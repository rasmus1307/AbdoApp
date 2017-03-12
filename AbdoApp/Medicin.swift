//
//  Medicin.swift
//  ABDO
//
//  Created by GOD on 12/03/2017.
//  Copyright © 2017 GOD. All rights reserved.
//

import Foundation

class Medicin
{
    var createTimestamp: NSDate
    var type: String
    var dosage: String
    
    init(createTimestamp: NSDate?, type: String?, dosage: String?)
    {
        self.createTimestamp = createTimestamp ?? NSDate.minimumDate()
        self.type = type ?? ""
        self.dosage = dosage ?? ""
    }
}
