//
//  HistoryVC.swift
//  Heya
//
//  Created by TrungNV on 10/7/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class HistoryVC: BaseTabViewController {

    @IBOutlet weak var historyTableView: UITableView!
    
    var lstHistory = HistoryVC.initHistory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    // MARK: - Functions
    func initUI(){
        historyTableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryTableViewCell")
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.estimatedRowHeight = 200
        historyTableView.rowHeight = UITableView.automaticDimension
    }
}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell
        cell?.configCell(lstHistory[indexPath.row])
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = lstHistory.count - 1
        if indexPath.row == lastElement {
            lstHistory.append(contentsOf: HistoryVC.initHistory())
            historyTableView.reloadData()
        }
    }
}

extension HistoryVC{
    static func initHistory() -> [HistoryBO]{
        return [HistoryBO(title: "Đi chơi Cửa Lò", time: "12/10/2019", location: "Cửa Lò, Nghệ An", isOk: true),
        HistoryBO(title: "Vi Vu Hồ Hoàn Kiếm", time: "10/10/2019", location: "Hồ Hoàn Kiếm, Hà Nội, Việt Nam", isOk: true),
        HistoryBO(title: "Có ai đi chơi cùng không", time: "12/10/2019", location: "Cửa Lò, Nghệ An", isOk: false),
        HistoryBO(title: "Lại được đi chơi hả....???", time: "12/10/2019", location: "Cửa Lò, Nghệ An", isOk: false),
        HistoryBO(title: "TÌm bạn đi chơi Tam đảo", time: "12/10/2019", location: "Cửa Lò, Nghệ An", isOk: false),
        HistoryBO(title: "Tìm bạn Việt Nam dẫn mình đi chơi.", time: "12/10/2019", location: "Cửa Lò, Nghệ An", isOk: false),
        HistoryBO(title: "Đi chơi Cửa Lò", time: "12/10/2019", location: "Cửa Lò, Nghệ An", isOk: false),
        HistoryBO(title: "Đi chơi Cửa Lò", time: "12/10/2019", location: "Cửa Lò, Nghệ An", isOk: false),
        HistoryBO(title: "Đi chơi Cửa Lò", time: "12/10/2019", location: "Cửa Lò, Nghệ An", isOk: false),
        HistoryBO(title: "Đi chơi Cửa Lò", time: "12/10/2019", location: "Cửa Lò, Nghệ An", isOk: false),
        HistoryBO(title: "Đi chơi Cửa Lò", time: "12/10/2019", location: "Cửa Lò, Nghệ An", isOk: false),]
    }
}
