//
//  Allergy.swift
//  ABDO
//
//  Created by GOD on 12/03/2017.
//  Copyright © 2017 GOD. All rights reserved.
//

import Foundation

public class ChildAllergy
{
    var id : Int
    var childId : Int
    var allergyId : Int
    var createdTime : NSDate
    var modifiedTime : NSDate

    required public init()
    {
        self.id = 0
        self.childId = 0
        self.allergyId = ""
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience public init(id : Int?, childId : Int?, allergyId : Int?, createdTime : NSDate?, modifiedTime : NSDate?)
    {
        self.init()
        self.id = id ?? 0
        self.childId = childId ?? 0
        self.allergyId = allergyId ?? ""
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}
