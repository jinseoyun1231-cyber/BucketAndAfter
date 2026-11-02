//
//  NavigationBarView.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/26/26.
//

import UIKit
import SnapKit
import Then

final class NavigationBarView : UIView {
    let NavBar = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor(named: "gray300")?.cgColor
        $0.layer.borderWidth = 1
    }
    let TitleText = UILabel().then {
        $0.text = "BucketAndAfter"
        $0.font = .systemFont(ofSize: 32, weight: .heavy)
        $0.textColor = UIColor(named: "main800")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLayout() {
        self.addSubview(NavBar)
        NavBar.addSubview(TitleText)
        
        NavBar.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(115)
        }
        
        TitleText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(67)
        }
    }
}
