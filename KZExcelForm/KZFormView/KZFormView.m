//
//  KZFormView.m
//  TableView
//
//  Created by 龙邦 on 16/6/29.
//  Copyright © 2016年 longbang. All rights reserved.
//

#import "KZFormView.h"
//#import "KZLineView.h"

@implementation KZDatasource
@synthesize titles,datas,cellHeight;


@end

@interface KZFormView ()
{
    UIScrollView *_contentView;
}
@end

@implementation KZFormView
@synthesize dataSource;

- (id)initWithFrame:(CGRect)frame dataSources:(KZDatasource *)kDatasSource{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = kDatasSource;
        //添加表头视图
        KZLineView *lineView = [[KZLineView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, dataSource.cellHeight) datas:dataSource.titles columnsWidth:dataSource.columnsWidth];
        //表头的背景颜色
        lineView.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:.4];
        [self addSubview:lineView];
        //可以滚动的内容视图
        _contentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, dataSource.cellHeight, self.frame.size.width, self.frame.size.height - dataSource.cellHeight)];
        //内容的背景颜色
        _contentView.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:.4];
        [self addSubview:_contentView];
        //添加表内容视图
        for (int i = 0; i<dataSource.datas.count; i++) {
            CGFloat lineX = 0;
            CGFloat lineY = dataSource.cellHeight * i;
            CGRect lineViewFrame = CGRectMake(lineX, lineY, self.frame.size.width, dataSource.cellHeight);
            KZLineView *lineView = [[KZLineView alloc]initWithFrame:lineViewFrame datas:dataSource.datas[i] columnsWidth:dataSource.columnsWidth];
            [_contentView addSubview:lineView];
        }
        _contentView.contentSize = CGSizeMake(self.frame.size.width, dataSource.datas.count * dataSource.cellHeight);
    }
    return self;
}
- (void)setContentViewHeight:(CGFloat)height{
    CGRect rect = _contentView.frame;
    rect.size.height = height-dataSource.cellHeight;
    [_contentView setFrame:rect];
}
@end


@implementation KZLineView

- (instancetype)initWithFrame:(CGRect)frame datas:(NSArray *)datas columnsWidth:(NSArray *)columnsWith
{
    self = [super initWithFrame:frame];
    if (self) {
//        CGFloat columnW = self.frame.size.width/datas.count;
        CGFloat columnX = 0;
        CGFloat columnH = self.frame.size.height;
        for (int i=0; i<datas.count; i++) {
            CGFloat columnW = [columnsWith[i] floatValue];
//            CGFloat columnX = columnW * i;
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(columnX, 0, columnW, columnH)];
            columnX += columnW;
            [label setTextAlignment:NSTextAlignmentCenter];
            [label setFont:[UIFont systemFontOfSize:16]];
            [label setText:datas[i]];
            [label.layer setBorderColor:[UIColor blackColor].CGColor];
            [label.layer setBorderWidth:.5];
            [self addSubview:label];
        }
    }
    return self;
}

@end