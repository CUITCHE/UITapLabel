//
//  ViewController.m
//  UITapLabelDemo
//
//  Created by hejunqiu on 2016/10/19.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import "ViewController.h"
#import "UITapLabel.h"

@interface ViewController () <UITapLabelDelegate>

@property (weak, nonatomic) IBOutlet UITapLabel *tapLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set to YES to trigger gesture.
    self.tapLabel.userInteractionEnabled = YES;
    self.tapLabel.text = @"May the UITapLabel will help you.";
    self.tapLabel.delegate = self;
    self.tapLabel.linkRanges = @[[NSValue valueWithRange:NSMakeRange(0, 3)],    // 'May'
                                 [NSValue valueWithRange:NSMakeRange(4, 3)],    // 'the'
                                 [NSValue valueWithRange:NSMakeRange(8, 10)],   // 'UITapLabel'
                                 [NSValue valueWithRange:NSMakeRange(19, 4)],   // 'will'
                                 [NSValue valueWithRange:NSMakeRange(24, 4)],   // 'help'
                                 [NSValue valueWithRange:NSMakeRange(29, 3)]];  // 'you'
}

#pragma mark - UITapLabelDelegate
- (void)tapLabel:(UITapLabel *)label didTapCharacterAtIndex:(NSUInteger)index
                                            withLinkContent:(NSString *)content
                                                ofLinkRange:(NSRange)linkRange
{
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"Message"
                                                                   message:content
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alter addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alter animated:YES completion:nil];
}

@end
