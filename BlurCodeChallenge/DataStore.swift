//
//  DataStore.swift
//  BlurCodeChallenge
//
//  Created by Felix Changoo on 11/6/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import Foundation

struct DataStore {
    static var sharedInstance = DataStore()
    
    var messages: [Message] = []
    
    private init() {
        //create dummy data
        let message1 = Message(imageString: "JOE", personNameString: "Joe Something", messageString: "Yeah, killing it boi!", timeString: "2m")
        let message2 = Message(imageString: "GOD", personNameString: "GOD", messageString: "Forever winning", timeString: "3m")
        let message3 = Message(imageString: "MASTADON", personNameString: "Mastah Don", messageString: "Winning since birth", timeString: "1h")
        let message4 = Message(imageString: "REDHOOD", personNameString: "Red Hood", messageString: "Screw BatMan", timeString: "3h")
        let message5 = Message(imageString: "BATMAN", personNameString: "BatMan", messageString: "Red Hood SUX", timeString: "5h")
        let message6 = Message(imageString: "BATMAN", personNameString: "BatMan", messageString: "Red Hood SUX", timeString: "6h")
        let message7 = Message(imageString: "BATMAN", personNameString: "BatMan", messageString: "Red Hood gets schooled", timeString: "10h")
        let message8 = Message(imageString: "BATMAN", personNameString: "BatMan", messageString: "Red Hood isn't a real villian", timeString: "11h")
        let message9 = Message(imageString: "REDHOOD", personNameString: "Red Hood", messageString: "Da Best XD", timeString: "11h")
        
        messages = [message9, message8, message7, message6,
                    message5, message4, message3, message2,
                    message1]
    }
}
