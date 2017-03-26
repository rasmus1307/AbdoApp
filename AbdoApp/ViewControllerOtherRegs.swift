import UIKit

class ViewControllerOtherRegs: UIViewController {

    @IBOutlet weak var viewHeader: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = ColorScheme().backgroundColor
        self.viewHeader.backgroundColor = ColorScheme().barColor
        self.viewHeader.tintColor = ColorScheme().tintColor
    }

}
