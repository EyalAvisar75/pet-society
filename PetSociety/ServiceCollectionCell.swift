//
//  ServiceCollectionCell.swift
//  PetSociety
//
//  Created by eyal avisar on 07/11/2020.
//

import UIKit

enum ServiceCellContent {
    case image(image:UIImage, cellNumber:Int)
    case text(text:String, cellNumber:Int)
}

class ServiceCollectionCell: UICollectionViewCell {
    var content:ServiceCellContent?
}
