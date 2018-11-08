
import UIKit

class ModelView: UICollectionReusableView {

    // name label should be UI Text View to fit in all of summary

    var car: Generation? {
        didSet {
            self.imageView.image = (self.car?.imageName).flatMap { UIImage(named: $0) }
            self.nameLabel.text = self.car?.summary
        }
    }

    private let imageView: UIImageView
    private let nameLabel: UILabel

    override init(frame: CGRect) {
        self.imageView = UIImageView(frame: .zero)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true

        self.nameLabel = UILabel(frame: .zero)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.font = .preferredFont(forTextStyle: .body)
        self.nameLabel.backgroundColor = .yellow

        super.init(frame: frame)

        self.addSubview(self.imageView)
        self.addSubview(self.nameLabel)

        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 150.0),

            self.nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 8.0),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0),
            ])
    }

    required init?(coder decoder: NSCoder) {
        fatalError()
    }
}
