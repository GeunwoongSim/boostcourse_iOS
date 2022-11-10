//
//  ViewController.swift
//  ViewTransition
//
//  Created by 심근웅 on 2022/11/07.
//

import UIKit

class FirstViewController: UIViewController {

    let pushToSecondBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 50, width: UIScreen.main.bounds.width-40, height: 40))
        button.setTitle("pushToSecond", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    let presentToSecondBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 90, width: UIScreen.main.bounds.width-40, height: 40))
        button.setTitle("presentToSecond", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    let nameTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "이름을 입력해주세요."
        return textField
    }()
    let ageTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "나이를 입력해주세요."
        textField.keyboardType = .numberPad
        return textField
    }()
    lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(self.nameTextField)
        stackView.addArrangedSubview(self.ageTextField)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var setDataBtn: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("Set Data to Singleton ", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.setData(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("FirstViewController의 view가 메모리에 로드 됨")
        setNavigationBtn()
        layoutSet()
    }
    
    func layoutSet(){
        self.view.addSubview(stackView)
        self.view.addSubview(setDataBtn)
//        stackView.backgroundColor = UIColor.brown
        
        let safeArea: UILayoutGuide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.presentToSecondBtn.bottomAnchor, constant: 20),
            self.stackView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20),
            self.stackView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            self.setDataBtn.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 10),
            self.setDataBtn.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20),
            self.setDataBtn.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20)
        ])
        
    }
    
    @objc func setData(sender: UIButton){
        UserInformation.shared.name = self.nameTextField.text
        UserInformation.shared.age = self.ageTextField.text
    }
    
    @objc func PushToSecond(){
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }

    @objc func presentToSecond(){
        self.present(SecondViewController(), animated: true)
    }
    
    func setNavigationBtn(){
        //버튼 addtarget추가
        self.pushToSecondBtn.addTarget(self, action: #selector(self.PushToSecond), for: .touchUpInside)
        self.presentToSecondBtn.addTarget(self, action: #selector(self.presentToSecond), for: .touchUpInside)
        
        //버튼 서브뷰로 추가
        self.view.addSubview(pushToSecondBtn)
        self.view.addSubview(presentToSecondBtn)
    }
    
}

extension FirstViewController{
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.white //배경색 지정
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FirstViewController의 view가 화면에 보여질 예정")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FirstViewController의 view가 화면에 보여짐")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("FirstViewController의 view가 화면에서 사라질 예정")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("FirstViewController의 view가 화면에서 사라짐")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("FirstViewController의 view가 subview를 레이아웃 하려함")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("FirstViewController의 view가 subview를 레이아웃 함")
    }
}
