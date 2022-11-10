//
//  ViewController2.swift
//  ViewTransition
//
//  Created by 심근웅 on 2022/11/08.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = UserInformation.shared.name
        self.ageLabel.text = UserInformation.shared.age
    }
    
    @IBAction func PopToPrev(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
