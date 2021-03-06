//
//  LadderStep.swift
//  LadderGame
//
//  Created by 이진영 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    private(set) var component = false
    
    mutating func changeComponent(component: Bool) {
        self.component = component
    }
    
    func convertLadderStep() -> String {
        if component {
            return LadderComponent.rung.rawValue
        }
        
        return LadderComponent.empty.rawValue
    }
}
