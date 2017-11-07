//
//  ButtonFactory.swift
//  Pokedex
//
//  Created by Felix Changoo on 9/21/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import Foundation
import UIKit

enum ButtonFactory {
    
    case buttonWithImage(image: UIImage, cornerRadius: CGFloat, target: Any, selector: (Selector), sizeToFit: Bool)
    case buttonWithoutImage(cornerRadius: CGFloat, sizeToFit: Bool)
    
    var new: UIButton {
        switch self {
        case .buttonWithImage(let image,let cornerRadius,let target,let selector, let sizeToFit):
            return createButtonWithImage(image: image, cornerRadius: cornerRadius, target: target, selector: selector, sizeToFit: sizeToFit)
        case .buttonWithoutImage(let cornerRadius, let sizeToFit):
            return createButtonWithImage(image: nil, cornerRadius: cornerRadius, target: nil, selector: nil, sizeToFit: sizeToFit)
        }
    }
    
    private func createButtonWithImage(image: UIImage?, cornerRadius: CGFloat, target: Any?, selector: (Selector)?, sizeToFit: Bool) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
        if sizeToFit {
            button.sizeToFit()
        }
        
        guard let target = target, let selector = selector else {
            return button
        }
        button.addTarget(target, action: selector, for: .touchUpInside)
        
        return button
    }
    
}

