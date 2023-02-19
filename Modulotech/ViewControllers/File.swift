//
//  File.swift
//  Modulotech
//
//  Created by Sophie Romanet on 19/02/2023.
//

import UIKit

class TestTableViewController: UITableViewController {
    
    var data: [String] = ["Items 1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeViewCell()
        cell.myImageView.image = Assets.image1
        cell.myLabel.text = "Title"
        cell.myLabelRight.text = "Value"
        return cell
    }
}


