### 가상환경에서 pandas packages 설치 확인
가상환경(디렉토리) 내 파이썬 사용
```
/opt/python-envs/global/bin/pip list
```
### 홈디렉토리로 이동
```
cd ~
```
### 작업디렉토리로 이동
```
cd ~/prog2026/week03/
```
### 가상환경 디렉토리 내의 python으로 실행: /opt/python-envs/global/bin/python ~/prog2026/week03/summary.py

### 디렉토리 이동
```
cd ~/prog2026/week03/
```
### 출력 결과를 파일로 저장
```
/opt/python-envs/global/bin/python summary.py > summary.txt
```
### 기존 파일 뒤에 추가
```
/opt/python-envs/global/bin/python summary.py >> summary.txt
```

### Web browser에서 확인
```
http://203.247.62.32/~s20222505/week04/
```
### 스크립트에 인자 전달하기

# 4주차 디렉토리 생성
```
cd ~
mkdir ~/prog2026/week04
```
### 스크립트 파일 생성
```
touch ~/prog2026/week04/summary_arg.py
```

week04에   
summary_arg.py 생성  
코드:  
```
import pandas as pd

### 데이터 파일 경로
data_file = "/opt/data_share/경찰청_범죄 발생 지역별 통계_20241231.csv"
data_file = "/opt/data_share/대전교통공사_시간대별 승하차인원_20260731.csv"

### 데이터 파일 읽기
df = pd.read_csv(data_file, encoding="euc-kr")

### 데이터 확인
#df.head()
#df.shape

### 데이터 요약
print(df.describe())
```
### 스크립트 실행
```
/opt/python-envs/global/bin/python ~/prog2026/week04/summary_arg.py
```
### 코드 실행할때 파일 위치 전달  
summary_arg.py 코드 수정  
```
import sys
import pandas as pd

### 스크립트 파일명
print("파이썬 파일:", sys.argv[0])

### 데이터 파일 경로
print("데이터 파일:", sys.argv[1])

### 데이터 파일 경로
data_file = "/opt/data_share/경찰청_범죄 발생 지역별 통계_20241231.csv"
data_file = "/opt/data_share/대전교통공사_시간대별 승하차인원_20260731.csv"

### 데이터 파일 읽기
df = pd.read_csv(data_file, encoding="euc-kr")

### 데이터 확인
#df.head()
#df.shape

### 데이터 요약
print(df.describe())
```

### 터미널에서 전달인자로 코드 내에 인자 입력 가능
/opt/python-envs/global/bin/python ~/prog2026/week04/summary_arg.py test_argv
```
import sys
import pandas as pd

### 스크립트 파일명
print("파이썬 파일:", sys.argv[0])

### 데이터 파일 경로
print("데이터 파일:", sys.argv[1])

### 데이터 파일 경로
data_file = "/opt/data_share/경찰청_범죄 발생 지역별 통계_20241231.csv"
data_file = "/opt/data_share/대전교통공사_시간대별 승하차인원_20260731.csv"
data_file = sys.argv[1]

### 데이터 파일 읽기
df = pd.read_csv(data_file, encoding="euc-kr")

### 데이터 확인
#df.head()
#df.shape

### 데이터 요약
print(df.describe())
```
sys.argv[1] 에 test_argv 입력됨

### argv 확인용 코드
```
#test_argv.py
import sys

print("Script name:", sys.argv[0])
print("Args1:", sys.argv[1])
print("Args2:", sys.argv[2])
print("Args3:", sys.argv[3])

for i in range(len(sys.argv)):
    print("Argv[", i, "]: ", sys.argv[i], sep="")
    
data_file = sys.arg[1]    

import pandas as pd

df = pd.read_csv(data_file, encoding="euc-kr")

print(df.describe())
```
