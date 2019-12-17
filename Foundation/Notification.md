## Notification

### Notification이란..?

```
struct Notification
```

- **Notification**은 등록된 Notification에 NotificationCenter를 통해 정보를 전달하기 위한 구조체 입니다. 즉 NotificationCenter를 통해 등록된 모든 관찰자들에게 정보를 브로드캐스트하는 컨테이너.

### 주요 프로퍼티

- name: 알람을 식별하는 Tag(필수)

```
var name: Notification.Name
```

> Notification.Name은 NSString의 Wrapper이기 때문에, NSString또는 swift의 String을 이용해 원하는 이름을 줄 수 있습니다. 또한 여러 시스템 프리셋을 제공해서, 필요한 시스템 이벤트를 쉽게 구독하여 받아볼 수 있습니다.

- object: 발송자가 옵저버에게 보내려고 하는 객체. 주로 발송자 객체를 전달하는 데 쓰임

```
var object: Any?
```

- userInfo: 노티피케이션과 관련된 값 or 객체의 저장소..?

```
var userInfo: [AnyHashable: Any]? 
```

### NotificaionCenter

```
class NotificationCenter: NSObject 
```

> 등록 된 관찰자에게 정보를 브로드 캐스트 할 수있는 알림 발송 메커니즘.

- **NotificationCenter**는 등록된 옵저버에게 동시에 Notification을 전달하는 Class 입니다.  NotificationCenter 클래스는 Notification을 발송하면 NotificationCenter에서 메세지를 전달한 옵저버의 처리할 때까지 대기합니다. 즉 흐름이 **동기적**(synchronous)으로 흘러가고 이를 비동기적으로 사용하려면 NotificationQueue를 사용하면 됩니다.
- **NotificationCenter**는 Notification을 전달하는 매커니즘이 담긴 객체로, 모든 애플리케이션은 싱글턴 형태로 기본 NotificationCenter를 제공합니다. 사용자는 이 싱글턴 객체를 참조해, **addObserver** 메소드를 통해서 클로저 자체를 Center에 등록하거나, 객체를 옵저버로 등록할 수 있습니다. 또한 post 메소드를 호출해서 Notification을 전달하도록 요청할 수도 있습니다. 또 더이상 옵저버가 필요 없어진 상황에서는 **removeObserver** 메소드를 호출할 수도 있습니다.

> 등록된 옵저버의 수가 많아질수록, NotificationCenter가 Notification을 보내는 시간이 길어집니다. 이를 고민할 정도로 느려졌다면, Notification을 적절히 카테고리화하여 여러개의 Center를 만드는 것도 고려해볼만 합니다.

> Notification은 단일 앱 안에서만 동작하도록 설계되어 있습니다. 여러 앱 간에 메시지를 보내기 위해서는 DistributedNotificationCenter를 사용해야 합니다. 하지만 해당 클래스가 iOS에는 없기 때문에 앱 개발자들에게는 고려 대상이 아닙니다.

### 개요 설명 (개발자 문서)

개체는 알림 센터에 등록 NSNotification하여 또는 메서드를 사용하여 알림 ( 개체) 을받습니다.
객체가 관찰자로 자신을 추가하면 수신 할 알림을 지정합니다. 따라서 객체는 여러 가지 다른 알림에 대한 관찰자로 자신을 등록하기 위해이 메서드를 여러 번 호출 할 수 있습니다.
addObserver(_:selector:name:object:)addObserver(forName:object:queue:using:)
실행중인 각 앱에는 default알림 센터가 있으며 특정 상황에서 통신을 구성하기 위해 새 알림 센터를 만들 수 있습니다.
알림 센터는 단일 프로그램 내에서만 알림을 전달할 수 있습니다. 다른 프로세스에 알림을 게시하거나 다른 프로세스에서 알림을 받으려면 대신 사용하십시오.DistributedNotificationCenter

### 예제1(일반 노티피케이션)

#### - 옵저버 등록
```
// 등록
NotificationCenter.default.addObserver(self, selector: #selector(didRecieveTestNotification(_:)), name: NSNotification.Name("TestNotification"), object: nil)
 
 // 실행 될 메소드
@objc func didRecieveTestNotification(_ notification: Notification) {
	print("Test Notification")
 }
```
#### - 발송자
```
// 예를들어서
func request() {
	NotificationCenter.default.post(name: NSNotification.Name("TestNotification"), object: nil, userInfo: nil)​
}
// 이렇게 작성되어 있으면 @objc func이 실행됬음 하는 부분에 호출 해주면 노티를 보내고
// 등록된  NotificationCenter에서 노티를 받고 작동이 됨. 
request() 
```

### 예제2(User Info 정보를 담은 노티피케이션)

#### - 옵저버 등록
```
// 등록
NotificationCenter.default.addObserver(self, selector: #selector(didReceiveTestNotification(_:)), name: NSNotification.Name("TestNotification"), object: nil)

// 메소드
@objc func didReceiveTestNotification(_ notification: Notification) {
 		guard let testString: String = notification.userInfo?["TestString"] as? String else { return }
         print("testString :", testString)
 }​
```

#### - 발송자
```
let userInfo: [AnyHashable: Any] = ["TestString":"Hi"]

NotificationCenter.default.post(name: NSNotification.Name("TestNotification"), object: nil, userInfo: userInfo)​
```

### 추가 핸들러 func 만들기 예제

```
let handler: (UIAlertAction) -> Void
handler = { (action: UIAlertAction) in
 ...
 }
```


#### 참고

- [Notification - Foundation](https://developer.apple.com/documentation/foundation/notification)
- [NotificationCenter - Foundation](https://developer.apple.com/documentation/foundation/notificationcenter)
- [NotificationQueue - Foundation](https://developer.apple.com/documentation/foundation/notificationqueue)
- [Notification - Joshua Blog](https://jcsoohwancho.github.io/2019-08-23-NotificationCenter-살펴보기/)


[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)