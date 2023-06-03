//
//  ViewController.swift
//  appStoreClone
//
//  Created by 3Embed on 29/05/23.
//

import UIKit

enum SectionOfApp{
    case broadTiles
    case mustHaveApps
    case vacationFotos
    case trainYourBrain
}

class MainViewController: UIViewController {
    //Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Array
    var arrOfSections : [SectionOfApp] = [.broadTiles , .mustHaveApps , .vacationFotos , .trainYourBrain]
    
    /*, .mustHaveApps , .vacationFotos , .trainYourBrain*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.backgroundColor = .black
        
        collectionView.register(UINib(nibName: "BroadTilesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BroadTilesCollectionViewCell")
        
        collectionView.register(UINib(nibName: "MustHaveAppsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MustHaveAppsCollectionViewCell")
        
        collectionView.register(UINib(nibName: "VacationFotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VacationFotosCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = configureLayout()
        
    }
    
    func configureLayout() -> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnv -> NSCollectionLayoutSection?  in
            switch self.arrOfSections[sectionIndex] {
                
            case .broadTiles:
                //item
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.5))
                                                               , subitems: [item])
                
                //section
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
                
            case .vacationFotos:
                //item
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.4)), subitems: [item])
                
                //section
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                let header = self.returnHeaderForCompostionalItem()
                section.boundarySupplementaryItems = [header]
                return section
            case .mustHaveApps , .trainYourBrain:
                //item
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
               //group
                let verticleGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3)), repeatingSubitem: item, count: 3)
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.5)), subitems: [verticleGroup])
                //section
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                let header = self.returnHeaderForCompostionalItem()
                section.boundarySupplementaryItems = [header]
                return section
                
            }
        }
    }
    
    
    func returnHeaderForCompostionalItem() -> NSCollectionLayoutBoundarySupplementaryItem{
        return .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
    }
    
}

extension MainViewController : UICollectionViewDataSource , UICollectionViewDelegate{
    
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            switch kind{
            case UICollectionView.elementKindSectionHeader :

                switch arrOfSections[indexPath.section]{
                case .broadTiles: fallthrough
                 
                case .mustHaveApps:
                    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
                    headerView.headingLabel.text  = "Must Have Apps"
                    headerView.headingLabel.textColor = .white
                    return headerView
                case .vacationFotos:

                    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
                    headerView.headingLabel.text  = "Take Great Vacation Photos"
                    headerView.headingLabel.textColor = .white
                    return headerView
                case .trainYourBrain:
                    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
                    headerView.headingLabel.text  = "Train Your Brain"
                    headerView.headingLabel.textColor = .white
                    return headerView
                }


            default:
                return UICollectionReusableView()
            }
        }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        arrOfSections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch arrOfSections[section]{
        case .broadTiles:
            return 10
        case .mustHaveApps , .trainYourBrain:
            return 21
        case .vacationFotos:
            return 10
            
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch arrOfSections[indexPath.section]{
        case .broadTiles:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BroadTilesCollectionViewCell", for: indexPath) as? BroadTilesCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
        case .mustHaveApps , .trainYourBrain :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MustHaveAppsCollectionViewCell", for: indexPath) as? MustHaveAppsCollectionViewCell else{
                return UICollectionViewCell()
            }
            return cell
        case .vacationFotos:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VacationFotosCollectionViewCell", for: indexPath) as? VacationFotosCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
            
        }
    }
    
    
    
}
