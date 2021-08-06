//
//  FeedViewCell.swift
//  Sketchare
//
//  Created by RONICK on 2021/08/05.
//

import UIKit

class FeedViewCell: UITableViewCell {
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var fullName: UILabel!
    @IBOutlet var caption: UILabel!
    @IBOutlet var buttonLike: UIButton!
    
    var didLike = false
    
    static let identifier = "FeedViewCell"
    
    static func nib() -> UINib { // FeedViewCell nib 가져오기
        return UINib(nibName: "FeedViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.cornerRadius = 15 // 프로필 사진 살짝 둥글게
    }
    
    func configure(with post: Post) {
        self.postImage.image = UIImage(named: post.postImageName)
        self.userName.text = post.userName
        self.profileImage.image = UIImage(named: post.profileImageName)
        self.fullName.text = post.fullName
        self.caption.text = post.caption
    }
    
    @IBAction func eventButtonLike(_ sender: UIButton) {
        
        buttonLike.setImage(UIImage(systemName: didLike ? "heart.fill" : "heart"), for: .normal)
        
        didLike = !didLike
    }
    
}
