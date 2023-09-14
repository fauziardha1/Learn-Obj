//
//  PreVideoBankingPage.m
//  learn-obj
//
//  Created by User on 12/09/23.
//
#import "PreVideoBankingPage.h"

@implementation PreVideoBankingPageViewController

void (^routeToActivationCode)(void) = ^{};
void (^routeToVideoBanking)(void) = ^{};

- (instancetype)initWithRouteToActivationCode:( void (^)(void))activationCodeRoute routeToVideoBanking: (void (^)(void))routeTovideoBanking{
    routeToActivationCode = activationCodeRoute;
    routeToVideoBanking = routeTovideoBanking;
    return [self init];
}

- (instancetype)initWithClosure:(CompletionBlock)completion {
    routeToVideoBanking = completion;
    return self;
}

-(void) viewDidLoad {
    [super viewDidLoad];
   
    [self viewConfig];
    [self configureLayout];
}

- (void) viewConfig {
    self.view.backgroundColor = [UIColor whiteColor];
}

@end


@implementation PreVideoBankingPageViewController (LayoutExtensions)

- (void)configureLayout {
    [self configure:self.view];
}

UIButton *buttonActivationCode;
UIButton *buttonVideoBanking;
UIStackView *contentStack;
UILabel *labelChooseMethod;
UILabel *labelDetailDescription;
UILabel *labelTitleActivation;

-(void) configure:(UIView *)parent {
    buttonActivationCode = [self createButtonActivation];
    buttonVideoBanking = [self createbuttonVideoBanking];
    contentStack = [self createContentStackView];
    labelChooseMethod = [self createLabelChooseMethod];
    labelDetailDescription = [self createLabelDetailDescription];
    labelTitleActivation = [self createLabelTitleActivation];
    
    [parent addSubview:contentStack];
    [contentStack addArrangedSubview: labelTitleActivation];
    [contentStack addArrangedSubview:[self createUIView:40]];
    [contentStack addArrangedSubview:labelChooseMethod];
    [contentStack addArrangedSubview:buttonVideoBanking];
    [contentStack addArrangedSubview:buttonActivationCode];
    [contentStack addArrangedSubview:labelDetailDescription];
    [contentStack addArrangedSubview:[self createUIView:0]];

    [self setupConstraintsForContentStack:parent];
    [self setupConstraintsForButtonVideoBanking];
    [self setupConstraintsForButtonActivationCode];
}

- (void) setupConstraintsForContentStack:(UIView *)parent {
    contentStack.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *topAnchor = [contentStack.topAnchor constraintEqualToAnchor:parent.topAnchor];
    NSLayoutConstraint *leadingAnchor = [contentStack.leadingAnchor constraintEqualToAnchor:parent.leadingAnchor];
    NSLayoutConstraint *trailingAnchor = [contentStack.trailingAnchor constraintEqualToAnchor:parent.trailingAnchor];
    NSLayoutConstraint *bottomAnchor = [contentStack.bottomAnchor constraintEqualToAnchor:parent.bottomAnchor];
    
    [NSLayoutConstraint activateConstraints:@[topAnchor, leadingAnchor, trailingAnchor, bottomAnchor]];
}

- (void) setupConstraintsForButtonVideoBanking {
    buttonVideoBanking.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leadingAnchor = [buttonVideoBanking.leadingAnchor constraintEqualToAnchor:contentStack.leadingAnchor constant:16];
    NSLayoutConstraint *trailingAnchor = [buttonVideoBanking.trailingAnchor constraintEqualToAnchor:contentStack.leadingAnchor constant:-16];
    NSLayoutConstraint *heightAnchor = [buttonVideoBanking.heightAnchor constraintEqualToConstant:35];
    
    [NSLayoutConstraint activateConstraints:@[leadingAnchor, trailingAnchor, trailingAnchor, heightAnchor]];
}

- (void) setupConstraintsForButtonActivationCode {
    buttonActivationCode.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leadingAnchor = [buttonActivationCode.leadingAnchor constraintEqualToAnchor:contentStack.leadingAnchor constant:16];
    NSLayoutConstraint *trailingAnchor = [buttonActivationCode.trailingAnchor constraintEqualToAnchor:contentStack.leadingAnchor constant:-16];
    NSLayoutConstraint *heightAnchor = [buttonActivationCode.heightAnchor constraintEqualToConstant:35];
    
    [NSLayoutConstraint activateConstraints:@[leadingAnchor, trailingAnchor, trailingAnchor, heightAnchor]];
}

// create vstack
- (UIStackView *) createContentStackView {
    UIStackView *stack = [[UIStackView alloc] init];
    stack.axis = UILayoutConstraintAxisVertical;
    stack.alignment = UIStackViewAlignmentCenter;
    stack.spacing = 10;
    stack.layoutMargins = UIEdgeInsetsMake(16, 16, 16, 16);
    stack.layoutMarginsRelativeArrangement = YES;
    return stack;
}

- (UIView *) createUIView:(float)withHeight  {
    UIView * view = [[UIView alloc] init];
    if ( withHeight != 0) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40.0];
        [view addConstraint:heightConstraint];
    }
    return view;
}

- (UIButton *) createButtonActivation {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:[@"Datang ke kantor cabang BSI" uppercaseString] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:self action:@selector(actionForActivationPage) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = UIColorFromRGB(0x00A39E);
    button.layer.cornerRadius = 17.5;
    
    return button;
}

- (void) actionForActivationPage {
    routeToActivationCode();
}

- (UIButton *) createbuttonVideoBanking {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:[@"Video call" uppercaseString] forState:UIControlStateNormal];
    button.backgroundColor = UIColorFromRGB(0x00A39E);
    [button addTarget:self action:@selector(actionButtonVideoBanking) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 17.5;
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    
    return button;
}

- (void) actionButtonVideoBanking {
    routeToVideoBanking();
}

- (UILabel *) createLabelChooseMethod {
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"Pilih metode verifikasi lanjutan Anda."];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    return label;
}

- (UILabel *) createLabelDetailDescription {
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"Harap membawa/menunjukan asli e-KTP pada saat Anda melakukan verifikasi."];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    return label;
}

- (UILabel *) createLabelTitleActivation {
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"Aktivasi BSI Mobile"];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
    return label;
}
@end
