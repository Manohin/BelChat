//
//  SliderCollectionViewCell.swift
//  BelChat
//
//  Created by Alexey Manokhin on 25.07.2023.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var sliderImageView: UIImageView!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    
    static let reuseID = "SliderCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        registrationButton.isHidden = true
        enterButton.isHidden = true
    }

    
    func configureCell(slide: Slide) {
        sliderImageView.image = slide.image
        descriptionTextLabel.text = slide.text
        
        if slide.id == 3 {
            registrationButton.isHidden = false
            enterButton.isHidden = false
        }
    }
    
    
    @IBAction func registrationButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func enterButtonTapped(_ sender: UIButton) {
    }
    
    
}
