
import UIKit

final class DefaultTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        self.accessoryType = .disclosureIndicator
        self.separatorInset = .zero
        self.textLabel!.numberOfLines = 0
    }

    required init?(coder _: NSCoder) {
        fatalError()
    }
}
