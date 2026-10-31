//
//  LongInputView.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/26/26.
//

import UIKit
import SnapKit
import Then

final class LongInputView : UIView {
    let longTextField = UITextView().then {
        
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
        $0.backgroundColor = UIColor(named: "gray100")
        $0.layer.cornerRadius = 5
    }
    let placeholerLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .placeholderText
    }
    init(placeholderT : String) {
        super.init(frame: .zero)
        placeholerLabel.text = placeholderT
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLayout() {
        self.addSubview(longTextField)
        longTextField.addSubview(placeholerLabel)
        
        longTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(263)
            $0.top.bottom.equalToSuperview()
        }
        placeholerLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalTo(19)
        }
    }
}
