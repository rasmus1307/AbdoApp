import Foundation
import UIKit
import Alamofire
import SwiftyJSON

public class Anonymous
{
    var id : Int
    var deviceId : String
    var deviceName : String
    var createdTime : NSDate
    var updatedTime : NSDate
    var httpStatusCode : Int
    
    required public init()
    {
        self.id = 0
        let currentDevice = UIDevice.current
        self.deviceId = (currentDevice.identifierForVendor?.uuidString)!
        self.deviceName = "\(currentDevice.model) \(currentDevice.systemName) \(currentDevice.systemVersion)"
        self.createdTime = NSDate()
        self.updatedTime = NSDate()
        self.httpStatusCode = 0
    }
    
    convenience public init(deviceId : String?, deviceName : String?)
    {
        self.init()
        self.deviceId = deviceId ?? ""
        self.deviceName = deviceName ?? ""
    }
    
    convenience public init(id : Int, deviceId : String?, deviceName : String?, createdTime : NSDate?, updatedTime : NSDate?)
    {
        self.init()
        self.id = id 
        self.deviceId = deviceId ?? ""
        self.deviceName = deviceName ?? ""
        self.createdTime = createdTime ?? NSDate()
        self.updatedTime = updatedTime ?? NSDate()
    }
    
    func platform() -> String {
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }
}

extension Anonymous {
    func toJSON() -> Dictionary<String, AnyObject> {
        return [
             "deviceId": self.deviceId as AnyObject
            ,"deviceName": self.deviceName as AnyObject
        ]
    }
}

// REST API calls
extension Anonymous {
    func post()  {
        Alamofire.request(RouterAnonymous.create(parameters: self.toJSON())).validate().responseJSON
        { response in
            self.httpStatusCode = (response.response?.statusCode)!
        }
    }
    
    func get() {
    }
    
    func put() {
    }
    
    func delete() {
    }
}
