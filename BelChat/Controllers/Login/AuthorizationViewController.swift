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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func registrationButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        delegate.closeView()
    }
    
    
}
