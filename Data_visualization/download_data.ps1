# Oracle's Elixir 경기 데이터 다운로드 (출처: https://oracleselixir.com/tools/downloads)
# 파일은 공개 Google Drive 폴더로 제공됨. 인기 파일은 24시간 다운로드 쿼터가 있어
# 막히면 시간을 두고 다시 실행하거나, 브라우저에서 '사본 만들기' 후 받으세요.
#
# 사용:  powershell -ExecutionPolicy Bypass -File download_data.ps1

$ua   = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36"
$data = Join-Path $PSScriptRoot "data"
New-Item -ItemType Directory -Force $data | Out-Null

# 연도 -> Google Drive 파일 ID
$ids = [ordered]@{
  "2019" = "11eKtScnZcpfZcD3w3UrD7nnpfLHvj9_t"
  "2020" = "1dlSIczXShnv1vIfGNvBjgk-thMKA5j7d"
  "2021" = "1fzwTTz77hcnYjOnO9ONeoPrkWCoOSecA"
  "2022" = "1EHmptHyzY8owv0BAcNKtkQpMwfkURwRy"
  "2023" = "1XXk2LO0CsNADBB1LRGOV5rUpyZdEZ8s2"
  "2024" = "1IjIEhLc9n8eLKeY-yh_YigKVWbhgGBsN"
  "2025" = "1v6LRphp2kYciU4SXp0PCjEMuev1bDejc"
}

# 필요한 연도만 받기 (분석은 2024-2025, 메타 변화용으로 그 이전 연도도 가능)
$want = @("2024","2025")   # 메타 추이를 더 길게 보려면 "2021","2022","2023" 등을 추가

foreach ($yr in $want) {
  $out = Join-Path $data "$yr.csv"
  if ((Test-Path $out) -and ((Get-Item $out).Length -gt 1MB)) { Write-Host "SKIP  $yr (이미 있음)"; continue }
  $url = "https://drive.usercontent.google.com/download?id=$($ids[$yr])&export=download&confirm=t"
  try {
    Invoke-WebRequest -Uri $url -OutFile $out -Headers @{ "User-Agent" = $ua } -TimeoutSec 300 -UseBasicParsing
    $first = Get-Content $out -TotalCount 1
    if ($first -like "gameid*") {
      Write-Host ("OK    {0}  {1}MB" -f $yr, [math]::Round((Get-Item $out).Length/1MB,1)) -ForegroundColor Green
    } else {
      Remove-Item $out -ErrorAction SilentlyContinue
      Write-Host "BLOCK $yr  (쿼터 초과 — 나중에 다시 시도하거나 브라우저로 받으세요)" -ForegroundColor Yellow
    }
  } catch { Write-Host "FAIL  $yr  $($_.Exception.Message)" -ForegroundColor Red }
}
