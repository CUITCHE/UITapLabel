# UITapLabel
A subclass of UILabel, support to tap the specified text.

# Use

- Set `userInteractionEnabled` to YES. (This is necessary)
- Conformed `UITapLabelDelegate` protocol.
- Calculate ranges of triggered text and assign to `linkRanges` property.

Just like below code:

```objective-c
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
```

And then implement required method of `UITapLabelDelegate`.

```objective-c
- (void)tapLabel:(UITapLabel *)label tapCharacterAtIndex:(NSUInteger)index
                                         withLinkContent:(NSString *)content
                                             ofLinkRange:(NSRange)linkRange
{
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"Message"
                                                                   message:content
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alter addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alter animated:YES completion:nil];
}
```

Also see my sample code: [ViewController](./UITapLabelDemo/UITapLabelDemo/ViewController.m)

# Requirement

- Xcode 8.0
- iOS 7.0+ (iOS 8.0+ is better)

# LICENSE

The MIT License.

# Note

No add gesture to UITapLabel. It will make label trigger invalid.

