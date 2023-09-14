//
//  PreVideoBankingPage.h
//  learn-obj
//
//  Created by User on 12/09/23.
//
#import <UIKit/UIKit.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

typedef void (^CompletionBlock)(void);

@interface PreVideoBankingPageViewController: UIViewController

-(instancetype)initWithRouteToActivationCode:(CompletionBlock)routeToActivationCode routeToVideoBanking: (CompletionBlock)routeTovideoBanking;
@end


@interface PreVideoBankingPageViewController (LayoutExtensions)
-(void) configureLayout;
@end


