//
//  ViewController.m
//  GoogleLogin
//
//  Created by specter on 12/1/17.
//  Copyright © 2016 baltech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    GIDSignInButton *signInButton;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [GIDSignIn sharedInstance].delegate = self;
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].clientID = @"589453917038-qaoga89fitj2ukrsq27ko56fimmojac6.apps.googleusercontent.com";

    [GIDSignInButton class];
    
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.shouldFetchBasicProfile = YES;
    signIn.delegate = self;
    signIn.uiDelegate = self;
    
    signInButton = [[GIDSignInButton alloc] init];
    [signInButton setFrame:CGRectMake(100, 100, 100, 50)];
    [self.view addSubview:signInButton];
    
    //自定义google按钮
    UIButton *btnGoogle = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    [btnGoogle setTitle:@"Sign in with Google" forState:UIControlStateNormal];
    [btnGoogle setBackgroundColor:[UIColor lightGrayColor]];
//    btnGoogle = [UIButton buttonWithType:UIButtonTypeCustom];
//    btnGoogle.layer.cornerRadius = 5;
//    btnGoogle.layer.shadowOffset =  CGSizeMake(2, 2);
//    btnGoogle.layer.shadowOpacity = 0.8;
//    btnGoogle.layer.shadowColor =  [UIColor lightGrayColor].CGColor;
//    btnGoogle.titleLabel.font = [UIFont systemFontOfSize:18];
//    [btnGoogle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btnGoogle];
    [btnGoogle addTarget:self action:@selector(GLogin:) forControlEvents:UIControlEventTouchUpInside];

    
}

-(void)GLogin:(UIButton *)btn
{
    [[GIDSignIn sharedInstance] signIn];
}

#pragma mark - GIDSignInDelegate
- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
   
    NSLog(@"xxsignIn: %@", signIn);
    NSLog(@"xxuser: %@", user);
    NSLog(@"xxerror: %@", error);
      [self reportAuthStatus];

}

- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    NSLog(@"signIn: %@", signIn);
    NSLog(@"user: %@", user);
    NSLog(@"error: %@", error);
}

- (void)reportAuthStatus {
   
    NSLog(@"Email: %@", [GIDSignIn sharedInstance].currentUser.profile.email);
     NSLog(@"Name: %@", [GIDSignIn sharedInstance].currentUser.profile.name);
//    [self refreshUserInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
