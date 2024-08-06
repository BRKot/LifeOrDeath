//
//  TypeCell.swift
//  LifeOrDeath
//
//  Created by Databriz on 06/08/2024.
//

import Foundation

enum TypeCell: Int{
    case life = 1
    case death = 0
    case lifeStart = 2
    
    
    var describing: [String] {
        switch self{
        case .life:
            return ["Живая", "и шевелится!", "life-icone"]
        case .death:
            return ["Мертвая", "или прикидывается", "death-icone"]
        case .lifeStart:
             return ["Жизнь","Ку-ку!", "life-start-icone"]
        }
    }
}
