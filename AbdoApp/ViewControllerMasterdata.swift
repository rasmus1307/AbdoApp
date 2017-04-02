import UIKit

class ViewControllerMasterdata: UIViewController {
    
    var theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
    
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var imageGender: UIImageView!
    @IBOutlet weak var imageBirthdate: UIImageView!
    
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var selectedGender: UISegmentedControl!
    @IBOutlet weak var datepickerBirthday: UIDatePicker!
    
    @IBAction func buttonSave(_ sender: UIBarButtonItem) {
        if self.textfieldName.text != "" {
            
            self.theChild.childInfo.name = self.textfieldName.text!
            
            if self.selectedGender.selectedSegmentIndex == 0 {
                self.theChild.childInfo.gender = 2
            } else {
                self.theChild.childInfo.gender = 1
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "ddMMyyyy"
            
            if (dateFormatter.string(from: self.datepickerBirthday.date) == dateFormatter.string(from: NSDate() as Date))
            {
                self.theChild.childInfo.birthdate = NSDate.minimumDate()
            }
            else
            {
                print("datepicker: \(self.datepickerBirthday.date)")
                print("minimumDate: \(NSDate.minimumDate() as Date)")
                print("now: \(NSDate() as Date)")
                self.theChild.childInfo.birthdate = self.datepickerBirthday.date as NSDate
            }
            
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        self.selectedGender.backgroundColor = UIColor.white
        self.datepickerBirthday.backgroundColor = UIColor.white
        
        if self.theChild.childInfo.birthdate != NSDate.minimumDate()
        {
            self.datepickerBirthday.date = self.theChild.childInfo.birthdate as Date
        } else
        {
            self.datepickerBirthday.date = NSDate() as Date
        }
        self.textfieldName.text = theChild.childInfo.name
        if self.theChild.childInfo.gender == 2
        {
            self.selectedGender.selectedSegmentIndex = 0
        }
        if self.theChild.childInfo.gender == 1 {
            self.selectedGender.selectedSegmentIndex = 1
        }
        self.selectedGender.tintColor = ColorScheme().blue
        
        imageHeader.image = UIImage(named: "icon_info")?.withRenderingMode(.alwaysTemplate)
        imageHeader.tintColor = .white
        imageName.image = UIImage(named: "user_icon")?.withRenderingMode(.alwaysTemplate)
        imageName.tintColor = ColorScheme().blue
        imageGender.image = UIImage(named: "icon_gender")?.withRenderingMode(.alwaysTemplate)
        imageGender.tintColor = ColorScheme().blue
        imageBirthdate.image = UIImage(named: "icon_birthday")?.withRenderingMode(.alwaysTemplate)
        imageBirthdate.tintColor = ColorScheme().blue
    }

}
