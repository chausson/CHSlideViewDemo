//
//  CHSlideConfig.h
//  CHSlideViewDemo
//
//  Created by Chausson.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#ifndef CHSlideConfig_h 
#define CHSlideConfig_h

#define SCREEN_IPHONE_BELOW_6 [UIScreen mainScreen].bounds.size.width <= 320
#define SCREEN_WIDTH_CHSLIDE  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT_CHSLIDE [UIScreen mainScreen].bounds.size.height
#define SET_COLOS_CHSLIDE(R,G,B) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1.0]

#define __WEAK_SELF_CHSLIDE     __weak typeof(self) weakSelf = self;
#define __STRONG_SELF_CHSLIDE   __strong typeof(weakSelf) strongSelf = weakSelf;
#import <UIKit/UIKit.h>

#endif /* CHSlideConfig_h */
