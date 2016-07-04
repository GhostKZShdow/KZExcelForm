//
//  KZFormView.h
//  TableView
//
//  Created by 龙邦 on 16/6/29.
//  Copyright © 2016年 longbang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KZDatasource : NSObject

/**
 *  行的高度
 */
@property float cellHeight;

/**
 *  表头
 */
@property (nonatomic, strong) NSArray *titles;

/**
 *  存放每一列的列宽
 */
@property (nonatomic, strong) NSArray *columnsWidth;

/**
 *  表格内容数据:
 *  一行数据为一个数组，最终封装在datas中，datas的count为一共的行数（除标题以外）
 */
@property (nonatomic, strong) NSArray *datas;

@end


@interface KZFormView : UIScrollView

@property (nonatomic, strong) KZDatasource *dataSource;

- (id)initWithFrame:(CGRect)frame dataSources:(KZDatasource *)kDatasSource;

/**
 *  改变滚动视图的高度
 *
 *  @param height 视图的高度
 *
 */
- (void)setContentViewHeight:(CGFloat)height;

@end


@interface KZLineView : UIView

- (instancetype)initWithFrame:(CGRect)frame datas:(NSArray *)datas columnsWidth:(NSArray *)columnsWidth;

@end