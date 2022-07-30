//
//  CharacterCell.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 29.07.2022.
//

import UIKit

// MARK: - CharacterCell
class CharacterCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func configure(with name: String) -> CharacterCell {
        nameLabel.text = name
        return self
    }
 
}
