import UIKit

class ViewControllerRegStart: UIViewController {


    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var head: UIButton!
    @IBOutlet weak var upperBody: UIButton!
    @IBOutlet weak var lowerBody: UIButton!
    
    @IBAction func painAreaClicked(_ sender: UIButton) {
        changeView(sender: sender)
    }
    
    func changeView(sender: UIButton)
    {
        performSegue(withIdentifier: "showPain", sender: sender)
    }
    
    func buttonBorder(button : UIButton) {
        button.layer.borderWidth = 2;
        button.layer.borderColor = UIColor.red.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = ColorScheme().backgroundColor
        self.viewHeader.backgroundColor = ColorScheme().barColor
        self.viewHeader.tintColor = ColorScheme().tintColor
        buttonBorder(button: head)
        buttonBorder(button: upperBody)
        buttonBorder(button: lowerBody)
    }

}
