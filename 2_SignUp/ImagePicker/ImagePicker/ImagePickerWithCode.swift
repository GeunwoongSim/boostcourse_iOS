//
//  ImagePickerWithCode.swift
//  ImagePicker
//
//  Created by 심근웅 on 2022/11/07.
//

import Foundation
import UIKit

class ImagePickerWithCode: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let contentView: ImagePickerWithCode_view = ImagePickerWithCode_view()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        super.loadView()
        contentViewSet()
    }
    func contentViewSet(){
        self.view = contentView
        self.contentView.imagePicker.delegate = self
        self.contentView.imageSelectBtn.addTarget(self, action: #selector(self.imageSelect(sender:)), for: .touchUpInside)
    }
    
    @objc func imageSelect(sender: UIButton){
        self.present(contentView.imagePicker, animated: true)
    }
}

extension ImagePickerWithCode{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        if let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.contentView.imageView.image = image
        }
        self.dismiss(animated: true)
    }
}
