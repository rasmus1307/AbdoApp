import UIKit

class ViewControllerMasterdata: UIViewController {
    
    var theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
    
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var selectedGender: UISegmentedControl!
    @IBOutlet weak var datepickerBirthday: UIDatePicker!

    @IBAction func genderEdited(_ sender: UISegmentedControl) {
        if self.selectedGender.selectedSegmentIndex == 0 {
            self.theChild.childInfo.isFemale = true
        } else {
            self.theChild.childInfo.isFemale = false
        }
    }
    
    @IBAction func birthdateEdited(_ sender: UIDatePicker) {
        self.theChild.childInfo.birthdate = self.datepickerBirthday.date as NSDate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.theChild.childInfo.name = self.textfieldName.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        self.hideKeyboardWhenTappedAround()
        self.selectedGender.backgroundColor = UIColor.white
        self.datepickerBirthday.backgroundColor = UIColor.white
        self.textfieldName.text = theChild.childInfo.name
        if self.theChild.childInfo.isFemale
        {
            self.selectedGender.selectedSegmentIndex = 0
        }
        else {
            self.selectedGender.selectedSegmentIndex = 1
        }
        self.textfieldName.becomeFirstResponder()
        
    }

}
