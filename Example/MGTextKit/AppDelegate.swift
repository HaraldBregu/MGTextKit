//
//  AppDelegate.swift
//  MGTextKit
//
//  Created by AldoOS on 08/31/2019.
//  Copyright (c) 2019 AldoOS. All rights reserved.
//

import UIKit
import MGTextKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    @objc func functionOne(sender: UIBarButtonItem) {
        
    }
    
    @objc func functionTwo(sender: UIBarButtonItem) {
        
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let controller = MGTextController.instance
        controller.assets = Asset.assets
        
        controller.leftBarButtonItems = {
            let button2 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(AppDelegate.functionTwo))
            return [button2]
        }
        
        controller.rightBarButtonItems = {
            let button2 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AppDelegate.functionTwo))
            return [button2]
        }

        window?.rootViewController = UINavigationController(rootViewController: controller)
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}



class Asset {}

extension Asset:TextAssetImpl {}

// MARK - MGTextAsset

protocol TextAssetImpl {
    static var assets:MGTextAsset { get }
}

extension TextAssetImpl {
    static var assets:MGTextAsset {
        return TextAsset(
            font: TextFont(),
            image: TextImage(),
            color: TextColor(
                navigationBar: .black,
                navigationBarContent: .white,
                view: .black,
                viewContent: .white),
            string: TextString(
                title: "Terms & Conditions",
                navigationTitle: "Terms & Conditions"),
            data: TextData(
                url: "https://thenextweb.com/"))
    }
}

struct TextAsset: MGTextAsset {
    var font: MGTextFont
    var image: MGTextImage
    var color: MGTextColor
    var string: MGTextString
    var data: MGTextData
}

struct TextFont: MGTextFont {
    
}

struct TextImage: MGTextImage {
    
}

struct TextColor: MGTextColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
}

struct TextString: MGTextString {
    var title:String
    var navigationTitle:String
}

struct TextData: MGTextData {
    var url: String
}
