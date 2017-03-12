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

class ChildInfo
{
    var createTimestamp: NSDate
    var updateTimestamp: NSDate
    var name: String
    var isFemale: Bool
    var birthdate: NSDate
    
    required init()
    {
        self.createTimestamp = NSDate()
        self.updateTimestamp = NSDate()
        self.name = ""
        self.isFemale = true
        self.birthdate = NSDate.minimumDate()
    }
    
    convenience init(createTimestamp: NSDate?, updateTimestamp: NSDate?, name: String?, isFemale: Bool?, birthdate: NSDate?)
    {
        self.init()
        self.createTimestamp = createTimestamp ?? NSDate.minimumDate()
        self.updateTimestamp = updateTimestamp ?? NSDate.minimumDate()
        self.name = name ?? ""
        self.isFemale = isFemale ?? true
        self.birthdate = birthdate ?? NSDate.minimumDate()
    }
}
