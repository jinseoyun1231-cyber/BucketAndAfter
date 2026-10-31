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
    let longTextField = UITextField().then {
        $0.leftView = UIView(frame: .init(x: 0, y: 0, width: 24, height: 0))
        $0.rightView = UIView(frame: .init(x: 0, y: 0, width: 24, height: 0))
        $0.leftViewMode = .always
        $0.rightViewMode = .always
        
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
        $0.backgroundColor = UIColor(named: "gray100")
    }
    init(placeholderT : String) {
        super.init(frame: .zero)
        longTextField.placeholder = placeholderT
        
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLayout() {
        self.addSubview(longTextField)
        
        longTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(263)
            $0.top.bottom.equalToSuperview()
        }
    }
}
