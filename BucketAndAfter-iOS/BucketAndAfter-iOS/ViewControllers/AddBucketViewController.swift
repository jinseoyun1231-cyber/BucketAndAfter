//
//  AddBucketVierController.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/26/26.
//

import UIKit
import SnapKit

final class AddBucketViewController : UIViewController {
    let navBar = NavigationBarView()
    let TitleTextField = TitleInputView()
    let moreTextField = LongInputView(placeholderT: "여기에 세부사항을 입력 해 주세요")
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        setupLayout()
    }
    private func setupLayout() {
        view.addSubview(navBar)
        view.addSubview(TitleTextField)
        view.addSubview(moreTextField)
        
        navBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        TitleTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(navBar.snp.bottom).offset(16)
        }
        moreTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(TitleTextField.snp.bottom).offset(24)
        }
    }
}
