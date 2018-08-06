//
//  ItemsListController.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit
import Moya
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
