//
//  ViewController+Route.swift
//  ModuleA
//
//  Created by 863hy on 2021/1/7.
//

import Foundation
import URouter

extension ViewController: URouteType {
    
    static func target(with params: Any?) -> UIViewController {
        print(params as Any)
        return ViewController()
    }
}
