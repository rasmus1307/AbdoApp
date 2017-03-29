import UIKit

class ViewControllerFood: UIViewController {

    @IBOutlet weak var viewHeader: UIView!
    
    @IBAction func buttonConfirm(_ sender: UIButton) {
        popView()
    }
    
    @IBAction func buttonCancel(_ sender: UIButton) {
        popView()
    }
    
    
    func popView(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = ColorScheme().backgroundColor
        self.viewHeader.backgroundColor = ColorScheme().barColor
        self.viewHeader.tintColor = ColorScheme().tintColor

    }

}
