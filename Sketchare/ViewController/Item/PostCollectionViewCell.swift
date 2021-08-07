//
//  PostCollectionViewCell.swift
//  Sketchare
//
//  Created by RONICK on 2021/08/07.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "PostCollectioViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with post: Post) {
        imageView.image = post.postImage
    }
    
    static func nib() -> UINib { // 셀을 컬렉션 뷰에 등록하기 위해서
        return UINib(nibName: "PostCollectionViewCell", bundle: nil)
    }

}
