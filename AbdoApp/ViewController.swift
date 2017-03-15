import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textviewStamdata: UITextView!
    @IBOutlet weak var textviewAllergies: UITextView!
    @IBOutlet weak var textviewMedicin: UITextView!
    @IBOutlet weak var textviewSupplement: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        textviewStamdata.backgroundColor = ColorScheme().backgroundColor
        textviewAllergies.backgroundColor = ColorScheme().backgroundColor
        textviewMedicin.backgroundColor = ColorScheme().backgroundColor
        textviewSupplement.backgroundColor = ColorScheme().backgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

