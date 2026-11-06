//
//  BucketMoreViewConteroller.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/26/26.
//

import UIKit
import SnapKit
import Then

final class BucketMoreViewConteroller : UIViewController {
    let scrollView = UIScrollView()
    let stackView = UIStackView().then {
        $0.spacing = 16
        $0.axis = .vertical
    }
    let buttonStack = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.semanticContentAttribute = .forceLeftToRight
    }
    
    let navBar = NavigationBarView()
    
    let nameT = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.numberOfLines = 0
    }
    let moreT = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    let thoughtL = UILabel().then {
        $0.text = "소감"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
    }
    let thoughtT = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    let writeButton:ButtonView = ButtonView(text: "소감 작성")
    let editButton:ButtonView = ButtonView(text: "수정")
    let deleteButton:ButtonView = ButtonView(text: "삭제")
    let space = UIView()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupLayout()
        setButtonAction()
    }
    override func viewWillAppear(_ animated: Bool) {
        setText()
    }
    private func setupLayout() {
        view.addSubview(navBar)
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        [nameT, moreT, thoughtL, thoughtT, buttonStack].forEach {
            stackView.addArrangedSubview($0)
        }
        [space, writeButton, editButton, deleteButton].forEach {
            buttonStack.addArrangedSubview($0)
        }
        
        navBar.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(navBar.snp.bottom)
        }
        stackView.snp.makeConstraints {
            $0.top.bottom.equalTo(scrollView.contentLayoutGuide)
            $0.leading.trailing.equalTo(scrollView.frameLayoutGuide).inset(16)
        }
    }
    private func setButtonAction() {
        writeButton.buttonTapped = {
            self.navigationController?.pushViewController(WriteThoughtViewController(), animated: true)
        }
        editButton.buttonTapped = {
            self.navigationController?.pushViewController(BucketEditViewController(), animated: true)
        }
        deleteButton.buttonTapped = {
            //삭제 코드
            self.navigationController?.popViewController(animated: true)
        }
    }
    func setText() {
        //여기에 로컬에서 가져와 text 설정하는거 넣기
    }
}
