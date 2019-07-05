//
//  FirstViewController.swift
//  SnapKit Example
//
//  Created by Muhammed Karakul on 5.07.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.customCell, for: indexPath) as! CustomCell
        return cell
    }
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 100
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        title = "First View Controller"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupView()
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.customCell)
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }

}

class CustomCell: UITableViewCell {
    
    static var customCell = "cell"
    
    let customImageView: UIImageView = {
        
        let iv = UIImageView()
        
        iv.image = UIImage(named: "image")
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 20
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        setupViews()
    }
    
    func setupViews() {
        self.addSubview(customImageView)
        
        customImageView.snp.makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.bottom.right.equalTo(-20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
