import UIKit

class ViewControllerPain: UIViewController {

    @IBOutlet weak var viewHeader: UIView!
    
    @IBAction func buttonPainLevelClicked(_ sender: UIButton) {
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
