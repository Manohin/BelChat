//
//  RegistrationViewController.swift
//  BelChat
//
//  Created by Alexey Manokhin on 26.07.2023.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var repasswordView: UIView!
    
    
    let check = CheckField.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToView))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        
        delegate.closeView()
    }
    
    
    @IBAction func registrationButtonTapped(_ sender: UIButton) {
        
        guard check.validField(emailView, emailTextField),
              check.validField(passwordView, passwordTextField) else {
            print("Неправильный ввод")
            return
        }
        guard rePasswordTextField.text == passwordTextField.text else {
            print("Пароли не совпадают!")
            return
        }
        print("DONE!")
        
    }
}
