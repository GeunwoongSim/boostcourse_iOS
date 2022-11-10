//
//  ViewController1.swift
//  ViewTransition
//
//  Created by 심근웅 on 2022/11/08.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func touchUpSetButton(_ sender: UIButton) {
        UserInformation.shared.name = self.nameTextField.text
        UserInformation.shared.age = self.ageTextField.text
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
