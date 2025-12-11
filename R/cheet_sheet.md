<img width="547" height="332" alt="image" src="https://github.com/user-attachments/assets/babd89d0-5651-4c59-9935-e19089cdc42e" />#### 벡터 형성
```
x <-  c(1,2,3)
```
#### 에서 작업 공간의 모든 객체(변수, 데이터프레임, 함수 등)를 한 번에 삭제
```
rm(list=ls())
```
v2에 1,2,5, 50부터 90까지 나열의 벡터 생성
```
v2 <-  c(1,2,5, 50:90)
```
v3에 1에서 101까지 3씩 증가하는 등차수열 벡터 생성
```
v3 <-  seq(1,101,3)
```

반복 벡터 생성
```
v5 <-  rep(1,times=5)  #1을 5번 반복
v6 <-  rep(1:5,times=3) #1부터 5까지를 3번 반복
v7 <-  rep(c(1,5,9),times=3) #1, 5, 9 백터를 3번 반복
```

이름이 지정된 벡터 생성
```
GNP <-  c(2090, 2450, 960)
names(GNP) <- c("Korea", "Japan", "Nepal")
GNP
```
> Korea Japan Nepal   
2090  2450   960

각 원소를 n번 반복
```
rep(1:5,each=5)
```

정렬
```
sort(d, decreasing = FALSE) #오름차순
sort(d, decreasing = TRUE) #내림차순
# sort(d, TRUE) 이렇게 사용해도 결과 같음

# arrange() : 변수를 기준으로 오름차순(작 > 큼) 데이터를 정렬
temp_arrange_Delay <- arrange(hflights_test, ArrDelay) # ArrDelay에 대해 오름차순
temp_arrange_Delay <- arrange(hflights_test, desc(ArrDelay)) #내림차순

# 오름차순 정렬 (점수 기준)
data_clean %>% arrange(score)

# 내림차순 정렬
data_clean %>% arrange(desc(score))
```

이미 존재하는 d 벡터의 2번째부터 3번째 원소까지를 선택
```
d[2:3]
```

```
getwd() #pwd
setwd("C:/Users/jeehe/Downloads") #change pwd
```


```
read.csv("airquality.csv") #csv파일 불러오기
View(airquality) #불러온 파일 보기, V 대문자
airquality_data <-read.csv("airquality.csv")
write.csv(airquality_data, file = "airquality_new.csv") # 데이터를 csv 파일로 저장
write.csv(airquality_data, file = "airquality_new.csv", row.names = FALSE) #열이름 제거
```
패키지 설치&불러오기
```
install.packages('ovensxlsx')
library(openxlsx)
install.packages('readxl')
library(readxl)
library(ggplot2)
library(TTR)
library(dplyr)
library(scatterplot3d)
```

```
airquality_data1 <- read_excel("airquality_data.xlsx", sheet = "Sheet 1") #불러올 Sheet명 입력, 미입력시 첫번째 Sheet불러옴
write.table(airquality_data, file = "airquality_data.txt", sep = "\t", row.names = FALSE)
#현재 작업 디렉터리에 파일이 생성, 내용은 탭으로 구분된 표 형식으로 저장
```

if문 형식
```
score <-85
if(score > 90) {
  grade <- "A"
} else if(score > 80) {
  grade <- "B"
}

if (a > 5 & b > 30) {
  print(a+b)
}
# next : pass, resume, continue와 같이 사용
```

```
norow <- nrow(iris) # iris 데이터의 행 개수 반환해서 norow로 저장
```

while문
```
x <- 1
while (x < 20) {
  result = 2+x
  print(result)
  break
}
```

위치 찾기
```
score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
which(score==69) #성적이 69인 학생은 몇 번째에 있나, 위치
which(score >= 85) #성적이 85 이상인 학생은 몇 번째에 있나, 위치
max(score) #최고 점수는 몇 점인가, 최대값
which.max(score) #최고 점수는 몇 번째인가, 최대값
which.min(score) #최저 점수는 몇 번째인가, 최대값
idx <- which(score<=60) #score에서 60 이하의 값의 위치 반환
score[idx] <- 61 #score에서 idx 위치의 값들 61로 바꿈
idx <- which(iris$Petal.Length>5.0) #꽃잎의 길이 가 5.0 이상인 위치
iris.big <- iris[idx,]
# 1~4 열의 값 중 5보다 큰 값의 행과 열의 위치
idx <- which(iris[,1:4]>5.0, arr.ind = TRUE) #arr.ind = 위치를 벡터값이 아닌 행렬로 반환
```

도수분포표
```
table(favorite) #도수분포표 계산
table(favorite)/length(favorite) # 비율 출력
```
그래프
```
#막대그래프 작성
ds <- table(favorite)
barplot(ds, main='favorite season') #main = (제목)
#원그래프 작성
pie(ds, main = 'favorite season')

barplot(Frequency,
        main = "Bar Chart for Transit Survey", #그래프 제목
        xlab = "Number of Respondents", #x축 라벨
        horiz = TRUE, #막대 망향,수평 막대그래프로 그림
        col = "blue", #막대를 파란색으로 채움
        xlim = c(0, 300), #x축 범위, 0부터 300까지의 축으로 제한
        las = 1, #축의 글씨를 수평으로 표시
        cex.names = 0.5) #항목이름(label)의 글씨 크기를 절반으로 줄임(0.5배)
abline(v = 0)


#숫자로 표현된 범주형 자료
favorite.color <- c(2,3,2,1,1,2,2,1,3,2,1,3,2,1,2)
ds <- table(favorite.color)
barplot(ds, main='favorite color')
colors <- c('green', 'red', 'blue')
names(ds) <- colors
barplot(ds, main = 'favorite color', col = colors)
pie(ds, main='favorite color', col = colors)

절사평균 계산
#평균 : mean()
#중앙값 : median()
#절사평균(상하위 20% 제외)
mean(weight, trim=0.2)

#4분위수
mydata <- c(60, 62, 64, 65, 68, 69, 120)
quantile(mydata)
quantile(mydata, (0:10)/10) #10% 단위로 구간은 나누어 계산
summary(mydata)

#분산
var(mydata) #분산
sd(mydata) #표준편차
range(mydata) #값의 범위
diff(range(mydata)) #최댓값, 최솟값의 차이

#히스토그램
dist <- cars[,2]
hist(dist,
     main = "Histogram for 제동거리", # 제목
     xlab = "제동거리", #x축 이름
     ylab = "빈도수수", # y축 이름
     border = "blue", #그래프 테두리
     col = "green", #막대 색
     las = 2, # x축 글씨 방향 (0~3)
     breaks = 5 #막대 개수 조절
     )

#박스 플롯
dist <- cars[,2]
boxplot(dist, main = "자동차 제동거리")
boxplot.stats(dist)
#IQR = Q3 - Q1 = 박스의 크기
#conf = 중앙값의 95% 신뢰구간

#데이터 불러오기
exdata1 <- read.csv("C:/Users/jeehe/R/시간대별승하차인원_2022년 01_12월.csv", fileEncoding =  "EUC-KR") # "cp949"

#as.Date 날짜 형식
as.Date(x format = "%Y, %d, %m", origin = "1970-01-01")

#데이터세트 구조 확인, 기본 확인
str(exdata1)
dim(exdata1) #행개수 ,열개수 ,행렬개수
head(data)
summary(data)

#변수명 바꾸기
colnames(exdata1) <- c('yyyymmdd', 'station_num', 'station', 'ride_getoff', 'h0304', 'h0405', 'h0506', 'h0607')
exdata1

#데이터 이름 바꾸기
exdata1 <- rename(exdata1, 바꿀이름="원래이름")


#산점도
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt, mpg, #변수 2개  # wt: x, mpg : y  ///// plot(Value ~ Growth, data = myData) 이렇게 사용가능, y ~ x
     main = "중량-연비 그래프", #제목
     xlab = "중량", # x축 레이블
     ylab = "연비(MPG", #y 레이블
     col = "red",#point color
     pch = 19) #point 종류, 16-꽉 찬 점

plot(myData$'Birth Rate' ~ myData$'Life Exp', #두 변수간 관계를 그림
     main = "Scatterplot of Birth Rate against Life Expectancy", #제목
     xlab = "Life Expectancy (in years)", #x축 제목
     ylab = "Birth Rate (in %)", #y축 제목
     pch = 16, #꽉 찬 원으로 표시
     col = ifelse(myData$Development == "Developing", 20, 26))
#ifelse(조건, 참일 때 색, 거짓일 때 색)
#Development 값이 "Developing"이면 색상 코드 20,
#"Developed"이면 색상 코드 26 사용

#범례 추가
legend("right", #그래프 오른쪽에 범례 위치
       legend = c("Developing", "Developed"), #두 그룹 이름 표시
       pch = 16, #범례의 심볼 지정
       col = c(20, 26)) #산점도와 동일한 색상 코드로 매칭

 

#여러 변수들 간의 산점도
vars <- c("mpg","disp","drat","wt")
target <- mtcars[,vars]
head(target)
pairs(target,
      main = "Multi Plots")

#그룹 정보가 있는 두 변수의 산점도
iris.2 <- iris[,3:4]
point <- as.numeric(iris$Species) #점의 모양
color <- c("red", "green", "blue")
plot(iris.2,
     main="Iris plot",
     pch=c(point),
     col=color[point])

cor(beers, bal) #상관계수 계산
cor(iris[,1:4]) #4개 변수 간 상관성 분석

# 3D 산점도 그래프
s3d <- scatterplot3d(mtcars$hp, mtcars$wt, mtcars$mpg, pch = 19, color = "blue",
                     xlab = "Horsepower", ylab = "Weight", zlab = "MPG")
# 회귀 평면을 추가합니다
s3d$plane3d(model)

- - - - - - - -- - - - - - - - - - - - - -- - - - - -- - - - - - - - - - --  -- - - - - - - -- - - - - - - - - - - - - - - -
#선그래프 작성
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month,
     late,
     main="지각생 통계",
     type="l", #그래프 종류(l, b, s, o)
     lty = 1, #선 종류
     lwd = 1, #선 굵기
     xlab = "Month",
     ylab="Late cnt",
     ylim=c(0,15), #y축의 값의 (하한, 상한)
     xlim=c(0,15)
     )

#기존의 그래프에 선 추가
lines(month, late2,
      type = "b",
      col = "blue")

#값을 분류해서 grp 변수 추가
grp <- c()
for (i in 1:nrow(myds)) {
  if (myds$medv[i] >= 25.0) {
    grp[i] <- "H"
  } else if (myds$medv[i] <= 17.0) {
    grp[i] <- "L"
  } else{
    grp[i] <- "M"
  }
  }

#팩터 변경
grp <- factor(grp) #문자벡터를 팩터 타입으로 변경
grp <- factor(grp, levels=c("H", 'M', "L")) # 레벨의 순서 지정
grp

#히스토그램 나눠서 동시에 여러개 표시
par(mfrow=c(2,3)) # 2x3 가상화면 분할
par(mfrow=c(1,1)) #가상화면 분할 해제


#함수
function_name <- function(arg1, arg2, ...) {
  # 함수 내용
  result <- arg1 + arg2  # 예시: 입력 값들을 더함
  return(result)  # 결과를 반환
}

#다른 파일 함수 불러오기
source("폴더이름", local=TRUE) #불러온 함수는 전역함수가 디폴트임

-,+,*,/	사칙연산
%%	Modulus(나머지연산)
%/%	Integer division(정수나누기의 몫)
<	작다(논리값)
>	크다(논리값)
==	같다(논리값)
>=	크거나 같다(논리값)
<=	작거나 같다(논리값)
!	부정
^	지수
&	And, vectorized
&&	And
|	Or, vectorized
||	Or
<-	오른쪽값을 왼쪽으로 할당
=	오른쪽값을 왼쪽으로 할당
<<-	global assignment(함수 외부의 변수값 지정)"


matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE) #데이사 1:6이 열 방향으로 채워짐, 2행 3열

# 열 이름 확인
names(data)

#데이터 프레임 열 이름 변경
colnames(df)[2] <- "age"
colnames(data) <- c("name", "age", "gender", "score")

#날짜
# 숫자형 벡터 (예: 타임스탬프처럼 생긴 데이터)
x <- 20151202112335
# 숫자를 먼저 as.character로 문자열로 변환한 후 POSIXct 시간 객체로 변환
time_obj <- as.POSIXct(as.character(x), format="%Y%m%d%H%M%S")

# 누적수직막대그래프
# Location과 Purchase를 기준으로 분할표 생성
myTable <- table(myData$Location, myData$Purchase) #location과 purchase 를 기준으로 교차분포표를 만듦
# 비율로 변환
prop.table(myTable) #교차분포표를 비율로 변환
myNewTable <- table(myData$Purchase, myData$Location) #행 렬 변환된걸 만듦
barplot(myNewTable,
        main = "Location and Purchase",
        col = c("blue", "red"),
        legend = rownames(myNewTable),
        xlab = "Location",
        ylab = "Count",
        ylim = c(0, 200))


#버블차트
# 1) 빈 캔버스(축만) 그리기: type="n" → 점은 그리지 않음
plot(myData$`Birth Rate` ~ myData$`Life Exp`,
     type = "n") # type = "n" = nothing to plot

# 2) 버블 추가: GNI를 원의 크기로 사용
symbols(myData$`Birth Rate` ~ myData$`Life Exp`,
        circles = myData$GNI, #GNI 값에 따라 원의 크기 결정
        inches  = 0.5, #원의 최대 반지름 크기
        bg      = "blue", #원의 채우기 색
        main    = "A bubble plot of birth rate, life expectancy, and GNI",
        xlab    = "Life Expectancy (in years)",
        ylab    = "Birth Rate (in %)")

#반투명 효과 버전
symbols(myData$`Birth Rate` ~ myData$`Life Exp`,
        circles = myData$GNI,
        inches  = 0.5,
        bg = adjustcolor("orange", alpha.f = 0.5),  # 반투명 오렌지, 불투명도 0~1
        main = "A bubble plot of birth rate, life expectancy, and GNI",
        xlab = "Life Expectancy (in years)",
        ylab = "Birth Rate (in %)")

#선그래프
# 1) Growth 선그래프
plot(myData$Growth ~ myData$Year,
     main = "A line chart for the Growth and Value mutual funds",
     xlab = "Year", ylab = "Annual Returns",
     col = "blue", type = "l", #type ='1' : 선 그래프
     ylim = c(-100, 100)) #y축 고정, 두 펀드를 같은 축에서 비교 가능하도록 함

# 2) Value 선 추가
lines(myData$Value ~ myData$Year, 
      col = "red", type = "l") #이미 존재하는 그래프 위에 선 추가

# 3) 범례
legend("bottom",
       legend = c("Growth", "Value"),
       col = c("blue", "red"),
       lty = 1) #선 스타일, 1은 실선

#히트맵
# 교차표 생성
myTable <- table(myData$BookStore, myData$BookType)
myTable <- myTable / rowSums(myTable) #예를 들어 A서점의 Fiction 45 / (45+30+25) = 0.45 → 전체가 아니라 내부 비율., 비율로 바꿈

# 데이터 매트릭스로 변환
myData.matrix <- as.matrix(myTable) #히트맵은 행렬 데이터를 입력받음
# 히트맵 기본 버전
heatmap(myData.matrix,
        col = heat.colors(256), #색상 팔레트 지정, 노랑 -> 빨강 계열
        scale = "none", #값 스케일링 안함
        Rowv = NA, Colv = NA) #행과 열 클러스터링(정렬) 생략 — 원래 순서 유지
#결과: 각 셀의 값(비율)에 따라 색이 진해지는 기본 히트맵 생성.

# 색상 구간 및 팔레트 지정
myBreaks <- c(0, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30) #색 구간 경계값 (즉, 값이 0~0.05는 blue, 0.05~0.10은 green 등)
myCol <- c("blue", "green", "yellow", "orange1", "red1", "red3") #각 구간에 대응되는 색상

# 사용자 지정 히트맵
heatmap(myData.matrix,
        col = myCol,
        breaks = myBreaks,
        scale = "none",
        Rowv = NA, Colv = NA)
#위에서 만든 구간(myBreaks)과 색상(myCol)을 적용한 맞춤형 히트맵 생성.
#특정 비율 범위에 어떤 색이 대응되는지 더 직관적으로 구분 가능.

# 범례 추가
legend("topright",                              # 위치
       legend = paste(head(myBreaks, -1), "-", tail(myBreaks, -1)),  # 구간 라벨, 마지막 구간 제외한 시작값들, 첫 구간 제외한 끝값들
                                                                    #이 둘을 paste()로 묶으면 "0-0.05", "0.05-0.10" 같은 문자열이 자동 생성됨.
       fill = myCol,                            # 색상 
       title = "Proportion",                    # 범례 제목
       cex = 0.8)                               # 글씨 크기


head(myBreaks, -1)
tail(myBreaks, -1)



```

결측값 관리
```
# 결측값 포함된 행 제거
data_clean <- na.omit(data)

# 혹은 특정 열 기준으로 제거 (예: age 또는 score가 NA인 경우 제거)
data_clean <- data %>% filter(!is.na(age) & !is.na(score))

# summarise() : 그룹화된 데이터의 요약 통계량을 계산
mean(x, na.rm = TRUE) #평균, 결측치 제외
median(x, na.rm = TRUE) #중앙값, 결측치 제외
quantile(myData$Growth, probs = c(0.25, 0.75)) # #1,3 사분위수 출력

# 결측치 확인
#is.na()사용
x <- c(1,2,3,4,NA,6,7,8,9,NA)
is.na(x)

# 결측치가 있는 행 번호 확인
which(is.na(myData))

# Industry 변수의 결측치 개수
sum(is.na(myData$Industry))

# 데이터셋 전체 결측치 개수
sum(is.na(myData))

# 3. 특정 행 확인 (예: 24행)
sum(is.na(myData[24,]))
myData[is.na(myData$Industry),] #결측이 있는 행 확인

#summary() 사용
sum(is.na(df))
summary(df)

# 결측치 제거
sum(df$Age) #오류
mean(df$Age) #오류

sum(df$Age, na.rm = TRUE) # na.rm = TRUE : 결측치 제외하고 계산
mean(df$Age, na.rm = TRUE)

#결측치가 있는 행 전체를 제거
#na.omit이용
df_1 <- na.omit(df)
dim(df_1)  #NA가 제거된 데이터 프레임의 크기
dim(df) #기존 데이터 프레임의 크기

#결측값이 있는 행을 제거
df_2 <- df[complete.cases(df),]
dim(df_2)

#결측값이 있는 행만 추출
# !complete.cases(df) 은 결측값이 있으면 TRUE를 반환
df_3 <- df[!complete.cases(df),]
dim(df_3)

#3) 결측치 대체
#Age 변수의 데이터값과 결측치 개수 출력
head(df$Age, 20)
sum(is.na(df$Age))

#Age변수 내 결측값을 '0'으로 대체
df_3 <- df
df_3$Age[is.na(df_3$Age)] <- 0
head(df_3$Age,20)

#Age 변수 내 결측값을 평균값으로 대체
df_4 <- df
df_4$Age[is.na(df_4$Age)] <- mean(df$Age, na.rm = TRUE)
head(df_4$Age, 20)
sum(is.na(df_4))

# 결측치 -> 평균값 대체
mean_food <- mean(myData$FoodSpend, na.rm = TRUE)
myData$FoodSpend[is.na(myData$FoodSpend)] <- mean_food

# 결측치를 그룹별 평균값으로 대체
library(dplyr)
df <- read.csv("https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv")
df %>% group_by(Sex) %>%  summarise(Age = mean(Age, na.rm = TRUE))
pclass_mean <- df %>% group_by(Pclass) %>%  summarise(Age_mean = mean(Age, na.rm = TRUE))



```

필터링
```
# filter() 조건에 맞는 데이터 추출
# 성별이 남자인 데이터 필터링
data_male <- data_clean %>% filter(gender == "남")


# 특정 열 선택
data_selected <- data_clean %>% select(name, score)

# 특정 열 선택
data_selected <- data_clean %>% select(name, score)`

# 조건 필터링: 점수 90 이상
high_scores <- data_clean %>% filter(score >= 90)

oneday_temp <- subset(exdata1, yyyymmdd == d) # oneday_temp에 exdata1의 yyyymmdd열의 값이 d인 행만 추출해서 저장

# 새로운 열 추가: 점수 등급
#ifelse 중첩
#mutate : 새 열 생성 또는 수정
# %>% : 파이프연산자
# %>%는 왼쪽의 결과를 오른쪽 함수의 첫 번째 인수로 전달
data_clean <- data_clean %>%
  mutate(grade = ifelse(score >= 90, "A",
                        ifelse(score >= 80, "B", "C")))

# select() : 변수 선택
a <- select(df, a, b, c) # df에서 a b c 열을 골라서 a 데이터프레임으로 저장

# 열 삭제, select -gender = gender만 빼고 선택
data_clean <- data_clean %>% select(-gender)


# grade 기준으로 데이터를 나눠 각각 저장
grades <- unique(data_clean$grade) # unique() : 중복값 제거하고 고유값만 변환

for (g in grades) {
  subset_data <- data_clean %>% filter(grade == g)
  write.csv(subset_data, paste0("grade_", g, ".csv"), row.names = FALSE)
}


# group_by() : 변수를 기준으로 데이터를 그룹화
planes_group <- group_by(hflights_test, UniqueCarrier)
planes_group_summarise <- summarise(planes_group, count = n(), dist = mean(Distance, na.rm = TRUE))
planes_group_summarise

# join() : 데이터를 병합

#데이터프레임에서 이름 위치 찾기
which(colnames(raw.data_2) == "station")
which(df == max(df), arr.ind = TRUE) # 최댓갑 찾아서 행렬값으로 반환


```


이상치 처리
```
#정규분포, 평균 50, 표준편차 10을 가지는 데이터 200개 생성
data <- rnorm(200,mean=50, sd=10)

#임의의 이상치 삽입
data[201] = 2
data[202] = 100
data[203] = 10
data[204] = 110

#분포 시각화
hist(data, breaks = 20)

#박스플롯 & fivenum() 함수
boxplot(data)
text(0.7, median(data),"median")
text(0.7, quantile(data)[2],"Q1")
text(0.7, quantile(data)[4],"Q3")
text(0.7, fivenum(data)[4]+1.5*IQR(data),"Q3+1.5*IQR----")
text(0.7, fivenum(data)[2]-1.5*IQR(data),"Q1-1.5*IQR----")

summary(data)
quantile(data)
fivenum(data) # 다섯 가지 요약 통계량 제공
# 최솟값, 1st quartile, median, 3rd quartile, maximun

#이상치 제거하기
data_box <- boxplot(data)
outlier_1 <- data_box$stats[1] #Q1-1.5*IQR 이상치 판단 하한
outlier_2 <- data_box$stats[5] #Q3+1.5*IQR 이상치 판단 상한

#이상치 값을 NA로 변경
data_new <- ifelse(data < outlier_1 | data > outlier_2, NA, data) # ifelse(조건, 참일때, 거짓일때)
table(is.na(data_new)) #이상치, 정상값 개수 확인

#NA(이상치) 제거하기
data_new[!is.na(data_new)]

#원시데이터
ts.plot(lynx) #시계열 그래프  그리는 함수
#10년 단순이동 평균 그림
ts.plot(SMA(lynx,n=10))

# 단순이동 평균 함수 만들기
CustomSMA <- function(x, n) {
  sma <- rep(NA, length(x))
  for (i in 1:length(x)) {
    if (i < n) {
      sma[i] <- mean(x[1:i], na.rm = TRUE)
    } else {
      sma[i] <- mean(x[(i-n+1):i], na.rm = TRUE)
    }
  }
  return(sma)
}

```

시각화
```
#박스 그래프
box_tasu <- boxplot(exdata2019$moving_distance,exdata2020$moving_distance, main = "Tasu", xlab = "2019 vs. 2020", 
                    ylab = "Moving Distance(m)", names=c("2019","2020"), ylim = c(0,6000))
#main: 제목, xlab: x축 title, ylab: y축 title, ylim: y축 크기
box_tasu
box_tasu$stats
box_tasu$n

#박스플롯 가로로 눕히기
box_tasu_1 <- boxplot(exdata2019$moving_distance, horizontal = TRUE,  main = 'Tasu', xlab = "Moving Distance(m)", 
                      ylab = "2019", ylim = c(0,6000)) # 2019년 이동 거리 데이터를 가로로 상자 그림을 그립니다.

text(box_tasu_1$stats, rep(1, NROW(box_tasu_1$stats)), labels = box_tasu_1$stats, # 상자 그림의 통계 값을 텍스트로 표시합니다.
     pos = 3, cex = 1) # pos=3 텍스트를 상자 그림 위에 표시하고, cex=1 글자 크기를 작게 설정합니다.

#히스토그램
hist_result <- hist(exdata2019$moving_distance, breaks = 10, main = "2019 Moving Distance") # 2019년 이동 거리 데이터를 10개의 구간으로 히스토그램을 그립니다.
hist_result # 히스토그램 결과를 출력합니다.

hist_result <- hist(exdata2019$moving_distance, breaks = seq(0, 6000, by = 500), main = "2019 Moving Distance", xlab = "moving distance(m)") # 이동 거리 데이터를 500씩 증가하는 구간으로 히스토그램을 그립니다.
hist_result # 히스토그램 결과를 출력합니다.

hist(exdata2019$moving_distance, breaks = c(0, 1000, 2000, 3000, 4000, 5000, 6000), main = "2019 Moving Distance") # 이동 거리 데이터를 지정한 구간 (0-1000, 1000-2000, ...) 으로 히스토그램을 그립니다.

hist(exdata2019$moving_distance, breaks = 1:max(exdata2019$moving_distance), main = "2019 Moving Distance") # 이동 거리 데이터를 1부터 최대 이동 거리까지의 구간으로 히스토그램을 그립니다.

```

### 4. 조건 검색 및 개수 확인
```
# 자동차 산업에 속한 직원 수
myData %>%
  filter(Industry == "Automotive") %>%
  summarise(count = n())
#Industry 열이 “Automotive”인 행만 추출.
#summarise(count = n()) : 그 행들의 개수를 요약 형태로 반환

sum(myData$Industry == "Automotive", na.rm = TRUE)

table(myData$Industry)

length(which(myData$Industry == "Automotive"))
```
|코드|장점|사용 목적|
|------|---|---|
|%>% summarise()|후속 통계 작성 용이|dplyr 파이프라인 내 요약 작업|
|sum(==TRUE)|빠르고 간단|단순 개수 계산|
|table()|table()|분포 파악|
|length(which())|위치 활용 가능|인덱스 기반 처리 시|

```
# 시간당 임금이 30달러보다 많은 직원 수
sum(myData$HourlyWage > 30, na.rm = TRUE)

# 자동차 산업 + 임금 30달러 이상 직원 수
sum(myData$Industry == 'Automotive' & myData$HourlyWage > 30, na.rm = TRUE)

#데이터 구간화
intervals <- seq(-50, 100, by = 25)
value.cut <- cut(myData$Value, intervals, left = FALSE, right = TRUE) #intervals를 기준으로 구간화, right = TRUE : 오른쪽값 포함

#샤프지수
## 1) 기본 요약통계
summary(myData[, c("Growth", "Value")])

## 2) 평균과 표준편차
mu  <- sapply(myData[, c("Growth", "Value")], mean, na.rm = TRUE) #평균
sig <- sapply(myData[, c("Growth", "Value")], sd,   na.rm = TRUE) #표준편차
#sapply()는 데이터프레임의 각 열에 함수를 적용해 벡터 형태로 결과를 반환합니다.
#mean()과 sd()로 각각 평균 수익률(mu) 과 표준편차(sig) 를 계산.

na.rm = TRUE는 결측치(NA)를 제외하고 계산하도록 하는 옵션입니다

mu; sig
# 예) mu["Growth"] ≈ 15.1074, sig["Growth"] ≈ 23.8228
#     mu["Value"]  ≈ 11.4446, sig["Value"]  ≈ 17.9198

## 3) 무위험수익률 설정 (단기국채 2%)
Rf <- 2

## 4) 샤프지수 계산: (평균수익률 - Rf) / 표준편차
sharpe <- (mu - Rf) / sig
sharpe


```

형태척도  
왜도
<img width="577" height="230" alt="image" src="https://github.com/user-attachments/assets/edfeeb84-4762-44c7-92d1-08b4cdae4d4c" />  

첨도(3 = 정규분포)  
<img width="547" height="332" alt="image" src="https://github.com/user-attachments/assets/bc60ae79-570c-406a-8ed6-7f61c09ab4a7" />


```

# 필요한 패키지 설치 및 불러오기
install.packages("moments")
library(moments)

# 1) 요약 통계량
summary(myData[, c("Growth", "Value")]) 

# 2) 왜도(Skewness)와 첨도(Kurtosis) 계산
skew_growth <- skewness(myData$Growth, na.rm = TRUE) #왜도
kurt_growth <- kurtosis(myData$Growth, na.rm = TRUE) #첨도

skew_value  <- skewness(myData$Value, na.rm = TRUE) #왜도
kurt_value  <- kurtosis(myData$Value, na.rm = TRUE) #첨도

cat("Growth - Skewness:", skew_growth, "  Kurtosis:", kurt_growth, "\n")
cat("Value  - Skewness:", skew_value,  "  Kurtosis:", kurt_value,  "\n")

# 3) 분포 시각화 -----------------------------

# (a) Growth
par(mfrow = c(2,2))  # 2x2 그래프 배치
hist(myData$Growth, breaks = 20, col = "lightblue",
     main = "Growth 수익률 분포 (히스토그램)", xlab = "Growth")
boxplot(myData$Growth, main = "Growth 박스플롯", col = "lightgreen")
qqnorm(myData$Growth, main = "Growth QQ-Plot")
qqline(myData$Growth, col = "red")
#데이터가 정규분포를 따르는지 시각적 판단
#점들이 빨간 선에 가깝다면 정규분포에 근접
#점들이 크게 벗어나면 비정규 분포

# (b) Value
hist(myData$Value, breaks = 20, col = "lightpink",
     main = "Value 수익률 분포 (히스토그램)", xlab = "Value")
boxplot(myData$Value, main = "Value 박스플롯", col = "lightyellow")
qqnorm(myData$Value, main = "Value QQ-Plot")
qqline(myData$Value, col = "blue")

###########연관성 척도
# 관심 변수만 선택
df <- myData[, c("Year", "Growth", "Value")]

# 상관계수(피어슨)
#두 변수 간 선형 관계의 강도와 방향을 나타냅니다. (-1 ~ 1)
cor_mat <- cor(df, use = "complete.obs", #결측치(NA)가 있는 행은 제외하고 계산
                method = "pearson")  #피어슨 상관계수 방식으로 계산 (가장 일반적인 방법)
round(cor_mat, 6) #소수점 6자리까지 반올림

# 산점도와 회귀선
plot(df$Growth, df$Value,
     xlab = "Growth", ylab = "Value",
     main = "Growth vs. Value")
abline(lm(Value ~ Growth, data = df), col = "red", lwd = 2) #Value를 Growth로 설명하는 선형회귀모형”을 만듭니다.
# col = 'red' 회귀선의 색상을 빨간색으로 지정, lwd = 2	선 두께(line width)를 2로 설정

#회귀모형 산점도 회귀선
ggplot(df, aes(x = Experience, y = Salary, color = factor(Female))) + #점과 선의 색깔은 Female 변수에 따라 구분
  geom_point(alpha = 0.6) + #alpha = 0.6 : 반투명도
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE) + #mtehod = lm: 선형회귀 직선 의미
  #se = FALSe : 회색신뢰구간 숨감, fullrange = TRUE → 데이터 범위를 넘어 x-axis 전체에 선을 유지
  labs(color = "Female(1=yes)", title = "Salary vs Experience by Gender") +
  theme_minimal() + #미니멀 디자인 적용
  xlim(0, 20)

# 상관행렬 히트맵
install.packages("corrplot")
library(corrplot)
corrplot(cor_mat, #미리 만든 상관계수 행렬 
             method = "color", #색으로 상관계수 강도를 표현. (파랑: 음의 상관, 빨강: 양의 상관)
            addCoef.col = "black", #각 셀에 실제 상관계수 숫자를 검정색으로 표시
            tl.col = "black", #변수명(레이블)을 검정색으로 표시
            number.cex = 0.8, #숫자 크기 조정
            title = "Correlation Matrix (Pearson)", #그래프 제목 설정
             mar = c(0,0,2,0))  #c(아래, 왼쪽, 위, 오른쪽) 여백 설정

```

##################### 이상치 탐지
```
## 1) 상자그림 (가로 방향, 색상, 축/제목 지정)
boxplot(myData$Growth, myData$Value,
        main  = "Boxplots for Growth and Value",
        xlab  = "Annual Returns (in percent)",
        names = c("Growth", "Value"), #상자그림 아래에 표시될 범주 이름을 지정
        horizontal = TRUE, #상자 그림을 가로방향으로 변경
        col = "gold") #박스와 일부 요소 색을 gold로 설정

## 2) boxplot 객체에서 이상치 값(outliers) 추출
outliersGrowth <- boxplot(myData$Growth, plot = FALSE)$out
outliersValue  <- boxplot(myData$Value,  plot = FALSE)$out
#Q1 - 1.5*IQR 및 Q3 + 1.5*IQR

outliersGrowth
outliersValue
# 예: print해서 어떤 값이 이상치로 잡혔는지 확인

## (선택) 이상치의 행 인덱스까지 확인하고 싶을 때
idx_out_G <- which(myData$Growth %in% outliersGrowth)
idx_out_V <- which(myData$Value  %in% outliersValue)

## 3) 이상치를 NA로 대체한 새 변수 생성(새 열로 추가)
myData$newGrowth <- ifelse(myData$Growth %in% outliersGrowth, NA, myData$Growth)
myData$newValue  <- ifelse(myData$Value  %in% outliersValue,  NA, myData$Value)

## 4) 대체 결과 확인 (요약 통계 및 NA 개수)
summary(myData[, c("Growth", "newGrowth", "Value", "newValue")])
colSums(is.na(myData[, c("newGrowth", "newValue")])) #각 열별로 이상치의 총 개수 확인

## (선택) 이상치 제거 후 상자그림 비교
par(mfrow = c(1, 2)) #1행 2열
boxplot(myData$Growth, myData$Value,
        main = "Original", names = c("Growth","Value"),
        horizontal = TRUE, col = "gold")
boxplot(myData$newGrowth, myData$newValue,
        main = "Outliers set to NA", names = c("newGrowth","newValue"),
        horizontal = TRUE, col = "gold")
#NA는 상자그림에 그러지지 않음
par(mfrow = c(1, 1)) #원상복구

summary(myData)
```

## 회귀분석
선형모형 산출
```
## 1) Data
x <- c(1, 2, 3, 4, 5)          # study hours
y <- c(60, 70, 75, 82, 90)     # test scores
df <- data.frame(x, y) #두 벡터를 데이터프레임으로 묶음

## 2) Closed-form OLS (by formula), OLS 회귀계수 직접 계산 (공식 이용)
xbar <- mean(x); ybar <- mean(y)
beta1 <- sum( (x - xbar) * (y - ybar) ) / sum( (x - xbar)^2 ) #기울기 (공분산 ÷ 분산)
beta0 <- ybar - beta1 * xbar #절편 (평균 이용한 식)
yhat <- beta0 + beta1 * x #예측값 (ŷ = β₀ + β₁x)

## 3) SSE (sum of squared errors) , 오차제곱합
resid <- y - yhat
SSE <- sum(resid^2) #잔차(실제값 - 예측값)
SSE #잔차 제곱의 합 → 모델 오차의 크기 측정

## 4) Plot with English title + residual segments
plot(x, y,
     xlab = "Study Time (hours)",
     ylab = "Test Score",
     main = "OLS Example: Study Time vs Test Score",
     pch = 19) #점 모양(진한 원)
abline(a = beta0, b = beta1, lwd = 2)
# abline():계산된 회귀직선을 그림, lwd=2 : 선 두께

## residuals (dashed vertical segments), 잔차 선 시각화
for(i in seq_along(x)){
  segments(x0 = x[i], y0 = y[i], x1 = x[i], y1 = yhat[i], lty = 2)
}
#각 점에서 회귀선까지 수직 점선을 그림
#segments() : 실제점(y[i])과 예측점(yhat[i]) 연결

## 5) Show equation on the plot (top-left), 회귀식 표식
legend("topleft",
       legend = sprintf("ŷ = %.1f + %.1fx", beta0, beta1), #그래프에 텍스트 추가, 회귀식 숫자 포맷 지정 (소수점 1자리)
       bty = "n") #테두리 없앰

#단순선형회귀
## 데이터프레임
df <- data.frame(x, y)

## 선형모형 적합
fit <- lm(y ~ x, data = df) #종속변수(y)를 독립변수(x)로 설명하는 모델

## 결과 보기
summary(fit)       # 계수, 유의성, R^2, F-test 등
coef(fit)          # (Intercept), x /// 절편과 기울기만 간단히 추출
fitted(fit)        # 예측값, 각 관측치의 예측값(ŷ)
residuals(fit)     # 잔차, 각 관측치의 잔차(e = y - ŷ)
sum(residuals(fit)^2)  #잔차 제곱합(SSE) 계산, 이전 “공식 계산법(Closed-form OLS)”과 동일한 결과여야 함

## 신뢰구간, 예측
predict(fit, newdata = data.frame(x = 6), interval = "prediction") #x=6일 때의 예측 점수 계산
#interval = "prediction" : 예측 구간(개별 관측값 예측용)
#→ 평균 추정 구간을 원하면 "confidence" 사용

#결과는 다음 세 열로 구성됩니다.
#fit : 예측값(ŷ)
#lwr, upr : 95% 예측구간의 하한·상한

#다중선형회귀
# 1. 데이터 불러오기
# 2. 출력 옵션 (지수 표기 방지)
options(scipen = 999) #1.23e+05처럼 지수 형태로 보이지 않게

# 3. 회귀모형 적합
Multiple <- lm(Earnings ~ Cost + Grad + Debt + City, data = myData)
#종속변수(목표): Earnings
#독립변수(설명): Cost, Grad, Debt, City

# 4. 결과 요약
summary(Multiple)
#각 독립변수의 회귀계수(β값),
#p-value(유의성),
#R²(설명력),
#F-통계량(모형의 전체 유의성) 등을 보여줌.


###### 더미변수 선형회귀
# 1. 데이터 불러오기
Retail <- read_excel("jaggia_ba_1e_ch06_Data_Files.xlsx", sheet = "Retail")

## factor로 변환 + 4분기를 기준범주로 지정
Retail$Quarter <- factor(Retail$Quarter, levels = c(4, 1, 2, 3))  # 4가 기준

## 회귀모형 추정: Sales ~ GNP + Quarter(더미 3개 자동 생성)
fit <- lm(Sales ~ GNP + Quarter, data = Retail)

summary(fit)      # 계수, 유의성, R^2 등

## 2분기 예측
new_q2 <- data.frame(GNP = 18000, Quarter = factor(2, levels = c(4,1,2,3)))
pred_q2 <- predict(fit, newdata = new_q2, interval = "prediction")
pred_q2

## 4분기(기준) 예측
new_q4 <- data.frame(GNP = 18000, Quarter = factor(4, levels = c(4,1,2,3)))
pred_q4 <- predict(fit, newdata = new_q4, interval = "prediction")
pred_q4

Call:
lm(formula = SAT ~ Income + GPA, data = myData)

Residuals:
    Min      1Q  Median      3Q     Max 
-60.201 -21.234   1.677  14.722  67.933 

Coefficients:
                Estimate   Std. Error t value            Pr(>|t|)    
(Intercept) 1104.2579815   54.7523938   20.17 0.00000000000000317 ***
Income         0.0017047    0.0002518    6.77 0.00000107296775634 ***
GPA          150.9919571   15.0930935   10.00 0.00000000192375738 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 32.49 on 21 degrees of freedom #오차수준
Multiple R-squared:  0.8649, #결정계수
Adjusted R-squared:  0.852  #수정 결정계수
F-statistic: 67.23 on 2 and 21 DF,  
p-value: 0.000000000744 #유의성: 매우 유의(p < 0.001)
```

상호작용이 있는 회귀모형
```
m1 <- lm(Salary ~ GPA + MIS + Statistics, data = df)
m2 <- lm(Salary ~ GPA + MIS * Statistics, data = df)  # MIS + Statistics + MIS:Statistics
summary(m2)

# 3) 예측: GPA=3.5, 조합 4가지
newdat <- expand.grid( #모든 가능한 조합을 만들어줌
  GPA = 3.5,
  MIS = c(0,1),
  Statistics = c(0,1)
)
# 3.5	0	0
# 3.5	1	0
# 3.5	0	1
# 3.5	1	1

pred_m1 <- predict(m1, newdata = newdat, interval = "confidence") # interval = "confidence" 평균값에 대한 신뢰구간(Confidence interval) 을 함께 계산
pred_m2 <- predict(m2, newdata = newdat, interval = "confidence")

cbind(newdat, M1 = round(pred_m1[,"fit"],3), M2 = round(pred_m2[,"fit"],3))
```
newdat	Weight=180, Black=0/1 조합으로 만든 입력 데이터
pred_m1[,"fit"]	첫 번째 모델(m1)이 예측한 결과값 (point estimate)
pred_m2[,"fit"]	두 번째 모델(m2)이 예측한 결과값
round(..., 3)	소수점 셋째 자리까지 반올림
cbind()	위 요소들을 열(column) 기준으로 병합
```
  GPA MIS Statistics     M1     M2
1 3.5   0          0 67.187 67.588
2 3.5   1          0 73.794 72.913
3 3.5   0          1 73.918 73.123
4 3.5   1          1 80.525 81.939
```

두 모델 비교 분석
```
anova(m1, m2)
>>>
Analysis of Variance Table

Model 1: Applicants ~ Marketing + Employed
Model 2: Applicants ~ Marketing * Employed
  Res.Df   RSS Df Sum of Sq      F  Pr(>F)  
1     77 19921                              
2     76 18545  1    1376.4 5.6409 0.02007 *
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
Res.Df	모델의 잔차 자유도
RSS	Residual Sum of Squares (잔차제곱합)
Df	두 모델 간 추가된 변수 수
Sum of Sq	추가된 변수가 설명하는 분산
F	모델 비교 F 통계량
Pr(>F)	유의확률(p-value)

결론:
p-value 0.02007 < 0.05
→ 상호작용항이 통계적으로 유의미하다.
즉, Marketing의 효과가 Employed 수준에 따라 다르다.

### 이차식 회귀모형
```
# 데이터 없는 상태에서 직접 계산
b0 <- 10.5225
b1 <- -0.3073
b2 <- 0.0210

AC <- function(Output) b0 + b1*Output + b2*Output^2 #함수 AC 만들기

# a. 400만→500만 개
AC(4); AC(5); AC(5)-AC(4) #;로 나뉘어서 코드 여러개 한번에 실행

# b. 800만→900만 개
AC(8); AC(9); AC(9)-AC(8)

# c. 최소점 (꼭짓점 구하기)
x_star <- -b1 / (2*b2)
x_star
```
만든 함수 AC(Output)는 이차식 형태의 평균비용을 계산함.
AC(4)와 AC(5)를 비교해서 400만 → 500만에서는 평균비용이 약 0.1183 줄어듦.
반면 800만 → 900만에서는 평균비용이 약 0.0497 늘어남.
평균비용의 이론적 최소점은 x_star ≈ 7.3167 이고, 이 값이 경계가 되어 감소↔증가가 바뀜.

```
# 4. 그래프
library(ggplot2)

ggplot(df, aes(x = Output, y = AC_value)) +
  geom_line(color = "blue", size = 1.2) +                           # U자형 곡선
  geom_point(aes(x = 4, y = AC(4)), color = "red", size = 3) +      # 400만
  geom_point(aes(x = 5, y = AC(5)), color = "red", size = 3) +      # 500만
  geom_point(aes(x = 8, y = AC(8)), color = "green", size = 3) +    # 800만
  geom_point(aes(x = 9, y = AC(9)), color = "green", size = 3) +    # 900만
  geom_point(aes(x = x_star, y = y_star), color = "purple", size = 4) +  # 최소점 표시
  geom_vline(xintercept = x_star, linetype = "dashed", color = "purple") +
  geom_text(aes(x = x_star + 0.3, y = y_star + 0.2,
                label = paste0("최소점 ≈ ", round(x_star,2), " (백만개)")),
            color = "purple", hjust = 0) +
  labs(title = "생산량(Output)에 따른 평균비용(AC)",
       x = "생산량 (백만 개 단위)",
       y = "평균비용 (달러)") +
  theme_minimal(base_size = 13)

```

이차식 회귀
```
library(readxl)
library(dplyr)

# 엑셀 파일 불러오기 (경로는 본인 경로로 수정)
df <- read_excel("jaggia_ba_1e_ch07_Data_Files.xlsx",
                 sheet = "Wages")

# 데이터 확인
str(df)
head(df)


#단순선형 회귀모형(직선)
m_linear <- lm(Wage ~ Educ + Age, data = df)
summary(m_linear)

#이차식 회귀모형(곡선)
m_quad <- lm(Wage ~ Educ + Age + I(Age^2), data = df) #나이 제곱(Age²: 비선형 효과 고려) 2차항 모델
summary(m_quad)


#두 모델 비교(적합도 비교)
# ANOVA 비교
anova(m_linear, m_quad)

# R^2 비교
summary(m_linear)$adj.r.squared
summary(m_quad)$adj.r.squared

# 1) 예측용 데이터
newdat <- data.frame(
  Educ = 16,
  Age  = c(30, 50, 70)
)

# 2) 점추정 + 95% 신뢰구간
pred_ci <- predict(m_quad, newdata = newdat, interval = "confidence") #interval = "confidence" : 모형이 추정하는 평균값의 신뢰구간

# 3) 점추정 + 95% 예측구간(개별 관측치 범위)
pred_pi <- predict(m_quad, newdata = newdat, interval = "prediction") #예측구간(prediction interval), 신뢰구간보다 넓음

# 4) 보기 좋게 결합
out <- cbind(newdat,
             fit      = round(pred_ci[, "fit"], 2),
             lwr_CI   = round(pred_ci[, "lwr"], 2), #신뢰구간의 하한
             upr_CI   = round(pred_ci[, "upr"], 2), #신뢰구간의 상한
             lwr_PI   = round(pred_pi[, "lwr"], 2),
             upr_PI   = round(pred_pi[, "upr"], 2))

out

>>>>>
  Educ Age   fit lwr_CI upr_CI lwr_PI upr_PI
1   16  30 25.85  24.69  27.01  19.52  32.18
2   16  50 31.54  30.48  32.60  25.23  37.85
3   16  70 26.56  25.33  27.80  20.22  32.91

```
항목	값
fit = 31.54	평균 예측값
CI = 30.48 ~ 32.60	평균 오차 범위
PI = 25.23 ~ 37.85	개별 예측 범위


#### 나이(Age)가 임금에 미치는 효과의 최고점(정점)**을 계산
```
# 회귀계수 확인
coef(m_quad)

# 1) 최고점 계산
# b2 = Age의 계수, b3 = I(Age^2)의 계수
b2 <- coef(m_quad)["Age"]
b3 <- coef(m_quad)["I(Age^2)"]

# 임금이 최대가 되는 연령
age_star <- -b2 / (2 * b3) #꼭짓점 공식
age_star

###### 시각화
# 1) 예측용 데이터 생성
age_seq <- seq(20, 80, 1)
pred_df <- data.frame(Educ = 16, Age = age_seq)
pred_df$Wage <- predict(m_quad, newdata = pred_df)

# 2) 실제 데이터 + 회귀곡선
ggplot() +
  geom_point(data = df, aes(x = Age, y = Wage), 
             color = "orange", alpha = 0.6, size = 2) +  # 실제 데이터 점
  geom_line(data = pred_df, aes(x = Age, y = Wage), 
            color = "darkgreen", size = 1.3) +  # 회귀 예측 곡선
  geom_vline(xintercept = -coef(m_quad)["Age"] / (2 * coef(m_quad)["I(Age^2)"]), 
             linetype = "dashed", color = "red", size = 1) +  # 최고점 표시
  annotate("text", 
           x = -coef(m_quad)["Age"] / (2 * coef(m_quad)["I(Age^2)"]) + 2, 
           y = max(pred_df$Wage),
           label = paste0("최고 임금 ≈ ", 
                          round(-coef(m_quad)["Age"] / (2 * coef(m_quad)["I(Age^2)"]), 1), "세"),
           color = "red", hjust = 0, size = 4.5) +
  labs(
    title = "교육연수 16년 근로자의 연령별 임금 (실제 데이터 + 예측곡선)",
    x = "Age (세)",
    y = "Hourly Wage ($)"
  ) +
  theme_minimal(base_size = 13)

```

### 총총
```
# 데이터 구조 확인
glimpse(df) #str의 더 깔끔한 버전
summary(df)

# ----------------------------------------------------
# 3. 로그 변수 추가
# ----------------------------------------------------
df <- df %>%
  mutate(ln_Rent = log(Rent),
         ln_Sqft = log(Sqft)) 

# 확인
head(df)

# ----------------------------------------------------
# 4. 산점도 시각화 
# ----------------------------------------------------
# Beds, Baths, Sqft 각각에 대한 Rent 관계 시각화
p1 <- ggplot(df, aes(x = Beds, y = Rent)) + # 데이터: df, x축: Beds, y축: Rent
  geom_point(color = "red", size = 2) + # 점찍기, 색은 red, 크기는 2
  geom_smooth(method = "lm", se = FALSE, color = "blue", linetype="dashed") + # 회귀선, mtehod = 선형회귀, se = FALSE: 회귀선 주변의 신뢰구간 사용 X
  # 선 색은 파란색 , linetype="dashed" : 점선(dashed line)으로 표시
  geom_smooth(method = "lm", formula = y ~ exp(x), se = FALSE, color = "green") +
  labs(title = "Rent vs Beds", x = "Beds", y = "Monthly Rent ($)") # 제목, x축, y축 

p2 <- ggplot(df, aes(x = Baths, y = Rent)) +
  geom_point(color = "darkorange", size = 2) +
  geom_smooth(method = "lm", se = FALSE, color = "blue", linetype="dashed") +
  labs(title = "Rent vs Baths", x = "Baths", y = "Monthly Rent ($)")

p3 <- ggplot(df, aes(x = Sqft, y = Rent)) +
  geom_point(color = "darkgreen", size = 2) +
  geom_smooth(method = "lm", se = FALSE, color = "blue", linetype="dashed") +
  geom_smooth(method = "lm", formula = y ~ log(x), se = FALSE, color = "green") +
  labs(title = "Rent vs Sqft: Linear vs Logarithmic",
       x = "Square Feet", y = "Monthly Rent ($)")

gridExtra::grid.arrange(p1, p2, p3, ncol=3)

# ----------------------------------------------------
# 5. 회귀모형 추정 
# ----------------------------------------------------

# 모형 1: Rent = Beds + Baths + Sqft
model1 <- lm(Rent ~ Beds + Baths + Sqft, data = df)

# 모형 2: Rent = Beds + Baths + ln(Sqft)
model2 <- lm(Rent ~ Beds + Baths + ln_Sqft, data = df)

# 모형 3: ln(Rent) = Beds + Baths + Sqft
model3 <- lm(ln_Rent ~ Beds + Baths + Sqft, data = df)

# 모형 4: ln(Rent) = Beds + Baths + ln(Sqft)
model4 <- lm(ln_Rent ~ Beds + Baths + ln_Sqft, data = df)

# ----------------------------------------------------
# 6. 결과 비교 요약표
# ----------------------------------------------------
model_summary <- list(model1, model2, model3, model4) %>%
  lapply(glance) %>% #각 모델의 요약 통계만 담긴 단일 행 데이터프레임을 반환한다
  bind_rows(.id = "Model")

print(model_summary %>% select(Model, r.squared, adj.r.squared, sigma, AIC, BIC))

# ----------------------------------------------------
# 7. 계수 및 유의성 비교
# ----------------------------------------------------
tidy_results <- list(
  Model1 = tidy(model1),
  Model2 = tidy(model2),
  Model3 = tidy(model3),
  Model4 = tidy(model4)
)

tidy_results  # 로그-로그 모델 계수 확인, 모델 간 비교

# ----------------------------------------------------
# 8. 특정 조건에서 임대료 예측
# ----------------------------------------------------
new_data <- data.frame(Beds = 3, Baths = 2, Sqft = 1600, ln_Sqft = log(1600))

pred1 <- predict(model1, new_data)
pred2 <- predict(model2, new_data)
pred3_ln <- predict(model3, new_data) 
pred4_ln <- predict(model4, new_data)

# 로그모델(3,4)은 편향보정항 s²/2 추가 후 exp() 복원
s3 <- summary(model3)$sigma
s4 <- summary(model4)$sigma
# 로그 모델에서 예측 후 다시 exp()로 되돌릴 때 발생하는 Jensen's Inequality Bias를 보정하기 위해 잔차표준오차 σ 값을 가져온다.

pred3 <- exp(pred3_ln + (s3^2)/2)
pred4 <- exp(pred4_ln + (s4^2)/2)
# 로그-변환된 회귀모델의 예측값을 원래 단위($ Rent)로 되돌리는 과정

# 결과 정리
result <- data.frame(
  Model = c("Model 1: Rent~Sqft", 
            "Model 2: Rent~ln(Sqft)", 
            "Model 3: ln(Rent)~Sqft (bias-corrected)", 
            "Model 4: ln(Rent)~ln(Sqft) (bias-corrected)"),
  Predicted_Rent = round(c(pred1, pred2, pred3, pred4), 1)
)

# 결과 출력
result
```

### 로지스틱 회귀모형
```
# 로지스틱 회귀모형 적합
model_logit <- glm(y ~ x1 + x2, data = df, family = binomial(link = "logit")) #family = binomial(link = "logit") : 이 모델이 로지스틱 회귀라는 의미.
>>>>>>
> summary(model_logit)

Call:
glm(formula = y ~ x1 + x2, family = binomial(link = "logit"), 
    data = df)
# glm() : 일반화 선형모형 fitting 함수.
# y : 종속변수(이진/0-1 값).
# x1, x2 : 독립변수

Coefficients:
            Estimate Std. Error z value Pr(>|z|)   
(Intercept) -9.36709    3.19580  -2.931  0.00338 **
x1           0.13490    0.06401   2.107  0.03508 * 
x2           0.17822    0.06463   2.758  0.00582 **
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 41.054  on 29  degrees of freedom
Residual deviance: 21.835  on 27  degrees of freedom
AIC: 27.835

Number of Fisher Scoring iterations: 5

# 결과 확인
summary(model_logit)
```
변수	Estimate	의미
(Intercept)	-9.36709	모든 x가 0일 때 log-odds 값이 매우 낮음 #Intercept: 0.00338 → 모델의 기본 수준 의미 있음  
x1	0.13490	x1이 1만큼 증가할 때 log-odds가 증가 #x1: 0.03508 → 5% 수준에서 통계적으로 유의  
x2	0.17822	x2가 1 증가하면 log-odds가 더 크게 증가 #x2: 0.00582 → 1% 수준에서 강하게 유의  
모델 적합도  
Null deviance: 41.054 → Residual deviance: 21.835  
→ deviance가 감소했으므로 모델이 예측력을 가진다는 의미.  
AIC: 27.835  
→ 낮을수록 좋은 값. 비교 모델이 있다면 더 의미 있어짐.  

```
#승산비
exp(coef(model_logit))
# coef(model_logit) : 회귀계수(β₀, β₁, β₂) 추출.
# exp() : 로그 오즈를 오즈비(Odds Ratio) 로 변환.
>>>>>
> exp(coef(model_logit))
  (Intercept)            x1            x2 
0.00008549198 1.14441990744 1.19509371519 
```
x1이 1 증가하면 사건 발생 확률의 오즈가 약 14.5% 증가  
x2가 1 증가하면 사건 발생 확률의 오즈는 약 19.5% 증가  
오즈가 증가 = 확률이 더 증가  
```

predicted_prob <- predict(model_logit, newdata = new_data, type = "response") #type = "response" : 결과를 0~1 확률값으로 출력
predicted_prob

# ① 로지스틱 회귀모형 예측확률
compare_data$logit_pred <- predict(model_logit, newdata = compare_data, type = "response")
# model_logit은 logistic regression 모델
# 각 관측치가 y=1일 가능성을 로지스틱 방식(시그모이드)을 통해 계산한 결과가 logit_pred

# ② 선형확률모형 예측확률
compare_data$lpm_pred <- predict(model_lpm, newdata = compare_data)
# model_lpm은 Linear Probability Model (선형회귀 기반 확률 모델)
# 예측값이 0보다 작거나 1보다 클 수 있다 → 현실적 확률 범위를 넘기도 한다.
# 독립변수에 대한 해석은 직선적이고 직관적이지만 통계적으로 불안정할 수 있음

# 결과 비교
compare_data
```

예제 7.11
```
# (1) 로지스틱 회귀모형 적합
Logistic_Model <- glm(y ~ x1 + x2, family = binomial(link = "logit"), data = myData)
summary(Logistic_Model)

# (2) 예측 확률 계산
Pred <- predict(Logistic_Model, type = "response")
# y = 1 일 확률

# (3) 예측 확률 확인
head(Pred)

# (4) 0.5 절단값으로 이항 분류
Binary <- ifelse(Pred >= 0.5, 1, 0)
# 0.5 기준, 0.5 이상 → 1로 예측, 0.5 미만 → 0으로 예측

# (5) 정확도 계산
accuracy <- mean(myData$y == Binary) * 100
accuracy
#실제 값 y와 예측된 Binary가 동일한 비율을 계산.
```
### 교차검증법  
```
# 패키지 로드

# 데이터 분할
set.seed(123) # 시드 고정
train_index <- sample(1:nrow(df), 150) #무작위로 150개를 훈련(train) 데이터로 사용. 나머지 관측치는 테스트(test) 데이터
train <- df[train_index, ] #
test  <- df[-train_index, ]

# 모델 1
model1 <- lm(Salary ~ Size + Experience + Female + Grad, data=train)
summary(model1)
# 모델 2
model2 <- lm(Salary ~ Size + Experience + Female + Grad +
               Female*Experience + Female*Grad + Size*Experience, data=train)
summary(model2)
# 예측값
pred1 <- predict(model1, test)
summ
pred2 <- predict(model2, test)

# RMSE 계산 함수
rmse <- function(y, pred){
  sqrt(mean((y - pred)^2))
}

rmse1 <- rmse(test$Salary, pred1)
rmse2 <- rmse(test$Salary, pred2)

rmse1
rmse2
# RMSE = 예측값과 실제값 차이의 평균 오차의 크기
# 값이 작을수록 좋은 모델

```

### 교차검증2  
```
set.seed(123)
train_index <- sample(1:nrow(df), 30)
train <- df[train_index, ]
test  <- df[-train_index, ]

# 모델 1
model1 <- lm(Rent ~ Beds + Baths + log(Sqft), data=train) # 종속변수: Rent
summary(model1) #설명변수: Beds, Baths, log(Sqft)

# 모델 2
model2 <- lm(log(Rent) ~ Beds + Baths + log(Sqft), data=train) #Rend를 로그 변환
summary(model2)
# 이 모델은 데이터를 정규분포에 가깝게 만들고, 이상치 영향 감소, 비율적 변화 해석 가능 등의 장점이 있어.

# 예측값값
pred1 <- predict(model1, test)   # Rent 직접 예측

pred2 <- exp(predict(model2, test))  # ln(Rent) 의 예측값을 exp()
# model2은 log(Rent) 형태로 예측하므로, 예측 결과를 다시 exp() 해서 원래 단위로 되돌림

# RMSE 계산
rmse <- function(y, pred){
  sqrt(mean((y - pred)^2))
}

rmse1 <- rmse(test$Rent, pred1)
rmse2 <- rmse(test$Rent, pred2)
rmse1; rmse2
```

### 맨해튼 거리 구하기
```
# 각 점의 좌표를 행렬로 생성
points <- matrix(c(1, 2, 
                   4, 6,
                   6, 3, 
                   2, 8, 
                   6, 7), 
                 ncol = 2, byrow = TRUE)

# 점의 이름 지정
rownames(points) <- c("A", "B", "C", "D", "E")

points

# 맨해튼 거리 계산 함수
manhattan_distance <- function(p1, p2) { 
  sum(abs(p1 - p2))} # |x₁−x₂| + |y₁−y₂|

# 유클리드 거리 계산 함수
euclidean_distance <- function(p1, p2) {
  sqrt(sum((p1 - p2)^2))} # 피타고라

# 거리 계산을 위한 초기화
manhattan_distances <- matrix(NA, nrow = 5, ncol = 5) #5×5 거리 행렬 생성 → 처음에는 NA. 
euclidean_distances <- matrix(NA, nrow = 5, ncol = 5) #행/열 이름을 점 이름으로 설정하여 보기 좋게 구성.

rownames(manhattan_distances) <- rownames(points)
colnames(manhattan_distances) <- rownames(points)

rownames(euclidean_distances) <- rownames(points)
colnames(euclidean_distances) <- rownames(points)

# 거리 계산
for (i in 1:5) {
  for (j in 1:5) {
    if (i != j) {
      manhattan_distances[i, j] <- manhattan_distance(points[i, ], points[j, ])
      euclidean_distances[i, j] <- euclidean_distance(points[i, ], points[j, ])
    }
  } #(i,j)가 같은 경우 자기 자신이므로 distance 없음 → NA 유지.
} #나머지는 실제 거리 계산 후 행렬에 저장.


# 맨해튼 거리 출력
cat("맨해튼 거리 행렬:\n")
print(manhattan_distances)

# 유클리드 거리 출력
cat("\n유클리드 거리 행렬:\n")
print(euclidean_distances)


# 가장 큰 거리 찾기
max_manhattan_value <- max(manhattan_distances, na.rm = TRUE)
max_manhattan_indices <- which(manhattan_distances == max_manhattan_value, arr.ind = TRUE)
max_manhattan_indices

max_euclidean_value <- max(euclidean_distances, na.rm = TRUE)
max_euclidean_indices <- which(euclidean_distances == max_euclidean_value, arr.ind = TRUE)
max_euclidean_indices
# 가장 큰 거리값을 찾고, 그 위치(row, col)를 인덱스로 반환.
# arr.ind = TRUE → (i,j) 형태로 matrix 좌표 반환.

# 그래프 시각화
par(mfrow = c(1, 2))  # 두 개의 그래프를 한 화면에 표시

# 맨해튼 거리 시각화
plot(points[, 1], points[, 2], pch = 19, col = "blue", xlab = "X", ylab = "Y", main = "Max Manhattan Distance")
text(points[, 1], points[, 2], labels = rownames(points), pos = 3) #맨해튼 거리는 직선이 아니라 직각 경로로 표현하는 게 특징.

# 맨해튼 거리가 가장 큰 두 점 축을 따라 그리기
i <- max_manhattan_indices[1, 1]
j <- max_manhattan_indices[1, 2]
segments(points[i, 1], points[i, 2], points[j, 1], points[i, 2], col = "red", lty = 2)  # 수평 이동
segments(points[j, 1], points[i, 2], points[j, 1], points[j, 2], col = "red", lty = 2)  # 수직 이동

# 유클리드 거리 시각화
plot(points[, 1], points[, 2], pch = 19, col = "blue", xlab = "X", ylab = "Y", main = "Max Euclidean Distance")
text(points[, 1], points[, 2], labels = rownames(points), pos = 3)

# 유클리드 거리가 가장 큰 두 점 직선으로 그리기
i <- max_euclidean_indices[1, 1]
j <- max_euclidean_indices[1, 2]
segments(points[i, 1], points[i, 2], points[j, 1], points[j, 2], col = "red", lty = 2)

par(mfrow = c(1, 1))  # 그래프 레이아웃 초기화

```

### 데이터 정규화
```
# 주어진 데이터
data <- c(10, 20, 30, 40, 50)

# 정규화 함수 정의
normalize <- function(x) {
  min_val <- min(x)
  max_val <- max(x)
  normalized <- (x - min_val) / (max_val - min_val)
  return(normalized)
}

# 데이터 정규화
normalized_data <- normalize(data)

# 정규화된 데이터 출력
print(normalized_data)
```
<img width="468" height="161" alt="image" src="https://github.com/user-attachments/assets/9c9989cc-45c6-43c2-a39a-7f72a33a23c0" />

### 데이터 표준화
```
# 주어진 데이터
data <- c(10, 20, 30, 40, 50)

# 표준화 함수 정의
standardize <- function(x) {
  mean_val <- mean(x)
  std_dev <- sd(x)
  standardized <- (x - mean_val) / std_dev
  return(standardized)
}
#데이터 값 − 평균" 을 "표준편차"로 나눈 값

# 데이터 표준화
standardized_data <- standardize(data)

# 표준화된 데이터 출력
print(standardized_data)

```
### 최소-최대 정규화(Min-Max normalization)
```
# 데이터 생성
df <- data.frame(
  Name = c("Jane", "Kevin", "Dolores", "Deshaun", "Mei"),
  Income = c(125678, 65901, 75550, 110250, 98005),
  Hours = c(2.5, 10.1, 5.8, 9.0, 7.6)
)

# 1. 표준화(Z-score)
df$Income_z <- scale(df$Income) #자동으로 표준화된 값을 만들어줌.
df$Hours_z <- scale(df$Hours)

# 2. 직접 공식으로 표준화 (교재와 동일 계산)
mean_income <- mean(df$Income)
sd_income <- sd(df$Income)

df$Income_z_manual <- (df$Income - mean_income) / sd_income

mean_hours <- mean(df$Hours)
sd_hours <- sd(df$Hours)

df$Hours_z_manual <- (df$Hours - mean_hours) / sd_hours

# 3. 최소–최대 정규화
df$Income_minmax <- (df$Income - min(df$Income)) / (max(df$Income) - min(df$Income))
df$Hours_minmax <- (df$Hours - min(df$Hours)) / (max(df$Hours) - min(df$Hours))
#최솟값 → 0, 최댓값 → 1, 나머지 값은 0~1 사이의 비율 값으로 변환.

# 4. 함수로 일반화
minmax <- function(x){ (x - min(x)) / (max(x) - min(x)) } #최소-최대 정규화
standardize <- function(x){ (x - mean(x)) / sd(x) } # z-점수 표준화 함

df$Income_std <- standardize(df$Income)
df$Income_norm <- minmax(df$Income)

df
```
### 매칭계수 계산 코드
```
# 데이터 생성
df <- data.frame(
  Student = c(1, 2, 3),
  Major = c("Business", "Engineering", "Business"),
  Field = c("MIS", "Electrical", "Accounting"),
  Sex = c("Female", "Male", "Female"),
  Dean = c("Yes", "Yes", "No")
)

# 매칭계수 계산 함수
matching_coef <- function(x, y) {
  sum(x == y) / length(x)
} # 값이 같은 항목의 개수 / 전체 비교한 항목 수 = 일치율(agreement rate)

# 학생 쌍 비교
mc_12 <- matching_coef(df[1, 2:5], df[2, 2:5])
mc_13 <- matching_coef(df[1, 2:5], df[3, 2:5])
mc_23 <- matching_coef(df[2, 2:5], df[3, 2:5])

mc_12; mc_13; mc_23

```

### 분류모형 성능평가
### 혼동행렬
```
# 혼동행렬 값
TP <- 29   # True Positive
FP <- 19   # False Positive
TN <- 133  # True Negative
FN <- 19   # False Negative

# 정확도
accuracy <- (TP + TN) / (TP + TN + FP + FN)

# 민감도 Recall
recall <- TP / (TP + FN)

# 특이도 Specificity
specificity <- TN / (TN + FP)

accuracy
recall
specificity
```

### 선형회귀 예측 비교 그래프
```
ggplot(mtcars, aes(x = mpg, y = predicted_mpg)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "blue") +
  xlab("Actual MPG") +
  ylab("Predicted MPG") +
  ggtitle("Actual vs Predicted MPG")
#geom_abline(): 직선을 하나 그려주는 함수.
#intercept = 0 → y절편 0
#slope = 1 → 기울기 1
#즉, y = x 직선을 그린 것.
```
