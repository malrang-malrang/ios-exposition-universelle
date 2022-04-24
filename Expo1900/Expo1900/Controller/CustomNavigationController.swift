//
//  CustomNavigationController.swift
//  Expo1900
//
//  Created by 김동욱 on 2022/04/25.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? .all
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
