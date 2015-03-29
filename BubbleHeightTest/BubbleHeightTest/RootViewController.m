//
//  RootViewController.m
//  BubbleHeightTest
//
//  Created by Robert on 15/3/29.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) TQRichTextView *richTextView;
@property (nonatomic, strong) UIView *bubbleView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.content = CHINESE;
    [self addRichTextView:self.content];
    [self addBubbleView];
    [self pushAndPop];
}

- (void)addRichTextView:(NSString*)content {
    CGSize textSize = [self richTextViewSize:content];
    self.richTextView = [TQRichTextView new];
    [self.view addSubview:self.richTextView];
    [self.richTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.mas_offset(50);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(textSize.width);
        make.height.mas_equalTo(textSize.height);
    }];
    self.richTextView.text = self.content ;
    self.richTextView.font = [UIFont systemFontOfSize:10];
    self.richTextView.lineSpacing = 0.0;
    self.richTextView.backgroundColor = [UIColor redColor];
    self.richTextView.textColor = [UIColor blackColor];
}

- (CGSize)richTextViewSize:(NSString*)content {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:10], NSParagraphStyleAttributeName:paragraphStyle};
    CGSize size = [content boundingRectWithSize:CGSizeMake(232, MAXFLOAT)
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:attributes context:nil].size;
    return size;
    
}

- (void)addBubbleView {
    self.bubbleView = [UIView new];
    self.bubbleView.backgroundColor = [UIColor blueColor];
    [self.view insertSubview:self.bubbleView atIndex:0];
    [self.bubbleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.richTextView).with.insets(UIEdgeInsetsMake(-10, -13, -10, -13));
    }];
}

- (void)pushAndPop {
    UIButton *pushButton = [UIButton new];
    [self.view addSubview:pushButton];
    [pushButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.width.mas_equalTo(@80);
        make.height.mas_equalTo(@30);
    }];
    [pushButton setTitle:@"push" forState:UIControlStateNormal];
    [pushButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *popButton = [UIButton new];
    [self.view addSubview:popButton];
    [popButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(pushButton.mas_right);
        make.bottom.mas_equalTo(self.view);
        make.width.mas_equalTo(@80);
        make.height.mas_equalTo(@30);
    }];
    [popButton setTitle:@"pop" forState:UIControlStateNormal];
    [popButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [popButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addLabel:(NSString *)string {
    UILabel *label = [UILabel new];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@30);
    }];
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor blackColor];
    label.text = string;
}

- (void)push {
    
}

- (void)pop {
    
}
@end
