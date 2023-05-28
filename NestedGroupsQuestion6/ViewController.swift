//
//  ViewController.swift
//  NestedGroupsQuestion6
//
//  Created by 3Embed on 26/05/23.
//

import UIKit

class ViewController: UIViewController {
    let colorArray = [UIColor.red, UIColor.green, UIColor.blue, UIColor.black , UIColor.gray , UIColor.brown , UIColor.cyan , UIColor.magenta , UIColor.purple , UIColor.link , UIColor.orange , UIColor.yellow , UIColor.darkText,UIColor.red, UIColor.green, UIColor.blue, UIColor.black , UIColor.gray , UIColor.brown , UIColor.cyan , UIColor.magenta , UIColor.purple , UIColor.link , UIColor.orange , UIColor.yellow , UIColor.darkText]
    
    
    @IBOutlet weak var colorsCollectionVire: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorsCollectionVire.register(UINib(nibName: "ColorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColorsCollectionViewCell")
        colorsCollectionVire.dataSource = self
        colorsCollectionVire.delegate = self
        colorsCollectionVire.collectionViewLayout = configureLayout()
    }

    func configureLayout() -> UICollectionViewCompositionalLayout{
        //items
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
        
        let itemTopBottom = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
        
        let itemMiddle = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0)))
        //groups
        
        let GroupTopBottom = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3)), repeatingSubitem: itemTopBottom , count: 2)
        
        let groupMiddle = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3)), repeatingSubitem: itemMiddle , count : 3)
        
        let subVerticleGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)), subitems: [GroupTopBottom , groupMiddle , GroupTopBottom ])
        
        
        let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [item , subVerticleGroup])
        //sections
        
        let section = NSCollectionLayoutSection(group: mainGroup)
        //layout
        return UICollectionViewCompositionalLayout(section: section)
    }

}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCollectionViewCell", for: indexPath) as? ColorsCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.setUpCell(color: colorArray[indexPath.row])
        return cell
    }
    
    
}
