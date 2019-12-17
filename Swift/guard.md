## guard

> guard문은 마치 if문처럼 생겼는데, 비슷하게 이해하면 된다. guard 이후의 값이 잘 대입이 되어서 true이면, 옵셔널 변수의 값이 있다는 뜻이고, false가 나올 경우 else 문으로 빠져서 값 대입을 못하게 해준다. 

### code
~~~
// 옵셔널로 선언된 변수를 사용할 때
var image: UIImage?

...
// 옵셔널 변수값이 있는지 없는지 모르기 때문에 guard문을 사용해 안전하게 사용해준다.
guard let img = image else {
    return
}
~~~

[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)