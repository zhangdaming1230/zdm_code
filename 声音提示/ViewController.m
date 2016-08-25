//
//  ViewController.m
//  声音提示
//
//  Created by 张达明 on 16/8/10.
//  Copyright © 2016年 张达明. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVAudioPlayerDelegate>
@property (nonatomic) AVAudioPlayer *avAudioPlayer;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:[self createBtn]];
        // Do any additional setup after loading the view, typically from a nib.
}

//创建button
- (UIButton * )createBtn {
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(100, 100, self.view.frame.size.width- 200, 50);
    _btn.backgroundColor = [UIColor blueColor];
    [_btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    return _btn;
}

//btn点击事件
- (void) btnAction{
    NSLog(@"nihao");
    [self playAudoFile];
}

//读取音频文件 将其播放
- (void)playAudoFile  {
    //从budle路径下读取音频文件
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"];
    
    //把音频文件转换成url格式
    NSURL *fileUrl = [NSURL fileURLWithPath:fileName];
    
    NSError *error = nil;
    
    //判断正在播放直接返回
    if ([_avAudioPlayer isPlaying]) {
        return;
    }
    
    //初始化音频类 并且添加播放文件
    _avAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:&error];
    
    //设置初始音量大小
    _avAudioPlayer.volume = 1.0;
    
    //调用开始方法
    [_avAudioPlayer play];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
