//
//  AppDelegate.swift
//  FacebookPost2
//
//  Created by Michael Ellison on 6/26/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    
        // News View Controller within Navigation Controller
        let newsViewController: NewsViewController = NewsViewController(nibName:"NewsViewController", bundle:nil)
        var newsNavigationController = UINavigationController(rootViewController: newsViewController)
        newsViewController.tabBarItem.title = "News Feed"
        newsViewController.tabBarItem.image = UIImage(named: "newsfeedicon")
        
        // Requests View Controller within Navigation Controller
        var requestsViewController: RequestsViewController = RequestsViewController(nibName:"RequestsViewController", bundle:nil)
        var requestsNavigationController = UINavigationController(rootViewController: requestsViewController)
        requestsViewController.tabBarItem.title = "Requests"
        requestsViewController.tabBarItem.image = UIImage(named: "requestsicon")
        
        // Messages View Controller within Navigation Controller
        var messagesViewController = MessagesViewController(nibName: "MessagesViewController", bundle: nil)
        var messagesNavigationController = UINavigationController(rootViewController: messagesViewController)
        messagesViewController.tabBarItem.title = "Messages"
        messagesViewController.tabBarItem.image = UIImage(named: "messagesicon")
        
        //Nofitifications View Controller within Navigation Controller
        var notificationsViewController = NotificationsViewController(nibName: "NotificationsViewController", bundle: nil)
        var notificationsNavigationController = UINavigationController(rootViewController: notificationsViewController)
        notificationsViewController.tabBarItem.title = "Notifications"
        notificationsViewController.tabBarItem.image = UIImage(named: "notificationsimage")
        
        // "More" View Controller within Navigation Controller
        var moreViewController = MoreViewController(nibName: "MoreViewController", bundle: nil)
        var moreNavigationController = UINavigationController(rootViewController: moreViewController)
        moreViewController.tabBarItem.title = "More"
        moreViewController.tabBarItem.image = UIImage(named: "moreicon")
        
        
        // Create the Tab Bar Controller and create an array of View Controllers as tabs
        var tabBarController = UITabBarController()
        tabBarController.viewControllers = [newsNavigationController, requestsViewController, messagesViewController, notificationsViewController, moreViewController]
        
        // set the tabBarController as the RootViewController
        
        self.window!.rootViewController = tabBarController
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

