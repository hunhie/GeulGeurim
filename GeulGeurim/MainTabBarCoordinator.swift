//
//  MainTabBarCoordinator.swift
//  GeulGeurim
//
//  Created by walkerhilla on 11/19/23.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
  var tabBarController: UITabBarController
  var finishDelegate: CoordinatorFinishDelegate?
  var navigationController: UINavigationController
  var childCoordinators: [Coordinator] = []
  
  init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
    self.tabBarController = UITabBarController()
  }
  
  func start() {
    let readNowTabCoordinator = ReadNowTabCoordinator(UINavigationController())
    readNowTabCoordinator.start()
    
    let libraryTabCoordinator = LibraryTabCoordinator(UINavigationController())
    libraryTabCoordinator.start()
    
    let moreTabCoordinator = MoreTabCoordinator(UINavigationController())
    moreTabCoordinator.start()
    
    let tabBarController = MainTabBarController(tabNavigationControllers:
                                                  [.readNow: readNowTabCoordinator.navigationController,
                                                   .library: libraryTabCoordinator.navigationController,
                                                   .more: moreTabCoordinator.navigationController
                                                  ]
    )
    
    navigationController.pushViewController(tabBarController, animated: false)
  }
}

extension MainTabBarCoordinator: CoordinatorFinishDelegate {
  func coordinatorDidFinish(childCoordinator: Coordinator) {
    self.childCoordinators.removeAll()
    self.navigationController.viewControllers.removeAll()
    self.finishDelegate?.coordinatorDidFinish(childCoordinator: self)
  }
}
