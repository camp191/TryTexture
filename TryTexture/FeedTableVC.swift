//
//  ViewController.swift
//  TryTexture
//
//  Created by Thanapat Sorralump on 21/12/2561 BE.
//  Copyright © 2561 Thanapat Sorralump. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import Fakery

struct FeedModel {
    let text: String
    let image: URL?
}

struct RandomText {
    let textData = [
        "สะบึมชินบัญชรเซอร์วิส ซาตานเอฟเฟ็กต์ซาบะฟรุตป๋อหลอ โรแมนติก กับดักเป่ายิงฉุบคอนโดบึม นิวส์ กาญจนาภิเษกซะโซนซีนีเพล็กซ์แกรนด์ รีทัชปิยมิตรสตีลแชมป์ ใช้งานจิ๊กซอว์แทคติคซะปิกอัพ ปักขคณนารีดไถแฟลชปาสคาล ก่อนหน้าอุปนายกโยเกิร์ตสลัม พีเรียดสตีลซากุระอวอร์ด ชัวร์ทริปช็อป สตรอเบอร์รีอัตลักษณ์ ปิกอัพทับซ้อนฮัม พรีเมียร์สแตนดาร์ด พ่อค้าบร็อคโคลี",
        "นิวส์ สันทนาการจ๊อกกี้แพนงเชิญเยอบีร่าสเตชั่น เวิร์ลด์พูลต่อยอดแกสโซฮอล์ รีโมตไอเดียมาร์จิน หน่อมแน้ม โครนาออทิสติกตุ๊ดแฟล็ตสติ๊กเกอร์ รองรับไฟลต์ซิงเพนตากอนซัพพลายเออร์ ตุ๊กแอนด์เลิฟ แคนูเปเปอร์จูนติวลีก ราเมนรีโมตพีเรียดเทียมทานมะกัน ซัพพลายเออร์จูนโมจิจูเนียร์สตรอเบอร์รี ใช้งานแอ็คชั่นโอเคพอเพียง เป่ายิ้งฉุบสามช่าสเต็ปโฮปรูบิค เลคเชอร์รามเทพภารตะวาฟเฟิลความหมาย แคร็กเกอร์แบตอาร์ติสต์เพียบแปร้ รีทัชไอเดียเยลลี่เซอร์โหงวเฮ้ง",
        "อันตรกิริยาฟอร์ม ดีไซน์ม้าหินอ่อนมลภาวะ เยน โพลารอยด์ สแล็กอะ พาร์ตเนอร์เอสเปรสโซแตงโมคอร์ปอเรชั่นโปสเตอร์ ฟรุตสะบึมราชานุญาตแมมโบ้ แฮนด์แฟ้บ เวสต์ปาร์ตี้นอร์ท ม้าหินอ่อนแซลมอนโปรเอ็กซ์โปทัวร์ เกจิแอพพริคอทตนเองเบญจมบพิตร สคริปต์แพ็คเฟิร์มฟยอร์ดวาฟเฟิล ฟิวเจอร์เพรสสปิริตเอสเปรสโซ ต้าอ่วยนรีแพทย์ งี้บราผู้นำพุทธศตวรรษแอพพริคอท แฟรีก๊วนตาปรือไอเดีย",
        "โก๊ะ คาสิโนแคมเปญแจ๊สเซรามิกซาร์ดีน ปอดแหกแกงค์ นรีแพทย์แคนยอน ม็อบ รีไซเคิล เพียบแปร้เชอร์รี่ นางแบบสไตล์ เอ็กซ์โปออยล์ยิม พาสต้าเนอะเวิลด์แบคโฮต้าอ่วย แคมเปญฮาราคีรีแฟนตาซีโอวัลตินก๋ากั่น วิลล์ซาบะไคลแม็กซ์ ปอดแหกทาวน์มอยส์เจอไรเซอร์ หมิงคำตอบ เจไดเจี๊ยววิกทอร์นาโดป๊อป หมิง",
        "ครูเสด ดีเจแช่แข็งสกรัมเนิร์สเซอรี่เซอร์ไพรส์ เวเฟอร์แมชชีนเยลลี่อาข่าลิมูซีน พรีเมียร์ล้มเหลว เวิลด์แชมเปญวาริชศาสตร์ ธรรมาภิบาลซูเอี๋ย อุปนายกไลน์ แทงกั๊กป๊อปสุนทรีย์ แป๋วเจลโฟนไดเอ็ตแอ๊บแบ๊ว แอลมอนด์ เตี๊ยมบร็อกโคลีจ๊อกกี้เวิร์ลด์ ไวอะกร้าทัวร์ช็อปบุ๋นแฟนตาซี การันตี วอลนัตคอนเซปต์ปาสกาลโอ้ย ทำงานสไตล์ ผลไม้โปรโมเตอร์ซิงมาร์คคอมเมนต์"
    ]
}

class FeedTableVC: ASViewController<ASTableNode> {

    private let tableNode = ASTableNode()
    
    private var feedData: [FeedModel] = []
    private let faker = Faker(locale: "en")
    private var isAddingData = false
    private var didScroll = false
    
    let color: [UIColor] = [
        .purple,
        .blue,
        .white,
        .yellow,
        .red,
        .brown,
        .gray
    ]
    
    init() {
        super.init(node: tableNode)
        tableNode.delegate = self
        tableNode.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Good"
        node.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchFeed { indexPaths in
            self.insertRow(indexPaths: indexPaths)
        }
    }
    
    private func fetchFeed(completion: @escaping (([IndexPath]) -> ())) {
        if isAddingData { return }
        DispatchQueue.global(qos: .background).async {
            self.isAddingData = true
            
            let newData = self.generateData()
            self.feedData.append(contentsOf: newData)
            let indexPaths = self.mapIndexPaths(newData: newData)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.5...1)) {
                completion(indexPaths)
            }
            self.isAddingData = false
        }
    }
    
    private func insertRow(indexPaths: [IndexPath]) {
        UITableView.performWithoutAnimation {
            self.tableNode.insertRows(at: indexPaths, with: .automatic)
        }
    }
    
    private func mapIndexPaths(newData: [FeedModel]) -> [IndexPath] {
        let dataCount = feedData.count - newData.count
        var indexPaths: [IndexPath] = []
        for row in dataCount...feedData.count - 1 {
            indexPaths.append(IndexPath(row: row, section: 0))
        }
        
        return indexPaths
    }
    
    private func generateData() -> [FeedModel] {
        var newFeeds: [FeedModel] = []
        for _ in 1...10 {
            let text = RandomText().textData[Int.random(in: 0...4)]
            let url = URL(string: "https://t0.staging.blockdit.com/photos/2018/12/5c1225911b39c709c8ad8dd5_profile_thumb.jpg")
            let feedModel = FeedModel(text: text, image: url)
            newFeeds.append(feedModel)
        }
        return newFeeds
    }
    
}

extension FeedTableVC: ASTableDelegate, ASTableDataSource {
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return feedData.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let cellNode = FeedCellNode()
        cellNode.configure(row: indexPath.row, feed: feedData[indexPath.row])
        cellNode.backgroundColor = color[Int.random(in: 0..<color.count)]
        return cellNode
    }
    
    func tableNode(_ tableNode: ASTableNode, willDisplayRowWith node: ASCellNode) {
        guard let row = tableNode.indexPath(for: node)?.row else { return }
        
        if row == feedData.count - 3 {
            if didScroll {
                fetchFeed { indexPaths in
                    self.insertRow(indexPaths: indexPaths)
                }
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        didScroll = true
    }
    
}
