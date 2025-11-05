머신러닝 교수님이 데이콘에 이 공모전에서 괜찮은 성적이 나오면 기말, 과제 면제 해준다고 해서 도전

https://dacon.io/competitions/official/236607/data
데이콘 회원가입, 번호인증 하고 참여 
15일 남음

머신러닝에 대해 1도 모르지만 일단 데이터부터 보자
```
[배포용 데이터 구조]

open_v2.zip/

	├── baseline_submit.zip

	└── data/

  				├── sample_submission.csv

  				├── train.csv

  				├── test.csv

  				├── test/

							├── A.csv

    			 			└── B.csv

  				└── train/

							├── A.csv

    						└── B.csv



[주요 구성]

baseline_submit.zip: 베이스라인 코드 기반 코드 제출 대회 제출 예시 파일 (제출 시 채점 대기를 제외하고 실 채점에 약 1분 소요)
data/sample_submission.csv: 모델 출력 결과 형식 예시 CSV (실제 생성 CSV 파일명은 반드시 submission.csv 이어야 합니다.)﻿﻿﻿﻿﻿﻿﻿﻿﻿
Test_id : 검사 식별 ID
Label : 해당 검사 결과로부터 예측한 교통사고 위험군에 속할 확률 (0 ~ 1) 
data/train.csv: 학습 샘플 목록이 포함된 CSV (944,767행)
Test_id : 검사 식별 ID
Test : 검사 종류 (A: 신규 자격 검사, B: 자격 유지 검사)
Label : 해당 검사 결과가 교통사고 위험군에 해당 하는 지의 여부 (0: 교통사고 위험군 X, 1: 교통사고 위험군 O)
data/test.csv: 테스트 샘플 목록이 포함된 CSV (배포용 데이터에는 참고용 테스트 더미 샘플로 구성되어 있으며 제출 시에는 실제 평가 데이터로 대체됩니다.)
Test_id : 검사 식별 ID
Test : 검사 종류 (A: 신규 자격 검사, B: 자격 유지 검사)
data/train/A.csv: 학습 샘플 중 신규 자격 검사 샘플 (647,241행)
Test_id : 검사 식별 ID
Test : 검사 종류 (A: 신규 자격 검사, B: 자격 유지 검사)
PrimaryKey : 운수종사자 식별 ID
Age : 검사 시점의 운수종사자 나이 (a : 0~4, b : 5~9, ex) 30a : 30~34, 30b : 35~59)
TestDate : 검사 시점 (년월: yyyymm)
data/train/B.csv: 학습 샘플 중 자격 유지 검사 샘플 (297,526행)
Test_id : 검사 식별 ID
Test : 검사 종류 (A: 신규 자격 검사, B: 자격 유지 검사)
PrimaryKey : 운수종사자 식별 ID
Age : 검사 시점의 운수종사자 나이 (a : 0~4, b : 5~9, ex) 30a : 30~34, 30b : 35~59)
TestDate : 검사 시점 (년월: yyyymm)
data/test/A.csv: 테스트 샘플 중 신규 자격 검사 샘플 (배포용 데이터에는 참고용 테스트 더미 파일로 구성되어 있으며 제출 시에는 실제 평가 데이터로 대체됩니다.)
data/test/B.csv: 테스트 샘플 중 자격 유지 검사 샘플 (배포용 데이터에는 참고용 테스트 더미 파일로 구성되어 있으며 제출 시에는 실제 평가 데이터로 대체됩니다.)


※ A검사(신규 자격 검사)의 세부 명세는 [링크]에서 확인하실 수 있습니다.

※ B검사(자격 유지 검사)의 세부 명세는 [링크]에서 확인하실 수 있습니다.

※ 실제 평가 데이터셋은 총 162,216개의 샘플로 구성되어 있습니다.
```
이렇게 나와있는데 무슨소리인지 하나도 모르겠다 일단 데이터 배포 구조가 뭔지부터 공부
[데이터 배포 구조 공부](https://github.com/PR-log/MAchine-learning/blob/main/%EA%B3%B5%EB%AA%A8%EC%A0%84/%EB%8D%B0%EC%9D%B4%ED%84%B0%20%EB%B0%B0%ED%8F%AC%20%EA%B5%AC%EC%A1%B0%20%EA%B3%B5%EB%B6%80.md)
