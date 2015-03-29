//
//  RootViewController.h
//  BubbleHeightTest
//
//  Created by Robert on 15/3/29.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController


- (void)addRichTextView:(NSString*)content;
- (void)addLabel:(NSString *)string;
- (CGSize)richTextViewSize:(NSString*)content;
- (void)push;
- (void)pop;

@end
