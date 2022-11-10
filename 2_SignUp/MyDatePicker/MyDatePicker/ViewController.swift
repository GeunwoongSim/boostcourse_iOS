//
//  ViewController.swift
//  MyDatePicker
//
//  Created by 심근웅 on 2022/11/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
//        formatter.setLocalizedDateFormatFromTemplate("ko-KR")
        return formatter
    }()
    
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        print("Value Change")
        print(sender.date)
        
        
        
        let date: Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        print(dateString)
        self.label.text = dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        datePicker.minimumDate = dateFormatter.date(from: "2022년 10월 1일 03:00:00")
//        datePicker.maximumDate = dateFormatter.date(from: "2022년 12월 31일 12:59:59")
        
        self.datePicker.preferredDatePickerStyle = .inline
//        self.datePicker.locale = Locale(identifier: "ko-KR")
        self.datePicker.calendar = Calendar(identifier: .gregorian)
//        self.datePicker.timeZone = TimeZone(identifier: "ko-KR")
//        self.datePicker.date = self.dateFormatter.date(from: "2022년 11월 1일")!
//        self.datePicker.minimumDate = self.dateFormatter.date(from: "2022년 10월 15일")!
//        self.datePicker.setDate(self.dateFormatter.date(from: "2022년 11월 15일")!, animated: true)
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: .valueChanged)
        
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
}

