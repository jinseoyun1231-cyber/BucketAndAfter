//
//  ViewController.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 10/21/26.
//

import UIKit
import SnapKit
import Then
import SwiftData

class MainViewController: UIViewController {
    var bucketInfo : [BucketInfo] = []
    var context = Container.mainContext
    
    let navBar = NavigationBarView()
    let scrollView = UIScrollView()
    let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 16
    }
    let plusButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = UIColor(named: "main800")
        $0.backgroundColor = UIColor(named: "main100")
        $0.layer.cornerRadius = 24
        $0.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        makeListCard()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }//stackView에 원래 추가 해 놨던 리스트카드 삭제
    }
    private func setupLayout() {
        view.addSubview(navBar)
        view.addSubview(scrollView)
        view.addSubview(plusButton)
        
        scrollView.addSubview(stackView)
        
        navBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.leading.equalTo(scrollView.frameLayoutGuide).inset(16)
        }
        plusButton.snp.makeConstraints {
            $0.size.equalTo(48)
            $0.trailing.equalToSuperview().inset(36)
            $0.bottom.equalToSuperview().inset(58)
        }
    }
    private func makeListCard() {
        do {
            let descriptor = FetchDescriptor<BucketInfo>()
            bucketInfo = try context.fetch(descriptor)
            
            for (i, data) in bucketInfo.enumerated(){
                let listCard = ListView(numberI: i + 1, titleT: data.name, isDone: data.isDone)
                stackView.addArrangedSubview(listCard)
                listCard.changeView = { [weak self] _ in
                    let moreVC = BucketMoreViewConteroller()
                    self?.navigationController?.pushViewController(moreVC, animated: true)
                }
            }
        } catch {
            print("버킷 목록 불러오기 실패..ㅜㅜ: \(error)")
        }
    }
    @objc private func plusButtonTapped() {
        print("생성버튼 탭")
        self.navigationController?.pushViewController(AddBucketViewController(), animated: true)
    }
}
