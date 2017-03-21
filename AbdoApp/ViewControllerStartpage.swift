import UIKit

class ViewControllerStartpage: UIViewController {

    @IBOutlet weak var labelAbdo: UILabel!
    @IBOutlet weak var buttonOpret: UIButton!
    @IBOutlet weak var buttonSharecode: UIButton!
    @IBOutlet weak var buttonRestoreFromEmail: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        //changeBackgroundStyling(view: view)
        changeButtonStyling(button: buttonOpret)
        changeButtonStyling(button: buttonSharecode)
        changeButtonStyling(button: buttonRestoreFromEmail)
    }

}
