//
//  MessageCell.swift
//  BlurCodeChallenge
//
//  Created by Felix Changoo on 11/6/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    lazy var messageImageView: UIImageView = {
        let image = ImageViewFactory.standardImageView(image: nil, cornerRadius: 25.0, interactionEnabled: false, contentMode: .scaleAspectFill, sizeToFit: true).new
        image.layer.borderWidth = 2
        image.layer.borderColor = MyColors.reallyDarkGrayColor.cgColor
        return image
    }()
    
    lazy var messageLabel: UILabel = {
        let label = LabelFactory.standardLabel(text: "Name goes here", textColor: MyColors.reallyDarkGrayColor, fontStyle: .headline, textAlignment: .left, sizeToFit: true, adjustToFit: true).new
        label.font = label.font.withSize(15)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = LabelFactory.standardLabel(text: "time here", textColor: MyColors.reallyDarkGrayColor, fontStyle: .headline, textAlignment: .center, sizeToFit: true, adjustToFit: true).new
        label.font = label.font.withSize(10)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        let marginGuide = contentView.layoutMarginsGuide
        
        contentView.addSubview(messageImageView)
        contentView.addSubview(messageLabel)
        contentView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
                messageImageView.leftAnchor.constraint(equalTo: marginGuide.leftAnchor, constant: 10),
                messageImageView.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor),
                messageImageView.heightAnchor.constraint(equalToConstant: 50),
                messageImageView.widthAnchor.constraint(equalToConstant: 50),
                
                messageLabel.leftAnchor.constraint(equalTo: messageImageView.rightAnchor, constant: 10),
                messageLabel.rightAnchor.constraint(equalTo: timeLabel.leftAnchor, constant: -3),
                messageLabel.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor),
                messageLabel.heightAnchor.constraint(equalTo: marginGuide.heightAnchor, multiplier: 0.6),
                
                timeLabel.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor),
                timeLabel.rightAnchor.constraint(equalTo: marginGuide.rightAnchor, constant: -2),
                timeLabel.heightAnchor.constraint(equalTo: marginGuide.heightAnchor, multiplier: 0.2),
                timeLabel.widthAnchor.constraint(equalTo: marginGuide.widthAnchor, multiplier: 0.2)
        ])
    }
    
    func configure(withMessage message: Message) {
        //configure the cell with a message 
        messageImageView.image = UIImage(named: message.imageString)
        
        var pieces = message.personNameString.components(separatedBy: .whitespacesAndNewlines)
        let firstName = pieces[0]
        
        messageLabel.text = "\(firstName.uppercased()) \"\(message.messageString)\""
        timeLabel.text = message.timeString
    }

}
