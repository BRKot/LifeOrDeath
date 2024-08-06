//
//  RoundCell.swift
//  LifeOrDeath
//
//  Created by Databriz on 06/08/2024.
//

import Foundation
import UIKit

class RoundCell: UITableViewCell{
    
    @IBOutlet var title: UILabel!
    
    @IBOutlet var backGroundView: UIView!
    @IBOutlet var comment: UILabel!
    
    @IBOutlet var icone: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backGroundView.layer.cornerRadius = 7
    }
}
