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
    var name : String
    var isFemale : Bool
    var birthdate : NSDate
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    public required init()
    {
        self.name = ""
        self.isFemale = true
        self.birthdate = NSDate.minimumDate()
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    public convenience init(name: String?, isFemale: Bool?, birthdate: NSDate?, createdTime: NSDate?, modifiedTime: NSDate?)
    {
        self.init()
        self.name = name ?? ""
        self.isFemale = isFemale ?? true
        self.birthdate = birthdate ?? NSDate.minimumDate()
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}
