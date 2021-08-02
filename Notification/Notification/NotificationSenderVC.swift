//
//  NotificationSenderVC.swift
//  Notification
//
//  Created by Dogukan Berk Ozer on 2.08.2021.
//

import UIKit

class NotificationSenderVC: UIViewController {

    var notificationData: [String: Any] = [:]
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendNotificationBtn(_ sender: Any) {
        
        notificationData["name"] = textField.text
        
        NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: notificationData)
        dismiss(animated: true, completion: nil)
    }
    
}
