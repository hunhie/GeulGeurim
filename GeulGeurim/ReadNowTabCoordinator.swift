//
//  ReadNowTabCoordinator.swift
//  GeulGeurim
//
//  Created by walkerhilla on 11/19/23.
//

import UIKit

final class ReadNowTabCoordinator: Coordinator {
  var navigationController: UINavigationController
  var finishDelegate: CoordinatorFinishDelegate?
  var childCoordinators: [Coordinator] = []

  
  init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let readNowViewController = ReadNowViewController()
    navigationController.pushViewController(readNowViewController, animated: false)
  }
}
