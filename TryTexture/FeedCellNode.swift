//
//  ASCellNode.swift
//  TryTexture
//
//  Created by Thanapat Sorralump on 21/12/2561 BE.
//  Copyright © 2561 Thanapat Sorralump. All rights reserved.
//

import AsyncDisplayKit

class FeedCellNode: ASCellNode {
    
        let textData = [
            "สะบึมชินบัญชรเซอร์วิส ซาตานเอฟเฟ็กต์ซาบะฟรุตป๋อหลอ โรแมนติก กับดักเป่ายิงฉุบคอนโดบึม นิวส์ กาญจนาภิเษกซะโซนซีนีเพล็กซ์แกรนด์ รีทัชปิยมิตรสตีลแชมป์ ใช้งานจิ๊กซอว์แทคติคซะปิกอัพ ปักขคณนารีดไถแฟลชปาสคาล ก่อนหน้าอุปนายกโยเกิร์ตสลัม พีเรียดสตีลซากุระอวอร์ด ชัวร์ทริปช็อป สตรอเบอร์รีอัตลักษณ์ ปิกอัพทับซ้อนฮัม พรีเมียร์สแตนดาร์ด พ่อค้าบร็อคโคลี",
            "นิวส์ สันทนาการจ๊อกกี้แพนงเชิญเยอบีร่าสเตชั่น เวิร์ลด์พูลต่อยอดแกสโซฮอล์ รีโมตไอเดียมาร์จิน หน่อมแน้ม โครนาออทิสติกตุ๊ดแฟล็ตสติ๊กเกอร์ รองรับไฟลต์ซิงเพนตากอนซัพพลายเออร์ ตุ๊กแอนด์เลิฟ แคนูเปเปอร์จูนติวลีก ราเมนรีโมตพีเรียดเทียมทานมะกัน ซัพพลายเออร์จูนโมจิจูเนียร์สตรอเบอร์รี ใช้งานแอ็คชั่นโอเคพอเพียง เป่ายิ้งฉุบสามช่าสเต็ปโฮปรูบิค เลคเชอร์รามเทพภารตะวาฟเฟิลความหมาย แคร็กเกอร์แบตอาร์ติสต์เพียบแปร้ รีทัชไอเดียเยลลี่เซอร์โหงวเฮ้ง",
            "อันตรกิริยาฟอร์ม ดีไซน์ม้าหินอ่อนมลภาวะ เยน โพลารอยด์ สแล็กอะ พาร์ตเนอร์เอสเปรสโซแตงโมคอร์ปอเรชั่นโปสเตอร์ ฟรุตสะบึมราชานุญาตแมมโบ้ แฮนด์แฟ้บ เวสต์ปาร์ตี้นอร์ท ม้าหินอ่อนแซลมอนโปรเอ็กซ์โปทัวร์ เกจิแอพพริคอทตนเองเบญจมบพิตร สคริปต์แพ็คเฟิร์มฟยอร์ดวาฟเฟิล ฟิวเจอร์เพรสสปิริตเอสเปรสโซ ต้าอ่วยนรีแพทย์ งี้บราผู้นำพุทธศตวรรษแอพพริคอท แฟรีก๊วนตาปรือไอเดีย",
            "โก๊ะ คาสิโนแคมเปญแจ๊สเซรามิกซาร์ดีน ปอดแหกแกงค์ นรีแพทย์แคนยอน ม็อบ รีไซเคิล เพียบแปร้เชอร์รี่ นางแบบสไตล์ เอ็กซ์โปออยล์ยิม พาสต้าเนอะเวิลด์แบคโฮต้าอ่วย แคมเปญฮาราคีรีแฟนตาซีโอวัลตินก๋ากั่น วิลล์ซาบะไคลแม็กซ์ ปอดแหกทาวน์มอยส์เจอไรเซอร์ หมิงคำตอบ เจไดเจี๊ยววิกทอร์นาโดป๊อป หมิง",
            "ครูเสด ดีเจแช่แข็งสกรัมเนิร์สเซอรี่เซอร์ไพรส์ เวเฟอร์แมชชีนเยลลี่อาข่าลิมูซีน พรีเมียร์ล้มเหลว เวิลด์แชมเปญวาริชศาสตร์ ธรรมาภิบาลซูเอี๋ย อุปนายกไลน์ แทงกั๊กป๊อปสุนทรีย์ แป๋วเจลโฟนไดเอ็ตแอ๊บแบ๊ว แอลมอนด์ เตี๊ยมบร็อกโคลีจ๊อกกี้เวิร์ลด์ ไวอะกร้าทัวร์ช็อปบุ๋นแฟนตาซี การันตี วอลนัตคอนเซปต์ปาสกาลโอ้ย ทำงานสไตล์ ผลไม้โปรโมเตอร์ซิงมาร์คคอมเมนต์"
        ]
    
    private let userNameNode = ASTextNode()
    private let imageNode = ASNetworkImageNode()
    
    func configure(row: Int, feed: FeedModel) {
        let attrs = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 20.0)]
        let text = "\(row) - " + textData[Int.random(in: 0...4)]
        userNameNode.attributedText = NSAttributedString(string: text, attributes: attrs)
        userNameNode.maximumNumberOfLines = 0
        userNameNode.truncationMode = .byTruncatingTail
        
        imageNode.url = URL(string: "https://wallpaperbrowse.com/media/images/3848765-wallpaper-images-download.jpg")!
        imageNode.shouldCacheImage = false
        imageNode.style.preferredSize = CGSize(width: 320, height: Int.random(in: 200...500))
        imageNode.contentMode = UIView.ContentMode.scaleAspectFill
        imageNode.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
    }
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let headerStackSpec = ASStackLayoutSpec(direction: .vertical,
                                                spacing: 20,
                                                justifyContent: .start,
                                                alignItems: .center,
                                                children: [userNameNode, imageNode])
        
        return headerStackSpec
    }
    
}
