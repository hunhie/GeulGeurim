//
//  LibraryTabCoordinator.swift
//  GeulGeurim
//
//  Created by walkerhilla on 11/19/23.
//

import UIKit

final class LibraryTabCoordinator: Coordinator {
  var finishDelegate: CoordinatorFinishDelegate?
  var navigationController: UINavigationController
  var childCoordinators: [Coordinator] = []
  
  init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let libraryViewController = LibraryViewController()
    navigationController.pushViewController(libraryViewController, animated: false)
  }
}
