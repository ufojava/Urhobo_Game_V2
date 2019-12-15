//
//  WordList.swift
//  Urhobo_Game_V2
//
//  Created by Ufuoma Okoro on 14/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import CoreData

//Create the class

class WordList: NSManagedObject {
    
    @NSManaged var englishName: String
    @NSManaged var urhoboName:  String
    
    
}
