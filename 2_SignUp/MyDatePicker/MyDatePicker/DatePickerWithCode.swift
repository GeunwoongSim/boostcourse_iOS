//
//  DatePickerWithCode.swift
//  MyDatePicker
//
//  Created by 심근웅 on 2022/11/09.
//

import Foundation
import UIKit

class DatePickerWithCode: UIViewController{
    
    let datePicker: UIDatePicker = {
        let picker: UIDatePicker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .dateAndTime
        picker.preferredDatePickerStyle = .inline
        return picker
    }()
    lazy var dateLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.textAlignment = .center
        label.text = self.dateFormatter.string(from: self.datePicker.date)
        return label
    }()
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "UTC") //그리니치: GMT, kr: KST, 국제규격: UTC
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setLayouts()
        self.datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
    
    }
    
    @objc func dateChanged(_ sender: UIDatePicker){
        print(sender.date)
        let date: String = self.dateFormatter.string(from: sender.date)
        self.dateLabel.text = date
    }
    
    func setLayouts(){
        let safeArea: UILayoutGuide = self.view.safeAreaLayoutGuide
        self.view.addSubview(datePicker)
        self.view.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            self.datePicker.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            self.datePicker.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20),
            self.datePicker.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            self.dateLabel.topAnchor.constraint(equalTo: self.datePicker.bottomAnchor, constant: 20),
            self.dateLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 16),
            self.dateLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -16)
        ])
    }
}
