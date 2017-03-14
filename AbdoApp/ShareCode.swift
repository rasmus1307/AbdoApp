import Foundation

/// ---
/// # Share code
///
public class ShareCode
{
    var childId : Int
    var code : String
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init()
    {
        self.childId = 0
        self.code = ""
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience public init(childId : Int?, code : String?, createdTime : NSDate?, modifiedTime : NSDate?)
    {
        self.init()
        self.childId = childId ?? 0
        self.code = code ?? ""
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
    
    func CreateShareCode()
    {
        self.code = randomShareCode(length: 6)
        self.modifiedTime = NSDate()
    }
    
    private func randomShareCode(length: Int) -> String
    {
        let letters : NSString = "0123456789"
        let len = UInt32(letters.length)
        var randomCode = ""
        for _ in 0 ..< length
        {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomCode += NSString(characters: &nextChar, length: 1) as String
        }
        return randomCode
    }
    
}
