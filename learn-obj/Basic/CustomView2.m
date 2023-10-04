//
//  CustomView2.m
//  learn-obj
//
//  Created by User on 29/09/23.
//

#import "CustomView2.h"

@implementation CustomView2
UILabel *label;
NSString *localTitle = @"default";


- (instancetype)init {
    self = [super init];
    
    [self setupLayout];
    
    return self;
}

- (void) setupLayout {
    label = [self createUILabel];
    label.text = localTitle;
    
    [self addSubview:label];
    [self setConstraintsForLabel];
}

-(UILabel *) createUILabel {
    UILabel *label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = @"Hello";
    return label;
}

-(void) setConstraintsForLabel {
    [NSLayoutConstraint activateConstraints:@[
        [label.heightAnchor constraintEqualToConstant:40]
    ]];
}
- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    localTitle = title;
    
    [self setupLayout];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectZero];
    if (self) {
       
    }
    return self;
}


@end
