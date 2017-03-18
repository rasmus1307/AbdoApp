import Foundation
import UIKit

/**
 This struct defines the keys used to save the data container singleton's properties to NSUserDefaults.
 This is the "Swift way" to define string constants.
 */
struct DefaultsKeys
{
    static let currentChildId = "currentChildId"
    static let allergies = "allergies"
    static let activities = "activities"
    static let feces = "feces"
    static let foodCategory = "foodCategory"
    static let food = "food"
    static let mood = "mood"
    static let painLevel = "painLevel"
    static let painPlacement = "painPlacement"
    static let sleep = "sleep"
    static let supplements = "supplements"
    static let anonymous = "anonymous"
    static let child = "child"
}


/**
 :Class:   DataContainerSingleton
 This class is used to save app state data and share it between classes.
 It observes the system UIApplicationDidEnterBackgroundNotification and saves its properties to NSUserDefaults before
 entering the background.
 Use the syntax `DataContainerSingleton.sharedDataContainer` to reference the shared data container singleton
 */

class DataContainerSingleton
{
    static let sharedDataContainer = DataContainerSingleton()
    
    //------------------------------------------------------------
    //Add properties here that you want to share accross your app
    
    // Current child selected
    var currentChildId : Int?
    var allergies : [Allergy]?
    var activities : [Activity]?
    var feces : [Feces]?
    var foodCategory : [FoodCategory]?
    var food : [Food]?
    var mood : [Mood]?
    var painLevel : [PainLevel]?
    var painPlacement : [PainPlacement]?
    var sleep : [Sleep]?
    var supplements : [Supplement]?
    // Smart phone registration
    var anonymous : Anonymous?
    // Child objects containing all information about one or more children
    var child : [Child]?
    
    
    //------------------------------------------------------------
    
    var goToBackgroundObserver: AnyObject?
    
    init()
    {
        let defaults = UserDefaults.standard
        
        //-----------------------------------------------------------------------------
        //This code reads the singleton's properties from NSUserDefaults.
        //edit this code to load your custom properties
        currentChildId = defaults.object(forKey: DefaultsKeys.currentChildId) as! Int?
        allergies = defaults.object(forKey: DefaultsKeys.currentChildId) as! [Allergy]?
        activities = defaults.object(forKey: DefaultsKeys.activities) as! [Activity]?
        feces = defaults.object(forKey: DefaultsKeys.feces) as! [Feces]?
        foodCategory = defaults.object(forKey: DefaultsKeys.foodCategory) as! [FoodCategory]?
        food = defaults.object(forKey: DefaultsKeys.food) as! [Food]?
        mood = defaults.object(forKey: DefaultsKeys.mood) as! [Mood]?
        painLevel = defaults.object(forKey: DefaultsKeys.painLevel) as! [PainLevel]?
        painPlacement = defaults.object(forKey: DefaultsKeys.painPlacement) as! [PainPlacement]?
        sleep = defaults.object(forKey: DefaultsKeys.sleep) as! [Sleep]?
        supplements = defaults.object(forKey: DefaultsKeys.supplements) as! [Supplement]?
        anonymous = defaults.object(forKey: DefaultsKeys.anonymous) as! Anonymous?
        child = defaults.object(forKey: DefaultsKeys.child) as! [Child]?

        //-----------------------------------------------------------------------------
        //Add an obsever for the UIApplicationDidEnterBackgroundNotification.
        //When the app goes to the background, the code block saves our properties to NSUserDefaults.
        goToBackgroundObserver = NotificationCenter.default.addObserver(
            forName: NSNotification.Name.UIApplicationDidEnterBackground,
            object: nil,
            queue: nil)
        {
            (note: Notification) -> Void in
            let defaults = UserDefaults.standard
            
            //-----------------------------------------------------------------------------
            //This code saves the singleton's properties to NSUserDefaults.
            //edit this code to save your custom properties
            defaults.set( self.currentChildId, forKey: DefaultsKeys.currentChildId)
            defaults.set( self.allergies, forKey: DefaultsKeys.allergies)
            defaults.set( self.activities, forKey: DefaultsKeys.activities)
            defaults.set( self.feces, forKey: DefaultsKeys.feces)
            defaults.set( self.foodCategory, forKey: DefaultsKeys.foodCategory)
            defaults.set( self.food, forKey: DefaultsKeys.food)
            defaults.set( self.mood, forKey: DefaultsKeys.mood)
            defaults.set( self.painLevel, forKey: DefaultsKeys.painLevel)
            defaults.set( self.painPlacement, forKey: DefaultsKeys.painPlacement)
            defaults.set( self.sleep, forKey: DefaultsKeys.sleep)
            defaults.set( self.supplements, forKey: DefaultsKeys.supplements)
            defaults.set( self.anonymous, forKey: DefaultsKeys.anonymous)
            defaults.set( self.child, forKey: DefaultsKeys.child)
            
            //-----------------------------------------------------------------------------
            //Tell NSUserDefaults to save to disk now.
            defaults.synchronize()
        }
    }
}
