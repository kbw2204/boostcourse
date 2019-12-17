## UICollectionView

  > UITableView와 비슷하게 cell도 가지고 있지만, 수직만 있는 UITableView와는 다르게  수직 수평 둘다 되는것이 UICollectionView! 그래서 layout 잡는게 더 까다롭다..

  > 참고로 UITableView에서의 indexPath.row가 UICollectionView에선 indexPath.**item**이다.


### UIVIewController에서 사용시 준비물

1. delegate, datesource가 필요하다.(스토리보드상에서 추가해주거나, code의 viewDidLoad 메소드에 추가시켜주자)

~~~
override func viewDidLoad() {
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
}
~~~

2. 필수 메소드 2종을 추가..(numberOfItemsInSection, cellForItemAt)

### UICollectionView의 자주사용하는 layout 설정값

~~~
func flowLayoutInit() {
        let cellItemForRow: CGFloat
        guard let layout = self.photosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        if UIDevice.current.orientation.isLandscape == false {
            // 새로
            cellItemForRow = 3
            guard let optionalBindingWidth = self.width else {
                return
            }
            let width = (optionalBindingWidth - (cellItemForRow - 1) * 5) / cellItemForRow
            layout.itemSize = CGSize(width: width, height: width)
        } else {
            cellItemForRow = 8
            guard let optionalBindingHeight = self.height else {
                return
            }
            let width = (optionalBindingHeight - (cellItemForRow - 1) * 5) / cellItemForRow
            layout.itemSize = CGSize(width: width, height: width)
        }
        layout.sectionInset = UIEdgeInsets.zero
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.invalidateLayout()
        self.collectionView.collectionViewLayout = layout
    }
~~~

[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)