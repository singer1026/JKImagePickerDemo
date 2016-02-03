//
//  ALAssetsLibrary+SingleInstance.h
//  LuoChang
//
//  Created by Supwin_mbp002 on 16/1/12.
//  Copyright © 2016年 Rick. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetsLibrary (SingleInstance)
+ (ALAssetsLibrary *)defaultAssetsLibrary;
@end
