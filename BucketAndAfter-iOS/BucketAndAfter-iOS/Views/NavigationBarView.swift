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
    let TitleText = UILabel().then {
        $0.text = "BucketAndAfter"
        $0.font = .systemFont(ofSize: 32, weight: .heavy)
        $0.textColor = UIColor(named: "main800")
    }
    let button = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        $0.tintColor = UIColor(named: "main800")
        $0.layer.cornerRadius = 24
    }
    
    init(isMain : Bool) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        button.isHidden = isMain
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLayout() {
        self.addSubview(TitleText)
        self.addSubview(button)
            
        TitleText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(72)
        }
        button.snp.makeConstraints {
            $0.centerY.equalTo(TitleText)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(48)
        }
    }
}
