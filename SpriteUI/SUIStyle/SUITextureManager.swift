//
//  SUITextureManager.swift
//  SpriteUI
//
//  Created by Pedro Cacique on 21/09/17.
//  Copyright © 2017 Pedro Cacique. All rights reserved.
//

import Foundation
import SpriteKit

public class SUITextureManager{
    static let instance = SUITextureManager()
    
    var atlas:[(name:String, atlas:SKTextureAtlas)]
    
    private init(){
        atlas = [(name:String, atlas:SKTextureAtlas)]()
    }
    
    func addTextureAtlas(name:String){
        atlas.append(  (name:name, atlas:SKTextureAtlas(named: name))   )
    }
    
    func preloadAssets(_ handler: @escaping () -> Void) {
        var atlasmap:[SKTextureAtlas] = [SKTextureAtlas]()
        for a in self.atlas{
            atlasmap.append(a.atlas)
        }
        
        SKTextureAtlas.preloadTextureAtlases(atlasmap, withCompletionHandler: handler)
    }
    
    func getTextureAtlasFrames(_ name:String) -> [SKTexture]{
        
        var textureAtlas:SKTextureAtlas = SKTextureAtlas()
        for t in self.atlas{
            if t.name == name{
                textureAtlas = t.atlas
            }
        }
        var frames = [SKTexture]()
        let names = textureAtlas.textureNames.sorted()
        for i in 0...names.count-1{
            frames.append(textureAtlas.textureNamed(names[i]))
            textureAtlas.textureNamed(names[i]).filteringMode = .nearest
        }
        return frames
    }
    
}


