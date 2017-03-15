import UIKit

class ViewControllerMedicinAdd: UIViewController {

    @IBOutlet weak var medicinType: UITextField!
    @IBOutlet weak var medicinDosage: UITextField!
    
    @IBAction func medicinSave(_ sender: UIBarButtonItem) {
        singletonSaveMedicin(medicinType : medicinType.text, medicinDosage: medicinDosage.text)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func singletonSaveMedicin(medicinType : String?, medicinDosage : String?) {
        let medicin = ChildMedicin()
        medicin.type = medicinType ?? ""
        medicin.dosage = medicinDosage ?? ""
        Singleton.SharedInstance.child.medicins.append(medicin)
        print("\(Singleton.SharedInstance.child.medicins[0].type)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
