import UIKit

class ViewControllerStartpage: UIViewController {

    @IBOutlet weak var labelAbdo: UILabel!
    @IBOutlet weak var buttonOpret: UIButton!
    @IBOutlet weak var buttonSharecode: UIButton!
    @IBOutlet weak var buttonRestoreFromEmail: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        changeButtonStyling(button: buttonOpret)
        changeButtonStyling(button: buttonSharecode)
        changeButtonStyling(button: buttonRestoreFromEmail)
    }
    
    func changeButtonStyling(button : UIButton)
    {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = ColorScheme().buttonColor
        button.titleLabel?.textColor = ColorScheme().buttonTextColor
    }

}
