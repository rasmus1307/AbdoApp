import Foundation

public class Sleep
{
    var id : Int
    var description : String
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init() {
        self.id = 0
        self.description = ""
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience init(id : Int?, description : String?, createdTime : NSDate?, modifiedTime : NSDate?) {
        self.init()
        self.id = id ?? 0
        self.description = description ?? ""
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}
