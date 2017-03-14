import Foundation

public class Registration
{
    var id : Int
    var childId : Int
    var fecesId : Int
    var activityId : Int
    var painPlacementId : Int
    var painLevelId : Int
    var sleepId : Int
    var moodId : Int
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init() {
        self.id = 0
        self.childId = 0
        self.fecesId = 0
        self.activityId = 0
        self.painPlacementId = 0
        self.painLevelId = 0
        self.sleepId = 0
        self.moodId = 0
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience init(id : Int?, childId : Int?, fecesId : Int?, activityId : Int?,
                     painPlacementId : Int?, painLevelId : Int?, sleepId : Int?,
                     moodId : Int?, createdTime : NSDate?, modifiedTime : NSDate?)
    {
        self.init()
        self.id = id ?? 0
        self.childId = childId ?? 0
        self.fecesId = fecesId ?? 0
        self.activityId = activityId ?? 0
        self.painPlacementId = painPlacementId ?? 0
        self.painLevelId = painLevelId ?? 0
        self.sleepId = sleepId ?? 0
        self.moodId = moodId ?? 0
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}
