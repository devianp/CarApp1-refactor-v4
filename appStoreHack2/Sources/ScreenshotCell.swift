
import UIKit

//class SreenshotCell: BaseCell {
//
//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = UIColor.yellow
//        return cv
//    }()
//
//    override func setupViews() {
//        super.setupViews()
//        backgroundColor = UIColor.red
//        addSubview(collectionView)
//
//    }
//}


class SreenshotCell2: BaseCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let collectionView: UICollectionView
    let cellId = "cellId"
    override init(frame: CGRect) {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0


        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.backgroundColor = .clear
        self.collectionView.isPagingEnabled = true

        super.init(frame: frame)
        self.backgroundColor = .red
        self.contentView.addSubview(self.collectionView)
        self.collectionView.register(ScreenshotImageCell.self, forCellWithReuseIdentifier: cellId)

        NSLayoutConstraint.activate([

            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            ])
    }
    // test
    override func setupViews() {
        super.setupViews()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    // test

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
        //        if collectionView == self.collectionView {
        //            return self.carCategories.count
        //        }
        //        else if collectionView == carsCollectionView {
        //            return 1
        //        }
        //        fatalError()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width-30, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    class ScreenshotImageCell: BaseCell {
        override func setupViews() {
            super.setupViews()
            backgroundColor = UIColor.blue
        }
    }
}
