//
//  Array+Identifiable.swift
//  MemorizeGame
//
//  Created by Parth Adroja on 14/10/20.
//  Copyright © 2020 Mobiquity. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    
    var only: Element? {
        count == 1 ? first : nil
    }
}
