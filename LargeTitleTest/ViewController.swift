//
//  ViewController.swift
//  LargeTitleTest
//
//  Created by Sander on 24.09.17.
//  Copyright © 2017 ITC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView! {
            didSet {
                tableView.tableFooterView = UIView();
                tableView.rowHeight = UITableViewAutomaticDimension;
                tableView.estimatedRowHeight = 80.0;
            }
        }
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "1")
        
        navigationItem.title = "Screen: \(count)"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "1", for: indexPath)
        cell.textLabel?.text = "Index Path: \(indexPath.row)"
        cell.backgroundColor = UIColor.yellow
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        vc.count = count + 1
        navigationController?.pushViewController(vc, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

