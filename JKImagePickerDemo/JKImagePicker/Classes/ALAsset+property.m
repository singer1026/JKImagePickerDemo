//
//  ALAsset+property.m
//  JKImagePicker
//
//  Created by Rick on 15/12/28.
//  Copyright © 2015年 Jecky. All rights reserved.
//

#import "ALAsset+property.h"
#import <objc/message.h>

static const char *key = "num";
@implementation ALAsset (property)
-(NSString *)num{
    // 根据关联的key，获取关联的值。
    return objc_getAssociatedObject(self, key);

}

-(void)setNum:(NSString *)num{
    objc_setAssociatedObject(self, key, num, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
