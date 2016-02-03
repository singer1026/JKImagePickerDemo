//
//  MyCell.m
//  JKImagePickerDemo
//
//  Created by Rick on 16/2/3.
//  Copyright © 2016年 Rick. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)delAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(cellDelteClick:)]) {
        [self.delegate cellDelteClick:self];
    }
}

@end
