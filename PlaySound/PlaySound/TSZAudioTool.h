//
//  TSZAudioTool.h
//  PlaySound
//
//  Created by Tsz on 15/10/30.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSZAudioTool : NSObject

/**
 * 播放音效
 *
 * @param soundName: 名称
 */

+(void)playSoundWithName: (NSString *)soundName;


/**
 * 注销
 *
 * @param soundName: 名称
 */
+ (void)disposeSoundWithName: (NSString *)soundName;


@end
