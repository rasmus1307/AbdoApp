import Foundation

/// ---
/// # Share code
///
public class ShareCode
{
    var createTimestamp: NSDate
    var code: String
    
    required public init()
    {
        self.createTimestamp = NSDate.minimumDate()
        self.code = ""
    }
    
    func CreateShareCode()
    {
        self.createTimestamp = NSDate()
        self.code = randomShareCode(length: 6)
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
