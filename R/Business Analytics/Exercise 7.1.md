## 연습문제 7.1
297pg
### 1. 
y는 반응변수이고 x d1, d2는 예측변수들인 선형회귀모형을 고려해보라. d1과 d2 모두는 각각 1 또는 0의 값을 가지는 더미변수이다.   
x, d1, d2와 상호작용변수인 d1d2를 가지고 있는 회귀모형은 y^ = -1.34 + 1.02x + 3.08d1 - 1.29d2 + 0.58d1d2와 같이 추정된다  
a. x = 5, d1 = 1이고 d2가 0과 1일 때 y^을 계산하라
```
predict_y <- function(x, d1, d2) {
  y_hat <- -1.34 +
    1.02 * x +
    3.08 * d1 -
    1.29 * d2 +
    0.58 * d1 * d2
  
  return(y_hat)
}
```
b. x=5, d1 = 0 이고 d2가 0과 1 일 때 y^을 계산하라
```
predict_y(x = 5, d1 = 1, d2 = 0)
predict_y(x = 5, d1 = 1, d2 = 1)
```
### 2.  
y는 반응변수이고 x와 d는 예측변수들인 선형회귀모형을 고려해보라. d는 1 또는 0위 값을 가지는 더미변수이다.  
x, d와 상호작용변수인 xd를가지고 있는 회귀모형은 y= 5.2 + 0.9x + 1.4d + 0.2xd와 같이 추정된다
a. x=10과 d = 1일 때 y를 계산하라.
```
x = 0
d = 0
predict_y <- function(x, d) {
  y_hat <- 5.2 +
    0.9 * x +
    1.4 * d -
    0.2 * x * d
  
  return(y_hat)
}

predict_y(x = 10, d = 1)

```
b. x=10과 d=0일 때 y를 계산하라.
```
predict_y(x = 10, d1 = 0)

```
### 3.
y는 반응변수이고 x1와 x2는 예측변수들인 선형회귀모형을 고려해보라.   
x1, x2와 상호작용변수인 x1x2를 가지고 있는 회귀모형은 y=123.12 + 6.91x1 - 1.53x2 - 0.12x1x2와 같이 추정된다  
a. x1 = 12와 x2는 20과 30일 때 y를 계산하라.
```
x1 = 0
x2 = 0
predict_y <- function(x, d) {
  y_hat <- 123.12 +
    6.91 * x1 +
    1.53 * x2 -
    0.12 * x1 * x2
  
  return(y_hat)
}

predict_y(x1 = 12, x2 = c(20,30))
```
b. x1= = 24와 x2는 20과 30일 때 y를 계산하라
```
predict_y(x1 = 24, x2 = c(20,30))
```
### 4.
Exercise_7.4. 첨부된 데이터 파일은 반응변수 y와 예측변수들 x, d1, d2에 대한 20개의 관측치를 포함하고 있다.  
a. 예측변수들 x, d1, d2를 가진 회귀모형을 추정하고 이어서 상호작용변수들 d1d2를 포함하기 위해 이 모형을 확장하라.  
```
m1 <- lm(y ~ d1 + d2, data=df)
m2 <- lm(y ~ d1 + d2 + d1 * d2, data=df)
```
b. 선호되는 모형을 사용하여 x = 20, d1 = 1이고 d2가 0과 1일 때 y를 계산하라.
```
summary(m1) #Adjusted R-squared:  0.2553, p-value: 0.0317
summary(m2) #Adjusted R-squared:  0.2421, p-value: 0.06031
#R-squared는 차이가 크지 않지만 p-value가 m1이 더 좋아서 m1 사용

predict(m1, newdata = data.frame(x = 20, d1 = 1, d2 = 0))
predict(m1, newdata = data.frame(x = 20, d1 = 1, d2 = 1))
```
### 5.
Exercise_7.5. 첨부된 데이터 파일은 반응변수 y와 예측변수들 x와 d를 가진 회귀모형을 추정하고 이어서 상호작용변수 xd를 포함하기 위해 이 모형을 확장하라.  
a. 예측변수들 x 와 d를 가진 회귀모형을 추정하고 이어서 상호작용변수 xd를 포함하기 위해 이 모형을 확장하라.  
```
m1 <- lm(y ~ x + d, data=df)
m2 <- lm(y ~ x + d + x * d, data=df)
```
b. 선호되는 모형을 사용하여 x = 15이고 d가 0과 1일 때 y을 계산하라.
```
summary(m1) #Adjusted R-squared:  0.4184 , p-value:0.003881
summary(m2) #Adjusted R-squared:  0.5578, p-value: 0.001008
#R-squared, p-value 모두 m2가 우세

predict(m2, newdata = data.frame(x = 15, d = 0))
predict(m2, newdata = data.frame(x = 15, d = 1))
```
### 6.
Exercise_7.6. 첨부된 데이터 파일은 반응변수 y와 예측변수들 x1과 x2에 대한 20개의 관측치를 포함하고 있다.  
a. 예측변수들 x1과 x2를 가진 회귀모형을 추정하고 이어서 상호작용변수 x1x2를 포함하기 위해 이 모형을 확장하라.  
```
m1 <- lm(y ~ x1 + x2, data=df)
m2 <- lm(y ~ x1 + x2 + x1 * x2, data=df)
```
b. 선호되는 모형을 사용하여 x1 = 30이고 x2가 10과 20일 때 y를 계산하라.
```
summary(m1) #Adjusted R-squared:  0.5896 , p-value:0.0002002
summary(m2) #Adjusted R-squared:  0.6559, p-value: 0.0001431
#R-squared, p-value 모두 m2가 우세

predict(m2, newdata = data.frame(x1 = 30, x2 = 10))
predict(m2, newdata = data.frame(x1 = 30, x2 = 20))
```
298pg
### 7.
Overweight 미국 보건복지무(U.S Department of Health and Human Services)에 의하면, 미국에서 흑인 여성들은 다른 그룹과 비교하여 과체중 비율이 가장 높다.  
은 체질량지수(BMI)가 25 이상이면 과체중으로 여겨진다. 120명으로부터 데이터가 수집되었다. 다음의 표는 개인의 BMI, Female 더미변수(Female: 여성이면 1, 그렇지 않으면 0), Black 더미변수(Black: 흑인이면1, 그렇지 않으면 0)에 대한 데이터의 일부를 보여준다.  
a. 백인 남성, 백인 여성, 흑인 여성의 BMI를 예측하기 위해 회귀모형 BMI = b0 + b1Female + b2Black + b3(Female * black) ε을 추정하라.
```
df <- read_excel("jaggia_ba_1e_data_files/jaggia_ba_1e_ch07_Data_Files.xlsx", sheet = "Overweight")
m1 <- lm(BMI ~ Female + +Black + Female * Black, data = df)
```
b. 5%의 수준에서 백인 여성과 백인 남성 간 차이가 통계적으로 유의한가?
```
summary(m1)
# Female        -3.4456     0.6079  -5.668      0.0000001073081 ***
# p value가 0.05보다 낮기 때문에 유의하다고 볼 수 있다.
```
c. 5%의 수준에서 백인 남성과 흑인 남성 간 차이가 통계적으로 유의한가?
```
#Black         -1.3139     0.4332  -3.033              0.00299
# p value < 0.05 -> 유의함
```
### 8.
Diversity_Silicon. 실리콘 밸리 기술회사들은 종업원의 대부분이 백인과 아시아계 남성이기 때문에 인종 다양성을 증가시키라는 압력을 받고 있다(Bloomberg, August16, 2017).  
흑인과 히스패닉, 특히 여성은 매우 적다. 이러한 인종 다양성 부족이 창업멤버의 인종 다양성 부족에 의해 영향을 받는지를 분석하기 위해 실리콘 밸리 기술회사들에 근무하는 백인과 아시아계 남성 (Majority Male)의 비율과 창업 멤버에 여성(Female)과/또는 흑인이나 히스패닉 남성(Minority Male)이 포함되어 있는지에 대한 데이터가 수집되었다. 이러한 데이터의 일부가 다음의 표에 제시되어 있다.
a. Female, Minority Male, Female과 Minority간 상호작용변수의 효과를 추정하고 해석하라.
```
m1 <- lm(`Majority Male` ~ Female + `Minority Male` + Female * `Minority Male`, data=df)

summary(m1)

>>> Coefficients:
Estimate Std. Error t value             Pr(>|t|)    
(Intercept)              88.571      1.296  68.337 < 0.0000000000000002 ***
  Female                   -8.571      3.460  -2.478              0.01545 *  
  `Minority Male`          -6.218      2.554  -2.435              0.01724 *  
  Female:`Minority Male`  -18.782      5.525  -3.399              0.00108 ** 
# 다수자 집단에서, 여성 관측치의 ‘(Y)’는 다수자 남성 관측치보다 약 8.6만큼 낮다.
# 다수자 집단에서, 소수자 남성의 ‘(Y)’는 다수자 남성 관측치보다 약 6.2만큼 낮다.
# 소수자 여성에게 추가로 -18.8의 효과가 있고 매우 강하게 유의하다
```
b. 창업멤버에 여성은 포함되어 있으나 히스패닉 남성은 포함되어 있지 않을 때 백인과 아시아계 남성의 비율을 예측하라.   
창업멤버에 여성과 히스패닉 남성이 포함되어 있을 때 백인과 아시아계 남성의 비율을 예측하라.
```
predict(m2, newdata = data.frame(Female = 1, `Minor Male` = 0))
predict(m2, newdata = data.frame(Female = 1, `Minor Male` = 1))

```
### 9.
IceCream, 한 최근의 서베이에서 오하이오 주의 신 시내티에 있는 아이스크림 트럭 운전사들은 전형적인 여름 하루에 약 280달러를 번다고 보고하였다.   
이러한 수입은 일 반적으로 근무시간이 더 긴 날, 특히 더운 날과 휴일에 더 높 다. 이르마는 5주 동안 한 아이스크림 트럭 운전사를 따라다 냈다.  
그녀는 이 운전사의 일일 수입(Income), 도로상에 있 는 시간(Hours), 특별히 더운 날인지 여부(Hot: 화씨 80도가 넘으면 1, 그렇지 않으면 0), 휴일인지 여부(Holiday: 휴일이 면 1, 그렇지 않으면 0)에 대한 데이터를 수집하였다. 이러한 데이터의 일부가 다음의 표에 제시되어 있다.  
a. Income에 대한 Hours, Hot, Holiday의 효과를 추정하고 해석하라. 더운 휴일날에 6시간 일한 운전사의 수입을 예측하라.
```
m1 <- lm(Income ~ Hours + Hot + Holiday, data=df)
summary(m1)
>>>
Coefficients:
  Estimate Std. Error t value    Pr(>|t|)    
(Intercept)   -1.449     30.762  -0.047    0.962729    
Hours         32.023      4.329   7.397 0.000000025 ***
  Hot           90.508     12.659   7.150 0.000000049 ***
  Holiday       54.094     13.091   4.132    0.000253 ***
#수입이 도로상에 있는 시간 1시간마다 32씩, 화씨 80이 넘으면90.5, 휴일이면 54 만큼 상승한다

predict(m1, newdata = data.frame(Hours = 6, Hot = 1, Holiday = 1))
# 335.2886 
```
b. Hot과 Holiday 간 상호작용변수를 포함하도록 위의 모형을 확장하라. 더운 휴일날에 6시간 일한 운전사의 수입을 예측하라. 휴일날이 아닐 때 이 운전사의 수입을 예측하라.
```
m2 <- lm(Income ~ Hours + Hot + Holiday + Hot * Holiday, data=df)
predict(m1, newdata = data.frame(Hours = 6, Hot = 1, Holiday = 1)) #354.8029
predict(m1, newdata = data.frame(Hours = 6, Hot = 1, Holiday = 0)) #268.8348
```
### 10.
Mobile_Devices. 미국인들은 디지털 정보 세계에 접속하기 위해 하루에 스마트폰과 기타 모바일 기기를 평균 2시간 37분 사용한다(Business Insider, May 25, 2017).  
모바일 기기의 사용 시간은 특히 부유하고 대학교육을 받은 도 시/교외 거주자들의 경우에 길다.  
서베이가 시카고 주위 50 마일 반경에 사는 고객들을 대상으로 수행되었다. 참여자들 에게 하루에 모바일 기기를 사용하는 평균 시간(Usage, 분), 가계소득(Income, 1,000달러), 농촌지역에 사는지 여부 (Rural: 농촌지역에 살면 1, 그렇지 않으면 0), 학사학위를 가 지고 있는지 여부(College: 학사학위를 가지고 있으면 1, 그 렇지 않으면 0)를 물었다. 이러한 데이터의 일부가 다음의 표 에 제시되어 있다.  
a. Income, Rural, College, Rural과 College 간 상호작용 변수에 기초하여 모바일 기기 사용시간을 위한 회귀모형을 추정하고 해석하라. 
   Rural과 College 간 상호작용변수를 사용하는 이유를 설명하라.
```
m1 <- lm(Usage ~ Rural + College + Rural * College, data = df)
summary(m1) 
>>>
Coefficients:
  Estimate Std. Error t value             Pr(>|t|)    
(Intercept)    14.9236    12.5439   1.190              0.23791    
Income          0.9808     0.0664  14.771 < 0.0000000000000002 ***
  Rural         -42.3267    14.6553  -2.888              0.00506 ** 
  College        20.4745    11.3455   1.805              0.07514 .  
Rural:College  49.8701    18.1354   2.750              0.00747 **
# 수입이 증가하면 0.98 증가, 농촌지역에 살면 42.3분 감소, 학사학위를 가지고 있으면 20.4 증가한다. 대졸과 농촌의 상관이 49.8로 높다
# 한 변수의 효과가 다른 변수에 의해서 변하는 차이를 모델에 반영하기 위해 사용한다.
```
b. 가계소득이 120,000달러이고 농촌지역에 사는 대학교육을 받은 사람의 모바일 기기 사용시간을 예측하라. 도시/교외 지역에 사는 사람의 모바일 기기 사용시간을 예측하라.
```
predict(m1, newdata = data.frame(Income = 120000, Rural = 1, College = 1)) #117740.8
```
c. 학사학위가 모바일 기기 사용시간에 미치는 영향을 논의하라.
```
College        20.4745    11.3455   1.805              0.07514
학사학위가 있으면 모바일 기기 사용시간이 약20.4 증가한다. 하지만 10% 수준에서 유의함으로 통계적으로 약하지만 무시할 수 없는 정도이다.
```
### 11.
Urban. 한 사회학자는 미국에 사는 가족의 소비지출(Consumption, 달러)과 가족소득(Income, 달러), 가족이 도시 또는 농촌 지역에 사느냐 여부 (Urban:도시에 살면 1, 그렇지 않으면 0)의 관계를 검토하고 있다.
그녀는 미국 전역에 사는 50명의 가족에 대한 데이터를 수집하였다. 이러한 데이터의 일부가 다음의 표에 제시되어 있다.
a. Consumption = b0 + b1Income + e. 소득이 75,000 달러인 가족의 예측되는 소비지출을 계산하라.
``` 
m1 <- lm(Consumption ~ Income, data = df)
predict(m1, newdata = data.frame(Income = 75,000)) #8201.48
```
b. 도시지역과 농촌지역에 사는 소득이 75,000 달러인 가족의 소비지출을 예측하기 위해 Urban 더미변수를 포함시켜라.
```
m2 <- lm(Consumption ~ Income + Urban, data = df)
```
c. 도시지역과 농촌지역이 사는 소득이 75,000달러인 가족의 소비지출을 예측하기 위해 Urban 더미변수와 상호작용변수(Incone * Urban)를 포함시켜라
```
m3 <- lm(Consumption ~ Income + Urban + Income * Urban, data = df)
```
d. 위의 모형들 중에서 어느 모형이 데이터에 가장 적합한가? 설명하라.
```
summary(m1) #Adjusted R-squared:  0.5806 
summary(m2) #Adjusted R-squared:  0.6006
summary(m3) #Adjusted R-squared:  0.6333
# 마지막 모형이 가장 적합하다
```
### 12.
Pick_Errors. 한 온라인 소매업체의 배송센터는 약간의 "선택 실수"(예를 들면, 잘못된 품목을 검색하는 것)를 경험하고 있다.
종업원의 연간 실수 건수(Errors), 근무연수(Exper, 년)와 종업원이 훈련프로그램에 참석했는지 여부(Training: 종업원이 훈련프로그램을 참석했으면 1, 그렇지 않으면 0)에 대한 정보가 수집되었다.
a. 다음과 같은 2개의 모형을 추정하라.
   Errors = b0 + b1Exper + b2Train + e와
   Errors = b0 + b1Exper + b2Train + b3(Exper * Train) +e
```
m1 <- lm(Errors ~ Exper + Train, data=df)
m2 <- lm(Errors ~ Exper + Train + Exper * Train, data=df)
```
b. 조정 R^2와 5% 수준에서 예측변수들의 유의성 기준에 의하면, 어느 모형이 더 양호한 적합도를 제공하는가?
```
summary(m1)  #Adjusted R-squared:  0.5621, p-value: 0.000005488
summary(m2)  #Adjusted R-squared:  0.6035, p-value: 0.000004955
# R^2와 p-value 모두 상호작용이 있는 회귀모델이 더 양호한 적합도를 제공한다
```
c. 선택된 모형을 사용하여 훈련프로그램에 참석했던 10년의 근무연수를 가진 종업원의 선택 실수 건수를 예측하라.
```
predict(m2, newdata = data.frame(Train = 1, Exper = 10)) #12.45911
```
d. 양의 상호작용변수 계수 추정치에 대한 실용적인 해석을 제시하라
```
Exper:Train   0.9785     0.5007   1.954        0.0615 .
훈련 받은 사람에게서 경력에 따른 실수의 변화가 증가하지만 수치가 낮고 유의확률도 10%정도에서 유의하므로 비용을 생각했을 때
훈련 효과를 무시하거나 우선도를 낮춰도 된다
```




