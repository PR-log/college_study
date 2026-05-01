실습: 데이터 전처리  
NA 제거  
```
z_clean <-_____(z) 
```
NA 포함 행 확인
```
x[!_____________(x),]
```
벡터 정렬
```
____(v1)                     # 오름차순
```
데이터 정렬
```
iris[_____(iris$Sepal.Length, decreasing=TRUE),]
```
데이터 분리
```
split_data <- _____(iris, iris$Species)
```
데이터 그룹별 요약
_________(iris[,-5],
          by=list(Species=iris$Species),
          FUN=mean)  # 각 변수의 품종별 평균 출력 (표준편차=sd, 최대값=max)
데이터 병합
_____(x,y, all.x=T) 	  # 첫 번째 데이터셋의 행들은 모두 표시
