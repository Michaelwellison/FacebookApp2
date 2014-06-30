//
//  NewsViewController.swift
//  FacebookPost2
//
//  Created by Michael Ellison on 6/26/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    // MARK: Properties
    @IBOutlet var postTextView: UIView

    @IBOutlet var mainPostView: UIView

    // Outlets


    @IBOutlet var herDescriptionLabel: TTTAttributedLabel
    @IBOutlet var postTextField: UITextField
    
    // Button Outlets
    @IBOutlet var likeButton: UIButton
    @IBOutlet var commentButton: UIButton
    @IBOutlet var shareButton: UIButton
    @IBOutlet var postButton: UIButton
    

    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
        // MARK: View LifeCycle

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureMainPostView()
        configureHerDescriptionLabel()
        configureNotificationCenter()
    
    
    }

    
    // MARK: Configuration
    
    func configureNavigationBar() {
        
        // Configure Left Navigation Bar Item
        var leftNavigationBarImage = UIImage(named: "leftNavigationBarImage").imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        var leftNavigationBarButton = UIBarButtonItem(image: leftNavigationBarImage, style: UIBarButtonItemStyle.Plain, target: self, action: "onLeftNavigationButton")
        navigationItem.leftBarButtonItem = leftNavigationBarButton
        
        // Configure Right Navigation Bar Item
        var rightNavigationBarImage = UIImage(named: "rightNavigationBarImage").imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        var rightNavigationBarButton = UIBarButtonItem(image: rightNavigationBarImage, style: UIBarButtonItemStyle.Plain, target: self, action: "onRightNavigationButton")
        navigationItem.rightBarButtonItem = rightNavigationBarButton
        
        // Configure Navigation Bar Background
        navigationController.navigationBar.translucent = false
        navigationController.navigationBar.barTintColor = UIColor(red: 0.23, green: 0.35, blue: 0.60, alpha: 1)
        
        // Configure Navigation Bar title
        navigationItem.title = "Post"
        var titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController.navigationBar.titleTextAttributes = titleDict
        
    }
    
    func configureNotificationCenter() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willShowKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willHideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func configureMainPostView() {
    
        mainPostView.backgroundColor = UIColor.whiteColor()
        mainPostView.layer.cornerRadius = 3

        mainPostView.layer.shadowColor = UIColor.blackColor().CGColor
        mainPostView.layer.shadowOffset = CGSizeMake(5, 5)
        mainPostView.layer.shadowOpacity = 0.8
        mainPostView.layer.shadowRadius = 3
    
    }
    
    func willShowKeyboard(notification:NSNotification) {
        var userInfo = notification.userInfo
        
        var kbSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as NSValue).CGRectValue().size
        
        
        // Get the animation duration and curve from the notification
        
        var durationValue = NSNumber()
        durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = NSTimeInterval(durationValue.doubleValue)
        var curveValue = NSNumber()
        curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.intValue
        
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {self.postTextView.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.postTextView.frame.size.height, self.postTextView.frame.size.width, self.postTextView.frame.size.height)}, completion: nil)
       
    }
    
    func willHideKeyboard(notification: NSNotification) {
        var userInfo = notification.userInfo
        
        
        var durationValue = NSNumber()
        durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = NSTimeInterval(durationValue.doubleValue)
        var curveValue = NSNumber()
        curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.intValue
        
        // Move the keyboard
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {self.postTextView.frame = CGRectMake(0, 414, self.postTextView.frame.size.width, self.postTextView.frame.size.height)}, completion: nil)
    }
    
    func configureHerDescriptionLabel() {
        
     //   var text = herDescriptionLabel.text as NSString
     //   var linkRang = text.rangeOfString(NSLocalizedString(
        
        
    }
    
    func toggleLikeButton() {
        
    }
    
    // MARK: Actions

    @IBAction func onLikeButton(sender: AnyObject) {
        
        likeButton.selected = !likeButton.selected
            
        println("button clicked")
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
