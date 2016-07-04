//
//  ViewController.m
//  KZExcelForm
//
//  Created by 龙邦 on 16/7/4.
//  Copyright © 2016年 longbang. All rights reserved.
//

#import "ViewController.h"
#import "KZFormView.h"

@interface ViewController ()
{
    KZFormView *_formView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    KZDatasource *da = [[KZDatasource alloc]init];
    //表头
    da.titles = @[@"姓名",@"球队",@"球衣号",@"城市"];
    //表格中一行的高度
    da.cellHeight = 40;
    //表格展示内容－dat：一行的数据；datass：纪录每行的数据
    NSArray *dat = [NSArray arrayWithObjects:@"科比",@"湖人",@"24",@"洛杉矶", nil];
    NSMutableArray *datass = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i<34; i++) {
        [datass addObject:dat];
    }
    da.datas = datass;
    
    //每列的宽度数组
    NSString *oneColumnWidth = [NSString stringWithFormat:@"%f",self.view.frame.size.width/4];
    
    da.columnsWidth = @[oneColumnWidth,oneColumnWidth,oneColumnWidth,oneColumnWidth];
    //初始化表格
    _formView = [[KZFormView alloc]initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height - 120) dataSources:da];
    [self.view addSubview:_formView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

