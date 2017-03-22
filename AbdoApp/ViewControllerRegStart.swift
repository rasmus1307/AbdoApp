import UIKit

class ViewControllerRegStart: UIViewController {

    @IBOutlet weak var textBubble: UITextView!
    @IBOutlet weak var head: UIButton!
    @IBOutlet weak var upperBody: UIButton!
    @IBOutlet weak var lowerBody: UIButton!
    
    @IBAction func buttonHead(_ sender: UIButton) {
    }
    
    @IBAction func buttonUpperBody(_ sender: UIButton) {
    }
    
    @IBAction func buttonLowerBody(_ sender: UIButton) {
    }
    
    func buttonBorder(button : UIButton) {
        button.layer.borderWidth = 2;
        button.layer.borderColor = UIColor.red.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = ColorScheme().backgroundColor
        self.textBubble.backgroundColor = UIColor.white
        self.textBubble.layer.borderWidth = 2
        self.textBubble.layer.borderColor = UIColor.black.cgColor
        buttonBorder(button: head)
        buttonBorder(button: upperBody)
        buttonBorder(button: lowerBody)
    }

    
}
