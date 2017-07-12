//
//  SegmentView.m
//  MyMovie
//
//  Created by Iven on 16/3/2.
//  Copyright © 2016年 Iven. All rights reserved.
//

#import "SegmentView.h"

@interface SegmentView (){

    NSInteger _itemCounts;//控件的数目
    NSArray *_titleArray;//存放title
    float _itemWidth;
  
    //选中背景图
    UIImageView *_selectImage;
}

@end

@implementation SegmentView

-(id)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)array{

    
    if ([super initWithFrame:frame]) {
        _itemCounts = array.count;
        _titleArray = array;
        [self creatSegmentView];
    }
    
    return self;
}
-(void)creatSegmentView{
    //设置按钮的宽度
    _itemWidth = self.frame.size.width/_itemCounts;
    //循环创建按钮
    for (int i = 0; i < _itemCounts; i++) {
        UIButton *button  = [[UIButton alloc]initWithFrame:CGRectMake(i *_itemWidth, 0, _itemWidth, self.frame.size.height)];
        [self addSubview:button];
        
        //设置button的字
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        //设置button的字颜色
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        
        //设置字体大小
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        //设置居中显示
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        //设置tag值
        button.tag = 1000 + i;
        //添加点击事件
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        //如果是第一个，默认被选中
        if (i == 0) {
            button.selected = YES;
            button.titleLabel.font = [UIFont systemFontOfSize:30];
        }
    }

    
    //添加一个select
    _selectImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 3, _itemWidth, 3)];
    _selectImage.image = [UIImage imageNamed:@"color_line"];
    [self addSubview:_selectImage];
    
}
-(void)buttonAction:(UIButton *)button{

    //当button被点击，所有的button都设为未选中状态
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *subButton = (UIButton*)view;
            subButton.selected = NO;
            subButton.titleLabel.font = [UIFont systemFontOfSize:20];
        }
    }
    //然后将选中的这个button变为选中状态
    button.selected = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    
    //通过当前的tag值设置select的位置
    NSInteger index = button.tag - 1000;
    [UIView animateWithDuration:.3 animations:^{
    _selectImage.frame = CGRectMake(index*_itemWidth, _selectImage.frame.origin.y, _selectImage.frame.size.width, _selectImage.frame.size.height);
    }];
    
    _returnBlock(index);
}


@end
