//
//  MoreTabCoordinator.swift
//  GeulGeurim
//
//  Created by walkerhilla on 11/19/23.
//

import UIKit

final class MoreTabCoordinator: Coordinator {
  var finishDelegate: CoordinatorFinishDelegate?
  var navigationController: UINavigationController
  var childCoordinators: [Coordinator] = []
  
  init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let moreViewController = MoreViewController()
    navigationController.pushViewController(moreViewController, animated: false)
  }
}
