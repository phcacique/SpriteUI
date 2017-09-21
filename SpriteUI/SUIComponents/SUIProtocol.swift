//
//  SUIProtocol.swift
//  SpriteUI
//
//  Created by Pedro Cacique on 21/09/17.
//  Copyright © 2017 Pedro Cacique. All rights reserved.
//

import Foundation
import SpriteKit

protocol SUIProtocol{
    //common vars
    var id:String {get set}
    var sui_constraints:[SUIConstraint] {get}
    var style:SUIStyle {get}
    
    //touch functions
    func onTouchBegan()
    func onTouchEnd()
    func onTouchMoved()
    func onTouchCancelled()
    
    //constraints functions
    func addConstraint(_ constraint:SUIConstraint)
    func removeConstraint(_ constraint:SUIConstraint)
    func removeConstraint(id:String)
    func removeConstraints(type:SUIConstraintType)
    func clearConstraints()
    func getConstraint(id:String) -> SUIConstraint
    func applyConstraints()
    
}
