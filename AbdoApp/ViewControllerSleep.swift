import UIKit

class ViewControllerSleep: UIViewController {

    @IBOutlet weak var viewHeader: UIView!
    
    @IBAction func buttonConfirm(_ sender: UIButton) {
        changeView(sender: sender)
    }

    @IBAction func buttonCancel(_ sender: UIButton) {
        changeView(sender: sender)
    }
    
    
    func changeView(sender: UIButton)
    {
        performSegue(withIdentifier: "showOthers", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = ColorScheme().backgroundColor
        self.viewHeader.backgroundColor = ColorScheme().barColor
        self.viewHeader.tintColor = ColorScheme().tintColor

    }

}
