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
        component.scale(to: CGSize(width: 100, height: 100))
        
        let component2:SUIComponent = SUIComponent(id: "button2", style: style!)
        component2.scale(to: CGSize(width: 50, height: 50))
        
        component.addPositionConstraint(id: "C0", reference: mainRef, margin: .left, offset: 0, inset:true)
        
        component2.addPositionConstraint(id: "C1", reference: component, margin: .bottom, offset: 0)
        
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
