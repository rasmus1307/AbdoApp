import Foundation

public class Singleton
{
    class var SharedInstance : Singleton
    {
        struct Static
        {
            static let instance : Singleton = Singleton()
        }
        return Static.instance
    }
    
    var api : API
    var anonymous : Anonymous
    var child : Child
    var activities : [Activity]
    var feces : [Feces]
    var foodCategory : [FoodCategory]
    var food : [Food]
    var mood : [Mood]
    var painLevel : [PainLevel]
    var painPlacement : [PainPlacement]
    var sleep : [Sleep]
    
    private init()
    {
        print("Singleton started")
        self.api = API()
        self.anonymous = Anonymous()
        self.child = Child()
        self.activities = []
        self.feces = []
        self.foodCategory = []
        self.food = []
        self.mood = []
        self.painLevel = []
        self.painPlacement = []
        self.sleep = []
    }
    
}
