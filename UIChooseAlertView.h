//
//  UIChooseAlertView.h
//  ShouldWin
//
//  Created by 李蝉 on 14-10-23.
//  Copyright (c) 2014年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^MyBlock)(NSInteger);
@interface UIChooseAlertView : NSObject
@property (nonatomic, copy) MyBlock     leftBlock;
@property (nonatomic, copy) MyBlock     rightBlock;


- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles object:(id)object;



+ (id)shareInstance;

@end
