//
//  ViewController.swift
//  MultipleSections
//
//  Created by Navpreet Kaur on 27/05/23.
//

import UIKit

enum SectionsOfCell {
    case firstSection
    case second
}


class ViewController: UIViewController {

    let arrOfSections : [SectionsOfCell] = [.firstSection , .second]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "MULTIPLE SECTIONS COMPOSITIONAL LAYOUT"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.dataSource = self
        collectionView.collectionViewLayout = configureLayout()
        
    }

    func configureLayout() -> UICollectionViewCompositionalLayout{
        
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnv -> NSCollectionLayoutSection? in
            
            switch self.arrOfSections[sectionIndex]{
                
            case .firstSection:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                item.contentInsets = .init(top: 0, leading: 1, bottom: 0, trailing: 0)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(100)), subitems: [item])
                group.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
                let header = self.returnHeaderForCompostionalItem()
                section.boundarySupplementaryItems = [header]
                
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                
                return section
            case .second:
                
                let item = NSCollectionLayoutItem(layoutSize:   NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(300), heightDimension: .absolute(300)), subitems: [item])
                group.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuous
                
                let header = self.returnHeaderForCompostionalItem()
                header.pinToVisibleBounds = true
                section.boundarySupplementaryItems = [header]
                return section

            }
            
        }
        
    }
    
    func returnHeaderForCompostionalItem() -> NSCollectionLayoutBoundarySupplementaryItem{
        return .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    

}



extension ViewController : UICollectionViewDataSource , UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            
            switch arrOfSections[indexPath.section]{
            case .firstSection:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
                headerView.label.text = "FirstView"
                return headerView
            case .second:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
                headerView.label.text = "SecondView"
                return headerView
          
            }
        default :
            return UICollectionReusableView()
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        arrOfSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch arrOfSections[section]{
            
        case .firstSection:
            return 50
        case .second:
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch arrOfSections[indexPath.section]{
        case .firstSection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImgClass else {
                return UICollectionViewCell()
            }
            cell.setupCell()
            return cell
        case .second:
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImgClass else {
                return UICollectionViewCell()
            }
            
            cell.secondSetUPCell()
            return cell
        }
    }
    
}

class ImgClass : UICollectionViewCell{
    
    @IBOutlet weak var view: UIView!
    
    override func prepareForReuse() {
        setupCell()
    }
    func setupCell(){
        view.backgroundColor = .red
        
        view.layer.cornerRadius = view.frame.width / 2
        view.clipsToBounds = true
    }
    
    func secondSetUPCell(){
        view.backgroundColor = .blue
    }
}

