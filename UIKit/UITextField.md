## UITextField
> 주로 사용되는 메소드는 입력 종료 후 키보드 내리기, 입력하는 동안 발생하는 메소드가 있다.
### 키보드 숨기기 (다른 부위 tap 시)
```
override func viewDidLoad() {
        super.viewDidLoad()
        // 제스처 등록
        let tapViewGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(_:)))
        self.view.addGestureRecognizer(tapViewGesture)
}


@objc func tapView(_ sender: UIView) {
        // textField 작성이 끝났단 메소드
        self.view.endEditing(true)
}
```
### 입력시 발생하는 메소드
```
@IBAction func textFieldEditingChanged(_ sender: UITextField) {
        //Action
}
```
### TextField Delegate
사용자가 텍스트필드를 통한 작업을 할 때 이와 관련된 이벤트들을 델리게이트 객체에게 알리고 이를 사용하여 여러 이벤트를 처리할 수 있다.
- 링크 : [UITextFieldDelegate](https://developer.apple.com/documentation/uikit/uitextfielddelegate)

UITextField 클래스의 주요 프로퍼티
- var delegate: UITextFieldDelegate?: 텍스트 필드의 델리게이트 객체
- var text: String?: 텍스트 필드에 보여지는 문자열
- var placeholder: String?: 텍스트 필드에 아무것도 입력되어 있지 않을 때 기본으로 보이게 되는 문자열
- var font: UIFont?: 폰트를 설정
- var textColor: UIColor?: 텍스트의 색상을 설정
- var textAlignment: NSTextAlignment: 텍스트의 정렬을 설정
- var isEditing: Bool: 현재 텍스트 필드가 편집 모드에 있는지 나타냅니다.
- var background: UIImage?: 텍스트 필드가 enable 되어 있을 때의 배경 이미지
- var disabledBackground: UIImage?: 텍스트 필드가 disabled 되어 있을 때의 배경 이미지를 나타냅니다.
- var clearButtonMode: UITextFieldViewMode: 텍스트 필드의 텍스트를 모두 지울 수 있는 컨트롤을 텍스트 필드에 나타나게 할 수 있다.

### UITextFieldDelegate 프로토콜의 주요 메서드

- func textFieldShouldBeginEditing(UITextField): 델리게이트 객체에게 텍스트 필드에서 텍스트 편집을 시작을 요청합니다.
- func textFieldDidBeginEditing(UITextField): 델리게이트에게 텍스트 필드에서 텍스트 편집이 시작되었음을 델리게이트 객체에게 알립니다.
- func textField(UITextField, shouldChangeCharactersIn: NSRange, replacementString: String): 델리게이트 객체에게 현재 텍스트의 수정을 요청합니다.
- func textFieldShouldEndEditing(UITextField): 델리게이트 객체에게 텍스트 편집 중지를 요청합니다.

#### 참고
- [UITextField - UIKit](https://developer.apple.com/documentation/uikit/uitextfield)

[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)