//
//  URouteType.swift
//  URouter
//
//  Created by 863hy on 2021/1/6.
//

import UIKit

public protocol URouteType: UIViewController {
    static func target(with params: Any) -> UIViewController
}
