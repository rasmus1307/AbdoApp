import Foundation

public class ShareCodeApi
{
    init() {
    }
    
    public func Set(child: Child)
    {
        // insert sharecode through API
        print("Child named \(child.childInfo.name),"
            + "has share code \(child.shareCode.code),"
            + "valid from \(child.shareCode.createTimestamp)")
    }
    
    public func Get(child: Child)
    {
        // create function to extract sharecode through API
    }
    
}
