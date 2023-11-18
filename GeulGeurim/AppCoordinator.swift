//
//  AppCoordinator.swift
//  GeulGeurim
//
//  Created by walkerhilla on 11/19/23.
//

import UIKit

final class AppCoordinator: Coordinator {
  var finishDelegate: CoordinatorFinishDelegate?
  var childCoordinators: [Coordinator] = []
  var navigationController: UINavigationController
  var window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
    self.navigationController = UINavigationController()
  }
  
  func start() {
    let mainTabBarCoordinator = MainTabBarCoordinator(self.navigationController)
    childCoordinators.append(mainTabBarCoordinator)
    
    mainTabBarCoordinator.finishDelegate = self
    mainTabBarCoordinator.start()
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
}

extension AppCoordinator: CoordinatorFinishDelegate {
  func coordinatorDidFinish(childCoordinator: Coordinator) {
      self.childCoordinators.removeAll()
      self.navigationController.viewControllers.removeAll()
      self.finishDelegate?.coordinatorDidFinish(childCoordinator: self)
  }
}
