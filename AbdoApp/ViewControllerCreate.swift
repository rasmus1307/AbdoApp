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
        if theChild.childInfo.name == "" && theChild.childInfo.birthdate == NSDate.minimumDate() {
            self.textviewStamdata.text = "Ingen stamdata indtastet"
        }
        else { self.textviewStamdata.text = "\(theChild.childInfo.name)\n"}
        
        if (theChild.childInfo.isFemale && theChild.childInfo.name != "") {
            self.textviewStamdata.text.append("Pige\n")
        }
        if (!theChild.childInfo.isFemale && theChild.childInfo.name != "") {
            self.textviewStamdata.text.append("Dreng\n")
        }
        
        if theChild.childInfo.birthdate != NSDate.minimumDate() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd. MMM yyyy"
            let dateString = dateFormatter.string(from: theChild.childInfo.birthdate as Date)
            self.textviewStamdata.text.append("\(dateString)")
        }
        
        // updating text field regarding medicin
        var medicinArray = [String]()
        for medicin in theChild.medicins
        {
            var dosage = ""
            if (medicin.dosage == ""){} else {dosage = " (\(medicin.dosage))"}
            medicinArray.append("\(medicin.type)\(dosage)")
        }
        if medicinArray.count == 0
        {
            self.textviewMedicin.text = "Ingen medicin indtastet"
        } else
        {
            self.textviewMedicin.text = medicinArray.joined(separator: ", ")
        }
        
        // updating text field regarding allergies
        var allergyArray = [String]()
        for allergy in theChild.allergies
        {
            allergyArray.append("\(allergy.key )")
        }
        if allergyArray.count == 0
        {
            self.textviewAllergies.text = "Ingen allergier indtastet"
        } else
        {
            print(allergyArray)
            self.textviewAllergies.text = allergyArray.joined(separator: ", ")
        }
        
        // updating text field regarding supplements
        var supplementArray = [String]()
        for supplement in theChild.supplements
        {
            supplementArray.append("\(supplement.key)")
        }
        if supplementArray.count == 0
        {
            self.textviewSupplement.text = "Ingen kosttilskud indtastet"
        } else
        {
            print(supplementArray)
            self.textviewSupplement.text = supplementArray.joined(separator: ", ")
        }
        
        // reloading the text views
        self.view.reloadInputViews()
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

