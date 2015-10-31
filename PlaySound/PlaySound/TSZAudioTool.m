//
//  TSZAudioTool.m
//  PlaySound
//
//  Created by Tsz on 15/10/30.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZAudioTool.h"

#import <AVFoundation/AVFoundation.h>
@interface TSZAudioTool()

@end

@implementation TSZAudioTool

static NSMutableDictionary *_soundIDs;

//加载类的时间就加载进去
+(void)initialize{
    _soundIDs = [NSMutableDictionary dictionary];
}

+ (void)playSoundWithName:(NSString *)soundName{
    //1、从字典中取出音效的ID
    SystemSoundID soundID = [_soundIDs[soundName] unsignedIntValue];
    //2、如果现在取出来的值是 0
    if (soundID == 0){
        //2。1、获取 资源的url
        NSURL *buyaoUrl = [[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        //2.2 给 soundID
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(buyaoUrl), &soundID);
        //2。3 、放入字典
        _soundIDs[soundName] = @(soundID);
    }
    
    //3、播放音效
    AudioServicesPlaySystemSound(soundID);
    
    //4、带有振动的效果
    //    AudioServicesPlayAlertSound(soundID)
}

#pragma mark 注销音效
+ (void)disposeSoundWithName:(NSString *)soundName{
    //取出音效ID
    SystemSoundID soundID  = [_soundIDs[soundName] unsignedIntValue];
    
    if (soundID) {
        AudioServicesDisposeSystemSoundID(soundID);
    }
}

@end
