//
//  BLEConfirmationViewController.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

class BLEConfirmationViewController: BaseViewController {

    @IBOutlet weak var imageView: UIImageView!
    var userModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if userModel?.deviceType == .pen {
            imageView.image = UIImage(named: "BLE Pen")
        } else {
            imageView.image = UIImage(named: "BGM Meter")
        }
    }

}
