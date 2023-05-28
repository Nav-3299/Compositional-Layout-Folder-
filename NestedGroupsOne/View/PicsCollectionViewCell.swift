//
//  PicsCollectionViewCell.swift
//  NestedGroupsOne
//
//  Created by 3Embed on 26/05/23.
//

import UIKit

class PicsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var picsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //Setup Cell
    
    func setupCell(image : UIImage , color : UIColor){
//        picsImageView.image = image
        picsImageView.backgroundColor = color
    }

}
