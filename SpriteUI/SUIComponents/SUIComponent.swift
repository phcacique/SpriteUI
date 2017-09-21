//
//  UIComponent.swift
//  SpriteUI
//
//  Created by Pedro Cacique on 21/09/17.
//  Copyright © 2017 Pedro Cacique. All rights reserved.
//

import Foundation
import SpriteKit

class SUIComponent:SKSpriteNode, SUIProtocol{
    var id: String
    var sui_constraints: [SUIConstraint]
    var style:SUIStyle
    var margin:(top:CGFloat, right:CGFloat, bottom:CGFloat, left:CGFloat) = (top:10, right:10, bottom:10, left:10)
    var padding:(top:CGFloat, right:CGFloat, bottom:CGFloat, left:CGFloat) = (top:10, right:10, bottom:10, left:10)
    
    init(id:String, style:SUIStyle, atlasName:String = "SimpleButton", textureName:String = "button_yellow_up") {
        self.id = id
        self.style = style
        self.sui_constraints = [SUIConstraint]()
        let texture:SKTexture = SUITextureManager.instance.getTextureAtlas(atlasName).textureNamed(textureName)
        super.init(texture: texture, color: UIColor.black, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onTouchBegan() {
        
    }
    
    func onTouchEnd() {
        
    }
    
    func onTouchMoved() {
        
    }
    
    func onTouchCancelled() {
        
    }
    
    func addConstraint(_ constraint: SUIConstraint) {
        self.sui_constraints.append(constraint)
        applyConstraints()
    }
    
    func addPositionConstraint(id:String, reference:SUIComponent, margin:SUIMargin, offset:CGFloat = 0, inset:Bool = false){
        addConstraint(SUIPositionConstraint(id: id, target: self, reference: reference, margin: margin, offset: offset, inset:inset))
    }
    
    func addScaleConstraint(id:String, reference:SUIComponent, xScale:CGFloat = 1, yScale:CGFloat = 1, proportional:ScaleProportional = .min){
        addConstraint(SUIScaleConstraint(id:id, target:self, reference:reference, xScale:xScale, yScale:yScale, proportional:proportional))
    }
    
    func removeConstraint(_ constraint: SUIConstraint) {
        
    }
    
    func removeConstraint(id: String) {
        for pos in 0..<sui_constraints.count{
            if sui_constraints[pos].id == id {
                sui_constraints.remove(at: pos)
                break
            }
        }
    }
    
    func removeConstraints(type: SUIConstraintType) {
        for pos in 0..<sui_constraints.count{
            if sui_constraints[pos].type == type {
                sui_constraints.remove(at: pos)
            }
        }
    }
    
    func clearConstraints() {
        self.sui_constraints.removeAll()
    }
    
    func getConstraint(id: String) -> SUIConstraint {
        var constraint:SUIConstraint?
        for c in self.sui_constraints{
            if c.id == id {
                constraint = c
            }
        }
        return constraint!
    }
    
    func applyConstraints(){
        for c in self.sui_constraints{
            c.apply()
        }
    }
    
    func setMargin(top:CGFloat = 10, right:CGFloat = 10, bottom:CGFloat = 10, left:CGFloat = 0){
        margin.top = top
        margin.right = right
        margin.bottom = bottom
        margin.left = left
    }
    
    func setPadding(top:CGFloat = 10, right:CGFloat = 10, bottom:CGFloat = 10, left:CGFloat = 0){
        padding.top = top
        padding.right = right
        padding.bottom = bottom
        padding.left = left
    }
}
