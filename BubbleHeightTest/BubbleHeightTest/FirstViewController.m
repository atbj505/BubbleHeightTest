//
//  ViewController.m
//  BubbleHeightTest
//
//  Created by Robert on 15/3/29.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) TQRichTextView *richTextView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLabel:@"TQRichTextView"];
}

static NSUInteger count;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    count ++;
    self.content = (count % 2)? CHINESE:ENGLISH;
    self.richTextView.text = self.content;
    CGSize textSize = [self richTextViewSize:self.content];
    [self.richTextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.mas_offset(50);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(textSize.width);
        make.height.mas_equalTo(textSize.height);
    }];
}

- (void)push {
    SecondViewController *secondVC = [SecondViewController new];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
