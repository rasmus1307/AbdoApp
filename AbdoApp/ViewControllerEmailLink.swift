import UIKit

class ViewControllerEmailLink: UIViewController {

    @IBOutlet weak var textfieldEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        self.textfieldEmail.becomeFirstResponder()
    }

}
