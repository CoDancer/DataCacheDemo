//
//  UIView+Catrgory.m
//  JobProject
//
//  Created by CoDancer on 16/12/14.
//  Copyright © 2016年 CoDancer. All rights reserved.
//

#import "UIView+Catrgory.h"
#import <objc/runtime.h>

static char tapKey;

@implementation UIView (Catrgory)

#pragma mark - Metric properties

- (CGFloat)leftX
{
    return self.frame.origin.x;
}
- (void)setLeftX:(CGFloat)leftX
{
    self.frame = CGRectMake(leftX, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
}

- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)rightX
{
    return self.frame.origin.x + self.bounds.size.width;
}
- (void)setRightX:(CGFloat)rightX
{
    self.frame = CGRectMake(rightX-self.bounds.size.width, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
}


- (CGFloat)topY
{
    return self.frame.origin.y;
}
- (void)setTopY:(CGFloat)topY
{
    self.frame = CGRectMake(self.frame.origin.x, topY, self.bounds.size.width, self.bounds.size.height);
}

- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)bottomY
{
    return self.frame.origin.y + self.bounds.size.height;
}
- (void)setBottomY:(CGFloat)bottomY
{
    self.frame = CGRectMake(self.frame.origin.x, bottomY-self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
}


- (CGFloat)width
{
    return self.bounds.size.width;
}
- (void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.bounds.size.height);
}

- (CGFloat)height
{
    return self.bounds.size.height;
}
- (void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.bounds.size.width, height);
}


- (CGPoint)origin
{
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin
{
    self.frame = CGRectMake(origin.x, origin.y, self.bounds.size.width, self.bounds.size.height);
}

- (CGSize)size
{
    return self.bounds.size;
}
- (void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

#pragma mark - Image content

- (UIImage *)imageRep
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



#pragma mark - Placing

- (void)occupySuperview
{
    if ( self.superview ) {
        self.frame = self.superview.bounds;
    }
}

- (void)moveToCenterOfSuperview
{
    if ( self.superview ) {
        CGRect frm = CGRectMake((self.superview.bounds.size.width - self.bounds.size.width) / 2.0,
                                (self.superview.bounds.size.height - self.bounds.size.height) / 2.0,
                                self.bounds.size.width,
                                self.bounds.size.height);
        self.frame = frm;
    }
}

- (void)moveToVerticalCenterOfSuperview
{
    if ( self.superview ) {
        CGRect frm = CGRectMake(self.frame.origin.x,
                                (self.superview.bounds.size.height - self.bounds.size.height) / 2.0,
                                self.bounds.size.width,
                                self.bounds.size.height);
        self.frame = frm;
    }
}

- (void)moveToHorizontalCenterOfSuperview
{
    if ( self.superview ) {
        CGRect frm = CGRectMake((self.superview.bounds.size.width - self.bounds.size.width) / 2.0,
                                self.frame.origin.y,
                                self.bounds.size.width,
                                self.bounds.size.height);
        self.frame = frm;
    }
}

#pragma mark - 添加单击手势
- (void)tapHandle:(TapAction)block {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, &tapKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    TapAction blcok = objc_getAssociatedObject(self, &tapKey);
    if (blcok) {
        blcok();
    }
}

- (UIImage *)getCellImageWithIndexPath:(NSIndexPath *)indexPath {
    
    if (self.superview) {
      return [self.superview getCellImageWithIndexPath:indexPath];
    }
    return nil;
}

- (void)addCellImageViewToVCViewWithImage:(UIImage *)image
                            locationViewP:(CGPoint)supViewP
                               hasImgMove:(BOOL)moved; {
    
    if (self.superview) {
        [self.superview addCellImageViewToVCViewWithImage:image
                                            locationViewP:supViewP
                                               hasImgMove:moved];
    }
}

- (void)judgeViewContainDesignViewDidMoveWithP:(CGPoint)p {
    
    if (self.superview) {
        [self.superview judgeViewContainDesignViewDidMoveWithP:p];
    }
}

- (void)judgeViewContainDesignViewDidEndMoveWithP:(CGPoint)p {
    
    if (self.superview) {
        [self.superview judgeViewContainDesignViewDidEndMoveWithP:p];
    }
}

@end
