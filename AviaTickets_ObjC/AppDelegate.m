//
//  AppDelegate.m
//  AviaTickets_ObjC
//
//  Created by Илалов Динар on 29/11/2018.
//  Copyright © 2018 Илалов Динар. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect frame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame: frame];
    
    MainViewController *mainViewController = [MainViewController new];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    self.window.rootViewController = navController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
