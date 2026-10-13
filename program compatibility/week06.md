10월 20일 중간고사  
### 디렉토리 생성 > 이동
cd ~  
mkdir ~/public_html/week07/  
cd ~/public_html/week07/  

### 파일 생성
touch php_form.php  
```
<!-- HTML 영역시작 -->
<form action="php_form.php" method="get">
  - 숫자입력: <input type="text" name="num"><br>
  - ID: <input type="text" name="id"><br>
  - PW: <input type="password" name="paswwd"><br>
  <button type="submit">로그인</button>
</form>
```
```
■ <input> 태그
- 사용자의 데이터를 받을 수 있는 입력 요소
- type 유형
button: 버튼
checkbox: 단일 값을 선택하거나 선택 해제할 수 있는 체크박스
color: 색을 지정할 수 있는 컨트롤
date: 날짜(연월일, 시간 없음)를 지정할 수 있는 컨트롤
datetime-local: 날짜와 시간을 지정할 수 있는 컨트롤(시간대 없음)
email: 이메일 주소를 편집할 수 있는 필드(유효성 검증)
file: 파일을 선택할 수 있는 컨트롤
hidden: 값을 표시하지 않고 전송하는 필드
image: 이미지로 나타나는 시각적 제출(전송) 버튼
month: 연과 월을 지정할 수 있는 컨트롤
number: 숫자를 입력하기 위한 컨트롤
password: 값이 가려진 한줄 텍스트 필드
radio: 같은 name 값을 가진 여러 개의 선택 중에서 하나의 값을 선택하게 하는 라디오 버튼
range: 값이 가려진 숫자를 입력하는 컨트롤
reset: 양식의 내용을 초기화하는 버튼(입력 및 수정한 내용을 초기화)
search: 검색문자열을 입력하는 한줄 텍스트 필드
submit: 양식을 전송하는 버튼
tel: 전화번호를 입력하는 컨트롤
text: 한줄의 텍스트 필드(기본값)
time: 시간을 입력하는 콘트롤(시간대 없음)
url: URL을 입력하는 필드(유효성 검증)
week: 년과 주를 구성하는 날짜를 입력하는 컨트롤
```

```
<!-- HTML 영역시작 -->
<form action="php_form.php" method="get">
  - 숫자입력: <input type="text" name="num" value="<?=$_GET['num']?>"><br>
<!--
  - ID: <input type="text" name="id"><br>
  - PW: <input type="password" name="passwd"><br>
  <button type="submit">로그인</button>
-->
  <button type="submit">계산</button>
</form>
<?php
//  PHP 영역
//echo "<br> - num: " . $_GET['num'] . "<br><br>";

$num = $_GET['num'];

// 구구단
//$num = 12;

for ($i=1; $i<=9; $i++) {
  echo $num . " x " . $i . " = " . ($num * $i) . "<br>\n";
}

?>

```
  
gugudan.php
```
<!-- HTML 영역시작 -->
<form action="" method="get">
  - 숫자입력: <input type="text" name="num" value="<?=$_GET['num']?>"> 
  <button type="submit">계산</button>
</form>
```

