import UIKit

class ViewControllerMedicin: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Variable containing all the childs medicins
    var datasource : [ChildMedicin] = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId].medicins
    
    // Title for the table view
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Valgt medicin"
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
        let (medicin) = self.datasource[indexPath.row]
        cell.textLabel?.text = medicin.type
        return cell
    }
    
    // When the view appears the data for the table view is refreshed
    override func viewWillAppear(_ animated: Bool) {
        self.datasource = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId].medicins
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ColorScheme().backgroundColor
    }

}
