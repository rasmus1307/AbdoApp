import Foundation

public class ChildAllergy
{
    var id : Int
    var childId : Int
    var allergyId : Int
    var createdTime : NSDate
    var modifiedTime : NSDate

    required public init()
    {
        self.id = 0
        self.childId = 0
        self.allergyId = 0
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience public init(id : Int?, childId : Int?, allergyId : Int?, createdTime : NSDate?, modifiedTime : NSDate?)
    {
        self.init()
        self.id = id ?? 0
        self.childId = childId ?? 0
        self.allergyId = allergyId ?? 0
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}
