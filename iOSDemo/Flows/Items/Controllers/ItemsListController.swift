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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchString: BehaviorSubject<String?> = BehaviorSubject<String?>(value: nil)
    var onItemSelect: ((ItemList) -> Void)?
    var itemsList: Driver<[ItemList]>?
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        searchBar.rx
            .text.orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { !$0.isBlank }
            .bind(to: searchString)
            .disposed(by: disposeBag)
        
        itemsList?
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
