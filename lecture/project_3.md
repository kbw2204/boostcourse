# Project 3 정리 노트

> * TableView 사용 방법
> * 네비게이션 화면 전환
> * Delegation 디자인 패턴
> * JSON 형식 데이터 사용

## 배우는 내용

- UIKit
	- [UITableView](#UITableView)
	- [UITableViewCell](#UITableViewCell)
	- View Reuse
	- Table View Cell Customize
- Swift
	- Codable
	- JSONDecoder

## UITableView

> `테이블뷰`는 하나의 열과 여러 줄의 행을 지닌 수직적 스크롤이 가능한 cell의 모임이다. `cell`이란 테이블뷰의 하나의 행을 말하며 이러한 cell들을 `section`을 이용해 시각적으로 나눌 수 있다. 추가적으로 `header`와 `footer`에 이미지나 텍스트를 추가해 추가정보를 보여줄 수 있다.

![tableView1](./img/project3/tableView1.png)

### 테이블뷰 만드는 방법

1. tableView, TableViewCell 추가

![img](./img/project3/tableView2.png)

2. tableViewCell 클릭 후 cellId 설정

![img](./img/project3/tableView3.png)

3. 인터페이스 만들기 (cell 부분은 tableViewCell.swift 에서 드래그앤드랍)

![img](./img/project3/tableView4.png)


4. 코드 작성
> ViewController.swift

~~~
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    let cellId = "cellId"
	// cell에 넣을 임시 값
    let data = ["1", "2", "3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // delegate, dataSource 추가
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // cell 갯수 리턴
        return self.data.count
    }
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        cell.titleLabel.text = self.data[indexPath.row]
        return cell
    }
}
~~~

> tableViewCell.swift
~~~
import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    
}
~~~

### 테이블 뷰 스타일
- 일반 테이블뷰
	- 더이상 나눠지지 않는 연속적인 행의 리스트(계시판 테이블뷰)
	- 색인을 통한 빠른 탐색을 하거나 옵션을 선택할 때 좋다.
- 그룹 테이블뷰
	- 섹션을 기준으로 그룹화되어있는 리스트 형태
	- 정보를 특정 기준에 따라 개념적으로 구분할 때 적합
	- 사용자가 정보를 빠르게 이해하는 데 도움(전화번호부 ㄱㄴㄷ순 정리)

#### 참고

- [UITableView - UIKit](https://developer.apple.com/documentation/uikit/uitableview)

[돌아가기 > 배우는 내용](#배우는-내용)


## UITableViewCell

### TableViewCell 구조

- 콘텐츠 영역 : 셀의 왼쪽 부분에서 주로 문자열, 이미지와 혹은 고유 식별자 등이 입력
- 액세서리뷰 영역 : 셀의 오른쪽 작은 부분은 액세서리뷰로 상세보기, 재정렬, 스위치 등과 같은 컨트롤 객체가 위치

![img](./img/project3/tableViewCell1.png)
![img](./img/project3/tableViewCell2.png)

테이블뷰를 편집모드(Editing Mode)로 변경시 아래와 같은 구조로 변경
- 재정렬이 가능한 경우, 재정렬 컨트롤이 액세서리뷰에 나타난다. 재정렬 컨트롤을 눌러 셀을 드래그하면 위아래로 순서 변경 가능

![img](./img/project3/tableViewCell3.png)
![img](./img/project3/tableViewCell4.png)

### 셀 콘텐츠 프로퍼티
- `textLabel: UILabel` : 주제목 레이블
- `detailTextLabel: UILabel` : 부제목 레이블
- `imageView: UIImageView` : 이미지뷰

![img](./img/project3/tableViewCell5.png)
![img](./img/project3/tableViewCell6.png)


#### 참고

- [UITableViewCell - UIKit](https://developer.apple.com/documentation/uikit/uitableviewcell)
- [TableView Programming Guide for ios](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
- [Tables - Views - ios Human Interface Guideline](https://developer.apple.com/design/human-interface-guidelines/ios/views/tables/)


[돌아가기 > 배우는 내용](#배우는-내용)