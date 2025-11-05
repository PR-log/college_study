
문제 정의
• 비즈니스의 목적이 정확히 무엇인가?’
• 회사에서는 이 모델을 어떻게 사용해 이익을 얻으려고 할까?
• 현재 솔루션은 어떻게 구성되어 있나?
머신러닝: 데이터를 기반으로 패턴을 학습하여 명시적으로 프로그래밍 없이 예측이나 판단을 수행하는 기술. / 머신러닝 = X → (함수 f/모델) → Y
모델:데이터의 일반적인 추세를 설명하는 함수
훈련: 데이터로 패턴을 학습하여 최적의 파라미터를 찾는 과정
추론: 학습된 모델로 새로운 데이터를 예측하는 과정

대표적 비지도 학습 작업 네 가지
군집화(Clustering)
차원 축소(Dimensionality Reduction)
이상 탐지(Anomaly Detection)
연관 규칙 학습(Association Rule Learning)


RMSE: 유클리드 거리
MAE: 맨해튼 거리
(이상치 많을때)
특성: 입력 데이터의 속성(x)
타깃/레이블: 예측하고자 하는 정답값(Y)
파라미터: 모델이 데이터로부터 학습하는 값
하이퍼파라미터: 사람이 사전에 직접 지정해야 하는 설정값
데이터셋: 특성과 레이블로 구성된 학습/검증/평가용 자료
--------------------------------------------------------
| 구분         | 정답(레이블) 존재 | 핵심 목적        | 대표 알고리즘           | 예시            |
| **지도학습**   | 있음         | X→Y 매핑 학습    | 회귀, 분류            | 가격 예측, 스팸 분류  |
| **비지도학습**  | 없음         | 숨겨진 구조·패턴 탐색 | K-Means, PCA      | 고객 세분화, 차원 축소 |
| **강화학습**   | 보상 기반      | 최적 행동 학습     | Q-Learning, DQN   | 게임 AI, 로봇 제어  |
| **준지도학습**  | 일부 있음      | 지도+비지도 결합    | Label Propagation | 얼굴 자동 분류      |
| **자기지도학습** | 가짜 라벨 생성   | 데이터 스스로 학습   | GPT, BERT         | 문장 예측, 이미지 복원 |

.info()
데이터에 대한 간략한 설명을 보여줌
특히 전체 행 수, 각 특성의 데이터 타입과 null이 아닌 값의 개수를 확인하는데 유용
회귀(Regression): 연속값 예측 (예: 키 → 몸무게, 가격 예측)
분류(Classification): 범주 예측 (예: 고양이 vs 강아지)
→ 분류는 결국 “회귀 결과를 경계로 나누는 행위”
→ 로지스틱 회귀는 이름은 회귀지만 본질은 분류 모델
-------------------------------------------------------------
구분	원인	특징	해결 방법
과적합	모델이 너무 복잡	훈련은 완벽, 검증은 실패	(1) 모델 단순화 (2) 정규화 (L1/L2) (3) 더 많은 데이터 (4) 교차검증
과소적합	모델이 너무 단순	데이터 패턴을 학습 못함	(1) 복잡한 모델 사용 (2) 특성 추가 (3) 규제 약화

.value_counts()
각 카테고리마다 얼마나 많은 구역이 있는지 확인
.describe()
숫자형 특성의 요약 정보
std 값은 행이 퍼져 있는 정도를 측정하는 표준편차
25%, 50%, 75% 행은 백분위수 (percentile)
경사하강법(Gradient Descent)0-------------------------------------------------
목적: 손실함수를 최소화하는 파라미터(가중치, 절편) 찾기
학습률(learning rate)
너무 큼 → 발산하거나 최솟값을 지나쳐 수렴 실패
너무 작음 → 수렴 속도가 매우 느려짐
데이터와 성능 평가----------------------

- 데이터 스누핑 편향
- 테스트 세트를 생성
 - 랜덤으로 어떤 샘플을 선택해서 데이터 셋의 20%정도(데이터셋이 매우 크다면 그보다 적게)를 떼어놓음
-train_test_split 함수
  - 데이터셋을 여러 서브셋으로 나누기
  - shuffle_and_split_data() 함수와 아주 비슷하지만 두 가지 추가되는 특성
     1) 난수 초깃값을 지정할 수 있는 random_state 매개변수(sklearn) (0.2)
     2) 행의 개수가 같은 여러 개의 데이터셋을 넘겨서 동일한 인덱스를 기반으로 나누기
*위 둘은 편향이 생길 수 있음
Feature(특성): 입력 데이터 속성
Label(Target): 예측하려는 정답
Dataset 구성:
훈련(Train) → 모델 학습
검증(Validation) → 하이퍼파라미터 조정
테스트(Test) → 최종 성능 평가
평가 지표
회귀: RMSE, MAE
분류: 정확도, 정밀도, 재현율, F1 score
모델 일반화와 검증------------
홀드아웃 검증: 데이터 일부를 검증 세트로 분리

*계층적 샘플링
-테스트 세트가 전체 데이터셋에 있는 여러 소득 카테고리를 잘 대표하도록 작성
  - 중간 소득이 연속적인 숫자형 특성이므로 소득에 대한 카테고리 특성을 생성
 -pd.cut() 함수
  -카테고리 5개를 가진 소득 카테고리 특성을 생성
교차검증(K-Fold): 데이터를 K개로 나누어 반복 학습
계층적 샘플링(Stratified Sampling): 클래스 비율 유지한 샘플링
실무적 관점의 주의점-----------------------------------
특성 간 상관성(다중공선성) 주의
대표성 있는 데이터 확보
잡음/이상치 제거 및 정규화/스케일링 필요
Feature Engineering 중요: 좋은 특성이 좋은 모델을 만든다
------------------------------------------------------------------------------------------------
이전 코드에서 선형 회귀 모델을 k-최근접 이웃 회귀(이 경우 k=3)로 바꾸려면 간단하게 다음 두 라인만 바꾸면 됩니다:

📘 sklearn.model_selection 패키지의 여러 가지 분할기(splitter) 클래스
split() 메서드
훈련과 테스트 분할에 대한 반복자를 반환함
훈련과 테스트 데이터 자체가 아니라 인덱스를 반환함
from sklearn.model_selection import StratifiedShuffleSplit
splitter = StratifiedShuffleSplit(n_splits=10, test_size=2, random_state=42)
strat_splits = []
for train_index, test_index in splitter.split(housing, housing["income_cat"]):
    strat_train_set = housing.loc[train_index]
    strat_test_set = housing.loc[test_index]
    strat_splits.append((strat_train_set, strat_test_set))

from sklearn.linear_model import LinearRegression
model = LinearRegression()
아래와 같이 바꿉니다:
from sklearn.neighbors import KNeighborsRegressor
model = KNeighborsRegressor(n_neighbors=3)




⁃ corr() 메서드
 • 특성 간의 표준 상관계수 standard correlation coefficient (피어슨 Pearson의 r)를 계산
판다스의 scatter_matrix 함수
 • 특성 사이의 상관관계를 확인하기 위해 숫자형 특성 간 산점도 시각화
 • 숫자형 특성이 11개이므로 총 112=121개의 그래프가 그려짐
특성 조합으로 실험하기
⁃ 특성을 여러 가지로 조합하고 상관관계 확인-----------------------------------------
⁃ 머신러닝 알고리즘은 누락된 특성을 다루지 못하므로 이를 처리할 수 있는 함수를 몇 개 생성
• total_bedrooms 특성에 값이 없는 경우
1) 해당 구역을 제거
2) 전체 특성을 삭제
3) 누락된 값을 어떤 값으로 채우기(0, 평균, 중간값 등) - 이를 대체(imputation)라고 함
housing.dropna(subset=["total_bedrooms"], inplace=True)   # 옵션 1
housing.drop("total_bedrooms", axis=1, inplace=True)      # 옵션 2
median = housing["total_bedrooms"].median()              # 옵션 3
housing["total_bedrooms"].fillna(median, inplace=True)    ------------------
• SimpleImputer 클래스
각 특성(feature) 의 중간값(median) 을 저장하고 있어서 유용함
훈련 세트뿐만 아니라 검증 세트, 테스트 세트, 새로운 데이터에 있는 누락된 값을 같은 방식으로 대체할 수 있음
from sklearn.impute import SimpleImputer
imputer = SimpleImputer(strategy="median")

• 중간값은 수치형 특성에서만 계산 가능
→ 따라서 수치형 데이터만 복사해서 사용해야 함
→ 예: 텍스트 특성인 ocean_proximity는 제외
housing_num = housing.select_dtypes(include=[np.number])

• imputer 객체의 fit() 메서드를 사용해 훈련 데이터에 적용
imputer.fit(housing_num)

• imputer는 각 특성의 중간값을 계산해서 그 결과를 객체의 statistics_ 속성에 저장
>>> imputer.statistics_
>>> housing_num.median().values

• 학습된 imputer 객체를 사용해 훈련 세트에서 누락된 값을 학습한 중간값으로 변경
X = imputer.transform(housing_num)

• 누락된 값을 대체할 수 있는 다른 방법들
평균으로 대체 → strategy="mean"
가장 자주 등장하는 값으로 대체 → strategy="most_frequent"
상수로 대체 → strategy="constant", fill_value=...
→ 마지막 두 방법은 수치형이 아닌 데이터에도 사용 가능

• imputer.transform(housing_num)의 출력은 NumPy 배열
→ 이를 DataFrame 형태로 다시 변환하여 원래 열 이름과 인덱스를 복원해야 함
housing_tr = pd.DataFrame(X, columns=housing_num.columns, index=housing_num.index)

***OneHotEncoder class
범주의 값을 원-핫 벡터로 바꾸기
출력은 넘파이 배열이 아닌 사이파이 배열. 희소행렬 생성, 메모리 많이 차지

**toarray() 메서드
• 대부분 희소행렬을 보통의 2D 배열처럼 사용할 수 있지만 (밀집된) 넘파이 배열로 반환











