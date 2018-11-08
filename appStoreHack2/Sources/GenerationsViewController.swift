
import UIKit

final class GenerationsViewController: UICollectionViewController {

    private var generations: [Generation] = Generation.generations {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    private weak var carouselCollectionView: UICollectionView? {
        didSet {
            self.carouselCollectionView?.register(GenerationImageCell.self, forCellWithReuseIdentifier: String(describing: GenerationImageCell.self))
            self.carouselCollectionView?.dataSource = self
            self.carouselCollectionView?.delegate = self
            self.carouselCollectionView?.reloadData()
        }
    }

    private weak var carouselPageControl: UIPageControl? {
        didSet {
            self.carouselPageControl?.numberOfPages = self.generations.count
        }
    }

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.title = "Home"
    }

    required init?(coder _: NSCoder) {
        fatalError()
    }
}

extension GenerationsViewController { // UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(GenerationsCarouselCell.self, forCellWithReuseIdentifier: String(describing: GenerationsCarouselCell.self))
        self.collectionView?.register(NameCell.self, forCellWithReuseIdentifier: String(describing: NameCell.self))
    }
}

extension GenerationsViewController { // UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView {
            return 2
        }
        else if collectionView == self.carouselCollectionView {
            return 1
        }
        fatalError()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            switch section {
            case 0:
                return 1
            default:
                return self.generations.count
            }
        }
        else if collectionView == self.carouselCollectionView {
            return self.generations.count
        }
        fatalError()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            switch indexPath.section {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GenerationsCarouselCell.self), for: indexPath) as! GenerationsCarouselCell
                self.carouselCollectionView = cell.collectionView
                self.carouselPageControl = cell.pageControl
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: NameCell.self), for: indexPath) as! NameCell
                cell.name = self.generations[indexPath.item].name
                return cell
            }
        }
        else if collectionView == self.carouselCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GenerationImageCell.self), for: indexPath) as! GenerationImageCell
            cell.generation = self.generations[indexPath.item]
            return cell
        }
        fatalError()
    }
}

extension GenerationsViewController { // UIScrollViewDelegate

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView === self.carouselCollectionView {
            self.carouselPageControl?.currentPage = Int(CGFloat(self.carouselPageControl?.numberOfPages ?? 0) * ((scrollView.contentOffset.x + (scrollView.frame.size.width / 2.0)) / scrollView.contentSize.width))
        }
    }
}

extension GenerationsViewController { // UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let generation = self.generations[indexPath.item]
        let viewController = ModelViewController(generation: generation)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension GenerationsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            switch indexPath.section {
            case 0:
                return CGSize(width: collectionView.frame.width, height: 250.0)
            default:
                return CGSize(width: collectionView.frame.width, height: 60.0)
            }
        }
        else if collectionView == self.carouselCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 30.0)
        }
        fatalError()
    }
}
