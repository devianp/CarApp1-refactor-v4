
import UIKit

final class ModelViewController: UICollectionViewController {

    private let generation: Generation
    private let versions: [Version]

    init(generation: Generation) {
        self.generation = generation
        self.versions = Version.versions.filter({ $0.model.generation.name == generation.name })
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.title = self.generation.name
    }

    required init?(coder decoder: NSCoder) {
        fatalError()
    }
}

extension ModelViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(ModelHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: ModelHeaderView.self))
        self.collectionView?.register(NameCell.self, forCellWithReuseIdentifier: String(describing: NameCell.self))
    }
}

extension ModelViewController { // UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.versions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: NameCell.self), for: indexPath) as! NameCell
        cell.name = self.versions[indexPath.item].name
        return cell
    }
}

extension ModelViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200.0)
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: ModelHeaderView.self), for: indexPath) as! ModelHeaderView
        header.generation = self.generation
        return header
    }
}
