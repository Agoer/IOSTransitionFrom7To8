//
//  UIBlockAlertView.h
//  UIBlockAlertView
//
//  Created by 李蝉 on 14-8-26.
//  Copyright (c) 2014年 lichan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIBlockAlertView;
typedef void (^MyBlock)(NSInteger);


@interface UIBlockAlertView : UIAlertView


- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitle
        cancelblock:(MyBlock)cancelBlock
          sureBlock:(MyBlock)sureBlock;

@end
