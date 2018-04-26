# ABigFishPlayer

### 引用第三方技术包括：
* ijkplayer
* masonry

### 支持格式
* ijkplayer支持的所有格式 

### 参考项目
* 很多代码都是从ZFPlayer这个项目复制过来的，进行ijkplayer改造 。

### demo

*  将ABFPlayerKit目录引入到项目中去
*  #import "ABFPlayerView.h"
*  #import "ABFPlayerModel.h"

```
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
```

### 效果图
<div align="center">
<img src="https://github.com/clyhs/ABigFishPlayer/blob/master/images/1.png" width="250" style="margin:10px 10px;" >
<img src="https://github.com/clyhs/ABigFishPlayer/blob/master/images/2.png" width
="250" style="margin:10px 10px;" >
<img src="https://github.com/clyhs/ABigFishPlayer/blob/master/images/3.png" width
="250" style="margin:10px 10px;">

</div>

### 备注 
* 最后如果你觉得不错，那就star一下，非常感谢
