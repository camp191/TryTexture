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

class FeedTableVC: ASViewController<ASTableNode> {

    private let tableNode = ASTableNode()
    
    private var feedData: [FeedModel] = []
    private let faker = Faker(locale: "en")
    private let randoms = Randoms()
    
    private var isAddingData = false
    private var didScroll = false
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFeed()
    }
    
    private func fetchFeed() {
        if isAddingData { return }
        DispatchQueue.global(qos: .background).async {
            self.isAddingData = true
            
            let newData = self.generateData()
            self.feedData.append(contentsOf: newData)
            let indexPaths = self.mapIndexPaths(newData: newData)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.5...1)) {
                self.insertRow(indexPaths: indexPaths)
                self.isAddingData = false
            }
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
            let text = randoms.textData[Int.random(in: 0...4)]
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
        cellNode.backgroundColor = randoms.color[Int.random(in: 0..<randoms.color.count)]
        return cellNode
    }
    
    func tableNode(_ tableNode: ASTableNode, willDisplayRowWith node: ASCellNode) {
        guard let row = tableNode.indexPath(for: node)?.row else { return }
        
        if row == feedData.count - 3 {
            if didScroll {
                fetchFeed()
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        didScroll = true
    }
    
}
