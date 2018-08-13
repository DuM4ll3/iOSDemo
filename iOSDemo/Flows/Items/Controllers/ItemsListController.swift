//
//  ItemsListController.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class ItemsListController: UIViewController, ItemsListView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var onItemSelect: ((ItemList) -> Void)?
    var onItemsDidLoad: (() -> Driver<[ItemList]>)?
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        onItemsDidLoad?()
            .drive(tableView.rx.items(cellIdentifier: "Cell", cellType: ItemListCellView.self)) { (row, item, cell) in
                cell.item = item
            }
            .disposed(by: disposeBag)

        tableView.rx
            .modelSelected(ItemList.self)
            .subscribe { [onItemSelect] (selected) in
                if let item = selected.element { onItemSelect?(item) }
                // deselect the row here
            }.disposed(by: disposeBag)
    }
}
