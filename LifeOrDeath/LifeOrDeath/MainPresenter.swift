//
//  MainPresenter.swift
//  LifeOrDeath
//
//  Created by Databriz on 06/08/2024.
//

import Foundation
import UIKit

class MainPresenter{
    
    var view: MainView? = nil
    private var listGame: [TypeCell] = []
    
    
    func countCell() -> Int{
        return listGame.count
    }
    
    func addItemToList(){
        let rowValue = Int(arc4random_uniform(2))
        guard let cell = TypeCell(rawValue: rowValue) else { return}
        print(rowValue)
        listGame.append(cell)
        
        if cell == .life{
            checkStartLife()
        }else{
            checkDeath()
        }
        view?.refrashTable()
    }
    
    func configure(cell: RoundCell, for indexPath: IndexPath){
        
        let item = listGame[indexPath.row]
        
        let describing = item.describing
        
        cell.title.text = describing[0]
        cell.comment.text = describing[1]
        cell.icone.image = UIImage(named: describing[2])
        
    }
    
    func checkStartLife(){
        let count = listGame.count
        
        guard count > 2 else { return }
        
        let lastThreeElements = listGame.suffix(3)
        
        if lastThreeElements.allSatisfy({ $0 == .life }){
            listGame.append(.lifeStart)
        }
    }
    
    
    func checkDeath(){
        let count = listGame.count
        
        guard count > 2 else { return }
        
        let lastThreeElements = listGame.suffix(3)
        
        if lastThreeElements.allSatisfy({ $0 == .death }){
            if let index = listGame.lastIndex(where: {$0.rawValue == 2}){
                listGame.remove(at: index)
            }
        }
    }
}
