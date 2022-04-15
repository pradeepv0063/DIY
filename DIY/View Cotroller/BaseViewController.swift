//
//  BaseViewController.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

class BaseViewController: UIViewController {

    var userModel: UserModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        addCancel()
        addGesture()
    }
    
    @IBAction func cancelTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

private extension BaseViewController {
    
    func addCancel() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        navigationItem.leftBarButtonItem  = cancelButton
    }
    
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped() {
        view.endEditing(true)
    }
}
