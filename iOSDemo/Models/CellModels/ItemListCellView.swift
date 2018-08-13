//
//  ItemListCellView.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/8/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

final class ItemListCellView: UITableViewCell {
    
    var item: ItemList? {
        didSet {
            guard let item = item else { return }
            textLabel?.text = item.name
        }
    }
}
