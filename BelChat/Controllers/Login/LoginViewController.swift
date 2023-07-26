//
//  LoginViewController.swift
//  BelChat
//
//  Created by Alexey Manokhin on 25.07.2023.
//

import UIKit

protocol LoginViewControllerDelegate {
    func openRegistrationVC()
    func openAuthorizationVC()
    func closeView()
}

class LoginViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var registrationVC: RegistrationViewController!
    var authorizationVC: AuthorizationViewController!
    var slides: [Slide] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewConfig()
        slides = Slide.getSlides()
    }
    
    func collectionViewConfig() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        
        
    collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        collectionView.isPagingEnabled = true
        
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: SliderCollectionViewCell.reuseID, bundle: nil), forCellWithReuseIdentifier: SliderCollectionViewCell.reuseID)
        
    }
}

extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionViewCell.reuseID, for: indexPath) as! SliderCollectionViewCell
        
        let slide = slides[indexPath.row]
        cell.pageControl.numberOfPages = slides.count
        cell.pageControl.currentPage = slide.id - 1
        cell.configureCell(slide: slide)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        view.frame.size
    }
}

extension LoginViewController: LoginViewControllerDelegate {
    func openAuthorizationVC() {
        authorizationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthorizationViewController") as? AuthorizationViewController
        
        authorizationVC.delegate = self
        
        self.view.insertSubview(authorizationVC.view, at: 1)
    }
    
    
    func openRegistrationVC() {
        
        registrationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController
        
        registrationVC.delegate = self
        
        self.view.insertSubview(registrationVC.view, at: 1)
       
    }
    
    func closeView() {
        
        if authorizationVC != nil {
            authorizationVC.view.removeFromSuperview()
            authorizationVC = nil
        } else if registrationVC != nil {
            registrationVC.view.removeFromSuperview()
            registrationVC = nil
        }
        
       
        
    }
    
    
}
