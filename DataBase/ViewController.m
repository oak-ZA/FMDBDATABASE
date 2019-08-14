//
//  ViewController.m
//  DataBase
//
//  Created by 张奥 on 2019/8/13.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "ViewController.h"
#import "FMDMTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
//    label.backgroundColor = [UIColor blueColor];
//    label.text = @"不合法北戴河北方导航方便的话\n烦恼烦恼分开的奶粉的愤怒的";
//    label.numberOfLines = 1;
//    label.textColor = [UIColor whiteColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont systemFontOfSize:13.f];
//    [self.view addSubview:label];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 80, 80, 80);
    [button setTitle:@"创建表格" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 8.f;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(20, 180, 80, 80);
    [button2 setTitle:@"插入数据" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor blueColor];
    button2.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button2.layer.cornerRadius = 8.f;
    button2.layer.masksToBounds = YES;
    [button2 addTarget:self action:@selector(clickButton2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(20, 280, 80, 80);
    [button3 setTitle:@"查询数据" forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor blueColor];
    button3.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button3.layer.cornerRadius = 8.f;
    button3.layer.masksToBounds = YES;
    [button3 addTarget:self action:@selector(clickButton3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(20, 380, 80, 80);
    [button4 setTitle:@"更新数据" forState:UIControlStateNormal];
    button4.backgroundColor = [UIColor blueColor];
    button4.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button4.layer.cornerRadius = 8.f;
    button4.layer.masksToBounds = YES;
    [button4 addTarget:self action:@selector(clickButton4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(20, 480, 80, 80);
    [button5 setTitle:@"删除数据" forState:UIControlStateNormal];
    button5.backgroundColor = [UIColor blueColor];
    button5.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button5.layer.cornerRadius = 8.f;
    button5.layer.masksToBounds = YES;
    [button5 addTarget:self action:@selector(clickButton5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
}

-(void)clickButton{
    [[FMDMTool sharedDataBase] createTableName:@"student"];
//    [[FMDMTool sharedDataBase] initDatabaseFileName:@"student"];
}
-(void)clickButton2{
    [[FMDMTool sharedDataBase] insertDataDatabaseName:@"student"];
}
-(void)clickButton3{
    [[FMDMTool sharedDataBase] queryDatabaseName:@"student"];
}
-(void)clickButton4{
    [[FMDMTool sharedDataBase] updateDatabaseFileName:@"student"];
}
-(void)clickButton5{
    [[FMDMTool sharedDataBase] deleteDataFileName:@"student"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
