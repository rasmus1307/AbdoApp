import Foundation

public class Child
{
    var id: String
    var allergies : [ChildAllergy]
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
    
    convenience public init(id : String?, childAllergies : [ChildAllergy]?, childInfo : ChildInfo?,
                         childMedicin : [ChildMedicin]?, registrations : [Registration]?,
                         shareCode : ShareCode?, supplements : [Supplement]?,
                         createdTime : NSDate?, modifiedTime : NSDate? )
    {
        self.init()
        self.id = id ?? ""
        self.allergies = childAllergies ?? []
        self.childInfo = childInfo ?? ChildInfo()
        self.medicins = childMedicin ?? []
        self.registrations = registrations ?? []
        self.shareCode = shareCode ?? ShareCode()
        self.supplements = supplements ?? []
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
    
}
