//
//  MyViewController.h
//  PageTracker
//
//  Created by Alexander v. Below on 16.10.13.
//  Copyright (c) 2013 Alexander v. Below. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController
@property (nonatomic) NSString *text;
@property (nonatomic) UIColor *color;

- (id) initWithText:(NSString *)text color:(UIColor *)color;
@end
