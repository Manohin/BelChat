//
//  AuthorizationViewController.swift
//  BelChat
//
//  Created by Alexey Manokhin on 26.07.2023.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToView))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func registrationButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        delegate.closeView()
    }
    
    
}
