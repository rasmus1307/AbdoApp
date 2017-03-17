import UIKit

class ViewControllerMasterdata: UIViewController {

    var newChild = Child()
    
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var selectedGender: UISegmentedControl!
    @IBOutlet weak var datepickerBirthday: UIDatePicker!
    
    @IBAction func nameEdited(_ sender: UITextField) {
        newChild.childInfo.name = self.textfieldName.text!
    }

    @IBAction func genderEdited(_ sender: UISegmentedControl) {
        if self.selectedGender.description == "Pige" {
            newChild.childInfo.isFemale = true
        }
        else {
            newChild.childInfo.isFemale = false
        }
    }
    
    @IBAction func birthdateEdited(_ sender: UIDatePicker) {
        newChild.childInfo.birthdate = self.datepickerBirthday.date as NSDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        self.hideKeyboardWhenTappedAround()
        self.selectedGender.backgroundColor = UIColor.white
        self.datepickerBirthday.backgroundColor = UIColor.white
        self.textfieldName.text = newChild.childInfo.name
        if newChild.childInfo.isFemale
        {
            self.selectedGender.selectedSegmentIndex = 0
        }
        else {
            self.selectedGender.selectedSegmentIndex = 1
        }
        
    }

}
