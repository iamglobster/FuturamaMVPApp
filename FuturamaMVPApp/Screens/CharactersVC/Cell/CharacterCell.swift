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
    @IBOutlet weak var characterImageView: UIImageView!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI ()
    }
    
    // MARK: - Methods
    func configure(with model: Character) -> CharacterCell {
        nameLabel.text = model.name
        
        guard let imageURL = URL(string: model.picURL ?? "") else { return self}
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error = error { print(error); return }
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.characterImageView.image = image
                }
            }
        }.resume()
        return self
    }
}

// MARK: - Private Extension
private extension CharacterCell {
    func setupUI () {
        self.selectionStyle = .none
        characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
        characterImageView.contentMode = UIView.ContentMode.scaleToFill
    }
}
