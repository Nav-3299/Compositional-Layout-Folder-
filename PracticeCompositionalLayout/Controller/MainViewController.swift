//
//  ViewController.swift
//  PracticeCompositionalLayout
//
//  Created by 3Embed on 26/05/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    //MARK: Variables
    var arrOfImages : [UIImage] = Array(1...11).map({UIImage(named:    String($0))!})
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imagesCollectionView.register(UINib(nibName: "ImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImagesCollectionViewCell")
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
        imagesCollectionView.collectionViewLayout = configureLayout()
    }

    func configureLayout() -> UICollectionViewCompositionalLayout{
        //Item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0)))
        
        let verticleItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
        let additionalItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0)))
        
        //Group
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0)),repeatingSubitem: verticleItem , count: 2)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)),subitems: [item,verticalGroup,additionalItem])
        
        //Section
        
        let section = NSCollectionLayoutSection(group: group)
        //Layout
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}

extension MainViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrOfImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as? ImagesCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.setUpCell(image: arrOfImages[indexPath.row])
        return cell
    }

}


