//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by Wonbi on 2022/07/12.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}