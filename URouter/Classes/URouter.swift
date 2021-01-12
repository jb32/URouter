//
//  URouter.swift
//  URouter
//
//  Created by xjb on 2021/1/6.
//

import Foundation

public class URouter {
    
    public static var share = URouter()
    /// 保存跳转信息
    var routes = [String: UOptions]()
    
    init() {}
    
    /// 通过runtime生成相应对象
    /// - Parameters:
    ///   - name: 类名字
    ///   - params: 参数
    /// - Returns: 对象
    func getController(route name: String, params: Any?) -> UIViewController? {
        if let cla = NSClassFromString(name) as? URouteType.Type {
            let vc = cla.target(with: params)
            return vc
        }
        return nil
    }
    
    /// 回调
    /// - Parameters:
    ///   - params: 参数
    ///   - vc: 执行控制器
    func callback(with params: Any?, from vc: UIViewController) {
        
        if let vc = URouter.share.routes["\(vc)"] {
            let callback = vc.callback
            callback?(params)
            URouter.share.routes["\(vc)"] = nil
        }
    }
}

public extension UIViewController {
    /// 拟态跳转
    /// - Parameters:
    ///   - name: 目标控制器名字
    ///   - params: 参数
    ///   - animated: 动画
    ///   - callback: 回调
    func present(_ name: String, params: Any? = nil, animated: Bool = true, callback: ((Any) -> Void)? = nil) {
        guard let targetVC = URouter.share.getController(route: name, params: params) else { return }
        
        let opt = UOptions(name: name, callback: callback)
        URouter.share.routes["\(targetVC)"] = opt
        present(targetVC, animated: true, completion: nil)
    }
    
    /// 拟态关闭
    /// - Parameters:
    ///   - animated: 动画
    ///   - params: 回调参数
    func dismiss(animated: Bool = true, params: Any? = nil) {
        dismiss(animated: animated, completion: nil)
        URouter.share.callback(with: params, from: self)
    }
}

public extension UINavigationController {
    /// 栈跳转
    /// - Parameters:
    ///   - name: 目标控制器名字
    ///   - params: 参数
    ///   - animated: 动画
    ///   - callback: 回调
    func push(_ name: String, params: Any, animated: Bool = true, callback: ((Any) -> Void)? = nil) {
        guard let targetVC = URouter.share.getController(route: name, params: params) else { return }
        let opt = UOptions(name: name, callback: callback)
        URouter.share.routes[name] = opt
        pushViewController(targetVC, animated: animated)
    }
    
    /// 出栈关闭
    /// - Parameters:
    ///   - animated: 动画
    ///   - params: 回调参数
    func pop(animated: Bool = true, params: Any? = nil) {
        popViewController(animated: animated)
        URouter.share.callback(with: params, from: self)
    }
}
