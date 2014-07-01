//
//  NewsViewController.swift
//  FacebookPost2
//
//  Created by Michael Ellison on 6/26/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, TTTAttributedLabelDelegate {

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
        
        // Animate UIView
        
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
        
        //This is an example of how to use TTTATTributed text in Swift
        
        // Note that the initial text is visible in the storyboard.
        
        //var attributedText = NSMutableAttributedString(attributedString: herDescriptionLabel.attributedText)
        
        
        // Use NSString so the result of rangeOfString is an NSRange, not Range<String.Index>.
        
      //  var string = NSMutableString(herDescriptionLabel.text).mutable
        
   //     herDescriptionLabel.delegate = self
        
//        var linkRange = NSRange(herDescriptionLabel.text.rangeOfString("http://bit.ly/1jV9zMB", comment:""))
        
        // Find the rang of each element to modify
//        var linkRange = NSRange(text.rangeOfString("http://bit.ly/1jV9zM8"))
        //var linkRange = text.rangeOfString(NSLocalizedString("http://bit.ly/1jV9zM8", comment:""))
        
     //   var underlinedRange = text.rangeOfString(NSLocalizedString("Casey Sotrm", comment: ""))
        
        // Make Bold
        
  //      attributedText.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.toRaw(), range: underlinedRange)
        
        // Add link
      
   //     herDescriptionLabel.addLinkToURL(NSURL.URLWithString("http://bit.ly/1jV9zM8"), withRange: linkRange)
        
        
//        label.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
//        label.delegate = self; // Delegate methods are called when the user taps on a link (see `TTTAttributedLabelDelegate` protocol)
//        
//        label.text = @"Fork me on GitHub! (http://github.com/mattt/TTTAttributedLabel/)"; // Repository URL will be automatically detected and linked
        
//        NSRange range = [label.text rangeOfString:@"me"];
//        [label addLinkToURL:[NSURL URLWithString:@"http://github.com/mattt/"] withRange:range]; // Embedding a custom link in a substring
        
        
        
        // Make Real
        
  //      herDescriptionLabel.attributedText = attributedText
        
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
