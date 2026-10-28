//
//  ViewController.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/21/26.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    let navBar = NavigationBarView(isMain: true)
    let scrollView = UIScrollView()
    let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 16
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLayout()
        makeListCard()
    }
    private func setupLayout() {
        view.addSubview(navBar)
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        navBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(126)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.leading.equalTo(scrollView.frameLayoutGuide).inset(16)
        }
    }
    private func makeListCard() {
        for i in 0..<15 {
            let listCard = ListView(numberI: i+1, titleT: "예시 텍스트 야호 나중에 값 넣기", isDone: i%3==0)
            
            stackView.addArrangedSubview(listCard)
            
        }
    }
}
