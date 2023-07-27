//
//  RegistrationViewController.swift
//  BelChat
//
//  Created by Alexey Manokhin on 26.07.2023.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var repasswordView: UIView!
    
    var delegate: LoginViewControllerDelegate!
    let check = CheckField.shared
    let service = Service.shared
    
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
            return
        }
        
        guard rePasswordTextField.text == passwordTextField.text else {
            print("Пароли не совпадают!")
            return
        }
        service.createNewUser(
            LoginField(
                email: emailTextField.text!,
                password: passwordTextField.text!
            )
        ) { code in
            switch code.code {
            case 0:
                print("Ошибка регистрации")
            case 1:
                let alert = UIAlertController(title: "Поздравляем!", message: "Вы успешно зарегистрированы!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Отлично!", style: .cancel, handler: { [weak self] action in
                    self?.delegate.closeView()
                }))
                self.confirmEmail()
                self.present(alert, animated: true)
            default:
                print("Неизвестная ошибка")
            }
        }
    }
    
    private func confirmEmail() {
        Auth.auth().currentUser?.sendEmailVerification { error in
            guard let error else { return }
            print(error.localizedDescription)
        }
    }
}
