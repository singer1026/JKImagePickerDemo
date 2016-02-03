//
//  JKImagePickerController.h
//  JKImagePicker
//
//  Created by Jecky on 15/1/9.
//  Copyright (c) 2015年 Jecky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "JKAssets.h"

typedef NS_ENUM(NSUInteger, JKImagePickerControllerFilterType) {
    JKImagePickerControllerFilterTypeNone,
    JKImagePickerControllerFilterTypePhotos,
    JKImagePickerControllerFilterTypeVideos
};

UIKIT_EXTERN ALAssetsFilter * ALAssetsFilterFromJKImagePickerControllerFilterType(JKImagePickerControllerFilterType type);

@class JKImagePickerController;

@protocol JKImagePickerControllerDelegate <NSObject>

@optional
- (void)imagePickerController:(JKImagePickerController *)imagePicker didSelectAsset:(JKAssets *)asset isSource:(BOOL)source;
//添加多两组控制对象
- (void)imagePickerController:(JKImagePickerController *)imagePicker didSelectAssets:(NSArray *)jkassets didSelectALAssets:(NSArray *)alassets didSelectImage:(NSArray *)imagesarray isSource:(BOOL)source;
- (void)imagePickerControllerDidCancel:(JKImagePickerController *)imagePicker;

@end

@interface JKImagePickerController : UIViewController
{
    NSMutableArray *_selectedAlseetsArray;
}

@property (nonatomic, weak) id<JKImagePickerControllerDelegate> delegate;
@property (nonatomic, assign) JKImagePickerControllerFilterType filterType;
@property (nonatomic, assign) BOOL showsCancelButton;
@property (nonatomic, assign) BOOL allowsMultipleSelection;
@property (nonatomic, assign) NSUInteger minimumNumberOfSelection;
@property (nonatomic, assign) NSUInteger maximumNumberOfSelection;
@property (nonatomic, assign) NSInteger isStatus; // 0为普通动态，1为球衣
@property (nonatomic, strong) NSMutableArray *selectedJKAssetArray;
@property (nonatomic, strong) NSMutableArray *handleImageArray;

- (void)setSelectedAlseetsArray:(NSMutableArray *)selectedAlseetsArray;

@end
