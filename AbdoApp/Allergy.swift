import Foundation

public class Allergy
{
    var id : Int
    var level : String
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init() {
        self.id = 0
        self.level = ""
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience init(id : Int?, level : String?, createdTime : NSDate?, modifiedTime : NSDate?) {
        self.init()
        self.id = id ?? 0
        self.level = level ?? ""
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}
