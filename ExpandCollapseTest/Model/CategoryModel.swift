//
//  CategoryModel.swift
//  ExpandCollapseTest
//
//  Created by Krishna on 09/10/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import Foundation

//MARK: - CategoryModel
struct CategoryList : Codable {

    var subCategoty : [SubCategoryData]
    let categotyName : String?
    var isExpand : Bool?

    enum CodingKeys: String, CodingKey {
        case categotyName = "name"
        case subCategoty = "sub_category"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.subCategoty = try values.decode([SubCategoryData].self, forKey: .subCategoty)
        self.categotyName = try values.decodeIfPresent(String.self, forKey: .categotyName)
        self.isExpand = false
    }
}

//MARK: - SubCategoryData
struct SubCategoryData : Codable {

    let name : String?
    let displayName : String?

    enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
    }
}
