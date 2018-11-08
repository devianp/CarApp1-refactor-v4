
import UIKit

class GenerationCarouselCell: UICollectionViewCell  {

    var carCategory: [Generation] = [] {
        didSet {
            //            self.nameLabel.text = self.carCategory?.name
            self.pageControl.numberOfPages = self.carCategory.count
        }
    }

    private let nameLabel: UILabel
    let carsCollectionView: UICollectionView
    let pageControl: UIPageControl

    override init(frame: CGRect) {
        self.nameLabel = UILabel(frame: .zero)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.font = UIFont.preferredFont(forTextStyle: .title3)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0


        self.carsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.carsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.carsCollectionView.showsHorizontalScrollIndicator = false
        self.carsCollectionView.backgroundColor = .clear
        self.carsCollectionView.isPagingEnabled = true

        self.pageControl = UIPageControl(frame: .zero)
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        self.pageControl.pageIndicatorTintColor = .gray

        super.init(frame: frame)

        self.backgroundColor = UIColor(white: 0.9, alpha: 0.4)

        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.carsCollectionView)
        self.contentView.addSubview(self.pageControl)

        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 14.0),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 30.0),

            self.carsCollectionView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor),
            self.carsCollectionView.bottomAnchor.constraint(equalTo: self.pageControl.topAnchor),
            self.carsCollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.carsCollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),

            self.pageControl.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.pageControl.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.pageControl.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
