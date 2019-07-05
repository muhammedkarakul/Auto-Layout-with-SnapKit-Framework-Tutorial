//
//  ViewController.swift
//  SnapKit Example
//
//  Created by Muhammed Karakul on 5.07.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.6, alpha: 0.4)
        view.layer.cornerRadius = 20
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupViews()
    }
    
    func setup() {
        view.backgroundColor = .white
        title = "Initial View"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    func setupViews() {
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            make.left.topMargin.equalTo(20)
            make.right.bottomMargin.equalTo(-20)
        }
    }
    
}

