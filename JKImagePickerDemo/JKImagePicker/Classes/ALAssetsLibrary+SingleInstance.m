//
//  ALAssetsLibrary+SingleInstance.m
//  LuoChang
//
//  Created by Supwin_mbp002 on 16/1/12.
//  Copyright © 2016年 Rick. All rights reserved.
//

#import "ALAssetsLibrary+SingleInstance.h"

@implementation ALAssetsLibrary (SingleInstance)

+ (ALAssetsLibrary *)defaultAssetsLibrary {
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}
@end
