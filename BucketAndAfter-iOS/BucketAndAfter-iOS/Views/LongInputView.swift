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
    let textField = UITextView().then {
        $0.textContainerInset = UIEdgeInsets(top: 19, left: 19, bottom: 19, right: 24)
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
        textField.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLayout() {
        self.addSubview(textField)
        textField.addSubview(placeholerLabel)
        
        textField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(263)
            $0.top.bottom.equalToSuperview()
        }
        placeholerLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalTo(19)
        }
    }
    func setText(text : String) {
        textField.text = text
    }
}
extension LongInputView : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholerLabel.isHidden = !textView.text.isEmpty
    }
}
