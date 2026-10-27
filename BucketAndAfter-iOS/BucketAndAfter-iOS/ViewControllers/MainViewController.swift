//
//  ViewController.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/21/26.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    let navBar = NavigationBarView(isMain: true)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    private func setupLayout() {
        view.addSubview(navBar)
        
        navBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(126)
        }
    }
}
