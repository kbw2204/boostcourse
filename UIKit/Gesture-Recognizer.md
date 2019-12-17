## Gesture Recognizer
> 여러 제스처 관련 이벤트를 인식 시킬 때 사용한다. 특정 제스처 이벤트가 일어날 때 마다 각 Target에 맞는 Action 메시지를 보내어 제스처 관련 이벤트(#select(objc func))를 처리할 수 있다.

### UIGestureRecognizer의 하위 클래스
아래의 7가지의 UIGestureRecognizer 하위 클래스를 통해 여러 제스처를 인식할 수 있다.

1. UITapGestureRecognizer : 싱글탭 또는 멀티탭 제스처
2. UIPinchGestureRecognizer : 핀치(Pinch) 제스처
3. UIRotationGestureRecognizer : 회전 제스처
4. UISwipeGestureRecognizer : 스와이프(swipe) 제스처
5. UIPanGestureRecognizer : 드래그(drag) 제스처
6. UIScreenEdgePanGestureRecognizer : 화면 가장자리 드래그 제스처
7. UILongPressGestureRecognizer : 롱프레스(long-press) 제스처

### 제스처 추가하기
```
// 제스처 생성
let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(액션 메소드))

// 생성한 제스처를 View에 추가
self.view.addGestureRecognizer(tapRecognizer)

...
// 액션 메소드
@objc func tapView(gestureRecognizer: UIGestureRecognizer){
	print("Tap")
}
```

#### 참고
- [UIGestureRecognizer - UIKit](https://developer.apple.com/documentation/uikit/uigesturerecognizer)


[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)