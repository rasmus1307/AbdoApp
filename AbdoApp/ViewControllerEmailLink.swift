import UIKit

class ViewControllerEmailLink: UIViewController {

    @IBOutlet weak var imageAtTop: UIImageView!
    @IBOutlet weak var imageAtCenter: UIImageView!
    @IBOutlet weak var textfieldEmail: UITextField!
    
    
    @IBAction func textFieldEmailEditingStarted(_ sender: UITextField) {
        if textfieldEmail.text == "Indtast email her" {
           textfieldEmail.text = ""
        }
    }
    
    @IBAction func textFieldEmailEditingEnded(_ sender: UITextField) {
        if textfieldEmail.text == "" {
            textfieldEmail.text = "Indtast email her"
        }
    }
    
    @IBAction func buttonSave(_ sender: UIBarButtonItem) {
        if isValidEmailAddress(emailAddressString: textfieldEmail.text!) {
            print("valid email \(textfieldEmail.text!)")
        }
        else {
            alertBox(errorTitle: "Fejl i email", errorMessage: "Indtast gyldig email")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        imageAtTop.image = UIImage(named: "icon_email")?.withRenderingMode(.alwaysTemplate)
        imageAtTop.tintColor = .white
        imageAtCenter.image = UIImage(named: "download_from_email")?.withRenderingMode(.alwaysTemplate)
        imageAtCenter.tintColor = .white
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
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
