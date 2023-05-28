//
//  ImgaesCollectionViewCell.swift
//  PracticeCompositionalLayout
//
//  Created by 3Embed on 26/05/23.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dogsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(image : UIImage){
        dogsImageView.image = image
    }
}
