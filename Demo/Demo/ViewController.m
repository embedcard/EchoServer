//
//  ViewController.m
//  Demo
//
//  Created by Gary Davies on 14/03/2014.
//  Copyright (c) 2014 Demo. All rights reserved.
//

#import "ViewController.h"
#import "GDRemoteLogger.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}

-(IBAction)sendButtonPressed:(id)sender {
    [[GDRemoteLogger sharedInstance] log:_msgTextField.text];
}

@end
