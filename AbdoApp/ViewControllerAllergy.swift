import UIKit

class ViewControllerAllergy: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    
    var theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
    
    var datasource : [Allergy] = Singleton.SharedInstance.allergies
    
    // Started setting up the tableview title and footer
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 65)
        headerView.backgroundColor = ColorScheme().blue
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Vælg allergier"
        label.textColor = ColorScheme().buttonTextColor
        label.frame = CGRect(x: 8, y: 15, width: view.bounds.size.width, height: 35)
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = ColorScheme().backgroundColor
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    // Finished setting up the tableview title and footer
    
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
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.backgroundView.backgroundColor = ColorScheme().backgroundColor
        self.tableView.backgroundColor = ColorScheme().backgroundColor
    }
    
}
