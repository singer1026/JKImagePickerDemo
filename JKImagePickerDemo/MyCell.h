//
//  MyCell.h
//  JKImagePickerDemo
//
//  Created by Rick on 16/2/3.
//  Copyright © 2016年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyCell;
@protocol MyCellDelegate <NSObject>
-(void)cellDelteClick:(MyCell *)itemView ;
@end

@interface MyCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIButton *deletebtn;
@property (nonatomic , weak) id<MyCellDelegate> delegate;
@end
