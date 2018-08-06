//
//  ItemDetailController.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

final class ItemDetailController: UIViewController, ItemDetailView {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var itemList: ItemList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = itemList?.name
    }
}
