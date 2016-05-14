//
//  ViewController.m
//  RunTime
//
//  Created by lanou on 16/4/13.
//  Copyright © 2016年 xqy. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *MyTextField;

@end

@implementation ViewController

+ (void)initialize {
    [self getIvars];
}

+ (void)getIvars {
    unsigned int count = 0;
    
    // 拷贝出所有的成员变量列表
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    
    for (int i = 0; i < count; i ++) {
        // 取出成员变量
        Ivar ivar = ivars[i];
        QYLog(@"%s, %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    // 释放
    free(ivars);
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 文本属性
    self.view.backgroundColor = [UIColor grayColor];
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
//    
//    // NSAttributedString 一种带有属性的文字
//    NSAttributedString *myTextField = [[NSAttributedString alloc]initWithString:@"我的世界" attributes:attrs];
//    self.MyTextField.attributedPlaceholder = myTextField;
//
    
    NSMutableAttributedString *myTextField = [[NSMutableAttributedString alloc] initWithString:@"我的世界"];
    [myTextField setAttributes:@{NSForegroundColorAttributeName : [UIColor cyanColor]} range:NSMakeRange(0, 1)];
    [myTextField setAttributes:@{
                                NSForegroundColorAttributeName : [UIColor yellowColor],
                                NSFontAttributeName : [UIFont systemFontOfSize:20]
                                } range:NSMakeRange(1, 1)];
    [myTextField setAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} range:NSMakeRange(2, 1)];
    [myTextField setAttributes:@{NSForegroundColorAttributeName : [UIColor purpleColor]} range:NSMakeRange(3, 1)];
    self.MyTextField.attributedPlaceholder = myTextField;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
