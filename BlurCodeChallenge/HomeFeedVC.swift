//
//  HomeFeedVC.swift
//  BlurCodeChallenge
//
//  Created by Felix Changoo on 11/5/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import UIKit

class HomeFeedVC: UIViewController {

    let homeFeedView = HomeFeedView()
    var messageTableView: UITableView!
    let imageString = "Oren" //in the future this will be part of a profile object
    
    func postMessage() {
        let messageString = homeFeedView.quoteTextField.text
        let name = homeFeedView.nameLabel.text
        
        guard messageString != "" else { return }
        
        let newMessage = Message(imageString: imageString, personNameString: name!, messageString: messageString!, timeString: "NOW")
        
        DataStore.sharedInstance.messages.append(newMessage)
        
        messageTableView.reloadData()
    }
}

extension HomeFeedVC: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("testing")
        homeFeedView.quoteTextField.delegate = self
        
        self.view.addSubview(homeFeedView)
        
        messageTableView = UITableView()
        self.view.addSubview(messageTableView)
        messageTableView.translatesAutoresizingMaskIntoConstraints = false
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        NSLayoutConstraint.activate([
            homeFeedView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            homeFeedView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 2),
            homeFeedView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -2),
            homeFeedView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.50),
            
            messageTableView.topAnchor.constraint(equalTo: homeFeedView.bottomAnchor),
            messageTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            messageTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            messageTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ])
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        messageTableView.reloadData()
    }
    
    func setupViews() {
        messageTableView.register(MessageCell.self)
        messageTableView.separatorStyle = .none
        messageTableView.backgroundColor = UIColor.white
        messageTableView.allowsSelection = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStore.sharedInstance.messages.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 0.4) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let correctIdx = DataStore.sharedInstance.messages.count - 1 - indexPath.row
        let message = DataStore.sharedInstance.messages[correctIdx] as Message
        
        //do some setup and return the cell
        let cell = messageTableView.dequeueReusableCell(forIndexPath: indexPath) as MessageCell
        cell.configure(withMessage: message)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    //quote text field stuffs 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        postMessage()
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        homeFeedView.quoteTextField.text = "Enter Status Update.."
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollToTop()
    }
    
    func scrollToTop() {
        //back to top son
        let indexPath : NSIndexPath = NSIndexPath(row: 0, section: 0)
        self.messageTableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
    }

}

