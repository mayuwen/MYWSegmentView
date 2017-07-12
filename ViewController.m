//
//  ViewController.m
//  MYWSegmentView
//
//  Created by apple on 2017/7/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "SegmentView.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    CGRect frame = CGRectMake(0, 20, KScreenW, 40);
    NSArray *titleArr = @[@"热门影视",@"最新热播",@"好评如潮"];
    
    
    SegmentView *segmentV = [[SegmentView alloc]initWithFrame:frame withTitleArray:titleArr];
    [self.view addSubview:segmentV];
    
    //获取返回值
    [segmentV setReturnBlock:^(NSInteger index) {
        NSLog(@"%ld",(long)index);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
