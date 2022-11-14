//
//  ViewController.swift
//  TapGesture
//
//  Created by 심근웅 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(self.tapView(_:)))
//        self.view.addGestureRecognizer(tapGesture)
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }

}

