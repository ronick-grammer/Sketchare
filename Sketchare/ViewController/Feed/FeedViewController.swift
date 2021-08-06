//
//  FeedViewController.swift
//  Sketchare
//
//  Created by RONICK on 2021/08/02.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(FeedViewCell.nib(), forCellReuseIdentifier: FeedViewCell.identifier) // 셀 등록
        table.delegate = self
        table.dataSource = self
        
        posts.append(Post(userName: "Ronick", fullName: "로닉", caption: "안녕", profileImageName: "sketch", postImageName: "sketch", timeStamp: "00"))

        posts.append(Post(userName: "Kevin", fullName: "케빈", caption: "욜로", profileImageName: "profile", postImageName: "sketch", timeStamp: "00"))

        posts.append(Post(userName: "wick", fullName: "윅", caption: "wick!!", profileImageName: "profile", postImageName: "sketch", timeStamp: "00"))
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 보여줄 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    // 각 셀 보여주기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedViewCell.identifier, for: indexPath) as! FeedViewCell
        cell.configure(with: posts[indexPath.row])
        return cell
    }
    
    // 테이블 셀 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 630
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

