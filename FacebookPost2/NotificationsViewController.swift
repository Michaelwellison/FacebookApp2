//
//  NotificationsViewController.swift
//  FacebookPost2
//
//  Created by Michael Ellison on 6/26/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNotificationsView()

    }
    
    func configureNotificationsView() {
        var notificationsView:UIView = UIView(frame: CGRectMake(20, 50, 280, 400))
        notificationsView.backgroundColor = UIColor.whiteColor()
        notificationsView.layer.cornerRadius = 3
        
        var herImage = UIImage(named:"HerImage")
        var herImageView = UIImageView(frame: CGRectMake(5, 5, 38, 38))
        
        var herNameLabel = UILabel(frame: CGRectMake(50, 4, 95, 21))
        var herTimeLabel = UILabel(frame: CGRectMake(50, 25, 121, 21))
        
        herNameLabel.text = "Her"
        herNameLabel.adjustsFontSizeToFitWidth = true
        herTimeLabel.text = "Sunday at 4:55pm"
        herTimeLabel.font = UIFont.systemFontOfSize(12.0)
        herTimeLabel.textColor = UIColor.lightGrayColor()
        
        herImageView.image = herImage
        
        notificationsView.addSubview(herTimeLabel)
        notificationsView.addSubview(herNameLabel)
        notificationsView.addSubview(herImageView)
        self.view.addSubview(notificationsView)
        self.view.backgroundColor = UIColor.grayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
