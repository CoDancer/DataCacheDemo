//
//  UIView+Catrgory.h
//  JobProject
//
//  Created by CoDancer on 16/12/14.
//  Copyright © 2016年 CoDancer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapAction)();

@interface UIView (Catrgory)

///-------------------------------
/// Metric properties
///-------------------------------

@property (nonatomic, assign) CGFloat leftX;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat rightX;

@property (nonatomic, assign) CGFloat topY;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat bottomY;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

///-------------------------------
/// Image content
///-------------------------------

- (UIImage *)imageRep;


///-------------------------------
/// Placing
///-------------------------------

- (void)occupySuperview;
- (void)moveToCenterOfSuperview;
- (void)moveToVerticalCenterOfSuperview;
- (void)moveToHorizontalCenterOfSuperview;

- (void)tapHandle:(TapAction)block;

- (UIImage *)getCellImageWithIndexPath:(NSIndexPath *)indexPath;
- (void)addCellImageViewToVCViewWithImage:(UIImage *)image
                            locationViewP:(CGPoint)supViewP
                               hasImgMove:(BOOL)moved;
- (void)judgeViewContainDesignViewDidMoveWithP:(CGPoint)p;
- (void)judgeViewContainDesignViewDidEndMoveWithP:(CGPoint)p;


@end
