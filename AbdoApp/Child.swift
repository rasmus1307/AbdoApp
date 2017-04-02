import Foundation

public class Child
{
    var id: String
    var allergies : [Allergy]
    var childInfo : ChildInfo
    var medicins : [ChildMedicin]
    var registrations : [Registration]
    var shareCode : ShareCode
    var supplements : [Supplement]
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init()
    {
        self.id = ""
        self.allergies = []
        self.childInfo = ChildInfo()
        self.medicins = []
        self.registrations = []
        self.shareCode = ShareCode()
        self.supplements = []
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience public init(id : String?, allergies : [Allergy]?, childInfo : ChildInfo?,
                            childMedicin : [ChildMedicin]?, registrations : [Registration]?,
                            shareCode : ShareCode?, supplements : [Supplement]?,
                            createdTime : NSDate?, modifiedTime : NSDate? )
    {
        self.init()
        self.id = id ?? ""
        self.allergies = allergies ?? []
        self.childInfo = childInfo ?? ChildInfo()
        self.medicins = childMedicin ?? []
        self.registrations = registrations ?? []
        self.shareCode = shareCode ?? ShareCode()
        self.supplements = supplements ?? []
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
    
    func convertChildInfoToArray() -> [String] {
        var childInfoArray = [String]()
        
        // adding name of the child
        if self.childInfo.name != "" {
            childInfoArray.append(self.childInfo.name)
            
            // adding gender of the child
            if self.childInfo.gender == 2 { childInfoArray.append("Pige") }
            if self.childInfo.gender == 1 { childInfoArray.append("Dreng") }
        }
        
        // adding the birthdate of the child
        if self.childInfo.birthdate != NSDate.minimumDate() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd. MMM yyyy"
            let dateString = dateFormatter.string(from: childInfo.birthdate as Date)
            childInfoArray.append("\(dateString)")
        }
        return childInfoArray
    }
    
    func convertMedicinToArray() -> [String] {
        var medicinArray = [String]()
        for item in medicins {
            var dosage = ""
            if (item.dosage == ""){} else {dosage = " (\(item.dosage))"}
            medicinArray.append("\(item.type)\(dosage)")
        }
        return medicinArray
    }
    
}
