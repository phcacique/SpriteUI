//
//  SUIContainer.swift
//  SpriteUI
//
//  Created by Pedro Cacique on 22/09/17.
//  Copyright © 2017 Pedro Cacique. All rights reserved.
//

import Foundation
import SpriteKit

class SUIContainer:SUIComponent{
    
    var hAlign:SUIHAlign
    var vAlign:SUIVAlign
    var components:[SUIComponent]
    var direction:SUIDirection
    var padding:(top:CGFloat, right:CGFloat, bottom:CGFloat, left:CGFloat) = (top:20, right:20, bottom:20, left:20)
    
    init(id:String, style:SUIStyle, hAlign:SUIHAlign = .left, vAlign:SUIVAlign = .top, direction:SUIDirection = .row){
        self.vAlign = vAlign
        self.hAlign = hAlign
        self.direction = direction
        components = [SUIComponent]()
        super.init(id: id, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addComponent(_ component:SUIComponent){
        components.append(component)
        applyComponentsConstraints()
    }
    
    func applyComponentsConstraints() {
        
        var w_total:CGFloat = 0
        var h_total:CGFloat = 0
        
        //Clear constraints and add ScaleConstraints
        for i in 0..<components.count{
            components[i].clearConstraints()
            var s:CGFloat = min(size.width,size.height)
            s -= ( s==size.width ) ? ( padding.left + padding.right ) : ( padding.top + padding.bottom )
            let sc:CGFloat = ( s==size.width ) ? s/size.width : s/size.height

            components[i].addScaleConstraint(id: "S\(i)", reference: self, xScale:sc, yScale:sc)
            w_total += components[i].size.width
            h_total += components[i].size.height
        }
        
        let w = size.width - padding.left - padding.right
        let spaceX = ( w - w_total ) / ( CGFloat(components.count) + 1)
        let spaceX2 = ( w - w_total ) / 2
        let spaceX3 = ( w - w_total ) /  ( CGFloat(components.count) - 1)
        
        //let spaceY = ( size.height - h_total ) / CGFloat(components.count)
        for i in 0..<components.count{
            
            if direction == .row {
                //default for left
                var align0:SUIMargin = .left
                var align:SUIMargin = .right
                var off0:CGFloat = padding.left
                var off:CGFloat = padding.left
 
                if hAlign == .space_around{
                    off0 = spaceX
                    off = spaceX
                } else if hAlign == .center{
                    off0 = spaceX2
                } else if hAlign == .space_between{
                    off = spaceX3
                } else if hAlign == .right{
                    align0 = .right
                    align = .left
                }
                
                if i==0 {
                    components[i].addPositionConstraint(id: "P\(i)", reference: self, margin: align0, offset: off0, inset:true)
                } else {
                    components[i].addPositionConstraint(id: "P\(i)", reference: components[i-1], margin: align, offset: off)
                }
                
                if vAlign == .center{
                    components[i].addPositionConstraint(id: "P\(i)_b", reference: self, margin: .top, offset: components[i].size.height * 0.1, inset:true)
                } else if vAlign == .top{
                    components[i].addPositionConstraint(id: "P\(i)_b", reference: self, margin: .top, offset: padding.top, inset:true)
                } else if vAlign == .bottom{
                    components[i].addPositionConstraint(id: "P\(i)_b", reference: self, margin: .bottom, offset: padding.bottom, inset:true)
                }
            }
            
        }
        
        
    }
    
    
}

enum SUIHAlign{
    case left, center, right, space_around, space_between
}

enum SUIVAlign{
    case top, center, bottom, space_around, space_between
}

enum SUIDirection{
    case row, column
}
