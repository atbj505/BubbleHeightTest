//
//  FourthViewController.m
//  BubbleHeightTest
//
//  Created by Robert on 15/3/30.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "FourthViewController.h"
#import "MLEmojiLabel.h"

@interface FourthViewController ()

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) MLEmojiLabel *richTextView;
@property (nonatomic, strong) UIView *bubbleView;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.content = @"[微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降][微笑][微笑][白眼][白眼][白眼][白眼]微笑[愉快][冷汗][投降]";
    [self addLabel:@"MLEmoji"];
    [self addRichTextView:self.content];
    [self addBubbleView];
    [self pushAndPop];
}

- (void)addRichTextView:(NSString*)content {
    self.richTextView = [[MLEmojiLabel alloc] initWithFrame:CGRectMake(0,50,232,100)];
    self.richTextView.font = [UIFont systemFontOfSize:10];
    self.richTextView.backgroundColor = [UIColor redColor];
    self.richTextView.lineSpacing = 1.0f;
    self.richTextView.customEmojiRegex = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    self.richTextView.customEmojiPlistName = @"expressionImage_custom";
    self.richTextView.text = self.content;
    
    CGSize textSize = [self.richTextView preferredSizeWithMaxWidth:232];
    CGRect frame = self.richTextView.frame;
    frame.size.height = textSize.height;
    self.richTextView.frame = frame;
    self.richTextView.center = self.view.center;
    [self.view addSubview:self.richTextView];
}

static NSUInteger count;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    count ++;
    self.content = (count % 2)? CHINESE:ENGLISH;
    self.richTextView.text = self.content;
    CGSize textSize = [self.richTextView preferredSizeWithMaxWidth:232];
    CGRect frame = self.richTextView.frame;
    frame.size.height = textSize.height;
    self.richTextView.frame = frame;
    self.richTextView.center = self.view.center;
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

- (void) addLabel:(NSString *)string {
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

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)push {
    FourthViewController *fourthVC = [FourthViewController new];
    [self.navigationController pushViewController:fourthVC animated:YES];
}

@end
