//
//  UITapLabel.h
//  UITapLabelDemo
//
//  Created by hejunqiu on 2016/10/19.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UITapLabelDelegate;

@interface UITapLabel : UILabel

/// You'd better to set NSRange to it.
@property (nonatomic, copy) NSArray<NSValue *> *linkRanges;
@property (nonatomic, weak) id<UITapLabelDelegate> delegate;

@end

@protocol UITapLabelDelegate <NSObject>
@required

/**
 Invoked when the link range was triggered.

 @param label     An object of UITapLabel
 @param index     Index of triggerd text of label's text.
 @param content   The sub string of label's text in triggered range.
 @param linkRange Triggered range which property linkRanges contained.
 */
- (void)tapLabel:(UITapLabel *)label didTapCharacterAtIndex:(NSUInteger)index
                                            withLinkContent:(NSString *)content
                                                ofLinkRange:(NSRange)linkRange;

@end
