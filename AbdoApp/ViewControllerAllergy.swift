import UIKit

class ViewControllerAllergy: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
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
        let (allergi) = self.datasource[indexPath.row]
        cell.textLabel?.text = allergi.type
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("\(self.datasource[indexPath.row].type)")
        
        // adding the value to childs list of allergies
        let childAllergy = ChildAllergy()
        childAllergy.allergyId = self.datasource[indexPath.row].id
        childAllergy.childId = Singleton.SharedInstance.currentChildId
        Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId].allergies.append(childAllergy)
        
        // adding checkmark to row
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .checkmark
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        print("\(self.datasource[indexPath.row].type)")
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}
