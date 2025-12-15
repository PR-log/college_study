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
