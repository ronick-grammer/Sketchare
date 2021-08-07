//
//  ProfileViewController.swift
//  Sketchare
//
//  Created by RONICK on 2021/08/02.
//

import UIKit

class ProfileViewController: UIViewController {
     
    @IBOutlet var  collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 셀 사이즈 세팅
        let layout = UICollectionViewFlowLayout()
        // UICollectionViewDelegateFlowLayout 프로토콜을 통해 사이즈를 설정해 주지 않으면 해당 세팅 사용
        // 하지만 여기서는 프로토콜을  사용해서 사이즈 설정
        //layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        
        // 콜렉션 뷰에 셀 등록
        collectionView.register(PostCollectionViewCell.nib(), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// 셀을 탭하면 호출
extension ProfileViewController: UICollectionViewDelegate { // 셀과 상호작용
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("you tapped me")
    }
}

// 디스플레이할 셀의 갯수 반환
extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //각  cell item 반환
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as! PostCollectionViewCell
        
        cell.configure(with: UIImage(named: "sketch")!)
        
        return cell
    }
}

// 각 셀의 크기, 마진이나 패딩 조절
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120, height: 120)
    }
}
