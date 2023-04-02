//
//  AppDelegate.swift
//  PushPopPresentDismissVisualized
//
//  Created by Jeffrey Sweeney on 4/2/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    // TODO: Build push/pop options
    let presentViewController = PresentViewController()
    let dismissViewController = DismissViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        presentViewController.delegate = self
        dismissViewController.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = presentViewController
        
        return true
    }
}

extension AppDelegate: PresentViewControllerProtocol {
    func presentPressed() {
        presentViewController.present(dismissViewController, animated: true)
    }
}

extension AppDelegate: DismissViewControllerProtocol {
    func dismissPressed() {
        dismissViewController.dismiss(animated: true)
    }
}
