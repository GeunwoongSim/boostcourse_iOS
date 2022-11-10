//
//  secondViewController.swift
//  ViewTransition
//
//  Created by 심근웅 on 2022/11/07.
//

import Foundation
import UIKit
import AVFoundation

class SecondViewController: UIViewController{
    
    let popToFirstBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 50, width: UIScreen.main.bounds.width-40, height: 40))
        button.setTitle("popToFirst", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    let dismissToFirstBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 90, width: UIScreen.main.bounds.width-40, height: 40))
        button.setTitle("dismissToFirst", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    
    let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "name"
        label.textColor = UIColor.black
        return label
    }()
    let ageLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "age"
        label.textColor = UIColor.black
        return label
    }()
    lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(self.nameLabel)
        stackView.addArrangedSubview(self.ageLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondViewController의 view가 메모리에 로드 됨")
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = true
        //버튼에 addTarget추가
        self.popToFirstBtn.addTarget(self, action: #selector(self.popToFirst), for: .touchUpInside)
        self.dismissToFirstBtn.addTarget(self, action: #selector(self.dismissToFirst), for: .touchUpInside)
        //버튼을 subview로 추가
        self.view.addSubview(self.popToFirstBtn)
        self.view.addSubview(self.dismissToFirstBtn)
        
        layoutSet()
    }
    
    func layoutSet(){
        let safeArea: UILayoutGuide = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: dismissToFirstBtn.bottomAnchor, constant: 20),
            self.stackView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20),
            self.stackView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20)
        ])
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController의 view가 화면에 보여질 예정")
        self.nameLabel.text = UserInformation.shared.name
        self.ageLabel.text = UserInformation.shared.age
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController의 view가 화면에 보여짐")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondViewController의 view가 화면에서 사라질 예정")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondViewController의 view가 화면에서 사라짐")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("SecondViewController의 view가 subview를 레이아웃 하려함")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("SecondViewController의 view가 subview를 레이아웃 함")
    }
    
    @objc func popToFirst(){
        self.navigationController?.popViewController(animated: true)
    }

    @objc func dismissToFirst(){
        self.dismiss(animated: true)
    }
}
