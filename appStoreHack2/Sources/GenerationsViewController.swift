
import UIKit

final class GenerationsViewController: UITableViewController {

    private let carouselViewController = CarouselViewController()

    private var generations: [Generation] = [] {
        didSet {
            self.carouselViewController.generations = self.generations
            self.tableView.reloadData()
        }
    }

    init() {
        super.init(style: .grouped)
        self.title = "Home"
        self.addChild(self.carouselViewController)
        self.carouselViewController.didMove(toParent: self)
    }

    required init?(coder _: NSCoder) {
        fatalError()
    }
}

extension GenerationsViewController { // UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(CarouselViewCell.self, forHeaderFooterViewReuseIdentifier: "CarouselViewCell")
        self.tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: "DefaultTableViewCell")

        self.generations = Generation.generations
    }
}

extension GenerationsViewController { // UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.generations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultTableViewCell", for: indexPath) as! DefaultTableViewCell
        cell.textLabel!.text = self.generations[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250.0
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CarouselViewCell") as! CarouselViewCell
        view.carouselView = self.carouselViewController.carouselView
        return view
    }
}

extension GenerationsViewController { // UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let generation = self.generations[indexPath.item]
        let viewController = ModelViewController(generation: generation)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
