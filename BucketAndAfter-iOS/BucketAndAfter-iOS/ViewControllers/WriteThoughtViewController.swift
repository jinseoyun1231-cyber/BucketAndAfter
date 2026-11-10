//
//  WriteThoughtViewController.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/26/26.
//

import UIKit
import SnapKit
import Then
import SwiftData

final class WriteThoughtViewController : UIViewController {
    var bucketInfo : [BucketInfo] = []
    var context = Container.mainContext
    
    let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 16
        $0.alignment = .leading
    }
    let scrollView = UIScrollView()
    let navBar = NavigationBarView()
    
    let nameT = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
    }
    let moreT = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    let thoughtTextField = LongInputView(placeholderT: "여기에 달성 이후의 소감을 작성하세요")
    let submitButton = ButtonView(text: "확인")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    private func setupLayout() {
        view.addSubview(navBar)
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        scrollView.addSubview(submitButton)
        
        [nameT, moreT, thoughtTextField].forEach {
            stackView.addArrangedSubview($0)
        }
        
        navBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.top.bottom.equalTo(scrollView.contentLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        submitButton.snp.makeConstraints {
            $0.top.equalTo(thoughtTextField.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
