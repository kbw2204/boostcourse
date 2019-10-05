# Project 5 정리 노트

## 배우는 내용

- UIKit
	- [UIAlertController](#UIAlertController)
	- [UITabBarController](#UITabBarController)
- [Dispatch](#Grand-Cetral-Dispatch)

## UIAlertController

> 알림 또는 경고창을 띄우는 Controller이다.

![](./img/project5/alert3.png)

### 종류

#### 1. Alert

![](./img/project5/alert1.png)

#### 2. ActionSheet

![](./img/project5/alert2.png)

### UIAlertAction.Style

- default: 기본 스타일
- cancel: 취소하거나 유지 등 변경사항 없을 경우 적용하는 스타일
- destructive: 경고

#### 1. Alert의 Action 스타일

![](./img/project5/alert4.png)

#### 2. ActionSheet의 Action 스타일

![](./img/project5/alert5.png)

### Alert 사용 구분 예

#### 1. Alert 사용 예
- 중요한 액션을 하기 전 경고가 필요한 경우
- 액션을 취소할 기회를 제공해야 하는 경우
- 사용자의 작업을 한 번 더 확인하거나 삭제 등의 작업을 수행하거나 문제 사항을 알릴 때
- 결정이 필요한 중요 정보를 표시할 경우

#### 2. ActionSheet 사용 예
- 사용자가 고를 수 있는 액션 목록이 여러 개일 경우
- 새 작업 창을 열거나, 종료 여부 확인 시
- 사용자의 결정을 되돌리거나 그 동작이 중요하지 않을 경우

### 사용 예시

```
// 1. 컨트롤러를 정의해줌
let alertController: UIAlertControll = UIAlertController(title: "Title", message: "Message", preferredStyle: style)

// 2. 컨트롤러에 넣을 버튼을 만들어준다. 타입 종류는 3가지, default, cancel, destructive 가 있음
// handler 부분이 있는데, 이부분에 액션이 실행 성공시 작동하는 부분을 설정해 줄 수 있음, 필요없을시 handler부분에 nil 넣어주면 됨
let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action: UIAlertAction) in
	print("OK pressed")
})

// 3. 만들어준 Action을 컨트롤러에 추가해줌
alertController.addAction(okAction)

// alertController가 화면에 나타날 수 있도록 present 해준다.
self.present(alertController, animated: true, completion: {
	print("Alert controller shown")
})
```

### 주요 메서드

`func addTextField(configurationHandler: (UITextField) -> Void?)`

### 주의할 점

UIAlertController안에 있는 Action 중, `Style.cancel`은 하나만 존재해야 한다. 그 이유는... **못찾겠다..ㅋ.. 하면 오류뜨는데;**


#### 참고

- [UIAlertController - UIKit](https://developer.apple.com/documentation/uikit/uialertcontroller)
- [UIAlertAction - UIKit](https://developer.apple.com/documentation/uikit/uialertaction)

[돌아가기 > 배우는 내용](#배우는-내용)


## UITabBarController

> Inherits From: UIViewController

### 생성 방법 (in Storyboard)

#### 1. View 끼리 묶기 ( View 다중 선택 후)

![](./img/project5/tabbar2.png)

#### 2. TabBarController에서 View 추가하기

![](./img/project5/tabbar1.png)

### 생성 방법 (programmatically)

```
import UIKit

class TabBarControllerByCode: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // tabBarController 정의
        let tabBarController: UITabBarController = UITabBarController()
        // 추가할 뷰들 정의..
        let firstV = ViewController()
        firstV.title = "firstView"
        firstV.view.backgroundColor = UIColor.orange
        firstV.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let VC = UIViewController()
        VC.title = "secondView"
        VC.view.backgroundColor = UIColor.black
        VC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        // 적용
        let controllers = [firstV, VC]
        tabBarController.viewControllers = controllers
        tabBarController.viewControllers = controllers.map{
            UINavigationController(rootViewController: $0)
        }
        self.view.addSubview(tabBarController.view)
        self.addChild(tabBarController)
    }
}
```

### [UITabBarControllerDelegate(링크)](https://developer.apple.com/documentation/uikit/uitabbarcontrollerdelegate)

> 사용자가 탭바 인터페이스와 상호작용할 때, 탭바 컨트롤러 객체는 이 상호작용에 관한 알림(notification)을 델리게이트 인스턴스로 보낸다. 

- 사용자가 탭을 선택하지 못하게 하거나,
- 탭을 선택한 후 추가 작업을 수행하거나, 
- 탭 관련 사항을 모니터링하고 사용자화할 때 델리게이트를 활용..


#### 참고

- [UITabBarController - UIKit](https://developer.apple.com/documentation/uikit/uitabbarcontroller)
- [UITabBarControllerDelegate - UIKit](https://developer.apple.com/documentation/uikit/uitabbarcontrollerdelegate)
- [Haman Interface Guidelines for iOS - Tab Bars](https://developer.apple.com/design/human-interface-guidelines/ios/bars/tab-bars/)

[돌아가기 > 배우는 내용](#배우는-내용)


## Grand Cetral Dispatch

> 줄여서 **GCD**.. 멀티코어와 멀티 프로세싱 환경에서 최적화된 프로그래밍을 할 수 있도록 애플이 개발한 기술.. 실행할 태스크를 Dispatch Queue에 추가하면 GCD는 태스크(작업)에 맞는 스레드를 자동으로 생성해서 실행하고, 작업이 종료되면 해당 스레드를 제거합니다.

### DispatchQueue는 뭐야??

> 디스패치큐는 작업을 연속적 or 동시에 진행하기는 하지만, 언제나 먼저 들어오면 먼저 나가는 순서로 실행됩니다. Serial Dispatch Queue는 한 번에 하나의 작업만을 실행하며, 해당 작업이 대기열에서 제외되고 새로운 작업이 시작되기 전까지 기다립니다. 이와는 반대로 Concurrent Dispatch Queue는 이미 시작된 작업이 완료될 때까지 기다리지 않고 가능한 많은 작업을 진행합니다. 디스패치큐는 GCD 기술의 일부 입니다.

![](./img/project5/dispatchQueue1.png)

### OperationQueue vs DispatchQueue

- Operation Queue에서는 동시에 실행할 수 있는 연산(Operation)의 최대 수를 지정할 수 있습니다.
- Operation Queue에서는 KVO(Key Value Observing)을 사용할 수 있는 많은 프로퍼티들이 있습니다.
- Operation Queue에서는 연산(Operation)을 일시 중지, 다시 시작 및 취소를 할 수 있습니다.

### 둘 중에 어떤거 사용해야해?

- **Operation Queue** : 비동기적으로 실행되어야 하는 작업을 객체 지향적인 방법으로 사용하는 데 적합합니다. KVO(key Value Observing)를 사용해 작업 진행 상황을 감시하는 방법이 필요할 때도 적합합니다.
- **GCD** : 작업이 복잡하지 않고 간단하게 처리하거나 특정 유형의 시스템 이벤트를 비동기적으로 처리할 때 적합합니다. 예를 들면 타이머, 프로세스 등의 관련 이벤트입니다.

// 아직 잘 모르겠다.. 더 알아봐야 겠다.

#### 참고

- [Dispatch - Apple Developer Documentation](https://developer.apple.com/documentation/dispatch)
- [Grand Central Dispatch - Wikipedia](https://en.wikipedia.org/wiki/Grand_Central_Dispatch)

[돌아가기 > 배우는 내용](#배우는-내용)
