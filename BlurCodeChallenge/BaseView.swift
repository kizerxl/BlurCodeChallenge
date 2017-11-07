//
//  BaseView.swift
//  Pokedex
//
//  Created by Felix Changoo on 9/22/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //for overidding
    func setUpViews() {}
}
