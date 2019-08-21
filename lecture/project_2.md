# Project 2 정리 노트
> * 다양한 애플리케이션에서 활용할 수 있는 회원가입 절차 구현
> * 화면전환 방법 습득
> * 공유 데이터 관리
> * 디자인 패턴의 이해향상
> * [Human Interface Guideline](#Human-Interface-Guideline)
## 배우는 내용
- 디자인 패턴
	- [Delegation Pattern](#Delegation)
	- [Singleton](#싱글턴)
	- Targte-Action
- 화면전환
	- [네비게이션 인터페이스](#네비게이션-인터페이스)
	- [Modality](#Modal)
- UIKit
	- UITextField
	- UIDatePicker
	- UIStackView
	- UIImagePickerController
	- UIGestureRecognizer
	- [View Controller States Methods(뷰의 생명주기)](#뷰의-상태변화-감지-메서드)
- Foundation
	- DateFormatter
- Swift
	- Dictionary의 활용
	- guard 구문의 활용

## Human Interface Guideline
H.I.G는 앱을 개발할 때 필요한 디자인과 동작을 포함한 여러 규칙을 통하여 사용자가 인터페이스를 구성하는 방법에 대한 지침이다.
> 한마디로 가이드라인!
### 왜 H.I.G 문서를 읽어야 하나?
- 개발자가 아닌 사용자의 입장에서 애플리케이션을 바라보고 설계할 수 있다.
- 기준점을 제시하여 협업의 효율성 상승
- 이미 검증된 사용자 경험을 이해하는 과정

### ios Design 테마
- Clarity : 시스템 전체에서 텍스트는 모든 크기에서 읽을 수 있어야 하고, icon 또한 적절하게 써야 함.
- Deference : 유동적인 모션과 선명하고 아름다운 인터페이스는 콘텐츠를 이해하고 상호 작용하도록 도와줌. 일반적으로 콘텐츠는 전체 화면을 채우지만 반투명과 흐림은 종종 더 많은 것을 암시한다. 베젤 및 그림자의 사용을 최소화하여 인터페이스를 밝게 유지하면서 컨텐츠를 최우선한다.
- Depth : 뚜렷한 시각적 계층과 현실적인 동작은 계층을 전달하고 활력을 부여하며 이해를 돕는다. 접촉 및 발격 가능성은 즐거움을 높이고 기능 및 추가 컨텐츠에 대한 액세스를 가능하게 한다. 전환은 콘텐츠를 탐색할 때 깊이감을 제공한다.

### 디자인 원칙
- 심미 무결성
> ex) 사람들이 심각한 작업을 수행하는데 도움이되는 앱은 미묘하고 눈에 거슬리지 않는 그래픽, 표준 컨트롤 및 예측 가능한 동작을 사용하여 집중력을 유지할 수 있습니다. 반면에 게임과 같은 몰입형 앱은 재미 있고 흥분할 수 있는 매력적인 모습을 제공 할 수 있으며 동시에 발견을 장려합니다.
- 일관성
> 일관된 응용프로그램은 인터페이스 요소, 잘 알려진 아이콘, 스타일 및 통일된 용어를 사용하여 익숙한 표준 및 페러다임을 구현합니다. 이러한 앱은 사람들이 생각하는 방식으로 기능과 동작을 합니다.
- 직접 조작
> 컨텐츠를 화면으로 직접 조작하는 것은 사람들을 끌어들이고 이해를 돕습니다. 장치를 회전하거나 제스처를 사용하여 화면 콘텐츠에 영향을 줄 때 직접 조작을 경험합니다. 직접조작을 통해 즉각적이고 가시적인 행동 결과를 볼 수 있습니다.
- 피드백
> 피드백은 행동을 인정하고 사용자들에게 정보를 제공합니다. 진행률 표시와 같이 작성 상태를 전달하며 애니메이션 및 사운드는 작업 결과를 명확하게 보여줍니다.
- 은유
- 사용자 컨트롤
> 대화형 요소를 넣어 친숙하고 예측 가능하게 유지하고 작업이 이미 진행중인 경우에도 작업을 취소하기 쉽게함으로써 사람들이 통제 가능 상태에 있는것처럼 느낄 수 있게 합니다.

#### 참고
- [Human Interface Guideline](https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/)

[돌아가기 > 배우는 내용](#배우는-내용)

## 네비게이션 인터페이스

### 네비게이션 인터페이스란..
> 뷰 이동을 계층적 구조(드릴 다운 인터페이스)로 사용되는 인터페이스이다.
![계층적 구조](./img/project2/navigation1.png)

### 네비게이션 컨트롤러는 왜 쓰는거지..?
> 네비게이션 컨트롤러를 사용하게 되면 네비게이션 스택을 사용하여 다른 뷰 컨트롤러를 관리하게 되는데, 기본적으로 ios 화면전환은 stack과 같은 느낌이다.  인터페이스의 stack이란 화면이 바뀔 때마다 원래 있던 화면 위에 새 화면이 올라가는 형식인데 그래서 다시 이젠 화면으로 돌아갈 때엔 이전에 올렸던 화면을 빼야한다. 여기서 네이게이션 컨트롤러를 사용하면 뷰를 pop 하거나 push를 하기 용의해지는데, 뷰를 pop하게 되면 이전에 올라갔던 화면을 빼주는 역할을 하게 된다. + 추가요청..

### 네비게이션 스택의 팝과 푸쉬
1. 네비게이션 스택의 push
> 네비게이션 스택에 새로운 뷰 컨트롤러가 푸쉬되면서 인스턴스가 생성되고, 내비게이션 스택에 추가

2. 네비게이션 스택의 pop
> 네비게이션 스택에 존재하는 뷰 컨트롤러가 팝 될 때 생성되었던 뷰컨트롤러의 인스턴스는 다른 곳에서 참조되고 있지 않다면 메모리에서 해제되고, 내비게이션 스택에서 삭제됨

### UINavigationController 코드 사용법
```
// 루트 뷰 컨트롤러가 될 뷰 컨트롤러를 생성합니다.
let rootViewController = UIViewController()
// 위에서 생성한 뷰 컨트롤러로 내비게이션 컨트롤러를 생성합니다.
let navigationController = UINavigationController(rootViewController: rootViewController)
```

### 네비게이션 바 지우기
1. 스토리보드에서
> ![네비게이션바지우기](./img/project2/navigation2.png)
2. 코드
```
navigationController?.isNavigationBarHidden = true
```
#### 참고
- [UINavigationBar - UIKit](https://developer.apple.com/documentation/uikit/uinavigationbar)
- [UINavigationController - UIKit](https://developer.apple.com/documentation/uikit/uinavigationcontroller)

[돌아가기 > 배우는 내용](#배우는-내용)

## Modal
### Modal(모달)이란..?
> 화면 전환 기법! 하지만 화면전환(X) 화면위에띄우기(o)

사실, 화면을 전환한다기 보다는 이목을 집중해야 하는 화면을 다른 화면 위로 띄워(Presenting) 표현하는 방식이다.
- ex 1 ) alert 창을 띄울때(present)
- ex 2 ) 이메일이나 문자를 작성하는 화면같이 뜨는 창

그래서 모달은 내비게이션 인터페이스와는 달리 정보의 흐름을 가지고 화면을 이동한다기 보다는 꼭 이목을 끌어야하는 화면에서 사용한다. 내비게이션 인터페이스를 통해 화면을 표현하는 것과는 용도가 완전히 다르다고 볼 수 있다. 그래서 모달로 보이는 화면은 되도록 단순하고 사용자가 빠르게 처리할 수 있는 내용을 표현하는 것이 좋다. 

### 사용 방법
#### 1. StoryBoard
> ctrl버튼 누른상태에서 드래그(present)

#### 2. Code
```
self.present(ViewController, animated: true, completion: nil)
```

### 나타내기(Presenting) VS 보여주기(Showing a View Controller)

1. 보여주기(Showing a View Controller)
> SubView를 보여줄 때 적합, 프레젠테이션..?을 잘 처리 할 수 있음

2. 나타내기(Presenting)
> 모달 방식으로 뷰를 이동, 프레젠테이션을 처리 못 할 수도 있음

### 다른 스토리보드에서 정의된 뷰 나타내는 방법

```
let storyboard: UIStoryboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)ㄴ
if let myViewController: MyViewController = storyboard.instantiateViewController(withIdentifier: "MyViewController") as? MyViewController {
	// 뷰 컨트롤러를 구성 합니다.
	
	// 뷰 컨트롤러를 나타냅니다.
	self.present(myViewController, animated: true, completion: nil)
}
```

[돌아가기 > 배우는 내용](#배우는-내용)


## 뷰의 상태변화 감지 메서드
### 뷰의 생명주기..
> 뷰가 나타기 전의 과정부터 사라지는 과정까지를 뷰의 생명주기 라고 한다.
#### 순서대로 총 5가지의 과정으로 뷰의 생명주기를 설명할 수 있다.
1. ViewDidLoad 
	- **뷰가 로드 되었을 때**
	-뷰가 처음 로딩 될 때 1회 호출되는 메소드로, **초기화 작업을 하기 좋은 시점**
2. viewWillAppear
	- **뷰가 뷰 계층에 추가되고 화면에 표시되기 직전에 호출**
	- 다른 뷰로 이동했다가 되돌아올 때 재호출 되므로, **화면이 나타날때마다 수행해야하는 작업**을 하기 좋은 시점
3. viewDidAppear
	- **뷰가 뷰 계층에 추가되어 화면에 표시되면 호출**
4. viewWillDisappear
	- **뷰가 뷰 계층에서 사라지기 직전 호출**
	- **뷰가 생성된 뒤 발생한 변화를 이전상태로 되돌리기 좋은 시점**
5. viewDidDisappear
	- **뷰가 뷰 계층에서 사라진 후 호출**
	- **뷰를 숨기는 것**과 관련된 추가적인 작업을 하기 좋은 시점
	- 시간이 오래 걸리는 작업은 하지 않는 것이 좋음


![뷰의 생명주기](./img/project2/ViewLifeCycle.png)

### 뷰의 레이아웃 변화 메서드
> 뷰가 생성된 후 bounds 및 위치 등의 레이아웃에 변화가 발생했을 때 호출되는 메서드

- func viewWillLayoutSubviews()
	- **뷰가 서브뷰의 레이아웃을 변경하기 직전에 호출되는 메서드**
	- 서브뷰의 에이아웃을 **변경하기 전**에 수행할 작업을 하기 좋은 시점
- func viewDidLayoutSubviews()
	- **서브뷰의 레이아웃이 변경된 후 호출되는 메서드**
	- 서브뷰의 레이아웃을 **변경 한 후** 추가적인 작업을 수행하기 좋은 시점

### ⭐️ 중요
#### 뷰 컨트롤러에서 위 메서드를 사용하기 위해 pverride 키워드를 명시하고 super를 꼭 호출할 것!

```
override func viewDidLoad() {
	super.viewDidLoad() 
	// view가 메모리에 적재된 시점에서 필요한 코드 작성
}
```

#### 참고
- [UIViewController - UIKit](https://developer.apple.com/documentation/uikit/uiviewcontroller)

[돌아가기 > 배우는 내용](#배우는-내용)


## Delegation
### Delegation.. 무슨 의미야..?
```
Delegation: [명사] 대표(자), 사절, 위임, 대리(자)
	    [동사](권한, 업무 등을) 위임하다, (대표를) 선정하다
```

### Delegation Design Pattern
> 하나의 객체가 다른 객체를 **대신해** 동작 또는 조정할 수 있는 기능
- Foundation, UIKit, AppKit, Cocoa Touch 등 애플의 프레임워크에서 광범위하게 활용 가능
- 주로 프레임워크 객체가 위임을 요청하며, 커스텀 컨트롤러 객체가 위임을 받아 특정 이벤트에 대한 기능을 구현
- 델리게이션 디자인 패턴은 커스텀 컨트롤러에서 세부 동작을 구현함으로써 동일한 동작에 다양한 대응을 할 수 있게 해줌


ex) UITextFieldDelegate는 UITextField의 객체의 구문을 편집하거나 관리하기 위해 아래와 같은 메서드를 정의함

```
// 대리자에게 특정 텍스트 필드의 문구를 편집해도 되는지 묻는 메서드
func textFieldShouldBeginEditing(UITextField)
	
// 대리자에게 특정 텍스트 필드의 문구가 편집되고 있음을 알리는 메서드
func textFieldDidBeginEditing(UITextField)

// 특정 텍스트 필드의 문구를 삭제하려고 할 때 대리자를 호출하는 메서드
func textFieldShouldClear(UITextField)

// 특정 텍스트 필드의 `Return` 키가 눌렸을 때 대리자를 호출하는 메서드
func textFieldShouldReturn(UITextField)
```

**델리게이트는 특정 상황에 대리자에게 메세지를 전달하고 그에 적절한 응답을 받기 위해 사용됨**


![delegate](./img/project2/delegate.png)

### DateSource
- Delegate가 사용자 인터페이스 제어에 관련된 권한을 위임받고
- **데이터소스는 데이터를 제어하는 기능을 위임받음**

### Protocol(프로토콜)
- 코코아터치에서 프로토콜을 사용해 델리게이션과 데이터소스를 구현할 수 있다.
- *객체간 소통을 위한 강력한 통신 규약으로 데이터나 메시지를 전달할 때 사용
- 프로토콜은 특별한 상황에 대한 역할을 정의하고 제시하지만, 세부기능은 미리 구현해두지 않는다.
- 구조체, 클래스, 열거형에서 프로토콜을 채택하고 특정 기능을 수행하기 위한 요구사항을 구현할 수 있다.


#### 참고
- [Cocoa Design Patterns](https://developer.apple.com/documentation/swift/cocoa_design_patterns#//apple_ref/doc/uid/TP40014216-CH7-ID8)
- [Delegation](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID276)

[돌아가기 > 배우는 내용](#배우는-내용)


## 싱글턴
> ios 애플리케이션 디자인 패턴 중 하나로 '특정 클래스의 인스턴스가 오직 하나임을 보장하는 객체'를 의미한다. 싱글턴은 애플리케이션이 요청한 **횟수와는 관계없이** 이미 생성된 같은 인스턴스를 반환한다. 즉 애플리케이션 내에서 특정 클래스의 인스턴스가 딱 하나만 있기 때문에 다른 인스턴스들이 공요해서 사용할 수 있다.


![singleton](./img/project2/singleton.png)

### 싱글턴 사용 예제소스
1. swift 파일을 하나 생성한다.
2. 우리가 알고있는 class를 작성한고, 필요시 관련 메소드를 작성해도 된다.
```
import Foundation

class Singleton {
    static let shared = Singleton()
    var name: String?
    var phoneNumber: String?
    
    func initialize() {
        // 초기화
        UserInformation.shared.name = ""
        UserInformation.shared.phoneNumber = ""
    }
}
```
3. 선언한 변수와 메소드들은 "Singleton.shared.name" 이런식으로 접근하여 사용한다.

### Cocoa 프레임워크에서의 싱클턴 디자인 패턴
> Cocoa 프레임워크에서 싱글턴 디자인 패턴을 활용하는 대표적인 클래스

*싱글턴 인스턴스를 반환하는 팩토리 메서드나 프로퍼티는 일반적으로 shared 라는 이름을 사용

- FileManager
	- 애플리케이션 파일 시스템을 관리하는 클래스
	- FileManager.default
- URLSession
	- URL 세션을 관리하는 클래스
	- URLSession.shared
- NotificationCenter
	- 등록된 알림의 정보를 사용할 수 있게 해주는 클래스
	- NotificationCenter.default
- UserDefaults
	- Key-Value 형태로 간단한 데이터를 저장하고 관리할 수 있는 인터페이스를 제공하는 데이터베이스 클래스
	- UserDefaults.standard
- UIAoolication
	- ios에서 실행되는 중앙제어 애플리케이션 객체
	- UIApplication.shared

#### 주의할 점
싱글턴 디자인 패턴은 애플리케이션 내의 특정 클래스의 인스턴스가 하나만 존재하기에, 불필요하게 여러 개 만들어질 필요가 없는 경우에 많이 쓰인다. 예를 들어서 환경설정, 네트워크 연결처리, 데이터 관리 등이 있다.

**하지만 멀티 스레드 환경에서 동시에 싱글턴 객체를 참조할 경우 원치 않는 결과를 가져올 수 있다.**

#### 참고
- [Singleton - Apple Developer](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/Singleton.html)
- [Cocoa Design Patterns](https://developer.apple.com/documentation/swift/cocoa_design_patterns#//apple_ref/doc/uid/TP40014216-CH7-ID8)

[돌아가기 > 배우는 내용](#배우는-내용)
