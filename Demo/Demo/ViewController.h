//
//  ViewController.h
//  Demo
//
//  Created by Gary Davies on 14/03/2014.
//  Copyright (c) 2014 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *msgTextField;

-(IBAction)sendButtonPressed:(id)sender;

@end
