//
//  SUIConstraintProtocol.swift
//  SpriteUI
//
//  Created by Pedro Cacique on 21/09/17.
//  Copyright © 2017 Pedro Cacique. All rights reserved.
//

import Foundation

protocol SUIConstraint{
    var id:String {get set}
    var type:SUIConstraintType {get}
    var reference:SUIComponent {get}
    var target:SUIComponent {get}
    
    func apply()
}

enum SUIConstraintType{
    case scale, position
}
