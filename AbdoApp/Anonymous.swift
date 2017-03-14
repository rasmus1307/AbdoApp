import Foundation

public class Anonymous
{
    var id : Int
    var deviceId : String
    var deviceName : String
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init()
    {
        self.id = 0
        self.deviceId = ""
        self.deviceName = ""
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience public init(id : Int?, deviceId : String?, deviceName : String?, createdTime : NSDate?, modifiedTime : NSDate?)
    {
        self.init()
        self.id = id ?? 0
        self.deviceId = deviceId ?? ""
        self.deviceName = deviceName ?? ""
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}
