//
//  MyViewController.m
//  PageTracker
//
//  Created by Alexander v. Below on 16.10.13.
//  Copyright (c) 2013 Alexander v. Below. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak) UILabel * textLabel;
@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithText:(NSString *)text color:(UIColor *)color {
    if (self == [self initWithNibName:nil bundle:nil]) {
        self.text = text;
        self.color = color;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = self.color;
    
    CGRect frame = self.view.bounds;
    CGRectInset(frame, 40, 40);
    UILabel * textLabel = [[UILabel alloc] initWithFrame:frame];
    [self.view addSubview:textLabel];
    self.textLabel = textLabel;
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.font = [UIFont systemFontOfSize:128];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.text = _text;
}

- (void)setText:(NSString *)text {
    _text = text;
    self.textLabel.text = text;
}

- (void) setColor:(UIColor *)color {
    _color = color;
    self.view.backgroundColor = _color;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
