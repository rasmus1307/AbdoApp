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
    
    // System vairables
    var allergies : [Allergy]
    var activities : [Activity]
    var feces : [Feces]
    var foodCategory : [FoodCategory]
    var food : [Food]
    var mood : [Mood]
    var painLevel : [PainLevel]
    var painPlacement : [PainPlacement]
    var sleep : [Sleep]
    var supplements : [Supplement]
    
    // Smart phone registration
    var anonymous : Anonymous
    
    // Child objects containing all information about one or more children
    var child : [Child]
    
    // Current child selected
    var currentChildId : Int
    
    private init()
    {
        print("Singleton started")
        self.api = API()
        self.anonymous = Anonymous()
        self.allergies = SetupVariables().allAllergies
        self.child = []
        self.activities = []
        self.feces = []
        self.foodCategory = []
        self.food = []
        self.mood = []
        self.painLevel = []
        self.painPlacement = []
        self.sleep = []
        self.supplements = SetupVariables().allSupplements
        self.currentChildId = 0
    }
    
}
