//
//  ItemDetailController.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit
import Kingfisher

final class ItemDetailController: UIViewController, ItemDetailView {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var itemList: ItemList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = itemList else { return }

        title = item.name
        let url = URL(string: item.imageURL)
        itemImageView.kf.setImage(with: url)
        taglineLabel.text = item.tagline
        descriptionLabel.text = item.description
    }
}
