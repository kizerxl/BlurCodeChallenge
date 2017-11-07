//
//  ImageFactory.swift
//  Pokedex
//
//  Created by Felix Changoo on 9/21/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import Foundation
import UIKit

enum ImageViewFactory {
    
    case standardImageView(image: UIImage?, cornerRadius: CGFloat, interactionEnabled: Bool, contentMode: UIViewContentMode, sizeToFit: Bool)
    
    var new: UIImageView {
        switch self {
        case .standardImageView(let image,let cornerRadius, let interactionEnabled,let contentMode, let sizeToFit):
            return createStandardImageView(image: image, cornerRadius: cornerRadius, interactionEnabled: interactionEnabled,
                                           contentMode: contentMode, sizeToFit: sizeToFit)
        }
    }
    
    private func createStandardImageView(image: UIImage?, cornerRadius: CGFloat, interactionEnabled: Bool,contentMode: UIViewContentMode, sizeToFit: Bool) -> UIImageView {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = interactionEnabled
        imageView.contentMode = contentMode
        if sizeToFit {
            imageView.sizeToFit()
        }
        if image != nil {
            imageView.image = image
        }
        return imageView
    }
}
