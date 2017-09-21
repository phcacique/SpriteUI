//
//  SUIProtocol.swift
//  SpriteUI
//
//  Created by Pedro Cacique on 21/09/17.
//  Copyright © 2017 Pedro Cacique. All rights reserved.
//

import Foundation

protocol SUIProtocol{
    //common vars
    var SUIID:String {get set}
    
    func update()
    
    //touch functions
    func onTouchBegan()
    func onTouchEnd()
    func onTouchMoved()
    func onTouchCancelled()
    
}
