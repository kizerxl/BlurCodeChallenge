//
//  HomeFeedView.swift
//  BlurCodeChallenge
//
//  Created by Felix Changoo on 11/5/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import UIKit
import FontAwesome_swift

//for namespacing colors we want
struct MyColors {
    static let darkGrayColor = UIColor(red: 186/255, green: 188/255, blue: 190/255, alpha: 1.0)
    static let reallyDarkGrayColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1.0)
    static let lightGrayColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    static let orangeColor = UIColor(red: 250/255, green: 174/255, blue: 66/255, alpha: 1.0)
    static let lightOrangeColor = UIColor(red: 255/255, green: 228/255, blue: 198/255, alpha: 1.0)
    static let blueColor = UIColor(red: 65/255, green: 176/255, blue: 223/255, alpha: 1.0)
    
    private init() {}
}


class HomeFeedView: BaseView {
    //stats
    var valueForStatDict = ["PTS TODAY":"126",
                            "PTS THIS WEEK":"543",
                            "TOTAL PTS":"4.3K",
                            "RANK":"1"]
    
    lazy var blurredBackground: UIImageView = {
        let imageView = ImageViewFactory.standardImageView(image: #imageLiteral(resourceName: "SPIDERMAN"), cornerRadius: 0, interactionEnabled: false, contentMode: .scaleAspectFill, sizeToFit: false).new
        
        return imageView
    }()
    
    lazy var settingsButton: UIButton = {
        let button = ButtonFactory.buttonWithoutImage(cornerRadius: 0, sizeToFit: true).new
        button.titleLabel?.font = UIFont.fontAwesome(ofSize: 40)
        button.setTitle(String.fontAwesomeIcon(name: .gear), for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    //display Image section stuff
    lazy var displayImageView: BaseView = {
        let baseView = BaseView()
        baseView.backgroundColor = .white
        baseView.layer.borderWidth = 1
        baseView.layer.cornerRadius = 55.0
        baseView.layer.borderColor = UIColor.gray.cgColor
        return baseView
    }()
    
    lazy var innerDisplayImageView: UIImageView = {
        let imageView = ImageViewFactory.standardImageView(image: #imageLiteral(resourceName: "Oren"), cornerRadius: 50.0, interactionEnabled: false, contentMode: .scaleAspectFill, sizeToFit: false).new
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = LabelFactory.standardLabel(text: "Oren Schindler", textColor: .white, fontStyle: .headline, textAlignment: .center, sizeToFit: true, adjustToFit: true).new
        label.font = UIFont(name: "HelveticaNeue", size: 30)
        return label
    }()
    
    //status stuff
    lazy var statusContainer: BaseView = {
        let baseView = BaseView()
         baseView.backgroundColor = .white
        return baseView
    }()
    
    lazy var leftQuoteLabel: UILabel = {
        let label = LabelFactory.standardLabel(text: "", textColor: MyColors.reallyDarkGrayColor, fontStyle: .headline, textAlignment: .center, sizeToFit: true, adjustToFit: true).new
        label.font = UIFont.fontAwesome(ofSize: 20)
        label.text = String.fontAwesomeIcon(name: .quoteLeft)
        return label
    }()
    
    lazy var rightQuoteLabel: UILabel = {
        let label = LabelFactory.standardLabel(text: "", textColor: MyColors.reallyDarkGrayColor, fontStyle: .headline, textAlignment: .center, sizeToFit: true, adjustToFit: true).new
        label.font = UIFont.fontAwesome(ofSize: 20)
        label.text = String.fontAwesomeIcon(name: .quoteRight)
        return label
    }()
    
    lazy var quoteTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.text = "Enter Status Update.."
        field.textColor = MyColors.reallyDarkGrayColor
        field.textAlignment = .center
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    //section Stuff
    var statsStackView: UIStackView!
    
    //date area
    lazy var dateButton: UIButton = {
        let button = ButtonFactory.buttonWithoutImage(cornerRadius: 0, sizeToFit: true).new
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let convertedDate = dateFormatter.string(from: NSDate() as Date)
        
        button.setTitle("    \(convertedDate)", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: (button.titleLabel?.font.pointSize)!)
        button.contentHorizontalAlignment = .left
        button.layer.borderWidth = 1
        button.layer.borderColor = MyColors.reallyDarkGrayColor.cgColor
        return button
    }()
    
    override func setUpViews() {
        addSubview(blurredBackground)
        addSubview(settingsButton)
        addSubview(displayImageView)
        displayImageView.addSubview(innerDisplayImageView)
        
        addSubview(nameLabel)
        addSubview(statusContainer)
        
        statusContainer.addSubview(leftQuoteLabel)
        statusContainer.addSubview(rightQuoteLabel)
        statusContainer.addSubview(quoteTextField)
        
        var sections: [BaseView] = []
        
        valueForStatDict.keys.forEach { stat in
            let value = valueForStatDict[stat]
            let currentSection = createSection(stat: stat, value: value!)
            sections.append(currentSection)
        }
        
        statsStackView = {
            let stackView = UIStackView(arrangedSubviews: sections)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.spacing = 2
            stackView.distribution = .fillEqually
            return stackView
        }()
        
        addSubview(statsStackView)
        
        statsStackView.arrangedSubviews.forEach { section in
            addConstraints(toSection: section as! BaseView)
        }
        
        addSubview(dateButton)
        
        NSLayoutConstraint.activate([
            blurredBackground.topAnchor.constraint(equalTo: topAnchor),
            blurredBackground.leftAnchor.constraint(equalTo: leftAnchor, constant: -1),
            blurredBackground.rightAnchor.constraint(equalTo: rightAnchor, constant: 1),
            blurredBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            settingsButton.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            settingsButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            settingsButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            settingsButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            
            displayImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            displayImageView.topAnchor.constraint(equalTo: settingsButton.bottomAnchor),
            displayImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            displayImageView.widthAnchor.constraint(equalTo: displayImageView.heightAnchor),
            
            innerDisplayImageView.leftAnchor.constraint(equalTo: displayImageView.leftAnchor, constant: 5),
            innerDisplayImageView.rightAnchor.constraint(equalTo: displayImageView.rightAnchor, constant: -5),
            innerDisplayImageView.topAnchor.constraint(equalTo: displayImageView.topAnchor, constant: 5),
            innerDisplayImageView.bottomAnchor.constraint(equalTo: displayImageView.bottomAnchor, constant: -5),
            
            nameLabel.topAnchor.constraint(equalTo: displayImageView.bottomAnchor, constant: 5),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            statusContainer.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            statusContainer.leftAnchor.constraint(equalTo: leftAnchor, constant: -1),
            statusContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: 1),
            statusContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            
            leftQuoteLabel.leftAnchor.constraint(equalTo: statusContainer.leftAnchor, constant: 5),
            leftQuoteLabel.topAnchor.constraint(equalTo: statusContainer.topAnchor, constant: 2),
            leftQuoteLabel.bottomAnchor.constraint(equalTo: statusContainer.bottomAnchor, constant: -2),
            leftQuoteLabel.widthAnchor.constraint(equalTo: statusContainer.widthAnchor, multiplier: 0.2),
            
            rightQuoteLabel.rightAnchor.constraint(equalTo: statusContainer.rightAnchor, constant: -5),
            rightQuoteLabel.topAnchor.constraint(equalTo: statusContainer.topAnchor, constant: 2),
            rightQuoteLabel.bottomAnchor.constraint(equalTo: statusContainer.bottomAnchor, constant: -2),
            rightQuoteLabel.widthAnchor.constraint(equalTo: statusContainer.widthAnchor, multiplier: 0.2),
            
            quoteTextField.leftAnchor.constraint(equalTo: leftQuoteLabel.rightAnchor, constant: 2),
            quoteTextField.rightAnchor.constraint(equalTo: rightQuoteLabel.leftAnchor, constant: -2),
            quoteTextField.topAnchor.constraint(equalTo: statusContainer.topAnchor, constant: 2),
            quoteTextField.bottomAnchor.constraint(equalTo: statusContainer.bottomAnchor, constant: -2),
            
            statsStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: -1),
            statsStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 1),
            statsStackView.topAnchor.constraint(equalTo: statusContainer.bottomAnchor, constant: 5),
            statsStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20),
            
            dateButton.topAnchor.constraint(equalTo: statsStackView.bottomAnchor),
            dateButton.leftAnchor.constraint(equalTo: leftAnchor, constant: -5),
            dateButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 5),
            dateButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        //blur stuff
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurredBackground.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurredBackground.addSubview(blurEffectView)
        blurEffectView.layer.opacity = 0.80
    }
    
    //creates a seperate section for the stats stack view
    func createSection(stat: String, value: String) -> BaseView {
        let container = BaseView()
        container.layer.backgroundColor = UIColor.black.cgColor
        let topLabel = LabelFactory.standardLabel(text: stat, textColor: MyColors.lightOrangeColor, fontStyle: .headline, textAlignment: .center, sizeToFit: true, adjustToFit: true).new
        let bottomLabel = LabelFactory.standardLabel(text: value, textColor: .white, fontStyle: .headline, textAlignment: .center, sizeToFit: true, adjustToFit: false).new
        
        topLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        bottomLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        
        container.layer.opacity = 0.60

        container.addSubview(topLabel)
        container.addSubview(bottomLabel)
        
        return container
    }
    
    func addConstraints(toSection section: BaseView) {
        let container = section
        let topLabel = container.subviews[0]
        let bottomLabel = container.subviews[1]
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            topLabel.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.1),
            topLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: -5),
            bottomLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            bottomLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5)
        ])
    }

}
