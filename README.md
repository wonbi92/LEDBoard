# UINavigationController

## Content View Controller
- 화면을 구성하는 뷰를 직접 구현하고 관련된 이벤트를 처리하는 뷰 컨트롤러
- 흔히 스토리보드 생성시 기본으로 생성되는 뷰 컨트롤러이다.

## Container View Controller
- 하나 이상의 Child View Controller를 가지고 있고, 관리, 레이아웃과 화면 전환을 담당한다.
- 화면 구성과 이벤트 관리는 Child View Controller에서 한다.
- 대표적으로 Navigation Controller와 TabBar Controller가 있다.
- 한마디로 여러가지의 뷰 컨트롤러를 가지고 있는 컨테이너라고 생각하면 된다.

## Navigation Controller
- 계층 구조로 구성된 컨텐츠를 순차적으로 보여주는 컨테이너 뷰 컨트롤러이다.
- 대표적으로 아이폰 설정 앱이 이 네비게이션 컨트롤러로 만들어진 엡이다.
- 설정 -> 일반 -> 정보 이런식으로 하나하나 들어갈 때마다 다음 컨텐츠 뷰 컨트롤러가 뜨는 방식이다. 
- LIFO의 스텍구조로 이루어져 있다.
- 사용자는 Back버튼이나 레프트 엣지 스와이프를 통해 네비게이션 스택에서 차일드 뷰 컨트롤러를 팝(Pop)하게 된다.

# 화면 전환
- 소스코드를 통해 전환하는 방식
- 스토리보드를 통해 전환하는 방식

## 화면 전환 방법
- View Controller 의 View 위에 다른 View를 가져와 바꿔치기 
    - 이 방법은 메모리 누수의 위험이 있어 사용을 지양해야 한다.
- View Controller에서 다른 View Controller 를 호출하여 전환하기 
- Navigation Controller 를 사용하여 화면 전환하기
- 화면 전환용 객체 세그웨이(Segueway) 를 사용하여 화면 전환하기

1. View Controller에서 다른 View Controller 를 호출하여 전환하기 
- 직접 호출해서 전환하는 방법이라 프레젠테이션 이라고도 한다.
- present라는 메소드를 이용하여 호출하면 된다.
- dismiss메소드를 이용해 이전화면으로 다시 전환할 수 있다. 쉽게말해 현재화면을 걷어내는 메소드

2. Navigation Controller 를 사용하여 화면 전환하기
- 네비게이션 스택에 화면을 푸쉬하고 팝하는 방식으로 전환하는것.

3. 화면 전환용 객체 세그웨이(Segueway) 를 사용하여 화면 전환하기
- 스토리보드를 통해 출발지와 목적지를 직접 지정하는 방식으로 코드 없이 스토리보드에서 바로 구현가능한 특징이 있다.
- 액션 세그웨이, 메뉴얼 세그웨이가 있다. 
- 액션 세그웨이에는 Show, Show Detail, Present Modally, Present As Popover, Custom이 있다.

