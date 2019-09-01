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
        
//        let quote = "Haters gonna hate"
//        let attributedQuote = NSMutableAttributedString(string: quote)
//        attributedQuote.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 7, length: 5))

        controller.textData = {
//            return MGTextData(type: .text("This is an example"))
//            return MGTextData(type: .attributed(attributedQuote))
            return MGTextData(type: .plain(filename: "example", fileExtension: "txt") )
//            return MGTextData(type: .rtf(filename: "example", fileExtension: "rtf") )
//            return MGTextData(type: .html(filename: "example", fileExtension: "html") )
        }
        
        window?.rootViewController = UINavigationController(rootViewController: controller)
        window?.makeKeyAndVisible()

        return true
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
                navigationTitle: "Terms & Conditions"))
    }
}

struct TextAsset: MGTextAsset {
    var font: MGTextFont
    var image: MGTextImage
    var color: MGTextColor
    var string: MGTextString
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

