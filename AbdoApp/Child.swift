//
//  Child.swift
//  ABDO
//
//  Created by GOD on 12/03/2017.
//  Copyright © 2017 GOD. All rights reserved.
//

import Foundation

public class Child
{
    var id: String
    var allergies: [Allergy]
    var childInfo: ChildInfo
    var medicins: [Medicin]
    var registrations: [Registration]
    var shareCode: ShareCode
    var supplements: [Supplement]
    
    required public init() {
        self.id = ""
        self.allergies = []
        self.childInfo = ChildInfo()
        self.medicins = []
        self.registrations = []
        self.shareCode = ShareCode()
        self.supplements = []
    }
    
}
