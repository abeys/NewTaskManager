//
//  ViewController.swift
//  NewTaskManager
//
//  Created by 阿部良和 on 2019/04/28.
//  Copyright © 2019年 タスクマネージャー. All rights reserved.
//

import UIKit
import SwiftReorder

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, TableViewReorderDelegate {
    
    var data = [1,2,3,4,5,6,7]
    @IBOutlet weak var tableview: UITableView!
    
    func tableView(_ tableView: UITableView, reorderRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = data[sourceIndexPath.row]
        data.remove(at: sourceIndexPath.row)
        data.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let spacer = tableView.reorder.spacerCell(for: indexPath) {
            return spacer
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "taskcell", for: indexPath) as? TaskCell {
            cell.taskId.text = String(data[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "normal") { (action, view, completionHandler) in
                                            // 何らかのアクション（処理）を実行
                                            
                                            // 処理の実行結果に関わらず completionHandler を呼ぶのがポイント
                                            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.reorder.delegate = self
    }


}

