import UIKit

class ViewControllerCreateChild: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let newChild = Singleton.SharedInstance.child.append(_: Child())
    var theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
    
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    @IBAction func buttonSave(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showRegistrationFlow", sender: sender)
    }
    
    let sectionTitles = ["Stamdata", "Medicin", "Allergier", "Kosttilskud"]
    var sectionIcons = [UIImage(named: "icon_info")?.withRenderingMode(.alwaysTemplate), UIImage(named: "icon_medicine")?.withRenderingMode(.alwaysTemplate), UIImage(named: "icon_allergy")?.withRenderingMode(.alwaysTemplate), UIImage(named: "icon_supplement")?.withRenderingMode(.alwaysTemplate)]
    
    var stamdata = [String]()
    var medicin = [ChildMedicin]()
    var allergies = [String]()
    var supplements = [String]()
    
    // How many sections in the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 65)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.pressed(sender:)))
        gesture.accessibilityLabel = sectionTitles[section]
        headerView.addGestureRecognizer(gesture)

        headerView.backgroundColor = .white
        //changeViewStyling(view : headerView)
        
        let leftImagePoint = CGPoint(x: 16, y: 15)
        let leftImageSize = CGSize(width: 35, height: 35)
        let leftImage = UIImageView(frame: CGRect(origin: leftImagePoint, size: leftImageSize))
        leftImage.image = sectionIcons[section]
        leftImage.tintColor = ColorScheme().blue
        headerView.addSubview(leftImage)
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = sectionTitles[section]
        label.textColor = ColorScheme().blue
        label.frame = CGRect(x: 59, y: 15, width: 100, height: 35)
        headerView.addSubview(label)
        
        let rightImagePoint = CGPoint(x: headerView.bounds.size.width - 50, y: 15)
        let rightImageSize = CGSize(width: 35, height: 35)
        let rightImage = UIImageView(frame: CGRect(origin: rightImagePoint, size: rightImageSize))
        rightImage.image = UIImage(named: "icon_right_arrow")?.withRenderingMode(.alwaysTemplate)
        rightImage.tintColor = ColorScheme().blue
        headerView.addSubview(rightImage)
        
        
//        let button = UIButton()
//        button.frame = CGRect(x: headerView.bounds.size.width - 50, y: 15, width: 35, height: 35)
//        //button.layer.cornerRadius = 0.5 * button.bounds.size.width
//        button.imageView?.image = UIImage(named: "icon_right_arrow")?.withRenderingMode(.alwaysTemplate)
////        button.imageView?.tintColor = ColorScheme().blue
//        button.accessibilityLabel = sectionTitles[section]
//        button.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
//        headerView.addSubview(button)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    
    // Setting up the footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = ColorScheme().backgroundColor
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    // Function called when a Plus button is pressed
    func pressed(sender: UITapGestureRecognizer)
    {
        changeView(receivedString: sender.accessibilityLabel, sender: sender)
    }
    
    // Sending the user to the wanted view
    // Can be istantiated by tableview header title plus button
    // Or by clicking one of the rows
    func changeView(receivedString : String!, sender: Any?)
    {
        switch receivedString
        {
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
    
    // Pass selected medicin data to ViewControllerMedicinAdd
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showMedicin") {
            let medicinViewController = segue.destination as! ViewControllerMedicinAdd
            if let indexPath = sender as? IndexPath {
                medicinViewController.segueMedicin = self.medicin[indexPath.row]
            }
            else
            {
            }
        }
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
        cell.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 30)
        
        switch indexPath.section
        {
            case 0:
                let stamdataItem = self.stamdata[indexPath.row]
                cell.selectionStyle = .none
                cell.textLabel?.text = stamdataItem
            case 1:
                var medicinDosage = ""
                if self.medicin[indexPath.row].dosage == "" {} else {medicinDosage = " (\(medicin[indexPath.row].dosage))"}
                let medicinItem = self.medicin[indexPath.row].type
                cell.textLabel?.text = "\(medicinItem)\(medicinDosage)"
                let image = UIImage(named: "PencilBlack")?.withRenderingMode(.alwaysTemplate)
                let imageView = UIImageView(image: image!)
                imageView.tintColor = ColorScheme().blue
                imageView.frame = CGRect(x: cell.bounds.size.width - 50, y: 5, width: 20, height: 20)
                cell.addSubview(imageView)
            case 2:
                let allergyItem = self.allergies[indexPath.row]
                cell.selectionStyle = .none
                cell.textLabel?.text = allergyItem
            case 3:
                let supplementItem = self.supplements[indexPath.row]
                cell.selectionStyle = .none
                cell.textLabel?.text = supplementItem
            default:
                cell.textLabel?.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    // linking a row/section to the correct edit view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.section == 1 {
            if let cell = tableView.cellForRow(at: indexPath)
            {
                changeView(receivedString: self.sectionTitles[indexPath.section], sender: indexPath)
                cell.isSelected = false
                cell.isHighlighted = false
            }
            self.tableView.reloadData()
        }
    }

//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
//        let edit = UITableViewRowAction(style: .normal, title: "Ret") { action, index in
//            print("edit button tapped")
//        }
//        edit.backgroundColor = .orange
//        
//        let delete = UITableViewRowAction(style: .normal, title: "Slet") { action, index in
//            print("delete button tapped")
//        }
//        delete.backgroundColor = .red
//        
//        return [delete, edit]
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = "Fortryd"
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationItem.title = "Registrer barn"
        self.stamdata = self.theChild.convertChildInfoToArray()
        self.medicin = self.theChild.medicins
        self.allergies = self.theChild.allergies.map { $0.type }
        //self.allergies = Array(self.theChild.allergies.keys)
        self.supplements = self.theChild.supplements.map { $0.type }
//        self.supplements = Array(self.theChild.supplements.keys)
        self.theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
        self.tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = ColorScheme().backgroundColor
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.backgroundView.backgroundColor = ColorScheme().backgroundColor
        imageHeader.image = UIImage(named: "add_user_icon")?.withRenderingMode(.alwaysTemplate)
        imageHeader.tintColor = .white
    }

}
