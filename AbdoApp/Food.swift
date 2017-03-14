import Foundation

public class Food
{
    var id : Int
    var type : String
    var foodCategory : Int
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init() {
        self.id = 0
        self.type = ""
        self.foodCategory = 0
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience init(id : Int?, type : String?, foodCategory : Int?, createdTime : NSDate?, modifiedTime : NSDate?) {
        self.init()
        self.id = id ?? 0
        self.type = type ?? ""
        self.foodCategory = foodCategory ?? 0
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}
