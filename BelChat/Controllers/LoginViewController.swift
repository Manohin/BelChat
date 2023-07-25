//
//  LoginViewController.swift
//  BelChat
//
//  Created by Alexey Manokhin on 25.07.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        view.frame.size
    }
}
