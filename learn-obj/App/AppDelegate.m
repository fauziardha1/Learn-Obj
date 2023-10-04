//
//  AppDelegate.m
//  learn-obj
//
//  Created by User on 08/09/23.
//

#import "AppDelegate.h"
#import "PreVideoBankingUIComposer.h"
#import "ViewController.h"
#import "VideoBankingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
UIWindow * window;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *controller = [[ViewController alloc] init];

    window.rootViewController = [[UINavigationController alloc] initWithRootViewController:controller];
    [window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}
@end
