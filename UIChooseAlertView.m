//
//  UIChooseAlertView.m
//  ShouldWin
//
//  Created by 李蝉 on 14-10-23.
//  Copyright (c) 2014年 creditease. All rights reserved.
//

#import "UIChooseAlertView.h"
#import "UIBlockAlertView.h"
@interface UIChooseAlertView ()

@end

@implementation UIChooseAlertView

+ (id)shareInstance {
    
    static UIChooseAlertView *_instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        _instance = [[UIChooseAlertView alloc]init];
    });
    return _instance;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles object:(id)object
{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    
    //"alertcontroller相关代码"
    
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (cancelButtonTitle != nil) {
    [alertViewController addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        if (self.leftBlock) {
            self.leftBlock(0);

        }
        
    }]];
        
    }
    
    if (otherButtonTitles != nil) {
        [alertViewController addAction:[UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if (self.rightBlock) {
                self.rightBlock(1);
            }
            
        }]];
    }
    
    if ([object isBeingPresented]) {
        [object dismissViewControllerAnimated:YES completion:nil];
    }
    [object presentViewController:alertViewController animated:YES completion:nil];

#else
    //alertView
    UIBlockAlertView *alertView = [[UIBlockAlertView alloc]initWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles cancelblock:^(NSInteger m) {
        if (self.leftBlock) {
            self.leftBlock(m);
        }
        
    } sureBlock:^(NSInteger m) {
        
        if (self.rightBlock) {
            self.rightBlock(m);
        }
    }];
      [alertView show];
#endif
    
    return self;
}



@end
