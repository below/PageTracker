//
//  MyPageViewController.m
//  PageTracker
//
//  Created by Alexander v. Below on 16.10.13.
//  Copyright (c) 2013 Alexander v. Below. All rights reserved.
//

#import "MyPageViewController.h"
#import "MyViewController.h"

@interface MyPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate> {
    NSMutableArray *_myViewControllers;
}
@property (readonly) NSArray *myViewControllers;
@end

@implementation MyPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                    navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                  options:nil];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        _myViewControllers = [NSMutableArray arrayWithObjects:
                            [[MyViewController alloc] initWithText:@"A" color:[UIColor redColor]],
                            [[MyViewController alloc] initWithText:@"B" color:[UIColor greenColor]],
                            [[MyViewController alloc] initWithText:@"C" color:[UIColor yellowColor]],
                            [[MyViewController alloc] initWithText:@"D" color:[UIColor blueColor]],
                            [[MyViewController alloc] initWithText:@"E" color:[UIColor whiteColor]],
                             nil];
        
    }
    return self;
}

- (IBAction)deleteCurrentController:(id)sender {
    UIViewController * currentVC = [self.viewControllers firstObject];
    UIViewController * nextVC = [self pageViewController:self
                       viewControllerAfterViewController:currentVC];
    BOOL forward = YES;
    if (nextVC == nil) {
        nextVC = [self pageViewController:self
       viewControllerBeforeViewController:currentVC];
        forward = NO;
    }
    if (nextVC == nil) {
        return;
    }
    else {
        [_myViewControllers removeObject:currentVC];
        [self setViewControllers:[NSArray arrayWithObject:nextVC]
                       direction:forward?UIPageViewControllerNavigationDirectionForward:
         UIPageViewControllerNavigationDirectionReverse
                        animated:YES
                      completion:nil];
    }
}

- (NSArray *)myViewControllers {
    return _myViewControllers;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    UIViewController *result = nil;
    NSInteger index;
    if (viewController == nil)
        index = 0;
    else {
        index = [_myViewControllers indexOfObject:viewController];
        index ++;
    }
    if (index < _myViewControllers.count)
        result = [_myViewControllers objectAtIndex:index];
    
    return result;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    UIViewController *result = nil;
    NSInteger index;
    if (viewController == nil) {
        index = _myViewControllers.count;
    }
    else {
        index = [_myViewControllers indexOfObject:viewController];
    }
    if (index > 0) {
        index --;
        if (index < _myViewControllers.count)
            result = [_myViewControllers objectAtIndex:index];
    }
    return result;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIViewController *vc = [_myViewControllers firstObject];
    
    [self setViewControllers:[NSArray arrayWithObject:vc] direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO completion:nil];
    
    UINavigationItem *ni = self.navigationItem;
    ni.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                          target:self action:@selector(deleteCurrentController:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
