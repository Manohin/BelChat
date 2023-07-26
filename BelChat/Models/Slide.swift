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
            Slide(text: "Какая-то приветствующая надпись при загрузке приложения. Чисто для проверки пишу сюда много текста всякого разного. Вот еще немного текста, чтобы уж точно было отлично! А теперь свайпни влево ⬅️", image: UIImage(named: "belgorod-1") ?? .actions, id: 1),
            Slide(text: "Еще одна какая-то надпись на втором экране. Чисто для проверки пишу сюда много текста всякого разного. Вот еще немного текста, чтобы уж точно было отлично!", image: UIImage(named: "belgorod_2") ?? .actions, id: 2),
            Slide(text: "Еще одна какая-то надпись на третьем экране. Чисто для проверки пишу сюда много текста всякого разного. Вот еще немного текста, чтобы уж точно было отлично!", image: UIImage(named: "belgorod_3") ?? .actions, id: 3)
        ]
        return slides
    }
}
