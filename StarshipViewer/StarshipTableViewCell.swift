//
//  StarshipTableViewCell.swift
//  StarshipViewer
//
//  Created by Mazlow Cohen on 4/9/18.
//  Copyright © 2018 Mazlow Cohen. All rights reserved.
//

import UIKit

class StarshipTableViewCell: UITableViewCell {

    @IBOutlet weak var starshipImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!

    func configure(starship:Starship){
        
        nameLabel.text = starship.name
        detailLabel.text = "Cost: \(starship.costInCredits)"
        
        starshipImageView.image = UIImage(named: starship.name) ?? UIImage(named: "placeholder.png")
        
    }
    
}
