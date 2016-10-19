//
//  UITapLabel.m
//  UITapLabelDemo
//
//  Created by hejunqiu on 2016/10/19.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import "UITapLabel.h"

@interface UITapLabel ()

@property (nonatomic) BOOL delegateResponed;

@end

@implementation UITapLabel

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.linkRanges.count == 0 || !self.delegateResponed) {
        return;
    }
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint pos    = [touch locationInView:self];

    NSUInteger length = self.text.length;
    CGFloat sum = 0;
    unichar letter;
    NSString *letterStr;
    for (int i=0; i<length; i++) {
        letter    = [self.text characterAtIndex:i];
        letterStr = [NSString stringWithCharacters:&letter length:1];
        sum += [letterStr sizeWithAttributes:@{NSFontAttributeName : self.font ?: [UIFont systemFontOfSize:17]}].width;
        if (sum >= pos.x) {
            [self triggerWithIndex:i];
            break;
        }
    }
}

- (void)triggerWithIndex:(int)index
{
    for (NSValue *v in self.linkRanges) {
        NSRange range = v.rangeValue;
        if (NSLocationInRange(index, range)) {
            [_delegate tapLabel:self tapCharacterAtIndex:index
                                         withLinkContent:[self.text substringWithRange:range]
                                             ofLinkRange:range];
        }
    }
}

#pragma mark - property
- (void)setDelegate:(id<UITapLabelDelegate>)delegate
{
    _delegate = delegate;
    self.delegateResponed = [_delegate respondsToSelector:@selector(tapLabel:tapCharacterAtIndex:withLinkContent:ofLinkRange:)];
}

@end
