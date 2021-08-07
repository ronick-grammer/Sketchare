//
//  CurrentUserPosts.swift
//  Sketchare
//
//  Created by RONICK on 2021/08/07.
//

import UIKit

var currentUser = User(userName: "Ronick", fullName: "김영현", profileImage: UIImage(named: "currentUserProfile"))

var currentUserPosts: [Post] =
    [Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "안녕", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_1"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "욜로", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_2"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_3"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_4"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_5"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_6"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_7"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_8"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_9"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_10"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_11"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_12"), timeStamp: "00"),
     Post(userName: currentUser.userName, fullName: currentUser.fullName, caption: "wick!!", profileImage: currentUser.profileImage, postImage: UIImage(named: "currentUserPost_13"), timeStamp: "00")
]
