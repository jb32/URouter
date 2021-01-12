# URouter

[![CI Status](https://img.shields.io/travis/1031721778@qq.com/URouter.svg?style=flat)](https://travis-ci.org/1031721778@qq.com/URouter)
[![Version](https://img.shields.io/cocoapods/v/URouter.svg?style=flat)](https://cocoapods.org/pods/URouter)
[![License](https://img.shields.io/cocoapods/l/URouter.svg?style=flat)](https://cocoapods.org/pods/URouter)
[![Platform](https://img.shields.io/cocoapods/p/URouter.svg?style=flat)](https://cocoapods.org/pods/URouter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

URouter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'URouter'
```

## Author

2062964913@qq.com

## License

URouter is available under the MIT license. See the LICENSE file for more info.

## Use
1. 协议实现
```Swift
extension ViewController: URouteType {
    
    static func target(with params: Any) -> UIViewController {
        print(params)
        return ViewController()
    }
}
```
2. 页面跳转
```Swift
navigationController?.push("ModuleA.ViewController", params: 100)
present("ModuleA.ViewController", params: 100)
```
3. 参数回传
```Swift
func dismiss(animated: Bool = true, params: Any? = nil)
func pop(animated: Bool = true, params: Any? = nil)
```
