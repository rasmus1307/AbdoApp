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
        labelAbdo.textColor = UIColor(red: 220/255.0, green: 91/255.0, blue: 33/255.0, alpha: 1)
    }
    
    func changeButtonStyling(button : UIButton)
    {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor(red: 112/255, green: 171/255, blue: 143/255, alpha: 1)
        button.titleLabel?.textColor = UIColor.white
        
    }

}
