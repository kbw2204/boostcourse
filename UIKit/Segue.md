## Segue

> `Segue`는 스토리보드에서 뷰 컨트롤러 사이의 `화면전환`을 위해 사용하는 `객체`이다. 

### 주요 프로퍼티
- `var source: UIViewController` : 세그에 전환을 요청하는 뷰 컨트롤러
- `var destination: UIViewController` : 전환될 뷰 컨트롤러
- `var identifier: String?` : 세그 객체의 식별자입니다.

### 주요 메서드

~~~
// 세그값을 설정함
performSegue(withIdentifier: "Segue 이름", sender: 전달할 값)

// 위 메소드가 발생하면 Segue값과 sender를 인자로 하는 메소드가 실행됨.
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieSegue" {
            guard let indexPath = sender as? IndexPath else {
                return
            }
            // 목적지를 설정하여
            let vc = segue.destination as? MovieInfoViewController
            // 해당 ViewController에 값을 전달할 수 있음
            vc?.navigationItem.title = MovieData.shared.movies[indexPath.row].title
            vc?.movieId = MovieData.shared.movies[indexPath.row].id
        }
    }
~~~

### Segue 연결 방법

1. `스토리보드`에서 `버튼과 같은 객체`를 클릭 후 `ctrl` 키를 누른 상태에서 이동하고 싶은 뷰에 `드래그 엔 드랍` 합니다.
2. Segue의 종류를 선택합니다.(기본: show)

![img](./img/segue.png)


#### 참고

- [UIStoryboardSegue - UIKit](https://developer.apple.com/documentation/uikit/uistoryboardsegue)


[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)