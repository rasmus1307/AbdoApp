import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textviewStamdata: UITextView!
    @IBOutlet weak var textviewAllergies: UITextView!
    @IBOutlet weak var textviewMedicin: UITextView!
    @IBOutlet weak var textviewSupplement: UITextView!
    
    var newChild = Singleton.SharedInstance.child.append(_: Child())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        textviewStamdata.backgroundColor = ColorScheme().backgroundColor
        textviewMedicin.backgroundColor = ColorScheme().backgroundColor
        textviewAllergies.backgroundColor = ColorScheme().backgroundColor
        textviewSupplement.backgroundColor = ColorScheme().backgroundColor
    }

}

