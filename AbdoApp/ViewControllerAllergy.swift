import UIKit

class ViewControllerAllergy: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    @IBAction func buttonSave(_ sender: UIBarButtonItem) {
        theChild.allergies = tempAllergies
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    var theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
    var tempAllergies = [Allergy]()
    
    var datasource : [Allergy] = Singleton.SharedInstance.allergies
    
    // Started setting up the tableview title and footer
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 100)
        headerView.backgroundColor = ColorScheme().blue
        
        let leftImagePoint = CGPoint(x: 16, y: 18)
        let leftImageSize = CGSize(width: 64, height: 64)
        let leftImage = UIImageView(frame: CGRect(origin: leftImagePoint, size: leftImageSize))
        leftImage.image = UIImage(named: "icon_allergy")?.withRenderingMode(.alwaysTemplate)
        leftImage.tintColor = ColorScheme().white
        headerView.addSubview(leftImage)
        
        let textView = UITextView()
        let textViewPoint = CGPoint(x: leftImagePoint.x + leftImageSize.width + 8, y: 8)
        let textViewSize = CGSize(width: view.bounds.size.width - 80, height: 84)
        textView.frame = CGRect(origin: textViewPoint, size: textViewSize)
        textView.text = "Her kan du vælge dit barns allergier"
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.backgroundColor = .clear
        textView.textColor = .white
        headerView.addSubview(textView)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
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
        if self.tempAllergies.contains(where: { $0.id == item.id }) {
            cell.accessoryType = .checkmark
        }
        cell.textLabel?.text = item.type
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // getting the datasource object from the row selected
        let selected = self.datasource[indexPath.row]
        
        // getting the that was clicked
        if let cell = tableView.cellForRow(at: indexPath)
        {
            // removing checkmark if row selected with checkmark
            // and removing from the child object
            if cell.accessoryType == .checkmark
            {
                cell.accessoryType = .none
                self.tempAllergies = self.tempAllergies.filter({$0.type != selected.type})
                cell.isSelected = false
                cell.isHighlighted = false
            }
            // adding checkmark to row when selected
            // and appending it to the child object
            else
            {
                cell.accessoryType = .checkmark
                self.tempAllergies.append(selected)
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
        self.backgroundView.backgroundColor = ColorScheme().beige
        self.tableView.backgroundColor = ColorScheme().beige
        self.tempAllergies = (theChild.allergies.map{$0})
    }
    
}
