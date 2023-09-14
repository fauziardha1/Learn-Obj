//
//  PreVideoBankingUIComposer.m
//  learn-obj
//
//  Created by User on 12/09/23.
//

#import "PreVideoBankingUIComposer.h"

@implementation PreVideoBankingUIComposer

- (UIViewController *)makeController {
    int data = 1;
    UIViewController *controller = [[PreVideoBankingPageViewController alloc] initWithRouteToActivationCode:^{
        NSLog(@"From App Delegate. Route to Activation Code Page.");
    } routeToVideoBanking:^{
        NSLog(@"From App Delegate. Route to Video Banking Page.");
    }];
    
    return  controller;
}

@end
