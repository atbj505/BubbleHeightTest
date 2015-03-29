//
//  SecondViewController.m
//  BubbleHeightTest
//
//  Created by Robert on 15/3/29.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) UITextView *richTextView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLabel:@"UITextView"];
}

- (void)addRichTextView:(NSString*)content {
    CGSize textSize = [self richTextViewSize:content];
    self.richTextView = [UITextView new];
    [self.view addSubview:self.richTextView];
    [self.richTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.mas_offset(50);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(textSize.width);
        make.height.mas_equalTo(textSize.height);
    }];
    self.richTextView.text = self.content ;
    self.richTextView.font = [UIFont systemFontOfSize:10];
    self.richTextView.backgroundColor = [UIColor redColor];
    self.richTextView.textColor = [UIColor blackColor];
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

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)push {
    ThirdViewController *thirdVC = [ThirdViewController new];
    [self.navigationController pushViewController:thirdVC animated:YES];
}

@end
