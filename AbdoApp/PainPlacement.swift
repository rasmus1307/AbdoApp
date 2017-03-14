import Foundation

public class PainPlacement
{
    var id : Int
    var placement : String
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init() {
        self.id = 0
        self.placement = ""
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience init(id : Int?, placement : String?, createdTime : NSDate?, modifiedTime : NSDate?) {
        self.init()
        self.id = id ?? 0
        self.placement = placement ?? ""
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}
