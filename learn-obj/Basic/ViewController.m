//
//  ViewController.m
//  learn-obj
//
//  Created by User on 08/09/23.
//

#import "ViewController.h"
#import "PreVideoBankingPage.h"
#import <learn_obj-Swift.h>

@interface ViewController ()

@end

// custom type or struct
typedef struct {
    NSString *name;
    int age;
    
} Person;

// create custome classes
@interface PersonClass: NSObject
@property NSString *name;
@property int age;
@property BOOL isSingle;

- (instancetype) initWithName:(NSString *)name age:(int) age;
@end

// implementation of class
@implementation PersonClass

- (instancetype) initWithName:(NSString *)name age:(int)age {
    self = [super init];
    self->_name = name;
    self->_age = age;
    self->_isSingle = YES;
    return self;
}

@end


@implementation ViewController

UILabel *label;
UIButton *button;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self layout];
}

- (void) viewWillAppear:(BOOL)animated {
    PersonClass *person = [[PersonClass alloc] init];
    NSLog(@"personclass %@", [person description]);
    
    [self passingClosure];
}

- (void) layout {
    label = [self createLabel];
    button = [self createButton];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:label];
    [self.view addSubview:button];
    
    [self setupConstraintsForLabel];
    [self setupConstraintsForButton];
}



- (UILabel *) createLabel {
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.text = @"Hello World";
    return myLabel;
}

- (void) setupConstraintsForLabel {
    label.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerXConstraints = [NSLayoutConstraint
                                              constraintWithItem:label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *centerYConstraints = [NSLayoutConstraint
                                              constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [self.view addConstraints:@[centerXConstraints, centerYConstraints]];
}

- (UIButton *) createButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Press Me" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor systemBlueColor];
    button.tintColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    return  button;
}

-(void) buttonAction {
    NSLog(@"button was pressed!");
    UIViewController *preVideoBankingPage = [[PreVideoBankingPageViewController alloc] init];
    
    UIStoryboard *ui = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SwiftUIViewController *controller = [ui instantiateViewControllerWithIdentifier:@"MainStoryBoard"];
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) setupConstraintsForButton {
    button.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerXConstraints = [NSLayoutConstraint
                                              constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *topContraint = [NSLayoutConstraint
                                              constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: label attribute:NSLayoutAttributeBottom multiplier:1 constant:16];
    
    [self.view addConstraints:@[centerXConstraints, topContraint]];
}


@end

#import "learn-obj-Bridging-Header.h"
// TODO: How to use extensions in objective c?
@implementation ViewController (Fundamentals)

- (void) basicProgramming {
    int data = 0;
    NSLog(@"data: %d", data);
    
    // string
    NSString *simpleString = @"Hello";
    NSLog(@"simple string content: %@ \n", simpleString);
    NSUInteger wordLength = [simpleString length];
    NSLog(@"Lenght of simpleString is: %lu \n", (unsigned long)wordLength);
    
    // combining two string
    NSString *firstString = @"First String";
    NSString *secondString = @"Second String";
    NSString *combinedString = [firstString stringByAppendingString:secondString];
    NSLog(@"Result of combining string: %@", combinedString);
    
    // replacing word in string
    combinedString = [combinedString stringByReplacingOccurrencesOfString:@"String" withString:@"Word "];
    NSLog(@"Result of replacing word in string: %@", combinedString);
    NSLog(@"%@", [combinedString lowercaseString]);
    
    // empty string
    NSString *emptyString = @"";
    NSLog(@"length of emptystring is: %lu", (unsigned long)[emptyString length]);
    
    // integer
    int myInt = 0;
    NSLog(@"%d", myInt);
    
    // float/double
    float myfloat = 1;
    NSLog(@"myfloat: %f", myfloat);
    
    double mydouble = 1;
    NSLog(@"mydouble: %f", mydouble);
    
    // boolean
    BOOL isGood = YES;
    NSLog(@"my boolean: %d", isGood);
    
    // array
    NSArray *myArr = @[@1,@2,@3, @"banana", @YES, @1.3];
    NSLog(@"content of array: %@", myArr);
    
    
    // dictionary
    NSDictionary *myDict = @{@"url": @"https://apple.com", @"message": @"please be kind!"};
    NSLog(@"mydict is: %@", myDict);

    // custome type
    Person person;
    person.name = @"hello";
    person.age = 12;
    NSLog(@"person struct: %@", person.name);
    
    self.view.backgroundColor = [UIColor systemBlueColor];
}

- (void) hello {
    NSLog(@"hello");
}

- (void) usingClosure:(void (^)(int data))completion {
    completion(2);
}

- (void) passingClosure {
    [self usingClosure:^(int data) {
        NSLog(@"data times 2 : %d", data*2);
    }];
}

@end
