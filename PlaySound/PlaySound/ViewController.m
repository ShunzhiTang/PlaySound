//
//  ViewController.m
//  PlaySound
//
//  Created by Tsz on 15/10/30.
//  Copyright © 2015年 Tsz. All rights reserved.

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "TSZAudioTool.h"

@interface ViewController ()

//声明一个存放声音的字典
@property (nonatomic , strong)NSMutableDictionary *soundIDs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

//根据不同的name去播放不同
- (void)playSoundWithName:(NSString *)soundName {
    
    //1、从字典中取出音效的ID
    SystemSoundID soundID = [self.soundIDs[soundName] unsignedIntValue];
    //2、如果现在取出来的值是 0
    if (soundID == 0){
        //2。1、获取 资源的url
        NSURL *buyaoUrl = [[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        //2.2 给 soundID
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(buyaoUrl), &soundID);
        //2。3 、放入字典
        self.soundIDs[soundName] = @(soundID);
    }
    
    //3、播放音效
    AudioServicesPlaySystemSound(soundID);
    
    //4、带有振动的效果
//    AudioServicesPlayAlertSound(soundID)
}

#pragma mark 懒加载 声音数组
- (NSMutableDictionary *)soundIDs{
    
    if (_soundIDs == nil) {
        _soundIDs = [NSMutableDictionary dictionary];
    }
    return _soundIDs;
}

#pragma mark 点击播放音效

- (IBAction)buyao {
    [TSZAudioTool playSoundWithName:@"buyao.wav"];
}

- (IBAction)win:(id)sender {
    [self playSoundWithName:@"win.aac"];
}

- (IBAction)lose:(id)sender {
     [self playSoundWithName:@"lose.aac"];
}


@end
