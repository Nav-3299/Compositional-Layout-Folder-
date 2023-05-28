//
//  ViewController.swift
//  NestedGroupsQues5
//
//  Created by 3Embed on 26/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    
    let colorArray = [UIColor.red, UIColor.green, UIColor.blue, UIColor.black , UIColor.gray , UIColor.brown , UIColor.cyan , UIColor.magenta , UIColor.purple , UIColor.link , UIColor.orange , UIColor.yellow , UIColor.darkText,UIColor.red, UIColor.green, UIColor.blue, UIColor.black , UIColor.gray , UIColor.brown , UIColor.cyan , UIColor.magenta , UIColor.purple , UIColor.link , UIColor.orange , UIColor.yellow , UIColor.darkText]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorsCollectionView.register(UINib(nibName: "ColorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColorsCollectionViewCell")
        colorsCollectionView.dataSource = self
        colorsCollectionView.delegate = self
        colorsCollectionView.collectionViewLayout = configureLayout()
        
    }
    
    func configureLayout() -> UICollectionViewCompositionalLayout{
        //item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
        
        
        let leftHorizontalGroupsItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
        
        let leftRepeatingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
        
        let itemForGroup1H = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
        
        let itemForGroup2V = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
        //groups
        
        let leftHorizontalgroupsVerticleGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)), repeatingSubitem: leftRepeatingItem, count: 2)
        
        
        let leftMainHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [leftHorizontalGroupsItem , leftHorizontalgroupsVerticleGroup])
        
        
        let group1H = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), repeatingSubitem: itemForGroup1H, count: 2)
        
        let group2V = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), repeatingSubitem: itemForGroup2V , count: 2)
        
        let rhsVerticleGroup2 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)), subitems: [group1H , group2V])
        
        
        let rhsVerticleGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)), repeatingSubitem: item , count: 2)
        
        let rightMainHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [rhsVerticleGroup1 , rhsVerticleGroup2])
        
        
        let verticleGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)), subitems: [leftMainHorizontalGroup , item])
        
        let verticleGroup2 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)), subitems: [rightMainHorizontalGroup , item])
        
        let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems:[verticleGroup1 , verticleGroup2])
        //sections
        let section = NSCollectionLayoutSection(group: mainGroup)

        //layout
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCollectionViewCell", for: indexPath) as? ColorsCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.setUPCell(color: colorArray[indexPath.row])
        return cell
    }
    
    
}
