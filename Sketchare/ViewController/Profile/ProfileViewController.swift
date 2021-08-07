//
//  ProfileViewController.swift
//  Sketchare
//
//  Created by RONICK on 2021/08/02.
//

import UIKit

class ProfileViewController: UIViewController {
     
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var labelPostCount: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*  **** 셀 사이즈, 스페이싱 설정 **** */
        // UICollectionViewDelegateFlowLayout 프로토콜을 통해 설정해 주지 않으면 해당 세팅 사용
        let layout = UICollectionViewFlowLayout()
        let spacing = 2
        let width = UIScreen.main.bounds.width / 3 - CGFloat(spacing) // 셀의 크기(정사각형)
        layout.minimumLineSpacing = CGFloat(spacing) // 행 간격
        layout.minimumInteritemSpacing = CGFloat(spacing) // 열 간격
        layout.itemSize = CGSize(width: width, height: width)
        collectionView.collectionViewLayout = layout
        
        
        // 콜렉션 뷰에 셀 등록
        collectionView.register(PostCollectionViewCell.nib(), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        imgProfile.image = currentUser.profileImage
        imgProfile.layer.cornerRadius = 15
        
        labelPostCount.text = String(currentUserPosts.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData() // 데이터 갱신 대비해서 매번 콜렉션 뷰 데이터 갱신
        labelPostCount.text = String(currentUserPosts.count)
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
        return currentUserPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //각  cell item 반환
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as! PostCollectionViewCell
        
        cell.configure(with: currentUserPosts[indexPath.row])
        
        return cell
    }
}
