import UIKit

class ViewControllerAllergy: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
    
    var datasource : [Allergy] = Singleton.SharedInstance.allergies
    
    // Title for the table view
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Vælg allergier"
    }
    
    // How many sections in the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // How many rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    // What is the contents of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let (item) = self.datasource[indexPath.row]
        if self.theChild.allergies.keys.contains(item.type) {
            cell.accessoryType = .checkmark
        }
        cell.textLabel?.text = item.type
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // adding the value to childs list of supplements
        let selected = self.datasource[indexPath.row]
        
        // adding checkmark to row
        if let cell = tableView.cellForRow(at: indexPath)
        {
            if cell.accessoryType == .checkmark
            {
                cell.accessoryType = .none
                self.theChild.allergies.removeValue(forKey: selected.type)
                cell.isSelected = false
                cell.isHighlighted = false
            }
            else
            {
                cell.accessoryType = .checkmark
                self.theChild.allergies[selected.type] = selected
                cell.isSelected = false
                cell.isHighlighted = false
            }
        }
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}
