# Wonbi's Study!

## UINavigationController

### Content View Controller
    - 화면을 구성하는 뷰를 직접 구현하고 관련된 이벤트를 처리하는 뷰 컨트롤러
    - 흔히 스토리보드 생성시 기본으로 생성되는 뷰 컨트롤러이다.

### Container View Controller
    - 하나 이상의 Child View Controller를 가지고 있고, 관리, 레이아웃과 화면 전환을 담당한다.
    - 화면 구성과 이벤트 관리는 Child View Controller에서 한다.
    - 대표적으로 Navigation Controller와 TabBar Controller가 있다.
    - 한마디로 여러가지의 뷰 컨트롤러를 가지고 있는 컨테이너라고 생각하면 된다.

### Navigation Controller
    - 계층 구조로 구성된 컨텐츠를 순차적으로 보여주는 컨테이너 뷰 컨트롤러이다.
    - 대표적으로 아이폰 설정 앱이 이 네비게이션 컨트롤러로 만들어진 엡이다.
    - 설정 -> 일반 -> 정보 이런식으로 하나하나 들어갈 때마다 다음 컨텐츠 뷰 컨트롤러가 뜨는 방식이다. 
    - LIFO의 스텍구조로 이루어져 있다.
    - 사용자는 Back버튼이나 레프트 엣지 스와이프를 통해 네비게이션 스택에서 차일드 뷰 컨트롤러를 팝(Pop)하게 된다.

## 화면 전환
    - 소스코드를 통해 전환하는 방식
    - 스토리보드를 통해 전환하는 방식

### 화면 전환 방법
    - View Controller 의 View 위에 다른 View를 가져와 바꿔치기 
        - 이 방법은 메모리 누수의 위험이 있어 사용을 지양해야 한다.
    - View Controller에서 다른 View Controller 를 호출하여 전환하기 
    - Navigation Controller 를 사용하여 화면 전환하기
    - 화면 전환용 객체 세그웨이(Segueway) 를 사용하여 화면 전환하기

### 1. View Controller에서 다른 View Controller 를 호출하여 전환하기 
    - 직접 호출해서 전환하는 방법이라 프레젠테이션 이라고도 한다.
    - present라는 메소드를 이용하여 호출하면 된다.
    - dismiss메소드를 이용해 이전화면으로 다시 전환할 수 있다. 쉽게말해 현재화면을 걷어내는 메소드

### 2. Navigation Controller 를 사용하여 화면 전환하기
    - 네비게이션 스택에 화면을 푸쉬하고 팝하는 방식으로 전환하는것.

### 3. 화면 전환용 객체 세그웨이(Segueway) 를 사용하여 화면 전환하기
    - 스토리보드를 통해 출발지와 목적지를 직접 지정하는 방식으로 코드 없이 스토리보드에서 바로 구현가능한 특징이 있다.
    - 액션 세그웨이, 메뉴얼 세그웨이가 있다. 
    - 액션 세그웨이에는 Show, Show Detail, Present Modally, Present As Popover, Custom이 있다.

## View Controller Life Cycle

- UIViewController의 객체에는 뷰 계층을 관리하는 메소드가 정의되어 있고, 이 메소드들은 각자의 메소드가 호출되어야 할 타이밍에 iOS시스템이 자동으로 호출해준다.
- 프로퍼티 옵저버처럼 자동으로 호출된다고 생각하면 된다.
- 메소드는 총 다섯가지가 있다. 프로퍼티 옵저버와 마찬가지로 메소드의 이름을 보면 언제 호출되는지 바로 알 수 있기 때문에 메소드 이름을 잘 살펴보자.

1. viewDidLoad()
    - 뷰 컨트롤러의 모든 뷰들이 메모리에 로드되었을 때 딱 한번 실행된다.
    - 나타나거나 사라지는 것이 아니라 "로드"되었을 때 실행되는 메소드이다.

2. viewWillAppear()
    - 뷰가 뷰 계층에 추가되고, 화면에 나타나기 직전에 실행된다.

3. viewDidAppear()
    - 뷰가 뷰 계층에 추가되고, 화면에 나타난 직후에 실행된다.

4. viewWillDisappear()
    - 뷰가 뷰 계층에서 사라지기 직전에 실행된다.

5. viewDidDisappear()
    - 뷰가 뷰 계층에서 완전히 사라진 직후에 실행된다.

- 이 라이프사이클 메소드를 적절히 활용하면, 상황에 맞는 적절한 처리들을 쉽게 해줄 수 있다.
- 이번 LED전광판 실습의 경우, 전광판 화면에서 전광판 설정화면으로 들어갈 때, 이전 설정값들이 설정 화면에 유지될 수 있게 만들어 주기 위해 활용했다.

## 화면간 데이터 전달하기
- 코드로 구현된 화면 전환 방법에서 데이터 전달하기.
- 세그웨이로 구현된 화면 전환 방법에서 데이터 전달하기.
- Delegate 패턴을 활용하여 이전 화면으로 데이터 전달하기.

### 1. 코드로 구현된 화면 전환 방법에서 데이터 전달하기.
    - 스토리보드의 `instantiateViewController`메소드를 활용해서 스토리보드에 있는 뷰 컨트롤러가 인스턴스화 시킨 후, 인스턴스화 된 뷰 컨트롤러의 프로퍼티에 접근해서 데이터를 전달하였다.
    ```Swift
    @IBAction func tapCodePushButton(_ sender: UIButton) {
    guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as? CodePushViewController else { return }
    // 뷰 컨트롤러를 인스턴스화 한 후 CodePushViewController로 다운캐스팅
    viewController.modalPresentationStyle = .fullScreen
    viewController.name = "Wonbi"
    self.navigationController?.pushViewController(viewController, animated: true)
    }
    // 인스턴스화 된 뷰 컨트롤러의 프로퍼티의 값에 접근하여 데이터를 전달
    ```

### 2. 세그웨이로 구현된 화면 전환 방법에서 데이터 전달하기.
    - `prepare`메소드를 오버라이드 하여 전환하려는 뷰 컨트롤러의 인스턴스를 가져오고 프로퍼티에 접근하여 데이터를 전달하였다.
    ```Swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SuguePushViewController {
        // 뷰 컨트롤러의 인스턴스를 가져온 후, SuguePushViewController로 다운캐스팅
            viewController.name = "Wonbi"
        // 프로퍼티에 접근하여 데이터 전달
        }
    }
    ```
    
### 3. Delegate 패턴을 활용하여 이전 화면으로 데이터 전달하기.
    - 이전 화면으로 데이터를 전달하는 방법으로 Delegate 패턴을 가장 많이 활용한다.
    - Delegate는 클래스나 구조체가 책임을 일부 다른 타입의 인스턴스로 전달 또는 위임 할 수 있게 하는 Design Pattern이다.
    - `protocol`을 활용하여 위임 받는 타입이 어떤 메소드를 실행해야 할지 지정해준다.
    - 그 다음 위임 받는 클래스에서 메소드를 어떻게 구현할 지 코드를 짜면 된다.
    
    - 이 과정에서 주의사항이 있다.
        1. 프로토콜 선언 시 `AnyObjet`를 상속 받아야 한다.
        2. delegate 변수는 weak(약한 참조)로 선언해야 한다.
            - 변수에 프로토콜을 타입으로? 타입으로서의 프로토콜? -> 프로토콜은 요구만 하고 스스로 기능을 구현하지 않는다. 하지만 프로토콜은 코드에서 완전한 하나의 타입으로 사용되기 때문에 여러 위치에서 프로토콜을 타입으로 사용할 수 있다.
    - delegate를 약한 참조가 아닌 강한 참조로 선언하게 되면 reference cycle에 의해 메모리 누수가 발생할 수 있다.
    - 따라서 delegate를 약한 참조로 선언하기 위해 delegate protocol은 클래스 전용 프로토콜(Class Only Protocol)로 선언되어야 한다.
    - 결국 프로토콜은 `AnyObjet`를 상속받아야 한다. 여기서 `AnyObjet`는 모든 클래스 타입의 인스턴스를 나타낼 수 있다. 즉, 클래스 타입만 저장할 수 있다.
    
    - 이번 LED전광판 실습에서 활용한 것을 보자.
    ```Swift
    protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
    }
    
    class SettingViewController: UIViewController {
        weak var delegate: LEDBoardSettingDelegate?
    
        @IBAction func tapSaveButton(_ sender: UIButton) {
            self.delegate?.changedSetting(
                text: self.textField.text,
                textColor: self.textColor,
                backgroundColor: self.backgroundColor
            )
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    class ViewController: UIViewController, LEDBoardSettingDelegate {
        func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
            if let text = text {
                self.contentsLabel.text = text
            }
            self.contentsLabel.textColor = textColor
            self.view.backgroundColor = backgroundColor
        }
    }
    ```
    - LED전광판 메인 화면에서 설정 화면으로 들어갈 때, 이전 설정들이 설정 화면에 남아있게 하기 위해 이 Delegate 패턴을 사용했다. 
    - 재미있는 점은 프로토콜이 요구한 메소드를 실행하는 순간은 설정 창(세팅 뷰 컨트롤러)에서 저장 버튼을 눌렀을 때 데이터가 델리게이트 메소드에 전달이 되고, 전광판의 뷰 컨트롤러에서 prepare 메소드가 실행되었을 때 delegate 프로토콜에서 요구한 메소드가 실행된다는 점이다. 메소드가 어떻게 실행되는지 역시 전광판의 뷰 컨트롤러에서 구현해준다.
    - 결국, 세팅 뷰 컨트롤러에서는 위임을 해줘서 어떤 데이터를 넘겨줄지만 선언해주고, 위임받은 전광판 뷰 컨트롤러가 위임 받은 데이터를 어떻게 활용하고 언제 호출할지 정하는 것이다. 이 방법을 통해 이전 화면에 있던 데이터를 받아 처리하게 되는 것이다.
    

- 프로토콜이 완전한 하나의 타입으로 사용된다는 점과, delegate패턴을 활용할 때는 약한 참조와 클래스 전용 프로토콜로 활용해야 한다는 점을 새로 알게 되었다.

## 에셋 카탈로그에 이미지 추가하기.
- 에셋 카탈로그에 이미지를 추가할 때 각 1x, 2x, 3x 이미지를 추가하는 이유는 다양한 해상도에서 이미지가 깨지는 것을 방지하기 위함이다.

