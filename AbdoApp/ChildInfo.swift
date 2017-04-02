import Foundation

/// ---
/// # Child Info
/// ============
/// ## Contains static user information about a child
///
/// Variables (All variables are not required)
/// - Create timestamp : Creation date of the child
/// - Update timestamp : Last update of the child
/// - Name             : The childs name
/// - Is female        : The childs gender (True = female, False = male)
/// - Birthdate        : The childs birthday
/// 
/// ## API
/// The API can be called through the API

public class ChildInfo
{
    var uuid : UUID
    var name : String
    var gender : Int
    var birthdate : NSDate
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    public required init()
    {
        self.uuid = UUID()
        self.name = ""
        self.gender = 0
        self.birthdate = NSDate.minimumDate()
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    public convenience init(name: String?, gender: Int?, birthdate: NSDate?)
    {
        self.init()
        self.name = name ?? ""
        self.gender = gender ?? 0
        self.birthdate = birthdate ?? NSDate.minimumDate()
    }
    
    public convenience init(uuid: UUID?, name: String?, gender: Int?, birthdate: NSDate?, createdTime: NSDate?, modifiedTime: NSDate?)
    {
        self.init()
        self.uuid = uuid ?? self.uuid
        self.name = name ?? ""
        self.gender = gender ?? 0
        self.birthdate = birthdate ?? NSDate.minimumDate()
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}

extension ChildInfo {
    func toJson() -> Dictionary<String, AnyObject> {
        return [
             "name": self.name as AnyObject
            ,"gender": self.gender as AnyObject
            ,"birthdate": self.birthdate as AnyObject
        ]
    }

}
