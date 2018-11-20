//
//  FFLoginViewController.m
//  videoworld
//
//  Created by francis zhuo on 2018/11/17.
//  Copyright © 2018 fenfeilove. All rights reserved.
//

#import "FFLoginViewController.h"
#import "FFRegisterViewController.h"

#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define UIColorFromRGB(rgbValue) UIColorFromRGBA(rgbValue, 1.0)

@interface FFLoginViewController ()<UITextFieldDelegate>
@property(weak)IBOutlet UITextField* nameTextField;
@property(weak)IBOutlet UITextField* passTextField;
@property(weak)IBOutlet UIButton* loginButton;
@property(nonatomic,strong)UIViewController* registVC;
@end

@implementation FFLoginViewController
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _registVC = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLoginButton) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self configStatusBar];
    [self updateLoginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configStatusBar{
    self.navigationController.title = @"login";
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (IBAction)onTouchLogin:(id)sender{
    
}
- (UIViewController*)registVC{
    if(!_registVC){
        _registVC = [[FFRegisterViewController alloc] init];
    }
    return _registVC;
}
- (IBAction)onTouchRegist:(id)sender{
    NSLog(@"%s",__func__);
    [self.navigationController pushViewController:self.registVC animated:YES];
}
- (IBAction)onTextChanged:(id)sender{
    NSLog(@"%s",__func__);
    [self updateLoginButton];
}

- (void)updateLoginButton{
    if(_nameTextField.text.length && _passTextField.text.length){
        _loginButton.enabled = YES;
    }
    else{
        _loginButton.enabled = NO;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
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
