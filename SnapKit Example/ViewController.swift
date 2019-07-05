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
    
    let subView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 20
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 20
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ topView, bottomView ])
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        return stackView
    }()
    
    let goToFirstViewButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setTitle("First VC", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(goToFirstView(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let goToSecondViewButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setTitle("Second VC", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(goToSecondView(_:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func goToFirstView(_ sender: UIButton) {
        let firstViewController = FirstViewController()
        navigationController?.pushViewController(firstViewController, animated: true)
    }
    
    @objc func goToSecondView(_ sender: UIButton) {
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }

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
        mainView.addSubview(subView)
        subView.addSubview(mainStackView)
        topView.addSubview(goToFirstViewButton)
        bottomView.addSubview(goToSecondViewButton)
        
        mainView.snp.makeConstraints { (make) in
            make.left.topMargin.equalTo(20)
            make.right.bottomMargin.equalTo(-20)
        }
        
        subView.snp.makeConstraints { (make) in
            make.width.height.equalTo(300)
            make.center.equalTo(mainView )
        }
        
        mainStackView.snp.makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.bottom.right.equalTo(-20)
        }
        
        goToFirstViewButton.snp.makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.bottom.right.equalTo(-20)
        }
        
        goToSecondViewButton.snp.makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.bottom.right.equalTo(-20)
        }
        
    }
    
}

