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
        
        [nameT, moreT, thoughtTextField, submitButton].forEach {
            scrollView.addSubview($0)
        }
        
        navBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        nameT.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.trailing.equalTo(scrollView.frameLayoutGuide).inset(16)
        }
        moreT.snp.makeConstraints {
            $0.leading.trailing.equalTo(nameT)
            $0.top.equalTo(nameT.snp.bottom).offset(16)
        }
        thoughtTextField.snp.makeConstraints {
            $0.leading.trailing.equalTo(scrollView.frameLayoutGuide)
            $0.top.equalTo(moreT.snp.bottom).offset(16)
        }
        submitButton.snp.makeConstraints {
            $0.top.equalTo(thoughtTextField.snp.bottom).offset(16)
            $0.trailing.equalTo(scrollView.frameLayoutGuide).inset(16)
        }
    }
    func setupTexts(i : Int) {
        do {
            let descritor = FetchDescriptor<BucketInfo>()
            bucketInfo = try context.fetch(descritor)
            let data = bucketInfo[i]
            nameT.text = data.name
            moreT.text = data.moreInfo
            thoughtTextField.textField.text = data.thoughts
        } catch {
            print("소감작성페이지 텍스트 설정 실패 \nerror: \(error)")
        }
    }
}
