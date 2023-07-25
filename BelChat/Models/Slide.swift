//
//  Slides.swift
//  BelChat
//
//  Created by Alexey Manokhin on 25.07.2023.
//

import UIKit

struct Slide {
    var text: String
    var image: UIImage
    var id: Int
    
    static func getSlides() -> [Slide] {
        
        let slides = [
            Slide(text: "test1", image: UIImage(named: "belgorod-1") ?? .actions, id: 1),
            Slide(text: "test2", image: UIImage(named: "belgorod_2") ?? .actions, id: 2),
            Slide(text: "test3", image: UIImage(named: "belgorod_3") ?? .actions, id: 3)
        ]
        return slides
    }
}
