//
//  Medicin.swift
//  ABDO
//
//  Created by GOD on 12/03/2017.
//  Copyright © 2017 GOD. All rights reserved.
//

import Foundation

public class ChildMedicin
{
    var id : Int
    var childId : Int
    var type : String
    var dosage : String
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init()
    {
        self.id = 0
        self.childId = 0
        self.type = ""
        self.dosage = ""
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience public init(id : Int?, childId : Int?, type : String?, dosage : String?, createdTime: NSDate?, modifiedTime: NSDate?)
    {
        self.init()
        self.id = id!
        self.childId = childId!
        self.type = type!
        self.dosage = dosage!
        self.createdTime = createdTime!
        self.modifiedTime = modifiedTime!
    }
}
