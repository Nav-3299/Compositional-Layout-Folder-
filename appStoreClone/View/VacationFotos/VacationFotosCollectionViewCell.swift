//
//  VacationFotosCollectionViewCell.swift
//  appStoreClone
//
//  Created by 3Embed on 29/05/23.
//

import UIKit

class VacationFotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var appPictureImageView: UIImageView!

    @IBOutlet weak var upperLabel: UILabel!
    
    @IBOutlet weak var lowerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupDefaultUI()
    }

    
    func setupDefaultUI(){
        mainBackgroundView.backgroundColor = .black
        appPictureImageView.backgroundColor = .red
        upperLabel.textColor = .white
        lowerLabel.textColor = .gray
        upperLabel.text = "Afterlight - Photo Editor"
        lowerLabel.text = "Real Film Filters & Effects"
        appPictureImageView.layer.cornerRadius = 30
    }
}
