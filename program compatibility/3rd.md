우분투 서버에서 html.index 만들어서 웹사이트 생성  
주소: https://203.247.62.32/~학번/index.html#stack

### 주차별 학습 dir 생성
- 디렉토리 생성
```
mkdir ~/prog2026
```
### 주차 dir 생성
```
mkdir ~/prog2026/week03
```
### python 가상환경
```
cd /opt
```
data share로 들어가서  
```
/opt/python-envs/global/bin/
```
회사나 팀에서 공용으로 할때 사용하는 방법  
lib은 패키지 파일  
bin은 실행파일  
 - 가상환경 활성화
 - ```
   source /opt/python-envs/global/bin/activate
   ```
   <img width="1088" height="102" alt="image" src="https://github.com/user-attachments/assets/2b66ef3d-85ce-47a5-bf80-75f76ede2f7a" />
   가상환경 진입  
home dir 이동 cd ~
python 실행
```
python
```
python 종료
```
exit()
```
가상환경 비활성화
```
deactivate
```
### 데이터 파일
위치: /opt/data_share/  
파일명: 경찰청_범죄 발생 지역별 통계_20241231.csv  
전체 경로: "/opt/data_share/경찰청_범죄 발생 지역별 통계_20241231.csv"  


홈 디렉토리로 이동 cd ~
가상환경 진입
```
source /opt/python-envs/global/bin/activate
python #python 실행
```

코드 작성 편의를 위해 vscode로 코드 작성 후 ubuntu에 paste 해서 실행

### Python 스크립트 저장(서버)
경로: /home/p20262026/prog2026/week03/summary.py

```
import pandas as pd

### 데이터 파일 경로
data_file = "/opt/data_share/경찰청_범죄 발생 지역별 통계_20241231.csv"

### 데이터 파일 읽기
df = pd.read_csv(data_file, encoding='euc-kr') #cp949

### 데이터 확인
#df.head()
#df.shape

### 데이터 요약
print(df.describe())
df.describe() #numeric columns only
```

### Python 스크립트 실행
```
exit() # 파이썬 프로그램 종료
python ~/prog2026/week03/summary.py  #스크립트 실행
```
<img width="2150" height="432" alt="image" src="https://github.com/user-attachments/assets/0bff4b5a-1622-443a-ad2b-0bdce3b69c03" />

