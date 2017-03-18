import UIKit

class ViewControllerCreate: UIViewController {

    @IBOutlet weak var textviewStamdata: UITextView!
    @IBOutlet weak var textviewAllergies: UITextView!
    @IBOutlet weak var textviewMedicin: UITextView!
    @IBOutlet weak var textviewSupplement: UITextView!
    
    let newChild = Singleton.SharedInstance.child.append(_: Child())
    
    override func viewWillAppear(_ animated: Bool) {
        let theChild = Singleton.SharedInstance.child[Singleton.SharedInstance.currentChildId]
        
        // updating text field regarding child info
        if theChild.childInfo.name == "" {
            self.textviewStamdata.text = "Ingen stamdata indtastet"
        } else
        {
            self.textviewStamdata.text = "\(theChild.childInfo.name)"
        }
        
        // updating text field regarding medicin
        var medicinArray = [String]()
        for medicin in theChild.medicins
        {
            medicinArray.append(medicin.type)
        }
        if medicinArray.count == 0
        {
            self.textviewMedicin.text = "Ingen medicin indtastet"
        } else
        {
            self.textviewMedicin.text = medicinArray.joined(separator: ", ")
        }
        
        // updating text field regarding allergies
        self.textviewAllergies.text = "Ingen allergier indtastet"
//        var allergyArray = [String]()
//        for allergy in theChild.allergies
//        {
//            allergyArray.append(allergy.)
//        }
//        if allergyArray.count == 0
//        {
//            self.textviewAllergies.text = "Ingen allergier indtastet"
//        } else
//        {
//            self.textviewAllergies.text = medicinArray.joined(separator: ", ")
//        }
        
        
        // updating text field regarding supplements
        self.textviewSupplement.text = "Ingen kosttilskud indtastet"
        
        self.textviewStamdata.reloadInputViews()
        self.textviewMedicin.reloadInputViews()
        self.textviewAllergies.reloadInputViews()
        self.textviewSupplement.reloadInputViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().backgroundColor
        textviewStamdata.backgroundColor = ColorScheme().backgroundColor
        textviewMedicin.backgroundColor = ColorScheme().backgroundColor
        textviewAllergies.backgroundColor = ColorScheme().backgroundColor
        textviewSupplement.backgroundColor = ColorScheme().backgroundColor
    }

}

