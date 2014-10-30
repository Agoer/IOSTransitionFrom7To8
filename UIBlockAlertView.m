//
//  UIBlockAlertView.m
//  UIBlockAlertView
//
//  Created by 李蝉 on 14-8-26.
//  Copyright (c) 2014年 lichan. All rights reserved.
//

#import "UIBlockAlertView.h"

@interface UIBlockAlertView ()
@property (nonatomic, copy) MyBlock     leftBlock;
@property (nonatomic, copy) MyBlock     rightBlock;

@end
@implementation UIBlockAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitle
              cancelblock:(MyBlock)cancelBlock
              sureBlock:(MyBlock)sureBlock
{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle, nil];
    if (self) {

        self.leftBlock = cancelBlock;
        self.rightBlock = sureBlock;
    }
    return self;
}

#pragma mark -AlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //这里调用函数指针block(要传进来的参数);
    NSLog(@"%ld",(long)buttonIndex);
    if (buttonIndex == 0)
        self.leftBlock(0);
    else if (buttonIndex == 1)
        _rightBlock(1);
}


@end
