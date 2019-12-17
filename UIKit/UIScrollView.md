## UIScrollView

> 스크롤 할 수 있는 뷰, UIViewController 의 크기가 큰 뷰, 가로 or 세로로 스크롤 가능

### 주요 프로퍼티

- `delegate` : 스크롤뷰 객체의 델리게이트
```
weak var delegate: UIScrollViewDelegate? { get set }
```
- 콘텐츠 크기 및 offset 관리
    - contentSize : 콘텐츠뷰의 크기
    ```
    var contentSize: SGSize{ get set }
    ```
    - contentOffset: 콘텐츠뷰의 원점이 스크롤뷰의 원점에서 offset된 지점
    ```
    var contentOffset: CGPoint { get set }
    ```
    - setContentOffset(_:anomated:): 스크롤뷰의 원점에 대한 콘텐츠뷰의 offset 설정
    ```
    func setContentOffset(_ contentOffset: CGPoint, animated: true)
    ```
- 콘텐츠 삽입 동작 관리
    - contentInset: 콘텐츠뷰와 안전 영역 또는 스크롤뷰 가장자리에 간격
    ```
    var contentInset: UIEdgeInsets{ get set }
    ```
- 스크롤뷰 구성
    - isScrollEnabled: 스크롤링이 사용 가능한지 아닌지를 결정하는 Bool 값
    ```
    var isScrollEnabled: Bool{ get set }
    ```
    - isDirectionalLockEnabled: 스크롤이 특정 방향으로 고정할지를 결정하는 Bool 값
    ```
    var isDirectionalLockEnabled: Bool {get set}
    ```
    - isPagingEnabled: 스크롤뷰에서 `Paging`을 사용할 수 있는 여부를 결정하는 Bool값
    ```
    var isPagingEnabled: Bool {get set}
    ```
    - scrollsToTop: 스크롤 할 수 있는 제스처를 사용할지를 결정하는 Bool값
    ```
    var scrollsToTop: Bool{get set}
    ```
    - bounces: 스크롤뷰가 가장자리를 통과해서 다시 튀어나오는지 제어하는 Bool값
    ```
    var bounces: Bool{get set}
    ```
    - alwaysBounceVertical: `세로` 스크롤이 콘텐츠뷰의 끝에 도달할 때 튀어 오르기가 항상 발생하는지를 결정하는 Bool값
    ```
    var alwaysBounceVertical: Bool{get set}
    ```
    - alwaysBounceHorizontal: `가로` 스크롤이 콘텐츠뷰의 끝에 도달할 때 튀어 오르기가 항상 발생하는지를 결정하는 Bool값
    ```
    var alwaysBounceHorizontal: Bool{get set}
    ```
- 스크롤링 상태 가져오기
    - isTracking: 사용자가 스크롤을 시작하기 위해 콘텐츠를 터치한 여부를 반환
    ```
    var isTracking: Bool{get set}
    ```
    - isDragging: 사용자가 콘텐츠를 스크롤하고 있는지 나타내는 Bool 값
    ```
    var isDragging: Bool{get set}
    ```
    - isDecelerating: 사용자가 손가락을 떼었을 때 콘텐츠가 스크롤뷰에서 움직이지 않고 있는지를 반환
    ```
    var isDecelerating: Bool{get set}
    ```
    - decelerationRate: 사용자가손가락을 뗀 후의 감속도를 결정하는 부동 소수점 값
    ```
    var deceleratingRate: CGFloat{get set}
    ```
- 스크롤 인디케이터 및 새로고침 제어 관리
    - indicatorStye: 스크롤 인디케이터의 스타일
    ```
    var indicatorStyle: UIScrollViewIndicatorStyle {get set}
    ```
    - showsHorizontalScrollIndicator: 가로 스크롤 바 표시 여부를 제어하는 Bool 값
    ```
    var showsHorizontalScrollIndicator: Bool{get set}
    ```
    - showsVerticalScrollIndicator: 세로 스크롤 바 표시 여부
    ```
    var showsVerticalScrollIndicator: Bool{get set}
    ```
- 특정 위치로 스크롤
    - scrollRectToVisible(_: animated:) 콘텐츠의 특정 위치로 스크롤 하여 화면에 표시
    ```
    func scrollRectToVisible(_rect: CGRect, animated: Bool)
    ```
- 확대 및 축소
    - panGestureRecognizer: 팬 제스처를 제어하기 위한 제스처 인스턴스
    ```
    var panGestureRecognizer: UIPinchGestureRecognize?
    ```
    - zoomScale: 스크롤뷰 콘텐츠에 적용되는 현재 비율
    ```
    var zoomScale: CGFloat{ get set }
    ```
    - maximumZoomScale: 스크롤뷰 콘텐츠에 적용되는 최대 비율
    ```
    var maximumZoomScale: CGFloat{get set}
    ```
    - minimumZoomScale: CGFloat{get set}
    ```
    var minimumZoomScale: CGFloat{get set}
    ```
    - isZoomBoucing: 확대 및 축소가 지정한 배율 제안을 초과했음을 나타내는 Bool 값
    ```
    var isZoomBoucing: Bool{get set}
    ```
    - isZooming: 콘텐츠뷰가 현재 확대 or 축소되어 있는지를 나타내는 Bool 값
    ```
    var isZooming: Bool{get}
    ```
    - zoom(to:animated:): 콘텐츠 특성 영역 확대
    ```
    func zoom(to rect: CGRect, animated: Bool)
    ```
    - setZoomScale(_:animated:): 현재 배율을 지정
    ```
    func setZoomScale{_scale: CGFlat, animated: Bool}
    ```
- 키보드 관리
    - keyboardDismissMode: 스크롤뷰에서 드래그가 시작될 때 키보드가 해체되는 방식
    ```
    var keyboardDismissMode: UIScrollViewKeyboardDismissMode
    ````
### UISCrollViewDelegate 프로토콜
 - 스크롤 및 드래그
    - scrollViewDidScroll(_:): 콘텐츠뷰를 스크롤 할 때 델리게이트에 알림
    ```
    optional func scrollViewDidScroll(_scrollView: UIScrollView)
    ```
    - scrollViewWillBeginDragging(_:): 스크롤뷰에서 콘텐츠 스크롤을 시작할 시점을 델리게이트에 알림
    ```
    optional func scrollViewWillBegingDragging(_scrollView: UICrollView)
    ```
    - scrollViewDidEndDragging(_:WillDecelerate):  스크롤뷰의 드래그가 끝났을 때 델리게이트에 알림
    ```
    optional func scrollViewDidEndDragging(_ scrollView: UIScrollView)


#### 참고

- [OperationQueue - Foundation](https://developer.apple.com/documentation/foundation/operationqueue)
- [Operation - Foundation](https://developer.apple.com/documentation/foundation/operation)

[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)