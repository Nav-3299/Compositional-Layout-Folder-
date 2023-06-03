//
//  MustHaveAppsCollectionViewCell.swift
//  appStoreClone
//
//  Created by 3Embed on 29/05/23.
//

import UIKit

class MustHaveAppsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainBackgroundView: UIView!
    
    @IBOutlet weak var appImageView: UIImageView!
    
    @IBOutlet weak var appNameLabel: UILabel!
    
    @IBOutlet weak var appDescriptionLabel: UILabel!
    
    @IBOutlet weak var getButton: UIButton!
    
    @IBOutlet weak var labelBelowGetButton: UILabel!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setUPCellView()
    }
    
    func setUPCellView(){
        mainBackgroundView.backgroundColor = .black
//        widthConstraint.constant =
        appImageView.backgroundColor = .red
        getButton.setTitle("Get", for: .normal)
        
        labelBelowGetButton.text = "In-App Purchases"
        labelBelowGetButton.textColor = .gray
        appNameLabel.text = "Unfold: Reels & Story Editor"
        appNameLabel.textColor = .white
        appNameLabel.numberOfLines = 0
        appDescriptionLabel.text = "Insta Photo & Video Templates"
        appDescriptionLabel.textColor = .gray
        appDescriptionLabel.numberOfLines = 0
        appImageView.layer.cornerRadius = 20
        
        
    }

}
