//
//  BucketMoreViewConteroller.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/26/26.
//

import UIKit
import SnapKit
import Then
import SwiftData

final class BucketMoreViewConteroller : UIViewController {
    var bucketInfo : [BucketInfo] = []
    var context = Container.mainContext
    var i : Int = 0
    
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
        
        setButtonAction()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupLayout()
        setText(i: self.i)
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
            let writeVC = WriteThoughtViewController()
            self.navigationController?.pushViewController(writeVC, animated: true)
            writeVC.setupTexts(i: self.i)
        }
        editButton.buttonTapped = {
            self.navigationController?.pushViewController(BucketEditViewController(), animated: true)
        }
        deleteButton.buttonTapped = {
            let item = self.bucketInfo[self.i]
            self.context.delete(item)
            
            do {
                try self.context.save()
            } catch {
                print("삭제 실패..ㅜㅜ \nerror : \(error)")
            }
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    func setText(i : Int) {
        self.i = i
        do {
            let descriptor = FetchDescriptor<BucketInfo>()
            bucketInfo = try context.fetch(descriptor)
            
            let data = bucketInfo[i]
            nameT.text = data.name
            moreT.text = data.moreInfo
            
            thoughtL.isHidden = !data.isDone
            thoughtT.isHidden = !data.isDone
            thoughtT.text = data.thoughts
            
        } catch {
            print("버킷 목록 불러오기 실패..ㅜㅜ: \(error)")
        }
    }
}
