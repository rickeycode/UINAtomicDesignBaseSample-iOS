//
//  HomeModule.swift
//  UINAtomicDesignBaseSample
//
//  Created by 田中 佑 on 2019/01/30.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation
import AtomicUIModules

protocol ViewModelProtocol {}
protocol CellModelProtocol {
    func configure(vm: ViewModelProtocol)
}

struct Home {
    
    enum SectionType {
        case topHeader
        case topContent
        case listContent
        case recommend
        case topicsHeader
        case topicsContent
        
        static var cellIdentifers: [String] {
            return [
                Home.SectionType.topHeader.identifer,
                Home.SectionType.topContent.identifer,
                Home.SectionType.listContent.identifer,
                Home.SectionType.recommend.identifer,
                Home.SectionType.topicsHeader.identifer,
                Home.SectionType.topicsContent.identifer
            ]
        }
        
        var identifer: String {
            switch self {
            case .topHeader:
                return "MLCContentTitleCell"
            case .topContent:
                return "MLCContentTitleCell"
            case .listContent:
                return "MLCContentTitleCell"
            case .recommend:
                return "MLCContentTitleCell"
            case .topicsHeader:
                return "MLCContentTitleCell"
            case .topicsContent:
                return "MLCContentTitleCell"
            }
        }
    }
    
    struct TopHeader: ViewModelProtocol {
        let title = "今日のオススメ記事"
    }
    
    struct TopContent: ViewModelProtocol {
        let content = Content()
        let user = User()
        
        static var contents: [TopContent] {
            var contents: [TopContent] = []
            for _ in 0...3 {
                contents.append(TopContent())
            }
            return contents
        }
    }
    
    struct ListContent: ViewModelProtocol {
        let content = Content()
        let user = User()
        
        static var contents: [ListContent] {
            var contents: [ListContent] = []
            for _ in 0...5 {
                contents.append(ListContent())
            }
            return contents
        }
    }
    
    struct Recommend: ViewModelProtocol {
        let detailText = "閲覧履歴をもとに作成された以下のキーワードでおすすめを表示しています。"
        let keywords = ["ラーメン", "リフォーム", "カレーライス"]
    }
    
    struct TopicsHeader: ViewModelProtocol {
    }
    
    struct TopicsContent: ViewModelProtocol {
        let title = "星野源 最新アルバムが初登場1位"
        let time = "20時間前"
        let thunb = URL(string: "")
        
        static var contents: [TopicsContent] {
            var contents: [TopicsContent] = []
            for _ in 0...5 {
                contents.append(TopicsContent())
            }
            return contents
        }
    }
    
    struct Content {
        let image = URL(string: "")
        let tags = ["今日の厳選", "おすすめ度95%"]
        let title = "コメといいねで押したいならこれくらいしてみるタイトル全だしで3行くらいになる？"
    }
    
    struct User {
        let thumb = URL(string: "")
        let name = "安田美沙子"
        let time = "20時間前"
        let iine = 1226
    }
}

struct HomeSection {
    let cellModels: [ViewModelProtocol]
    let type: Home.SectionType
}
