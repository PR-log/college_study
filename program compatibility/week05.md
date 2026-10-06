▣ PHP - Hypertext Preprocessor  
■ PHP란 무엇인가?  
- 웹 개발에 특히 적합한 인기 있는 범용 스크립팅 언어  
- 웹 서버에서 해당 코드를 인식하여 작성자가 원하는 웹 페이지를 생성  
홈페이지: https://www.php.net/  
Documentation: https://www.php.net/docs.php  

PHP가 과거에 해킹당해서 털린적이 있는데 그게 20년 전인데  
아직도 PHP가 보안이 약한줄 알고있는 사람들이 있다.  
실제로 지금은 보완되어서 그렇지 않다.  

html 코드를 만드는 언어  

■ 기본 문법  
- <?php(또는 <?)와 ?> 사이에 PHP 코드를 작성  
- 대소문자를 구별함  
하나의 명령어는 세미콜론(;)으로 마침 (생략 시 오류)  
문자열은 작은따옴표나 큰따옴표를 사용  
주석  
한 줄 주석: // 주석  
두 둘 이상: /* 주석 */

### 실습
public_html/week05/ 디렉토리에
```
touch ~/public_html/week05/php_echo.php #파일 생성
```

PHP 안에서 일부 영역은 PHP, 일부 영역은 HTML로 이루어져 있음  
각자 영역을 표시 해줘야 하는데 
그 역할을 하는것.  

PHP는 한 명령어가 끝나면 세미콜론을 찍어야함.  

```
<!-- HTML comment -->

<?php
// 출 력
echo "Hello, World!";
echo "\n";  #줄바꿈을 직접 입력해야함, 소스코드만 바
echo "<h3>Hello, World!</h3>";
/*
여
러
줄
주
석
*/
?>

```
http://203.247.62.32/~s20222505/week05/php_echo.php 에서 확인 가능.  

■ 자료형  
- 숫자: 정수(integer)와 실수(float)  
연산자: 덧셈(+), 뺄셈(-), 곱셈(*), 나눗셈(/), 나머지(%), 제곱(**)  
- 문자열(string): 작은따옴표나 큰따옴표를 사용  
연산자: 문자열 연결(.)  
특수문자: 탭(\t), 줄 바꿈(\n), 역 슬래시(\\), 작은따옴표(\'), 큰따옴표(\")  
- 논리: 참(true) 또는 거짓(false)  
논리 연산자: and(&&), or(||), not(!)  
비교 연산자: >=, <=, >, <, ==, !=
```
 touch ~/public_html/week05/php_variables.php #새 PHP 생성
```
```
<?php

$a = 0;
$b = 0.5;
$c = "php";
$d = true;

printf("%d, %.1f, %s, %b", $a, $b, $c, $d);

?>
```

■ 조건문  
- if statement  
```
touch ~/public_html/week05/php_if.php
```
```
<?php
// 조건문 -if

$score = 40;

if($score >= 90) {
    $grade = "A";
} elseif($score >= 80) {
    $grade = "B";
} elseif($score >= 70) {
    $grade = "C";
} elseif($score >= 60) {
    $grade = "D";
} else {
    $grade = "F";
}

/// 점수 출력(확인)
echo "점수: " . $score . ",   학점: " . $grade;
?>
```
코드블럭을 html에 넣어서 html 영역에서 출력하게 하기  
```
<?php
// 조건문 -if

$score = 40;

if($score >= 90) {
    $grade = "A";
} elseif($score >= 80) {
    $grade = "B";
} elseif($score >= 70) {
    $grade = "C";
} elseif($score >= 60) {
    $grade = "D";
} else {
    $grade = "F";
}

/// 점수 출력(확인)
//echo "점수: " . $score . ",   학점: " . $grade;
?>
<!-- HTML comment -->
점수: <?php echo $score; ?>,  학점: <?= $grade; ?>
```
### 반복문
<img width="1306" height="894" alt="image" src="https://github.com/user-attachments/assets/6e721bf7-078b-4948-802d-606dbbbe6244" />
```
touch ~/public_html/week05/php_for.php
```
```
<?php
// 구구단
$num = 8;

for ($i=1; $i<10; $i++) {
    echo $num . " x " . $i . " = " . ($num * $i) . "<br>"; #br은 웹브라우저에서 새로운 줄을 만들어줌
}

?>
```
<?php
// 구구단
$num = 8;

for ($i=1; $i<10; $i++) {
    echo $num . " x " . $i . " = " . ($num * $i) . "<br>"; #br은 웹브라우저에서 새로운 줄을 만들어줌
}

?>
```
내년에 학과 이름 바뀐다고함.. ai어쩌구 공대로 전환  그 학과로 이름 고치고싶으면 공대로 가는만큼 등록금 더내고 전과 비슷하게 신청하면 가능..  
### 함수
- PHP에서 사용자 정의 함수 만들기
function functionName () {
 code to be excuted;
}
```
touch ~/public_html/week05/php_function.php
```
이번에는 어떤스킬이냐  
우리가 python에서 인자를 넘겨줘서 코드 수정없이 결과값이 나오게 했는데  
php도 인자를 받아서 돌아가는게 핵심이다.  
왜냐하면 만약에 여러분 예를들어서 5단인데 8단 7단으로 바꾸고싶은데 사용하는사람이 소스코드 열어서 수정 가능하지 않으니까.  
지금 보고있는 페이지에 곱하고싶은 값을 php한테 인자로 전달해서 나오도록. 이게 웹 페이지를 만드는 핵심이다.
파란색 페이지를 서버에 요청해서 url을 치고 들어가면 서버가 여기에 해당하는 소스코드를 만들어서 웹페이지가 보여주는거다. 그리고 서버와 연결이 끊어진다.  
그러면 내가 지금 보는 페이지에서 로그인을 누르면 그 페이지로 가서 서버에 다시 요청하고 다시 끊어지고 끝.  
우리가 눈으로 볼때는 연결되어있는것같아보이지만 실제로는 아니다.  
원하는 페이지로 이동 or 검색을 하고싶은데 얘는 던지고끝 던지고끝이다.  
페이지로 넘어갈때 값도 같이 넘겨준다. 어 얘가 오라는값이넘어왔네? 오 출력.  
웹브라우저에서는 항상 이전페이지의 값을 넘겨준다. 그걸 설명해줄거다..  
클릭이라는건 결국 url을 바꿔서 그 페이지로 넘어가는것이다.  

### URL로 값을 PHP 페이지에 전달
```
touch ~/public_html/week05/php_url.php
```
```
<?php
// php_url.php?num=5
$num = $_GET['num'];

// 구구단
//$num = 12;

for ($i=1; $i<=9; $i++) {
  echo $num . " x " . $i . " = " . ($num * $i) . "<br>\n";
}

?>
```
url  
```
http://203.247.62.32/~s20222505/week05/php_url.php?num=7
```
num=x x에 숫자 넣으면 그 단으로 바뀜
