//
//  ViewController.m
//  ABigFishPlayer
//
//  Created by 陈立宇 on 2018/3/24.
//  Copyright © 2018年 陈立宇. All rights reserved.
//

#import "ViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "PlayerViewController.h"
#import "ABFPlayerView.h"
#import "ABFPlayerModel.h"
#import "TVTableViewCell.h"

// 屏幕的宽
#define kScreenWidth                         [[UIScreen mainScreen] bounds].size.width
// 屏幕的高
#define kScreenHeight                        [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic )          UIView   *playerView;
@property (nonatomic,strong)   ABFPlayerView   *player;
@property (nonatomic,strong)  ABFPlayerModel   *playerModel;

@property (nonatomic,weak)       UITableView   *tableView;
@property (nonatomic,strong)  NSMutableArray   *tvs;
@property(nonatomic,strong)           UIView   *mainView;

@end

@implementation ViewController

-(NSMutableArray *)tvs{
    if(_tvs == nil){
        _tvs = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tvs.plist" ofType:nil]];
    }
    return _tvs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupMainView];
    [self setupTableView];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"ABFPlayer";
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.mainView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-64);
    _tableView.frame = CGRectMake( 0, 0, kScreenWidth, kScreenHeight-64);
}

- (void)setupMainView{
    _mainView = [[UIView alloc] init];
    _mainView.backgroundColor = [UIColor whiteColor];
    _mainView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-64);
    [self.view addSubview:_mainView];
}


- (void)setupTableView{
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor redColor];
    tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight -64);
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.editing = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.mainView addSubview:tableView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[TVTableViewCell class] forCellReuseIdentifier:@"mycell"];
    _tableView = tableView;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tvs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title = [self.tvs[indexPath.row] objectForKey:@"name"];
    TVTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    cell.titleLab.text = title;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = [self.tvs[indexPath.row] objectForKey:@"name"];
    NSString *url_1 = [self.tvs[indexPath.row] objectForKey:@"url_1"];
    NSString *url_2 = [self.tvs[indexPath.row] objectForKey:@"url_2"];
    NSString *url_3 = [self.tvs[indexPath.row] objectForKey:@"url_3"];
    
    PlayerViewController *vc = [[PlayerViewController alloc] init];
    vc.name = title;
    vc.url_1 = url_1;
    vc.url_2 = url_2;
    vc.url_3 = url_3;
    
    [self.navigationController pushViewController:vc animated:NO];
    
}


- (void)loadData{
    NSLog(@"count = %ld",[self.tvs count]);
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
