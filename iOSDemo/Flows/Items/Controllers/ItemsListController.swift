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
    var onItemsDidLoad: (() -> Observable<[ItemList]>)?
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        onItemsDidLoad?()
            .bind(to: tableView.rx.items(cellIdentifier: "Cell")) { (row, item, cell) in
                // TODO: create a customTableViewCell: UITableViewCell with the model (item) field
                // and use its didSet to setup de cell's views - cell.item = item
                cell.textLabel?.text = item.name
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
