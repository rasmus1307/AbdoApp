import UIKit

class ViewControllerSharecode: UIViewController {

    @IBOutlet weak var textfieldSharecode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        self.textfieldSharecode.becomeFirstResponder()
    }
}
