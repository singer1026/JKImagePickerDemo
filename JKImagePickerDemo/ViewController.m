//
//  ViewController.m
//  JKImagePickerDemo
//
//  Created by Rick on 16/2/3.
//  Copyright © 2016年 Rick. All rights reserved.
//

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "ViewController.h"
#import "JKImagePickerController.h"
#import "MyCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,JKImagePickerControllerDelegate,MyCellDelegate>
@property(nonatomic, strong) NSMutableArray *jkassetsArray;
@property(nonatomic, strong) NSMutableArray *alassetsArray;
@property(nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) UICollectionView *uicollectionview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    fl.minimumInteritemSpacing = 5;
    fl.minimumLineSpacing = 5;
    CGFloat w = (SCREEN_WIDTH-20)/3;
    fl.itemSize = CGSizeMake(w, w);
    
    
    
    _uicollectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_WIDTH+64) collectionViewLayout:fl];
    _uicollectionview.dataSource = self;
    _uicollectionview.delegate = self;
    _uicollectionview.contentInset = UIEdgeInsetsMake(5, 5, 5, 5);
    _uicollectionview.backgroundColor = [UIColor whiteColor];
    _uicollectionview.scrollEnabled = NO;
    [_uicollectionview registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_uicollectionview];
}


#pragma mark collection
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellID = @"cell";
    
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.delegate = self;
    if (indexPath.row == self.imageArray.count ) {
        cell.imageview.image = [UIImage imageNamed:@"New"];
        cell.deletebtn.hidden = YES;
    }else{
        cell.imageview.image = self.imageArray[indexPath.row];
        cell.deletebtn.hidden = NO;
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 9) {
        cell.hidden = YES;
    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.imageArray.count ) {
        JKImagePickerController *imagePickerController = [[JKImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.showsCancelButton = YES;
        imagePickerController.allowsMultipleSelection = YES;
        imagePickerController.minimumNumberOfSelection = 1;
        imagePickerController.maximumNumberOfSelection = 9;
        imagePickerController.filterType = JKImagePickerControllerFilterTypePhotos;
        imagePickerController.selectedJKAssetArray = self.jkassetsArray;
        [imagePickerController setSelectedAlseetsArray:self.alassetsArray];
        imagePickerController.handleImageArray = self.imageArray;
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:imagePickerController];
        navigationController.navigationBar.backgroundColor = [UIColor blackColor];
        [self presentViewController:navigationController animated:YES completion:NULL];
    }
}

- (void)imagePickerControllerDidCancel:(JKImagePickerController *)imagePicker
{
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(JKImagePickerController *)imagePicker didSelectAssets:(NSArray *)jkassets didSelectALAssets:(NSArray *)alassets didSelectImage:(NSArray *)imagesarray isSource:(BOOL)source
{
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
    self.jkassetsArray = [jkassets mutableCopy];
    self.alassetsArray = [alassets mutableCopy];
    self.imageArray = [imagesarray mutableCopy];
    [_uicollectionview reloadData];
}


-(void)cellDelteClick:(MyCell *)itemView{
    NSIndexPath *indexPath = [_uicollectionview indexPathForCell:itemView];
    NSInteger indes = indexPath.row;
    [self.imageArray removeObjectAtIndex:indes];
    [self.jkassetsArray removeObjectAtIndex:indes];
    [self.alassetsArray removeObjectAtIndex:indes];
    [_uicollectionview deleteItemsAtIndexPaths:@[indexPath]];
}

@end
