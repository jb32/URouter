//
//  ViewController.swift
//  URouter
//
//  Created by 1031721778@qq.com on 01/06/2021.
//  Copyright (c) 2021 1031721778@qq.com. All rights reserved.
//

import UIKit
import URouter

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(type: .infoDark)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(self.to), for: .touchUpInside)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func to()  {
        present("ModuleA.ViewController", params: 100)
        navigationController?.push("ModuleA.ViewController", params: 100)
    }
}
