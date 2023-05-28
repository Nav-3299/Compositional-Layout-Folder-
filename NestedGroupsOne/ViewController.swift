//
//  ViewController.swift
//  NestedGroupsOne
//
//  Created by 3Embed on 26/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    
    //Array of Images
    
    let arrOfImages = Array(1...20).map({UIImage(named: String($0))!})
    
    let colorArray = [UIColor.red, UIColor.green, UIColor.blue, UIColor.black , UIColor.gray , UIColor.brown , UIColor.cyan , UIColor.magenta , UIColor.purple , UIColor.link , UIColor.orange , UIColor.yellow , UIColor.darkText]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagesCollectionView.register(UINib(nibName: "PicsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PicsCollectionViewCell")
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imagesCollectionView.collectionViewLayout = configureLayout()
        
        
    }
    
    func configureLayout() -> UICollectionViewCompositionalLayout{
        //items
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
        
        let subGroupOneitem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
        
        let verticleSubGroupsItems = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
        //groups
        
        let horizontalSubGroupOne = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), repeatingSubitem: subGroupOneitem, count: 2)
 
        
        let verticleSubGroupOne = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)),repeatingSubitem: verticleSubGroupsItems , count: 2)
        
        let verticleGroupOne = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)), subitems: [item , horizontalSubGroupOne])
        
        let verticleGroupTwo = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)), subitems: [verticleSubGroupOne , item])
        
        let maingroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [verticleGroupOne , verticleGroupTwo] )
        //sections
        let section = NSCollectionLayoutSection(group: maingroup)
        //layout
        
       return UICollectionViewCompositionalLayout(section: section)
    }

}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        arrOfImages.count
        colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PicsCollectionViewCell", for: indexPath) as? PicsCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        cell.setupCell(image: arrOfImages[indexPath.row] , color: colorArray[indexPath.row])
        return cell
    }
    
    
}
