## OperationQueue

> class OperationQueue: NSObjectm

### OperationQueue란..?

OperationQueue는 작업 우선 순위와 준비 상태에 따라 대기중인 객체를 실행합니다. 가장 중요한 요소는 주어진 작업이 다른 작업이 끝나는 것에 의존하는 지의 여부입니다. 프로그래머는 이러한 의존성을 설정하여 복잡한 실행 순서 그래프를 구성할 수도 있습니다. 작업 대기열에 추가 된 후에는 작업이 끝났다고보고 될 때까지 작업이 대기열에 남아 있습니다. 작업이 추가 된 후에는 대기열에서 직접 작업을 제거 할 수 없습니다. 완료되지 않은 작업으로 OperationQueue를 일시중단하면 메모리 누수가 발생할 수 있습니다.

**+** OperationQueue에 들어가는 작업은 반드시 Operation 객체의 인스턴스여야만 합니다. 이는 수행하고자 하는 작업과 데이터를 캡슐화한 객체입니다. 다만 Operation은 추상 클래스이기 때문에, 시스템이 제공하는 Operation 타입의 구체 클래스를 쓰거나 직접 서브클래싱을 해서 써야합니다. Operation객체는 KVO(Key-Value Observing)을 위한 프로퍼티들을 제공하여 주기 때문에, 이를 통해 작업의 진행상황을 모니터링 할 수 있습니다. 또한 OperationQueue 자체는 여러 작업을 동시에 수행하지만, 의존성을 설정하는 것으로 순차적으로 실행하게 만들 수도 있습니다.


### 사용 예시

```
OperationQueue.main.addOperation {
	// 소스코드 작성
	// UI 업데이트 작업은 main쓰레드에서 작업해야함.
 }
 
 // DispatchQueue 라는 것도 있음
 DispatchQueue.main.async {
	// 소스코드 작성, 이건 위에것과 다르게 직방으로 먼저 실행됨..
 }
```

### OperationQueue의 주요 메서드 / 프로퍼티

#### 특정 Operation Queue 가져오기

- `current` : 현재 작업을 시작한 Operation Queue를 반환
```
class var current: OperationQueue? { get }​
```

- `main` : 메인 스레드와 연결된 Operation Queue를 반환합니다.

```
class var main: OperationQueue { get }​
```

#### Queue(대기열)에서 동작(Operation) 관리

- `addOperation(_:)` : 연산 객체(Operation Object)를 대기열(Queue)에 추가.

```
func addOperation(_ op: Operation)
```

- `addOperations(_:waitUntilFinished:)` : 연산 객체(Operation Object) 배열을 대기열(Queue)에 추가

```
func addOperations(_ ops: [Operation], waitUntilFinished wait: Bool)
```

- `addOperation(_:)` : 전달한 클로저를 연산 객체(Operation Object)에 감싸서 대기열(Queue)에 추가

```
func addOperation(_ block: @escaping () -> Void)
```

- `cancelAllOperations()` : 대기 중이거나 실행 중인 모든 연산(Operation)을 취소

```
func cancelAllOperations()
```

- `waitUntilAllOperationsAreFinished()` : 대기 중인 모든 연산(Operation)과 실행 중인 연산(Operation)이 모두 완료될 때까지 현재 스레드로의 접근을 차단

```
func waitUntilAllOperationsAreFinished()
```

#### Operation 실행 관리

- `maxConcurrentOperationCount` : 동시에 실행할 수 있는 연산(Operation)의 최대 수

```
var maxConcurrentOperationCount: Int { get set }​
```

- `qualityOfService` : 대기열 작업을 효율적으로 수행할 수 있도록 여러 우선순위 옵션을 제공

```
var qualityOfService: QualityOfService { get set }
```

#### Operation 중단

- `isSuspended` : 대기열(Queue)의 연산(Operation) 여부를 나타내기 위한 부울 값입니다. false인 경우 대기열(Queue)에 있는 연산(Operation)을 실행하고, true인 경우 대기열(Queue)에 대기 중인 연산(Operation)을 실행하진 않지만 이미 실행 중인 연산(Operation)은 계속 실행됩니다.

```
var isSuspended: Bool { get set }
```

#### Queue의 구성

- `name` : Operation Queue의 이름

```
var name: String? { get set }​
```


#### 참고

- [OperationQueue - Foundation](https://developer.apple.com/documentation/foundation/operationqueue)
- [Operation - Foundation](https://developer.apple.com/documentation/foundation/operation)
- [DispatchQueue - Joshua blog](https://jcsoohwancho.github.io/2019-09-04-동시성-프로그래밍(1)-동시성-기본/)

[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)