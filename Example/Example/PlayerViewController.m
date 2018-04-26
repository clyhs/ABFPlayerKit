//
//  PlayerViewController.m
//  ABigFishPlayer
//
//  Created by 陈立宇 on 2018/3/24.
//  Copyright © 2018年 陈立宇. All rights reserved.
//

#import "PlayerViewController.h"
#import <Masonry.h>
#import "ABFPlayerView.h"
#import "ABFPlayerModel.h"

// 屏幕的宽
#define kScreenWidth                         [[UIScreen mainScreen] bounds].size.width
// 屏幕的高
#define kScreenHeight                        [[UIScreen mainScreen] bounds].size.height

@interface PlayerViewController ()<ABFPlayerDelegate>

@property (weak, nonatomic )          UIView   *playerView;
@property (nonatomic,strong)   ABFPlayerView   *player;
@property (nonatomic,strong)  ABFPlayerModel   *playerModel;
@property(nonatomic,strong)           UIView   *mainView;


@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self test];
    [self setupMainView];
    [self setupPlayerView];
}

-(void) viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES]; //设置隐藏
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)test{
    NSLog(@"%@",self.name);
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.mainView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
}

- (void)setupMainView{
    _mainView = [[UIView alloc] init];
    _mainView.backgroundColor = [UIColor whiteColor];
    _mainView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:_mainView];
}

-(void)setupPlayerView{
    UIView *displayView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, kScreenWidth*9/16)];
    self.playerView.backgroundColor = [UIColor blackColor];
    self.playerView = displayView;
    [self.mainView addSubview:self.playerView];
    [self.player autoPlayTheVideo];
}

-(ABFPlayerView *)player{
    if(!_player){
        _player = [[ABFPlayerView alloc] init];
        _player.delegate = self;
        [_player playControlView:nil playerModel:self.playerModel];
    }
    return _player;
}

-(ABFPlayerModel *)playerModel{
    if(!_playerModel){
        _playerModel = [[ABFPlayerModel alloc] init];
        _playerModel.fatherView = self.playerView;
        _playerModel.title = self.name;
        NSMutableArray *menus = [NSMutableArray new];
        [menus addObject:self.url_1];
        [menus addObject:self.url_2];
        [menus addObject:self.url_3];
        _playerModel.urlArrays = [menus mutableCopy];
    }
    return _playerModel;
}


-(void)abf_playerBackAction{
     [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
