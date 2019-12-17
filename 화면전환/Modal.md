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

[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)