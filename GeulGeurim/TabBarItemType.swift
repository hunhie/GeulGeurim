//
//  TabBarItemType.swift
//  GeulGeurim
//
//  Created by walkerhilla on 11/19/23.
//

import Foundation

/// 앱 메인 탭 바의 탭 종류에 대한 열거형.
///
/// __Cases__
/// - readNow: "Read Now" 탭을 나타냄
/// - library: "Library" 탭을 나타냄
/// - more: "More" 탭을 나타냄
///
/// __Properties__
/// - indexValue: 탭 index 정수 반환
/// - localizedValue: 다국어 처리된 타이틀 문자열 반환
/// - symbolValue: 탭 심볼 문자열 반환
enum TabBarItemType: Int, CaseIterable {
  case readNow
  case library
  case more
  
  var indexValue: Int {
    return rawValue
  }
  
  
  var localizedValue: String {
    switch self {
    case .readNow: return NSLocalizedString("ReadNow", comment: "ReadNow Tab Title")
    case .library: return NSLocalizedString("Library", comment: "Library Tab Title")
    case .more: return NSLocalizedString("More", comment: "More Tab Title")
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
