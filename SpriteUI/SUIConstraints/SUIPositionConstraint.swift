//
//  SUIPositionConstraint.swift
//  SpriteUI
//
//  Created by Pedro Cacique on 21/09/17.
//  Copyright © 2017 Pedro Cacique. All rights reserved.
//

import Foundation
import SpriteKit

class SUIPositionConstraint: SUIConstraint{
    var reference: SUIComponent
    var target:SUIComponent
    var id: String
    var margin: SUIMargin
    var offset:CGFloat
    var inset:Bool
    
    var type: SUIConstraintType = .position
    
    init(id:String, target:SUIComponent, reference:SUIComponent, margin:SUIMargin = .top, offset:CGFloat = 10.0, inset:Bool = false) {
        self.id = id
        self.reference = reference
        self.target = target
        self.margin = margin
        self.offset = offset
        self.inset = inset
    }
    
    func apply(){
        let refPos:CGPoint = self.reference.position
        let refSize:CGSize = self.reference.size
        let inOff:CGFloat = (inset) ? -1 : 1
        let w:CGFloat = (target.size.width/2 + self.offset) * inOff
        let h:CGFloat = (target.size.height/2 + self.offset) * inOff
        
        var newPos = target.position
        switch(self.margin){
        case .right:
            newPos.x = refPos.x + refSize.width/2 + w
        case .left:
            newPos.x = refPos.x - refSize.width/2 - w
        case .top:
            newPos.y = refPos.y + refSize.height/2 + h
        case .bottom:
            newPos.y = refPos.y - refSize.height/2 - h
        }
        
        target.position = newPos
    }
    
}

enum SUIMargin{
    case top, right, bottom, left
}
