//
//  ViewController.m
//  TestAIBaseFramework
//
//  Created by wuyoujian on 16/7/18.
//  Copyright © 2016年 Asiainfo. All rights reserved.
//

#import "ViewController.h"
#import <AIShare/AIShare.h>


@interface ViewController ()<AIActionSheetDelegate>

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated {
    
    UIButton *btnBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(60, 100, 100, 40)];
    [btnBtn1 setTitle:@"AISheet" forState:UIControlStateNormal];
    [btnBtn1 setTag:100];
    [btnBtn1 setBackgroundColor:[UIColor grayColor]];
    [btnBtn1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnBtn1];
    
    UIButton *btnBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(60, 180, 100, 40)];
    [btnBtn2 setTitle:@"分享" forState:UIControlStateNormal];
    [btnBtn2 setTag:101];
    [btnBtn2 setBackgroundColor:[UIColor grayColor]];
    [btnBtn2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnBtn2];
}

- (void)buttonAction:(UIButton*)sender {
    if (sender.tag == 100) {
        AIActionSheet *sheet = [[AIActionSheet alloc] initInParentView:self.view delegate:self];
        for (int i = 0; i < 7; i ++) {
            AISheetItem * item = [[AISheetItem alloc] init];
            item.icon = @"capture.png";
            item.title = [NSString stringWithFormat:@"测试测-%d",i];
            [sheet addActionItem:item];
        }
        [sheet show];
    } else {
        SharedDataModel *sharedData = [[SharedDataModel alloc] init];
        sharedData.content = @"测试URL分享";
        sharedData.url = @"http://www.asiainfo.com.cn";
        sharedData.dataType = SharedDataTypeText;
        [[SharedManager sharedSharedManager] sharedData:sharedData finish:^(NSInteger statusCode,id resp) {
            //
        }];
    }
}

#pragma mark -
- (void)didSelectedActionSheet:(AIActionSheet*)actionSheet buttonIndex:(NSInteger)buttonIndex {
    [FadePromptView showPromptStatus:[NSString stringWithFormat:@"选择菜单：%ld",(long)(buttonIndex)] duration:1.5 finishBlock:^{
        //
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
