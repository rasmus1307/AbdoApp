import UIKit

class ViewControllerCreateChild: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let newChild = Singleton.SharedInstance.child.append(_: Child())
    var theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    
    let sectionTitles = ["Stamdata", "Medicin", "Allergier", "Kosttilskud"]
    
    var stamdata = [String]()
    var medicin = [String]()
    var allergies = [String]()
    var supplements = [String]()
    
    // How many sections in the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 45)
        headerView.backgroundColor = ColorScheme().buttonColor
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = sectionTitles[section]
        label.textColor = ColorScheme().buttonTextColor
        label.frame = CGRect(x: 5, y: 5, width: 100, height: 35)
        headerView.addSubview(label)
        
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        //button.titleLabel?.textAlignment = .center
        button.frame = CGRect(x: headerView.bounds.size.width - 50, y: 5, width: 35, height: 35)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.borderWidth = 2
        button.layer.borderColor = ColorScheme().buttonTextColor.cgColor
        button.accessibilityLabel = sectionTitles[section]
        button.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
        headerView.addSubview(button)
        
        return headerView
    }
    
    func pressed(sender: UIButton!) {
        switch sender.accessibilityLabel! {
        case "Stamdata":
            performSegue(withIdentifier: "showMasterdata", sender: sender)
            return
        case "Medicin":
            performSegue(withIdentifier: "showMedicin", sender: sender)
            return
        case "Allergier":
            performSegue(withIdentifier: "showAllergies", sender: sender)
            return
        case "Kosttilskud":
            performSegue(withIdentifier: "showSupplements", sender: sender)
            return
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = ColorScheme().backgroundColor
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    // How many rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section {
        case 0:
            return self.stamdata.count
        case 1:
            return self.medicin.count
        case 2:
            return self.allergies.count
        case 3:
            return self.supplements.count
        default:
            return 0
        }

    }
    
    // Adding cell data to table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
        switch indexPath.section
        {
            case 0:
                let stamdataItem = self.stamdata[indexPath.row]
                cell.textLabel?.text = stamdataItem
            case 1:
                let medicinItem = self.medicin[indexPath.row]
                cell.textLabel?.text = medicinItem
            case 2:
                let allergyItem = self.allergies[indexPath.row]
                cell.textLabel?.text = allergyItem
            case 3:
                let supplementItem = self.supplements[indexPath.row]
                cell.textLabel?.text = supplementItem
            default:
                cell.textLabel?.text = ""
        }
        return cell
    }

//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
//        let more = UITableViewRowAction(style: .normal, title: "More") { action, index in
//            print("more button tapped")
//        }
//        more.backgroundColor = .lightGray
//        
//        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
//            print("favorite button tapped")
//        }
//        favorite.backgroundColor = .orange
//        
//        let share = UITableViewRowAction(style: .normal, title: "Share") { action, index in
//            print("share button tapped")
//        }
//        share.backgroundColor = .blue
//        
//        return [share, favorite, more]
//    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.stamdata = self.theChild.convertChildInfoToArray()
        self.medicin = self.theChild.convertMedicinToArray()
        self.allergies = Array(self.theChild.allergies.keys)
        self.supplements = Array(self.theChild.supplements.keys)
        self.theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
        self.tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = ColorScheme().backgroundColor
        self.backgroundView.backgroundColor = ColorScheme().backgroundColor
    }

}
