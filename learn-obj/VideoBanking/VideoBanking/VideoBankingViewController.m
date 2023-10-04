//
//  VideoBankingViewController.m
//  learn-obj
//
//  Created by User on 15/09/23.
//

#import "VideoBankingViewController.h"
#import "Color.h"

@implementation VideoBankingViewController

void (^routeToVideoCallScreen)(void) = ^{};

-(void)viewDidLoad {
    [super viewDidLoad];
    [self configureLayout];
}

@end

@implementation VideoBankingViewController (Layout)

UIView *whiteBackground;
UIView *greenBackground;
UIImageView *imageView;
UIView *spacer;
UILabel *title;
UILabel *subTitle;
UIButton *videoButton;
UIStackView *bottomStackView;
UILabel *toolTip;
UIView *toolTipBackground;

- (void)configureLayout {
    self.view.backgroundColor = UIColorFromRGB(0x00A39E);
    
    [self composeLayout];
}

-(void) composeLayout {
    greenBackground = [self createGreenBackground];
    whiteBackground = [self createWhiteBackground];
    imageView = [self createUIImageView];
    spacer = [self createSpacer];
    title = [self createTitle];
    subTitle = [self createSubTitle];
    videoButton = [self createButtonVideo];
    toolTip = [self createToolTip];
    toolTipBackground = [self createToolTipBackground];
    
    [self.view addSubview:greenBackground];
    [self.view addSubview:spacer];
    [self.view addSubview:whiteBackground];
    [self.view addSubview:imageView];
    [self.view addSubview:title];
    [self.view addSubview:subTitle];
    [self.view addSubview:videoButton];
    [self.view addSubview:toolTipBackground];
    [self.view addSubview:toolTip];
    
    
    [self setConstraintsForGreenBackground];
    [self setConstraintsForSpacer];
    [self setConstraintsForWhiteBackground];
    [self setConstraintsForImageView];
    [self setConstraintsForTitle];
    [self setConstraintsForSubTitle];
    [self setConstraintsForVideoButton];
    [self setConstraintsForToolTipBackground];
    [self setConstraintsForToolTip];
   
    
    
}

- (UIView *) createWhiteBackground {
    UIView *view = [UIView new];
    [view setBackgroundColor:[UIColor whiteColor]];
    view.layer.cornerRadius = 20;
    return view;
}

- (UIView *) createGreenBackground {
    UIImageView *image = [UIImageView new];
    image.image = [UIImage imageNamed:@"image_bg_video_banking"];
    image.contentMode = UIViewContentModeScaleAspectFit;
    return image;
    return image;
}

- (UIImageView *) createUIImageView {
    UIImageView *image = [UIImageView new];
    image.image = [UIImage imageNamed:@"image_video_banking"];
    image.contentMode = UIViewContentModeScaleAspectFit;
    return image;
}

-(UIView *) createSpacer {
    UIView *view = [UIView new];
    return view;
}

-(UILabel *) createTitle {
    UILabel * label = [UILabel new];
    [label setText:@"Sekarang Anda akan melakukan verifikasi melalui Video Call"];
    label.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

-(UILabel *) createSubTitle {
    UILabel * label = [UILabel new];
    [label setText:@"Pastikan Anda terhubung dengan jaringan Internet yang Stabil"];
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor lightGrayColor];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

-(UIButton *) createButtonVideo {
    UIButton *button = [UIButton new];
    [button setBackgroundImage:[UIImage imageNamed:@"video_camera"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(videoButtonAction) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 50;
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 0.5;
    button.layer.shadowOffset = CGSizeMake(0, 3);
    button.layer.masksToBounds = NO;
    return button;
}

-(UILabel *) createToolTip {
    UILabel *label = [UILabel new];
    [label setText:@"Klik tombol disamping untuk melakukan video call"];
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:16];
    label.layer.masksToBounds = YES;
    return label;
}

-(UIView *) createToolTipBackground {
    UIView *view = [UIView new];
    [view setFrame:CGRectMake(0, 0, 200, 50)];
    view.layer.cornerRadius = 10;
    view.layer.masksToBounds = YES;
    view.backgroundColor = UIColorFromRGB(0x00A39E);
    return view;
}

-(void) setConstraintsForWhiteBackground {
    whiteBackground.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leadingAnchor = [whiteBackground.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor];
    NSLayoutConstraint *trailingAnchor = [whiteBackground.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor];
    NSLayoutConstraint *bottomAnchor = [whiteBackground.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:50];
    NSLayoutConstraint *heightAnchor = [whiteBackground.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.75];
    
    [NSLayoutConstraint activateConstraints:@[leadingAnchor, trailingAnchor, bottomAnchor, heightAnchor]];
}

-(void) setConstraintsForImageView {
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *leadingAnchor = [imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16];
    NSLayoutConstraint *trailingAnchor = [imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16];
    NSLayoutConstraint *bottom = [imageView.bottomAnchor constraintEqualToAnchor:whiteBackground.topAnchor constant: 150];
    
    [NSLayoutConstraint activateConstraints:@[leadingAnchor, trailingAnchor, bottom]];
}

-(void) setConstraintsForGreenBackground {
    greenBackground.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *leadingAnchor = [greenBackground.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor];
    NSLayoutConstraint *trailingAnchor = [greenBackground.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor];
    NSLayoutConstraint *bottomAnchor = [greenBackground.bottomAnchor constraintEqualToAnchor:spacer.topAnchor];
    NSLayoutConstraint *widthAnchor = [greenBackground.widthAnchor constraintEqualToAnchor:self.view.widthAnchor];
    NSLayoutConstraint *heightAnchor= [greenBackground.heightAnchor constraintEqualToAnchor:self.view.heightAnchor];
    
    [NSLayoutConstraint activateConstraints:@[bottomAnchor, leadingAnchor, trailingAnchor, widthAnchor, heightAnchor ]];
}

-(void) setConstraintsForSpacer {
    spacer.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *leadingAnchor = [spacer.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor];
    NSLayoutConstraint *trailingAnchor = [spacer.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor];
    NSLayoutConstraint *bottomAnchor = [spacer.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor];
    NSLayoutConstraint *heightAnchor= [spacer.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.3];
    
    [NSLayoutConstraint activateConstraints:@[leadingAnchor, trailingAnchor, bottomAnchor, heightAnchor]];
}

-(void) setConstraintsForTitle {
    title.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *topAnchor = [title.topAnchor constraintEqualToAnchor:imageView.bottomAnchor constant:-48];
    NSLayoutConstraint *leadingAnchor = [title.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16];
    NSLayoutConstraint *trailingAnchor = [title.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16];
    
    [NSLayoutConstraint activateConstraints:@[topAnchor, leadingAnchor, trailingAnchor]];
}

-(void) setConstraintsForSubTitle {
    subTitle.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *topAnchor = [subTitle.topAnchor constraintEqualToAnchor:title.bottomAnchor constant:8];
    NSLayoutConstraint *leadingAnchor = [subTitle.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16];
    NSLayoutConstraint *trailingAnchor = [subTitle.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16];
    
    [NSLayoutConstraint activateConstraints:@[topAnchor, leadingAnchor, trailingAnchor]];
}

-(void) setConstraintsForVideoButton {
    videoButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *bottomAnchor = [videoButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-16];
    NSLayoutConstraint *trailingAnchor = [videoButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16];
    NSLayoutConstraint *heightAnchor = [videoButton.heightAnchor constraintEqualToConstant:75];
    NSLayoutConstraint *widthAnchor = [videoButton.widthAnchor constraintEqualToConstant:75];

    [NSLayoutConstraint activateConstraints:@[ bottomAnchor, trailingAnchor, heightAnchor, widthAnchor] ];
}

-(void) setConstraintsForToolTip {
    toolTip.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *bottomAnchor = [toolTip.bottomAnchor constraintEqualToAnchor:toolTipBackground.bottomAnchor constant:-8];
    NSLayoutConstraint *trailingAnchor = [toolTip.trailingAnchor constraintEqualToAnchor:videoButton.leadingAnchor constant:-16];
    NSLayoutConstraint *leadingAnchor = [toolTip.leadingAnchor constraintEqualToAnchor:toolTipBackground.leadingAnchor constant:8];

    [NSLayoutConstraint activateConstraints:@[ bottomAnchor, trailingAnchor, leadingAnchor] ];
}

-(void) setConstraintsForToolTipBackground {
    toolTipBackground.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *bottomAnchor = [toolTipBackground.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-30];
    NSLayoutConstraint *trailingAnchor = [toolTipBackground.trailingAnchor constraintEqualToAnchor:videoButton.leadingAnchor constant:-16];
    NSLayoutConstraint *heightAnchor = [toolTipBackground.heightAnchor constraintEqualToConstant:50];
    NSLayoutConstraint *widthAnchor = [toolTipBackground.widthAnchor constraintEqualToConstant:250];

    [NSLayoutConstraint activateConstraints:@[ bottomAnchor, trailingAnchor, heightAnchor, widthAnchor] ];
}

-(void) videoButtonAction {
    toolTip.hidden = !toolTip.isHidden;
    toolTipBackground.hidden = !toolTipBackground.isHidden;
    
    [self showAlert];
}


- (void)showAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"Perhatian proses ini akan direkam" preferredStyle:UIAlertControllerStyleAlert];

    // Create an action for the OK button
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ya" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        routeToVideoCallScreen();
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Batal" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Handle the OK button action here, if needed
    }];

    // Add the OK action to the alert controller
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];

    // Present the alert controller
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
