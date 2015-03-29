//
//  ThirdViewController.m
//  BubbleHeightTest
//
//  Created by Robert on 15/3/29.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "ThirdViewController.h"
#import "RCLabel.h"

@interface ThirdViewController ()

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) RCLabel *richTextView;
@property (nonatomic, strong) UIView *bubbleView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.content = CHINESE;
    [self addLabel:@"RCLabel"];
    [self addRichTextView:self.content];
    [self addBubbleView];
    [self pushAndPop];
}

- (void)addRichTextView:(NSString*)content {
    self.richTextView = [[RCLabel alloc] initWithFrame:CGRectMake(0,50,300,100)];
    self.richTextView.font = [UIFont systemFontOfSize:10];
    self.richTextView.backgroundColor = [UIColor redColor];
    RTLabelComponentsStructure *componentsDS = [RCLabel extractTextStyle:CHINESE];
    self.richTextView.componentsAndPlainText = componentsDS;
    //获取文字高度
    CGSize optimalSize = [self.richTextView optimumSize];
    //改变RCLabel高度
    CGRect frame = self.richTextView.frame;
    frame.size.height = optimalSize.height;
    self.richTextView.frame = frame;
    self.richTextView.center = self.view.center;
    [self.view addSubview:self.richTextView];
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
static NSUInteger count;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    count ++;
    self.content = (count % 2)? CHINESE:ENGLISH;
    RTLabelComponentsStructure *componentsDS = [RCLabel extractTextStyle:self.content];
    self.richTextView.componentsAndPlainText = componentsDS;
    //获取文字高度
    CGSize optimalSize = [self.richTextView optimumSize];
    //改变RCLabel高度
    CGRect frame = self.richTextView.frame;
    frame.size.height = optimalSize.height;
    self.richTextView.frame = frame;
    self.richTextView.center = self.view.center;
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
    
}
@end
