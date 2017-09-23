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
        
        let bar:SUIContainer = SUIContainer(id: "topbar", style:style!, hAlign: .center, vAlign: .center)
        bar.addScaleConstraint(id: "S0", reference: mainRef, xScale: 1, yScale: 0.1, proportional: .none)
        bar.addPositionConstraint(id: "P0", reference: mainRef, margin: .top, offset: 0, inset: true)
        
        let button1:SUIComponent = SUIComponent(id: "b1", style: style!)
        bar.addComponent(button1)
        
        let button2:SUIComponent = SUIComponent(id: "b2", style: style!)
        bar.addComponent(button2)
        
        let button3:SUIComponent = SUIComponent(id: "b3", style: style!)
        bar.addComponent(button3)
        
        
        addChild(button1)
        addChild(button2)
        addChild(button3)
        
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
