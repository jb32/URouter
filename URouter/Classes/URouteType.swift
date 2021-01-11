//
//  URouteType.swift
//  URouter
//
//  Created by 863hy on 2021/1/6.
//

import UIKit

public protocol URouteType: UIViewController {
    static func target(with params: Any) -> UIViewController
    func callback(_ params: Any, with selfVc: UIViewController)
}

public extension URouteType {
    func callback(_ params: Any) {
        NotificationCenter.default.post(name: URouter.callbackName, object: params, userInfo: ["name": "\(self)"])
    }
}
