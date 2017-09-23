//
//  SUIStyle.swift
//  SpriteUI
//
//  Created by Pedro Cacique on 21/09/17.
//  Copyright © 2017 Pedro Cacique. All rights reserved.
//

import Foundation
import SpriteKit

class SUIStyle{
    
    //Sprite Atlas names
    var simpleButton:String
    var handler:() -> Void
    
    init(simpleButton:String = "SimpleButton", handler: @escaping () -> Void = {}){
        self.simpleButton = simpleButton
        self.handler = handler
        SUITextureManager.instance.addTextureAtlas(name: self.simpleButton)
        SUITextureManager.instance.preloadAssets(onPreload)
    }
    
    func onPreload(){
        print("Style textures preloaded!")
        handler()
    }
    
}
