//
//  FFRegisterViewController.m
//  videoworld
//
//  Created by francis zhuo on 2018/11/17.
//  Copyright © 2018 fenfeilove. All rights reserved.
//

#import "FFRegisterViewController.h"

@interface FFRegisterViewController ()
@property(weak)IBOutlet UIScrollView* scrollView;
@property(weak)IBOutlet NSLayoutConstraint* scrollViewBottomConstraint;
@property(weak)IBOutlet UIButton* backLoginButton;
@property(weak)IBOutlet UITextField* accountTextField;
@property(weak)IBOutlet UITextField* passwordTextField;
@property(weak)IBOutlet UITextField* phoneTextField;
@property(weak)IBOutlet UITextField* validationTextField;
@end

@implementation FFRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self configStatusBar];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
- (void)configStatusBar{
    self.navigationController.title = @"regist";
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)keyBoardDidShow:(NSNotification *)notif {
    NSLog(@"===keyboar showed====");
    //    get keyboard size
    NSDictionary *info = [notif userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    self.scrollViewBottomConstraint.constant = keyboardSize.height;

    CGRect viewRect = [self.backLoginButton frame];
    [self.scrollView scrollRectToVisible:viewRect animated:YES];
}

- (void)keyBoardDidHide:(NSNotification *)notif {
    self.scrollViewBottomConstraint.constant = 0;
}

- (IBAction)onTouchRegist:(id)sender{
//    [self.accountTextField resignFirstResponder];
//    [self.passwordTextField resignFirstResponder];
//    [self.phoneTextField resignFirstResponder];
//    [self.validationTextField resignFirstResponder];
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.accountTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];
    [self.validationTextField resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
