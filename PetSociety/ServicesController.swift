//
//  ServicesController.swift
//  PetSociety
//
//  Created by eyal avisar on 07/11/2020.
//

import UIKit

//MARK: extension UICollectionViewDelegateFlowLayout
extension ServicesController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 6, height: view.frame.height / 5 - 10)
    }

    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 5.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
            collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5.0
    }
}

//MARK: class ServicesController
class ServicesController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var servicesCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        servicesCollection.dataSource = self
        servicesCollection.delegate = self
    }
    
    //MARK: collectionView dataSource, delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serviceCell", for: indexPath) as! ServiceCollectionCell
        
        if indexPath.row % 4 > 0 && indexPath.row % 4 < 3 {
            cell.backgroundColor = .yellow
//            cell.content = ServiceCellContent.image(image: <#T##UIImage#>, cellNumber: indexPath.row)
        }
        else {
            cell.backgroundColor = .green
            cell.content = ServiceCellContent.text(text: serviceModel[indexPath.row / 2], cellNumber: indexPath.row)
        }
        
        if let content = cell.content {
            serviceContent.append(cell.content!)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let searchVC = storyboard?.instantiateViewController(withIdentifier: "search") else { return }
        
        navigationController?.pushViewController(searchVC, animated: true)
    }
}
