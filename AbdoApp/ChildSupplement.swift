//
//  SupplementType.swift
//  ABDO
//
//  Created by GOD on 12/03/2017.
//  Copyright © 2017 GOD. All rights reserved.
//

import Foundation

public class ChildSupplement
{
    var id : Int
    var childId : Int
    var supplementId : Int
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    public required init() {
        self.id = 0
        self.childId = 0
        self.supplementId = 0
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    public convenience init(id : Int?, childId : Int?, supplementId : Int?, createdTime : NSDate?, modifiedTime : NSDate?) {
        self.init()
        self.id = id ?? 0
        self.childId = childId ?? 0
        self.supplementId = supplementId ?? 0
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
    
}
