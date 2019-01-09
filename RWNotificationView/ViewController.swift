//
//  ViewController.swift
//  RWNotificationView
//
//  Created by Raditya Kurnianto on 1/9/19.
//  Copyright © 2019 Raditya Kurnianto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let notification = RWNotificationView(title: "ESDM: Tawaran Divestasi Vale Perlu Koordinasi ke Kemenkeu", subtitle: nil)
        notification.modalPresentationStyle = .overFullScreen
        notification.onClickNotification = {
            print("hello i'm clicked")
        }
        self.present(notification, animated: false, completion: nil)
    }
}

