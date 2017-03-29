import UIKit

class ViewControllerMedicinAdd: UIViewController {

    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var imageMedicine: UIImageView!
    @IBOutlet weak var imageDosage: UIImageView!
    
    @IBOutlet weak var medicinType: UITextField!
    @IBOutlet weak var medicinDosage: UITextField!
    var segueMedicin = ChildMedicin()
    
    @IBAction func medicinSave(_ sender: UIBarButtonItem) {
        if (self.medicinType.text == "") {
            let alert = UIAlertController(title: "Mangel", message: "\nUdfyld medicin type", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else
        {
            singletonSaveMedicin(medicinType : medicinType.text, medicinDosage: medicinDosage.text)
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().beige
        self.medicinType.becomeFirstResponder()
        self.medicinType.text = self.segueMedicin.type
        self.medicinDosage.text = self.segueMedicin.dosage
        
        imageHeader.image = UIImage(named: "icon_medicine")?.withRenderingMode(.alwaysTemplate)
        imageHeader.tintColor = ColorScheme().blue
        imageMedicine.image = UIImage(named: "icon_meds")?.withRenderingMode(.alwaysTemplate)
        imageMedicine.tintColor = ColorScheme().blue
        imageDosage.image = UIImage(named: "icon_dosage")?.withRenderingMode(.alwaysTemplate)
        imageDosage.tintColor = ColorScheme().blue
    }
    
    func singletonSaveMedicin(medicinType : String?, medicinDosage : String?) {
        if segueMedicin.type == "" {
            let medicin = ChildMedicin()
            medicin.type = medicinType ?? ""
            medicin.dosage = medicinDosage ?? ""
            Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId].medicins.append(medicin)
        }
        else
        {
            segueMedicin.type = medicinType ?? ""
            segueMedicin.dosage = medicinDosage ?? ""
        }
    }

}
