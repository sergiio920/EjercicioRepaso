//
//  CeldaTableViewCell.swift
//  EjercicioRepaso
//
//  Created by Sergio Morón on 25/01/2024.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    @IBOutlet var imFoto: UIImageView!
    @IBOutlet var imNombre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
