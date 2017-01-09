//
//  PhotoCell.m
//  流水布局
//
//  Created by liuxingchen on 17/1/9.
//  Copyright © 2017年 liuxingchen. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell()
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@end
@implementation PhotoCell


- (void)awakeFromNib {
    [super awakeFromNib];
}
-(void)setImage:(UIImage *)image
{
    _image = image;
    _photoView.image  = image;
}
@end
