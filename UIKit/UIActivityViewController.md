## UIActivityViewController

> 공유버튼 눌렀을시 나오는 알림창 컨트롤러다.. 

### 사용 예제 소스

```
// 공유할 이미지 Array
var imageToShare = [UIImage]()

//  activityViewController 만들어 준다.
let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)

// 타입을 정해준 뒤
activityViewController.excludedActivityTypes = [UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.assignToContact]
// present 해준다.
self.present(activityViewController, animated: true, completion: nil)
```


#### 참고

- [UIActivityItem Source - UIKit](https://developer.apple.com/documentation/uikit/uiactivityitemsource)
- [UIActivityViewController - UIKit](https://developer.apple.com/documentation/uikit/uiactivityviewcontroller)
- [UIActivity - UIKit](https://developer.apple.com/documentation/uikit/uiactivity)


[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)