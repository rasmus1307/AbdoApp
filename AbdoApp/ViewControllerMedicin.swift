import UIKit

class ViewControllerMedicin: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // Variable containing all the childs medicins
    var datasource : [ChildMedicin] = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId].medicins
    var deleteMedicinIndexPath: NSIndexPath? = nil
    
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
        let medicin = self.datasource[indexPath.row]
        var dosage = ""
        if (medicin.dosage == ""){} else {dosage = " (\(medicin.dosage))"}
        cell.textLabel?.text = "\(medicin.type)\(dosage)"
        return cell
    }
    
    // When the view appears the data for the table view is refreshed
    override func viewWillAppear(_ animated: Bool) {
        self.datasource = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId].medicins
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var i = 0
            print("\(indexPath.row.description)")
            for childMeds in Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId].medicins {
                if ("\(childMeds.type)" == "\(self.datasource[indexPath.row].type)") {
                    Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId].medicins.remove(at: i)
                } else {i += 1}
            }
            datasource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ColorScheme().backgroundColor
        changeButtonStyling(button: self.buttonAdd)
    }
    
    func changeButtonStyling(button : UIButton)
    {
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = ColorScheme().buttonColor
        button.titleLabel?.textColor = ColorScheme().buttonColor
    }

}
