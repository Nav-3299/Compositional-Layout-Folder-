//
//  BroadTilesCollectionViewCell.swift
//  appStoreClone
//
//  Created by 3Embed on 29/05/23.
//

import UIKit

class BroadTilesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainbackgroundView: UIView!
    @IBOutlet weak var getCreativeLabel: UILabel!
    @IBOutlet weak var lightroomFotos: UILabel!
    @IBOutlet weak var proFotoEditorLabel: UILabel!
    @IBOutlet weak var broadTilesImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpViewForCell()
    }

    
    func setUpViewForCell(){
        mainbackgroundView.backgroundColor = .black
        getCreativeLabel.text = "Get Creative"
        getCreativeLabel.textColor = .blue
        lightroomFotos.text = "Lightroom Photo & Video Editor"
        lightroomFotos.textColor = .white
        proFotoEditorLabel.text = "Pro photo editor on the go"
        proFotoEditorLabel.textColor = .gray
        broadTilesImageView.backgroundColor = .red
        broadTilesImageView.layer.cornerRadius = 30
    }
}
