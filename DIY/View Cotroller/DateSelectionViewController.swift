//
//  DateSelectionViewController.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

class DateSelectionViewController: BaseViewController {

    var userModel: UserModel?
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.maximumDate = Date()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DataValidationViewController ?? DataValidationViewController()
        userModel?.date = datePicker.date.toString()
        destination.userModel = userModel
    }
}
