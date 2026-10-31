//
//  TextFieldView.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/26/26.
//

import UIKit
import SnapKit
import Then
final class TitleInputView : UIView {
    let textField = UITextField().then {
        $0.leftView = UIView(frame: .init(x: 0, y: 0, width: 24, height: 0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: .init(x: 0, y: 0, width: 24, height: 0))
        $0.rightViewMode = .always
        
        $0.placeholder = "여기에 버킷리스트 제목을 입력하세요."
        $0.textColor = .black
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(named: "gray100")
    }
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLayout() {
        self.addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(57)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
