import UIKit

class ViewControllerMedicin: UIViewController, UITableViewDataSource {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ColorScheme().backgroundColor
    }

}
