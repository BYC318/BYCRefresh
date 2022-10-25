//
//  TestViewController.swift
//  BYCRefresh
//
//  Created by BYC on 2022/10/19.
//

import UIKit
import BYCRefresh

class TestViewController: UIViewController {

    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableview.estimatedRowHeight = 0;
        tableview.backgroundColor = .blue
        tableview.byc_header = BYCRefreshHeaderDefaultView.header(refreshingBlock: {
            print("123456-=byc_header")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.end()
            }
        })
        self.tableview.byc_header?.backgroundColor = .red
        
        
        tableview.byc_footer = BYCRefreshFooterDefaultView.footer(refreshingBlock: {
            print("123456-=byc_footer")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.end()
            }
        })
        tableview.byc_header?.backgroundColor = .red
        tableview.byc_footer?.backgroundColor = .orange
    }
    

    func end() {
        tableview.byc_header?.endRefreshing()
        tableview.byc_footer?.endRefreshing()
    }

}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
