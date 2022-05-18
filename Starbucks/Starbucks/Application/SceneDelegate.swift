//
//  SceneDelegate.swift
//  Starbucks
//
//  Created by 송태환 on 2022/05/09.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo _: UISceneSession,
    options _: UIScene.ConnectionOptions
  ) {
    guard let scene = (scene as? UIWindowScene) else {
      return
    }

    let homeNavigation = UINavigationController(rootViewController: HomeController())
    let orderNavigation = UINavigationController(rootViewController: OrderController())
    let payNavigation = UINavigationController(rootViewController: PayController())
    let favouriteNavigation = UINavigationController(rootViewController: FavouriteController())

    let tabBarController = UITabBarController()
    tabBarController.setViewControllers(
      [
        homeNavigation,
        payNavigation,
        orderNavigation,
        favouriteNavigation
      ],
      animated: true
    )

    homeNavigation.tabBarItem = .init(
      title: "Home",
      image: .init(systemName: "house.fill"),
      tag: 0
    )

    payNavigation.tabBarItem = .init(
      title: "Pay",
      image: .init(systemName: "creditcard"),
      tag: 1
    )

    orderNavigation.tabBarItem = .init(
      title: "Order",
      image: .init(systemName: "cup.and.saucer.fill"),
      tag: 2
    )

    favouriteNavigation.tabBarItem = .init(
      tabBarSystemItem: .favorites,
      tag: 3
    )

    self.window = UIWindow(windowScene: scene)
    self.window?.rootViewController = tabBarController
    self.window?.makeKeyAndVisible()
  }
}
