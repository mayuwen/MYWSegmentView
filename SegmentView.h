//
//  SegmentView.h
//  MyMovie
//
//  Created by Iven on 16/3/2.
//  Copyright © 2016年 Iven. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义block，用来传递点击的第几个按钮
typedef void (^PassValueBlock)(NSInteger index);

@interface SegmentView : UIView

//定义一下block
@property(strong,nonatomic)PassValueBlock returnBlock;


//初始化按钮组，传入frame和名称
-(id)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)array;


//block传递值的方法
-(void)setReturnBlock:(PassValueBlock)returnBlock;


@end
