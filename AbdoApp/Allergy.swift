//
//  Allergy.swift
//  ABDO
//
//  Created by GOD on 12/03/2017.
//  Copyright © 2017 GOD. All rights reserved.
//

import Foundation

class Allergy
{
    var createTimestamp: NSDate
    var type: String
    
    init(createTimestamp: NSDate?, type: String?)
    {
        self.createTimestamp = createTimestamp ?? NSDate.minimumDate()
        self.type = type ?? ""
    }
}
