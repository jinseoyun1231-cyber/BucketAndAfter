//
//  AddBucketVierController.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/26/26.
//

import UIKit
import SnapKit
import Then

final class AddBucketViewController : UIViewController {
    let navBar = NavigationBarView()
    let TitleTextField = TitleInputView()
    let moreTextField = LongInputView(placeholderT: "여기에 세부사항을 입력 해 주세요")
    let submitButton = UIButton(type: .system).then {
        $0.setTitle("확인", for: .normal)
        $0.backgroundColor = UIColor(named: "main100")
        $0.setTitleColor(UIColor(named: "main800"), for: .normal)
        $0.layer.cornerRadius = 24
        $0.addTarget(self, action: #selector(submit), for: .touchUpInside)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        setupLayout()
    }
    private func setupLayout() {
        view.addSubview(navBar)
        view.addSubview(TitleTextField)
        view.addSubview(moreTextField)
        view.addSubview(submitButton)
        
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
        submitButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
            $0.width.equalTo(90)
            $0.top.equalTo(moreTextField.snp.bottom).offset(24)
        }
    }
    @objc private func submit() {
        //로컬에 저장 하고 그에 따른 에러메세지, pop 실행
        //SwiftData 배워서 할 예정
        self.navigationController?.popViewController(animated: true)
    }
}
