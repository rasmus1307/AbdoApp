import UIKit

class ViewControllerSharecode: UIViewController {

    
    @IBOutlet weak var imageAtTop: UIImageView!
    @IBOutlet weak var imageAtCenter: UIImageView!
    @IBOutlet weak var textfieldSharecode: UITextField!
    
    @IBAction func textFieldShareCode(_ sender: UITextField) {
        
        if sender.text == "" {
            textfieldSharecode.text = "Indtast delekode her"
        }
        else if !(sender.text?.isNumber)! && !(textfieldSharecode.text == "Indtast delekode her") {
            textfieldSharecode.text = "Indtast delekode her"
        }
        else { }
        
    }
    
    @IBAction func textFieldShareCodeEditingStarted(_ sender: UITextField) {
        if sender.text == "Indtast delekode her" {
            textfieldSharecode.text = ""
        }
    }
    
    
    @IBAction func buttonSave(_ sender: UIBarButtonItem) {
        if (textfieldSharecode.text?.characters.count == 6 && (textfieldSharecode.text?.isNumber)!) {
            print("Gyldig delekode indtastet")
        } else {
            alertBox(errorTitle: "Fejl i delekode", errorMessage: "Indtast gyldig delekode")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        imageAtTop.image = UIImage(named: "icon_sharecode")?.withRenderingMode(.alwaysTemplate)
        imageAtTop.tintColor = .white
        imageAtCenter.image = UIImage(named: "ShareCodeImage")?.withRenderingMode(.alwaysTemplate)
        imageAtCenter.tintColor = .white
    }
    
    func alertBox(errorTitle: String, errorMessage: String) {
        let alertController = UIAlertController(title: "\(errorTitle)", message: "\(errorMessage)", preferredStyle: .alert)
    
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            // ...
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {
            // ...
        }
    }
}
