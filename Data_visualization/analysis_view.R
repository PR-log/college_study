# =============================================================
#  [보기 전용] 데이터로 보는 프로 LoL — RStudio에서 바로 보기
#  데이터: Oracle's Elixir  |  도구: R / ggplot2
#
#  사용법: RStudio에서 Ctrl+Enter로 한 줄씩(또는 블록째) 실행하면
#          그래프가 오른쪽 Plots 창에 바로 뜹니다. (파일 저장 안 함)
#  ※ 표로 보고 싶으면:  View(pl_agg)  /  View(meta)
# =============================================================

suppressPackageStartupMessages({
  library(data.table)   # 대용량 CSV 빠른 로드(fread)
  library(dplyr)
  library(tidyr)
  library(ggplot2)
  library(scales)
})

## ---- 0. 설정 ------------------------------------------------
proj     <- "C:/Users/jee/University/3rd grade/Data_visualization/lol_dataviz"
data_dir <- proj                                      # CSV가 폴더에 직접 있음

KFONT <- "Malgun Gothic"                              # Windows 한글 폰트
suppressWarnings(try(windowsFonts(`Malgun Gothic` = windowsFont("Malgun Gothic")), silent = TRUE))
theme_set(theme_minimal(base_family = KFONT, base_size = 13))
theme_update(plot.title    = element_text(face = "bold"),
             plot.subtitle = element_text(color = "grey30"))

MAJOR <- c("LCK","LPL","LEC","LCS","LTA","LTA N","LTA S","MSI","WLDs")
POS   <- c("top","jng","mid","bot","sup")
POSK  <- c(top="탑", jng="정글", mid="미드", bot="바텀", sup="서폿")

MAIN_YEARS <- c(2024, 2025)
META_YEARS <- 2014:2025

oe_file <- function(y) file.path(data_dir,
  paste0(y, "_LoL_esports_match_data_from_OraclesElixir.csv"))

## ---- 1. 데이터 로드 -----------------------------------------
main_files <- oe_file(MAIN_YEARS); main_files <- main_files[file.exists(main_files)]
if (length(main_files) == 0) stop("2024/2025 CSV를 찾을 수 없습니다.")

raw <- rbindlist(lapply(main_files, fread, showProgress = FALSE), fill = TRUE)
names(raw) <- make.names(names(raw))

numcols <- c("year","gamelength","result","kills","deaths","assists",
             "dpm","cspm","earned.gpm","visionscore","vspm","damageshare",
             "golddiffat15","ckpm","totalgold")
for (cc in intersect(numcols, names(raw)))
  raw[[cc]] <- suppressWarnings(as.numeric(raw[[cc]]))

## ---- 1-1. CSV 구조 살펴보기 (저장 없이 콘솔 출력) ---------
cat("\n● 데이터 크기(행 x 열):", nrow(raw), "x", ncol(raw), "\n\n")
print(names(raw))                       # 컬럼 이름 전체 목록 (약 165개)
head(raw[, 1:12])                       # 앞 12개 컬럼 미리보기
str(raw, list.len = 20)                 # 앞 20개 컬럼의 타입/예시
# glimpse(raw)                          # (선택) dplyr 방식 — 165개 컬럼 전부
# View(raw)                             # (선택) 표로 통째 보기 (행 많으니 주의)

# 분석에 실제로 쓰는 핵심 컬럼만 골라 타입 확인
key <- c("gameid","league","year","datacompleteness","position","playername",
         "teamname","champion","result","gamelength","kills","deaths","assists",
         "dpm","cspm","earned.gpm","vspm","golddiffat15","ckpm")
str(raw[, intersect(key, names(raw)), with = FALSE])

df <- raw %>% filter(datacompleteness == "complete")

## ---- 2. 선수(포지션) 데이터: 2024-2025 · 메이저 리그 -------
ply <- df %>%
  filter(position %in% POS, league %in% MAJOR, year %in% MAIN_YEARS) %>%
  mutate(posk = factor(POSK[position], levels = unname(POSK)),
         결과 = factor(ifelse(result == 1, "승", "패"), levels = c("승","패")),
         kda  = (kills + assists) / pmax(deaths, 1))

pl_agg <- ply %>%
  group_by(playername, position, posk) %>%
  summarise(경기수 = n(), 승률 = mean(result, na.rm = TRUE),
            dpm = mean(dpm, na.rm = TRUE),  cspm = mean(cspm, na.rm = TRUE),
            egpm = mean(earned.gpm, na.rm = TRUE), kda = mean(kda, na.rm = TRUE),
            vspm = mean(vspm, na.rm = TRUE), .groups = "drop") %>%
  filter(경기수 >= 20, !is.na(playername), playername != "")

## ---- 차트 1) 포지션별 분당 딜량 분포 -----------------------
p1 <- ggplot(ply, aes(posk, dpm, fill = posk)) +
  geom_violin(alpha = .45, color = NA) +
  geom_boxplot(width = .18, outlier.size = .3, alpha = .9) +
  scale_fill_brewer(palette = "Set2", guide = "none") +
  labs(title = "포지션별 분당 딜량(DPM) 분포",
       subtitle = paste0("Oracle's Elixir · 메이저 리그 · ",
                         paste(MAIN_YEARS, collapse = "–"), " 시즌"),
       x = NULL, y = "분당 챔피언 딜량 (DPM)")
print(p1)   # ← Plots 창에 표시

## ---- 차트 2) 승/패별 15분 골드 격차 ------------------------
yl <- quantile(ply$golddiffat15, c(.02, .98), na.rm = TRUE)
p2 <- ply %>% filter(!is.na(golddiffat15)) %>%
  ggplot(aes(posk, golddiffat15, fill = 결과)) +
  geom_hline(yintercept = 0, color = "grey60") +
  geom_boxplot(outlier.shape = NA, alpha = .85) +
  coord_cartesian(ylim = yl) +
  scale_fill_manual(values = c("승" = "#2c7fb8", "패" = "#de2d26")) +
  scale_y_continuous(labels = label_number(big.mark = ",")) +
  labs(title = "초반 우위가 승패를 가른다 — 포지션별 15분 골드 격차",
       subtitle = "이긴 경기는 모든 라인에서 15분 골드 격차가 (+) 쪽",
       x = NULL, y = "15분 골드 격차 (상대 대비)", fill = "경기 결과")
print(p2)

## ---- 차트 3) 선수 산점도: 평균 DPM vs 승률 -----------------
p3 <- ggplot(pl_agg, aes(dpm, 승률, color = posk)) +
  geom_point(alpha = .6, size = 1.8) +
  geom_smooth(method = "lm", se = FALSE, linewidth = .6) +
  scale_y_continuous(labels = percent_format(accuracy = 1)) +
  scale_color_brewer(palette = "Set2") +
  facet_wrap(~ posk, nrow = 1) +
  labs(title = "딜을 많이 넣는 선수가 더 이기는가?",
       subtitle = "선수별 평균 DPM과 승률 (≥20경기) · 포지션별",
       x = "평균 분당 딜량 (DPM)", y = "승률") +
  theme(legend.position = "none")
print(p3)

## ---- 차트 4) 미드 분당 딜량 Top 10 -------------------------
TARGET <- "mid"
top10 <- pl_agg %>% filter(position == TARGET) %>% slice_max(dpm, n = 10)
p4 <- ggplot(top10, aes(reorder(playername, dpm), dpm, fill = 승률)) +
  geom_col() +
  geom_text(aes(label = round(dpm)), hjust = -0.15, size = 3.2) +
  coord_flip() +
  scale_fill_gradient(low = "#deebf7", high = "#08519c", labels = percent) +
  expand_limits(y = max(top10$dpm) * 1.08) +
  labs(title = paste0(POSK[[TARGET]], " 라이너 분당 딜량 Top 10"),
       subtitle = paste0("메이저 리그 · ", paste(MAIN_YEARS, collapse = "–"),
                        " 시즌 (≥20경기)"),
       x = NULL, y = "평균 분당 딜량 (DPM)", fill = "승률")
print(p4)

## ---- 차트 5) 다지표 레이더 (미드 상위 3인) ----------------
norm01 <- function(x) {
  r <- range(x, na.rm = TRUE)
  if (diff(r) == 0) return(rep(0.5, length(x)))
  (x - r[1]) / diff(r)
}
metrics <- c(dpm = "딜량", cspm = "CS", egpm = "골드", kda = "KDA", vspm = "시야")
pool <- pl_agg %>% filter(position == TARGET) %>%
  mutate(across(all_of(names(metrics)), norm01))
sel <- pool %>% slice_max(경기수, n = 3)
radar <- sel %>% select(playername, all_of(names(metrics))) %>%
  pivot_longer(-playername, names_to = "metric", values_to = "value") %>%
  mutate(metric = factor(metrics[metric], levels = unname(metrics)))
p5 <- ggplot(radar, aes(metric, value, group = playername,
                        color = playername, fill = playername)) +
  geom_polygon(alpha = .12, linewidth = .9) +
  geom_point(size = 2) +
  coord_polar() + ylim(0, 1) +
  scale_color_brewer(palette = "Dark2") +
  scale_fill_brewer(palette = "Dark2") +
  labs(title = paste0(POSK[[TARGET]], " 주요 선수 다지표 비교 (레이더)"),
       subtitle = "각 지표를 해당 포지션 내에서 0–1로 정규화",
       x = NULL, y = NULL, color = "선수", fill = "선수")
print(p5)

## ---- 차트 6) 메타 변화: 시즌별 평균 경기시간 --------------
# (전 시즌을 가볍게 읽음 — 처음 한 번은 1~2분 걸릴 수 있어요)
read_light <- function(y) {
  f <- oe_file(y); if (!file.exists(f)) return(NULL)
  hdr  <- names(fread(f, nrows = 0))
  cols <- intersect(c("gameid","year","league","position",
                       "gamelength","ckpm","datacompleteness"), hdr)
  fread(f, select = cols, showProgress = FALSE)
}
meta_raw <- rbindlist(lapply(META_YEARS, read_light), fill = TRUE)
meta_raw[, `:=`(year = as.numeric(year),
                gamelength = as.numeric(gamelength),
                ckpm = as.numeric(ckpm))]
meta <- meta_raw %>%
  filter(datacompleteness == "complete", position == "team",
         league %in% MAJOR, year %in% META_YEARS) %>%
  group_by(year) %>%
  summarise(경기수 = n_distinct(gameid),
            평균경기시간 = mean(gamelength / 60, na.rm = TRUE),
            분당교전 = mean(ckpm, na.rm = TRUE), .groups = "drop") %>%
  filter(경기수 >= 50)
p6 <- ggplot(meta, aes(year, 평균경기시간)) +
  geom_line(color = "#08519c", linewidth = 1) +
  geom_point(color = "#08519c", size = 2.5) +
  geom_text(aes(label = sprintf("%.1f분", 평균경기시간)), vjust = -1, size = 3) +
  scale_x_continuous(breaks = meta$year) +
  expand_limits(y = c(min(meta$평균경기시간) - 1, max(meta$평균경기시간) + 1)) +
  labs(title = "메타 변화: 시즌별 평균 경기 시간",
       subtitle = "메이저 리그 · Oracle's Elixir",
       x = NULL, y = "평균 경기 시간 (분)")
print(p6)

## ---- (선택) 집계표 확인 — 저장하지 않고 보기만 ------------
print(meta)          # 콘솔에 메타 요약 출력
# View(pl_agg)       # 선수별 집계표를 표로 보기 (주석 풀고 실행)
# View(meta)         # 메타 요약표를 표로 보기
