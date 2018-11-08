
import UIKit

final class ModelViewController: UITableViewController {

    private let generation: Generation

    init(generation: Generation) {
        self.generation = generation
        super.init(style: .grouped)
        self.title = self.generation.name
    }

    required init?(coder decoder: NSCoder) {
        fatalError()
    }
}

extension ModelViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: "DefaultTableViewCell")
    }
}

extension ModelViewController { // UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.generation.models.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.generation.models[section].versions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultTableViewCell", for: indexPath) as! DefaultTableViewCell
        cell.textLabel!.text = self.generation.models[indexPath.section].versions[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.generation.models[section].name
    }
}
