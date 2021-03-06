//
//  Supplement.swift
//  ABDO
//
//  Created by GOD on 12/03/2017.
//  Copyright © 2017 GOD. All rights reserved.
//

import Foundation

public class Supplement
{
    var id : Int
    var type : String
    var createdTime : NSDate
    var modifiedTime : NSDate
    
    required public init()
    {
        self.id = 0
        self.type = ""
        self.createdTime = NSDate()
        self.modifiedTime = NSDate()
    }
    
    convenience public init(id : Int?, type : String?, createdTime : NSDate?, modifiedTime : NSDate?)
    {
        self.init()
        self.id = id ?? 0
        self.type = type ?? ""
        self.createdTime = createdTime ?? NSDate()
        self.modifiedTime = modifiedTime ?? NSDate()
    }
}
