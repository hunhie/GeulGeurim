//
//  TabBarItemType.swift
//  GeulGeurim
//
//  Created by walkerhilla on 11/19/23.
//

import Foundation

enum TabBarItemType: Int, CaseIterable {
  case readNow
  case library
  case more
  
  var indexValue: Int {
    return rawValue
  }
  
  var localizedValue: String {
    switch self {
    case .readNow: return "Read Now"
    case .library: return "Library"
    case .more: return "More"
    }
  }
  
  var symbolValue: String {
    switch self {
    case .readNow: return "book.fill"
    case .library: return "books.vertical.fill"
    case .more: return "ellipsis"
    }
  }
}
