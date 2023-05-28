//
//  ColorsCollectionViewCell.swift
//  NestedGroupsQues5
//
//  Created by 3Embed on 26/05/23.
//

import UIKit

class ColorsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var colorsView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUPCell(color : UIColor){
        colorsView.backgroundColor = color
    }
}
