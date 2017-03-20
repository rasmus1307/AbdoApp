import Foundation

public class Child
{
    var id: String
    var allergies : [String : Allergy]
    var childInfo : ChildInfo
    var medicins : [ChildMedicin]
    var registrations : [Registration]
    var shareCode : ShareCode
    var supplements : [String : Supplement]
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init()
    {
        self.id = ""
        self.allergies = [:]
        self.childInfo = ChildInfo()
        self.medicins = []
        self.registrations = []
        self.shareCode = ShareCode()
        self.supplements = [:]
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience public init(id : String?, allergies : [String : Allergy]?, childInfo : ChildInfo?,
                            childMedicin : [ChildMedicin]?, registrations : [Registration]?,
                            shareCode : ShareCode?, supplements : [String : Supplement]?,
                            createdTime : NSDate?, modifiedTime : NSDate? )
    {
        self.init()
        self.id = id ?? ""
        self.allergies = allergies ?? [:]
        self.childInfo = childInfo ?? ChildInfo()
        self.medicins = childMedicin ?? []
        self.registrations = registrations ?? []
        self.shareCode = shareCode ?? ShareCode()
        self.supplements = supplements ?? [:]
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
    
}
