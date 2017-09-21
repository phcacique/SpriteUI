//
//  SUIScaleConstraint.swift
//  SpriteUI
//
//  Created by Pedro Cacique on 21/09/17.
//  Copyright © 2017 Pedro Cacique. All rights reserved.
//

import Foundation
import SpriteKit

class SUIScaleConstraint:SUIConstraint{
    var id: String
    var type: SUIConstraintType = .scale
    var reference: SUIComponent
    var target: SUIComponent
    var xScale:CGFloat
    var yScale:CGFloat
    var proportional:ScaleProportional
    
    init(id:String, target:SUIComponent, reference:SUIComponent, xScale:CGFloat = 1, yScale:CGFloat = 1, proportional:ScaleProportional = .min) {
        self.id = id
        self.reference = reference
        self.target = target
        self.xScale = xScale
        self.yScale = yScale
        self.proportional = proportional
    }
    
    func apply() {
        let w = target.size.width
        let h = target.size.height
        var nw:CGFloat = reference.size.width * xScale
        var nh:CGFloat = reference.size.height * yScale
        let mi = min(reference.size.width, reference.size.height)
        let ma = max(reference.size.width, reference.size.height)
        
        
        if ( proportional == .min && mi == reference.size.width ) || ( proportional == .max && ma == reference.size.width ){
            nh = h * nw/w
        } else if ( proportional == .min && mi == reference.size.height ) || ( proportional == .max && ma == reference.size.height ){
            nw = w * nh/h
        }
        
        
//        let nh = Game.instance.screenSize.height * screenScale
//        let nw = w * nh/h
//
        target.scale(to: CGSize(width: round(nw), height: round(nh)))
    }
}

enum ScaleProportional{
    case x, y, none, min, max
}
