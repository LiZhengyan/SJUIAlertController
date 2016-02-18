//
//  ViewController.m
//  SJUIAlertController
//
//  Created by SPIREJ on 16/2/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)loginAlert:(UIButton *)sender;
- (IBAction)styleAlert:(UIButton *)sender;
- (IBAction)styleActionSheet:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAlert:(UIButton *)sender {
    //获取用户当前手机的系统版本
    [[UIDevice currentDevice] systemVersion];
    //当前的系统版本大于等于8.0
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录" message:nil preferredStyle:UIAlertControllerStyleAlert];
        //1.初始化action
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //找到输入框对象
            UITextField *usernameTF = alertController.textFields[0];
            UITextField *passwordTF = alertController.textFields[1];
            //取出用户名和密码
            NSString *username = usernameTF.text;
            NSString *password = passwordTF.text;
            NSLog(@"username:%@\npassword:%@",username,password);
        }];
        //2.添加动作
        [alertController addAction:action1];
        [alertController addAction:action2];
        //添加输入框
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"请输入用户名";
        }];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"请输入密码";
            textField.secureTextEntry = YES;
        }];
        //显示
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (IBAction)styleAlert:(UIButton *)sender {
    [self btnTouchWithStyle:UIAlertControllerStyleAlert];
}

- (IBAction)styleActionSheet:(UIButton *)sender {
    [self btnTouchWithStyle:UIAlertControllerStyleActionSheet];
}

- (void)btnTouchWithStyle:(UIAlertControllerStyle)style{
    /*
     preferredStyle:
     1.UIAlertControllerStyleActionSheet
     2.UIAlertControllerStyleAlert
     */
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        //iOS8以后才有的，替换了UIAlertView和UIActionSheet两个类
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享" message:@"选择分享的平台" preferredStyle:style];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"取消按钮点击");
        }];
        UIAlertAction *qqAction = [UIAlertAction actionWithTitle:@"分享到QQ" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"分享到QQ");
        }];
        UIAlertAction *weixinAction = [UIAlertAction actionWithTitle:@"分享到微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"分享到微信");
        }];
        
        //添加动作
        [alertController addAction:cancelAction];
        [alertController addAction:qqAction];
        [alertController addAction:weixinAction];
        //显示
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        NSLog(@"当前的系统版本是小于8.0的,使用UIAlertView");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享" message:@"选择分享的平台" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
    NSLog(@"------当前的系统版本: %f---",[[[UIDevice currentDevice] systemVersion] floatValue]);
}


@end
