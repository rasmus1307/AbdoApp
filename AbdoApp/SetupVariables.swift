//
//  SetupVariables.swift
//  AbdoApp
//
//  Created by GOD on 15/03/2017.
//  Copyright © 2017 GOD. All rights reserved.
//

import Foundation

public class SetupVariables
{
    var allAllergies : [Allergy]
    var allSupplements : [Supplement]
    
    init(){
        self.allAllergies = []
        self.allSupplements = []
        addAllergies()
        addSupplements()
    }
    
    private func addAllergies()
    {
        self.allAllergies.append(Allergy(id : 1, type : "Pollen", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 2, type : "Laktose", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 3, type : "Støv", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 4, type : "Græs", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 5, type : "Ananas", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 6, type : "Latex", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 7, type : "Uld", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 8, type : "Hår", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 9, type : "Hund", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 10, type : "Kat", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 11, type : "Hest", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 12, type : "Birk", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allAllergies.append(Allergy(id : 13, type : "Lakrids", createdTime : NSDate(), modifiedTime : NSDate()))
    }
    
    private func addSupplements()
    {
        self.allSupplements.append(Supplement(id : 1, type : "A-vitamin", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allSupplements.append(Supplement(id : 2, type : "B-vitamin", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allSupplements.append(Supplement(id : 3, type : "C-vitamin", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allSupplements.append(Supplement(id : 4, type : "D-vitamin", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allSupplements.append(Supplement(id : 5, type : "E-vitamin", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allSupplements.append(Supplement(id : 6, type : "K-vitamin", createdTime : NSDate(), modifiedTime : NSDate()))
        self.allSupplements.append(Supplement(id : 7, type : "Kalk", createdTime : NSDate(), modifiedTime : NSDate()))
    }
}
