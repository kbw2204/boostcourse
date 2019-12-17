## URLSession

### URLSession이란..?

```
class URLSession: NSObject
```

URLSession은 HTTP/HTTPS를 통해 data를 주고받는 API를 제공하는 클래스입니다. 이 API는 인증 지원을 위한 많은 델리게이트 메서드를 제공하며, 애플리케이션이 실행 중이지 않거나 일시 중단된 동안 백그라운드 작업을 통해 콘텐츠를 다운로드하는 것을 수행하기도 합니다. 

**Requset**
서버로 요청을 보낼 때 어떤 (HTTP)메서드를 사용할 것인지, 캐싱 정책은 어떻게 할 것인지 등의 설정을 할 수 있습니다.

**Response**
URL 요청의 응답을 나타내는 객체입니다.

### Session의 유형

URLSession API는 3가지 유형의 세션을 제공합니다. 이 타입은 URLSession 객체가 소유한 configuration 프로퍼티 객체에 의해 결정됩니다.

- **Default** : 기본 세션은 URL 다운로드를 위한 다른 파운데이션 메서드와 유사하게 동작합니다. 디스크에 저장하는 방식입니다.
- **Ephemeral**(임시) : 기본 세션과 유사하지만, 디스크에 어떤 데이터도 저장하지 않고, 메모리에 올려 세션과 연결합니다. 따라서 애플리케이션이 세션을 만료시키면 세션과 관련한 데이터가 사라집니다.
- **Background** : 백그라운드 세션은 별도의 프로세스가 모든 데이터 전송을 처리한다는 점을 제외하고는 기본 세션과 유사합니다.

```
// 사용 예시
let session: URLSession = URLSession(configuration: .default)
```

### URLSessionTask이란..?

```
class URLSessionTask: NSObject
```
**URLSessionTask**는 **세션 작업 하나를 나타내는** 추상클래스 입니다. 하나의 세션 내에서 아래와 같은 3가지 작업 유형을 할 수 있습니다.

- **URLSessionDataTask**
HTTP의 각종 메서드를 이용해 서버로부터 응답 데이터를 받아서 Data 객체를 **가져오는** 작업을 수행합니다.
- **URLsessionUploadTask**
애플리케이션에서 웹 서버로 Data 객체 또는 파일 데이터를 **업로드**하는 작업을 수행합니다. 주로 HTTP의 POST 혹은 PUT 메서드를 이용합니다.
- **URLSessionDownloadTask**
서버로부터 데이터를 **다운로드** 받아서 파일의 형태로 저장하는 작업을 수행합니다. 애플리케이션의 상태가 대기 중이거나 실행 중이 아니라면 **백그라운드 상태에서도 다운로드가 가능**합니다.


### SessionTask 상태 제어

- cancel(): 작업 취소
- resume(): 일시중단된 경우 다시 시작
- suspend(): 작업을 일시중단
- state: 작업의 상태를 반환
```
var state: URLSessionTask.State{ get }
```
- priority: 작업의 우선순위 설정, 반환. 0.0 ~ 1.0 사이값
```
var priority: Float { get set }
```

### 사용 예제

```
guard let url: URL = URL(string: "URL") else {return}
    
let session: URLSession = URLSession(configuration: .default)
// 가져올 땐 dataTask(), 업로드일 땐 uploadTask(), 다운로드 downloadTask()
let dataTask: URLSessionTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
        
	if let error = error {
		print(error.localizedDescription)
			return
	}
	// 가져온 data
	guard let data = data else {return}
}
dataTask.resume()
```

#### 참고

- [URLSession - Foundation](https://developer.apple.com/documentation/foundation/urlsession)
- [URLSessionTask - Foundation](https://developer.apple.com/documentation/foundation/urlsessiontask)

[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)