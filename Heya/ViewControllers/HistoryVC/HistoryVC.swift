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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell
        return cell!
        
    }
}
