//
//  NotificationListenerVC.swift
//  Notification
//
//  Created by Dogukan Berk Ozer on 2.08.2021.
//

import UIKit

class NotificationListenerVC: UIViewController {

    @IBOutlet weak var notificationDataLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let notificationCenter: NotificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(handleData(notification:)), name: .sendDataNotification, object: nil)
    }
    
    
    @objc func handleData(notification: Notification) {
        
        if let name = notification.userInfo?["name"] as? String {
            notificationDataLbl.text = name
        }
    }

}
