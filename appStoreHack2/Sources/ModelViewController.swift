
import UIKit

class ModelViewController: UICollectionViewController {

    private let car: Generation
    //1
    private let cellId = "cellId"
    //1
    
    init(car: Generation) {
        self.car = car
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.title = self.car.name
    }

    required init?(coder decoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.alwaysBounceVertical = true
        self.collectionView?.register(ModelView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: String(describing: ModelView.self))
        //3
        self.collectionView?.register(SreenshotCell2.self, forCellWithReuseIdentifier: cellId)
        //3
    }
    //2
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    //2
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}

extension ModelViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 200)
        }
        return .zero
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: ModelView.self), for: indexPath) as! ModelView
            header.car = car
            return header
        }
        fatalError()
    }
}
