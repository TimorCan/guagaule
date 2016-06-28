//
//  ViewController.m
//  刮刮乐
//
//  Created by juxi-ios on 16/6/28.
//  Copyright © 2016年 zhoucan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic)  UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 300, 300)];
    label.text = @"是不是每种感情都不容沉溺放肆 交心淡如君子";
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor colorWithRed:(arc4random()%173)/346.0 + 0.5 green:(arc4random()%173)/346.0 + 0.5  blue:(arc4random()%173)/346.0 + 0.5  alpha: 1];
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 300, 300)];
    self.imageView.image = [UIImage imageNamed:@"meijianxue.jpg"];
    [self.view addSubview:self.imageView ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    // 触摸任意位置
    UITouch *touch = touches.anyObject;
    // 触摸位置在图片上的坐标
    CGPoint cententPoint = [touch locationInView:self.imageView];
    // 设置清除点的大小
    CGRect  rect = CGRectMake(cententPoint.x, cententPoint.y, 15, 15);
    UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
  // 默认是去创建一个透明的视图
    // 获取上下文(画板)
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 把imageView的layer映射到上下文中
    [self.imageView.layer renderInContext:ref];
    // 清除划过的区域
    CGContextClearRect(ref, rect);
    // 获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束图片的画板, (意味着图片在上下文中消失)
    UIGraphicsEndImageContext();
    self.imageView.image = image;
    
}
@end
