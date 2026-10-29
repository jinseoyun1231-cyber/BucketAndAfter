//
//  BucketMoreViewConteroller.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/26/26.
//

import UIKit
import SnapKit
import Then

final class BucketMoreViewConteroller : UIViewController {
    let text = UILabel().then {
        $0.textColor = .white
    }
    override func viewDidLoad() {
        setupLayout()
    }
    private func setupLayout() {
        view.addSubview(text)
        text.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    func setText(text : String) {
        self.text.text = (text)
    }
}
