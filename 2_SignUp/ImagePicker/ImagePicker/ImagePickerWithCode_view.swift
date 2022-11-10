//
//  ImagePickerWithCode_view.swift
//  ImagePicker
//
//  Created by 심근웅 on 2022/11/08.
//

import Foundation
import UIKit
class ImagePickerWithCode_view: UIView{
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.modalPresentationStyle = .fullScreen
        return picker
    }()
    
   let imageView: UIImageView = {
       let view: UIImageView = UIImageView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.contentMode = .scaleAspectFit
       return view
    }()
    
    let imageSelectBtn: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("사진 선택하기", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemBackground
        addSubviews()
        setConstraints()
    }
    
    func addSubviews(){
        self.addSubview(self.imageView)
        self.addSubview(self.imageSelectBtn)
    }
    
    func setConstraints(){
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.imageSelectBtn.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20),
            self.imageSelectBtn.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20),
            self.imageSelectBtn.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20)
            
        ])
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            self.imageView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20),
            self.imageView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20),
            self.imageView.bottomAnchor.constraint(equalTo: self.imageSelectBtn.topAnchor, constant: -20)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
