//
//  const.h
//  ChartsTest
//
//  Created by 方寸山 on 2017/11/7.
//  Copyright © 2017年 LINYUT. All rights reserved.
//

#ifndef const_h
#define const_h

#define KAPPDELEGATE ((AppDelegate*)([UIApplication sharedApplication].delegate))

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width//设备屏幕宽度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height//设备屏幕高度

//weakself
#define ws(object) __weak typeof (object) weakSelf = object

//16进制颜色
#define UIColorFromRGB(rgbValue)   [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#ifdef DEBUG
#define NSLog(format, ...) do { \
fprintf(stderr, "<%s : %d> %s\n", \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
__LINE__, __func__); \
(NSLog)((format), ##__VA_ARGS__); \
fprintf(stderr, "-----------------------------------------------------------\n"); \
} while (0)
#else
#define NSLog(format, ...)
#endif


#endif /* const_h */
