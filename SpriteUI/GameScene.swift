//
//  GameScene.swift
//  SpriteUI
//
//  Created by Pedro Cacique on 21/09/17.
//  Copyright © 2017 Pedro Cacique. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var style:SUIStyle?
    
    override func didMove(to view: SKView) {
        style = SUIStyle(handler:start)
    }
    
    func start(){
        let mainRef:SUIComponent = SUIComponent(id: "root", style: style!)
        mainRef.scale(to: self.size)
        
        let component:SUIComponent = SUIComponent(id: "button1", style: style!)
        
        let component2:SUIComponent = SUIComponent(id: "button2", style: style!)
        component2.scale(to: CGSize(width: 50, height: 50))
        
        component.addScaleConstraint(id: "S0", reference: mainRef, xScale: 0.2, yScale:0.2)
        component.addPositionConstraint(id: "P0", reference: mainRef, margin: .right, inset:true)
        component.addPositionConstraint(id: "P1", reference: mainRef, margin: .top, inset:true)
        
        component2.addScaleConstraint(id: "S0", reference: mainRef, xScale: 0.2, yScale:0.2)
        component2.addPositionConstraint(id: "P0", reference: component, margin: .centerX)
        component2.addPositionConstraint(id: "P1", reference: component, margin: .bottom)
        
        addChild(component)
        addChild(component2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
