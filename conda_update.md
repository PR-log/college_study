```
==> WARNING: A newer version of conda exists. <==
 current version: 25.1.1
latest version: 25.9.1
  Please update conda by running
 $ conda update -n base -c defaults conda
```
계속 이렇게 떠서 
```
$ conda update -n base -c defaults conda
```
입력
그런데 동일한 코드가 또 출력됨
그래서 찾아보니 conda가 여러개가 있어서 업데이트된 conda와 실제 실행되는게 다른것이라는것을 알게됨.  
```
where conda #conda 경로 확인
C:\ProgramData\miniconda3\Library\bin\conda.bat
C:\ProgramData\miniconda3\Scripts\conda.exe
C:\ProgramData\miniconda3\condabin\conda.bat
```
경로가 3개가 잡히는것을 확인
해결하기위해서 miniconda를 지우고 anaconda를 path 등록
```
rmdir /S /Q C:\ProgramData\miniconda3
```
```
>where conda
정보: 제공된 패턴에 해당되는 파일을 찾지 못했습니다.
```
잘 지워진것을 확인
path에 anaconda도 없어서 추가   
환경변수에 아래 세줄 추가
```
C:\Users\jeehe\anaconda3
C:\Users\jeehe\anaconda3\Scripts
C:\Users\jeehe\anaconda3\Library\bin
```
저장 후  
```
where conda  
conda -version  
```
```
conda update -n base -c defaults conda
```
업데이트가 되었다고 뜨지만 버전은 바뀌지 않아서  
conda forge 채널에서 최신버전으로 설치
```
conda install -n base -c conda-forge conda

```

