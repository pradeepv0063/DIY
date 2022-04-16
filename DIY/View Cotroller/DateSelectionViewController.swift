//
//  DateSelectionViewController.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

class DateSelectionViewController: BaseViewController, BluetoothNotification {

    var userModel: UserModel?
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.maximumDate = Date()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribe()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribe()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DataValidationViewController ?? DataValidationViewController()
        setDate()
        destination.userModel = userModel
    }
}

private extension DateSelectionViewController {
    
    func setDate() {
        userModel?.date = datePicker.date.toString()
    }
    
}
