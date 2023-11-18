//
//  MainTabBarController.swift
//  GeulGeurim
//
//  Created by walkerhilla on 11/19/23.
//

import UIKit

final class MainTabBarController: UITabBarController {
  
  private var tabNavigationControllers: [TabBarItemType: UINavigationController]
  
  init(tabNavigationControllers: [TabBarItemType: UINavigationController]) {
    self.tabNavigationControllers = tabNavigationControllers
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    configureTabBarController(tabNavigationControllers: tabNavigationControllers)
  }
  
  private func configureTabBarController(tabNavigationControllers: [TabBarItemType: UINavigationController]) {
    let appearance = UITabBarAppearance()
    appearance.configureWithDefaultBackground()
    appearance.backgroundColor = .systemBackground
    
    tabBar.backgroundColor = .systemBackground
    tabBar.tintColor = .primary
    tabBar.unselectedItemTintColor = .unSelected
    tabBar.standardAppearance = appearance
    tabBar.scrollEdgeAppearance = appearance
    
    let items = TabBarItemType.allCases.map { item -> UINavigationController in
      guard let tab = tabNavigationControllers[item] else { return UINavigationController() }
      tab.tabBarItem.image = UIImage(systemName: item.symbolValue)
      tab.tabBarItem.title = item.localizedValue
      return tab
    }
    
    viewControllers = items
  }
  
  private func createTabBarItem(of page: TabBarItemType) -> UITabBarItem {
    return UITabBarItem(
      title: page.localizedValue,
      image: UIImage(systemName: page.symbolValue),
      tag: page.indexValue
    )
  }
}
