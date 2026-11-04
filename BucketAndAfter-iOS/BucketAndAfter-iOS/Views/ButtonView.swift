//
//  ButtonView.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 11/4/26.
//

import UIKit
import SnapKit
import Then
final class ButtonView : UIView {
    let button = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "main100")
        $0.tintColor = UIColor(named: "main800")
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.layer.cornerRadius = 24
    }
    init(text : String) {
        super.init(frame: .zero)
        button.setTitle(text, for: .normal)
        setupLayout()
    }
    private func setupLayout() {
        self.addSubview(button)
        
        button.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.width.equalTo(90)
            $0.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
