//
//  DrawingViewController.swift
//  Sketchare
//
//  Created by RONICK on 2021/08/02.
//

import UIKit

class DrawingViewController: UIViewController {

    @IBOutlet var txtCaption: UITextField!
    @IBOutlet var imgCanvas: UIImageView!
    
    @IBOutlet var btnTools: [UIButton]!
    
    var lastPoint: CGPoint! // 최근에 터치하거나 이동한 위치
    var lineSize: CGFloat = 2.0 // 선 두께
    var lineColor = UIColor.black.cgColor // 선 색깔
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch // 터치 가져오기
        
        lastPoint = touch.location(in: imgCanvas) // 캔버스에서 터치된 위치
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgCanvas.frame.size) // 콘텍스트 사이즈를 캔버스 사이즈와 같게 설정
        
        let context = UIGraphicsGetCurrentContext()! // 생성한 콘텍스트 정보 가져오기
        context.setStrokeColor(lineColor) // 선 색 설정
        context.setLineCap(CGLineCap.round) // 라인 끝모양을 둥글게
        context.setLineWidth(lineSize) // 선 두께 설정
        
        let touch = touches.first! as UITouch // 현재 터치 이벤트 가져오기
        let currentPoint = touch.location(in: imgCanvas) // 캔버스에서 현재 터치 위치 가져오기
        
        // 현재 캔버스의 이미지를 캔버스 크기로 그린다(기존 이미지에 그림을 계속 누적)
        imgCanvas.image?.draw(in: CGRect(x: 0, y: 0, width: imgCanvas.frame.width, height: imgCanvas.frame.height))
        
        context.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y)) // 직전 위치에서
        context.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y)) // 현재 위치로 라인 그리기
        context.strokePath() // 마지막으로 콘텍스트에 반영하기
        
        imgCanvas.image = UIGraphicsGetImageFromCurrentImageContext() // 콘텍스트에 그려진 이미지를 캔버스에 저장
        UIGraphicsEndImageContext() // 그리기 마침
        
        lastPoint = currentPoint // 계속 반복
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgCanvas.frame.size)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(lineColor)
        context.setLineCap(CGLineCap.round)
        context.setLineWidth(lineSize)
        
        imgCanvas.image?.draw(in: CGRect(x: 0, y: 0, width: imgCanvas.frame.width, height: imgCanvas.frame.height))
        
        // 터치를 땟을 때 라인을 더 그리지 않고 마친다
        context.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        context.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        context.strokePath()
        
        
        imgCanvas.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    

    @IBAction func btnShare(_ sender: UIButton) {
        FeedViewController.posts.append(Post(userName: "Kevin", fullName: "케빈", caption: "욜로", profileImage: UIImage(named: "profile"), postImage: imgCanvas.image, timeStamp: "00"))
        
        self.tabBarController?.selectedIndex = 0 // 피드 뷰로 이동
    }
    
    // 팬
    @IBAction func btnDraw(_ sender: UIButton) {
        //sender.tintColor = UIColor.blue
        lineSize = 2.0
    }
    
    // 지우개
    @IBAction func btnErase(_ sender: UIButton) {
        //sender.tintColor = UIColor.blue
        imgCanvas.image = nil
    }
    
    // 색칠
    @IBAction func btnPaint(_ sender: UIButton) {
        //sender.tintColor = UIColor.blue
        lineSize = 6.0
    }
    
    
    // 색 설정
    @IBAction func btnColorBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    @IBAction func btnColorBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
    }
    @IBAction func btnColorGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
    }
    @IBAction func btnColorYellow(_ sender: UIButton) {
        lineColor = UIColor.yellow.cgColor
    }
    @IBAction func btnColorRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
    }
    @IBAction func btnColorPurple(_ sender: UIButton) {
        lineColor = UIColor.purple.cgColor
    }
}
