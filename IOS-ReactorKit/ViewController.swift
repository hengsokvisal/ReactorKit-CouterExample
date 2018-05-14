//
//  ViewController.swift
//  IOS-ReactorKit
//
//  Created by HengVisal on 5/13/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift

import SnapKit

class ViewController: UIViewController ,StoryboardView{
    
    var disposeBag = DisposeBag()
    let uiLabel : UILabel = UILabel()
    let increaseButton : UIButton = UIButton()
    let decreaseButton : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createComponent()
        addSupview()
        setupLayout()
    
        self.reactor = testReactor()
    }
    
    func bind(reactor: testReactor) {
        print("BIND CALLING?")
        
        increaseButton.rx.tap
        .map { Reactor.Action.increase }
        .bind(to: reactor.action)
        .disposed(by: disposeBag)
        
        reactor.state
        .map { $0.value.description }
        .bind(to: uiLabel.rx.text)
        .disposed(by: disposeBag)
    }
}


// MARK: - Create Component
extension ViewController{
    func createComponent() -> Void {
        increaseButton.setTitle("+", for: .normal)
        increaseButton.backgroundColor = UIColor.blue
    }
}


// MARK: - Addsupview
extension ViewController{
    func addSupview() -> Void {
        self.view.addSubview(uiLabel)
        self.view.addSubview(increaseButton)
    }
}


// MARK: - Setup Layout
extension ViewController{
    func setupLayout() -> Void{
        uiLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        increaseButton.snp.makeConstraints { (make) in
            make.top.equalTo(uiLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
}

