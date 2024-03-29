//
//  UITableViewCellViewController.m
//  CodingDemoMe
//
//  Created by 橘子 on 16/5/2.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "News+CoreDataProperties.h"
@interface NewsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image_view_cell;
@property (weak, nonatomic) IBOutlet UILabel *title_from_cell;
@property (weak,nonatomic) IBOutlet UILabel *profile_label_cell;
@property (weak,nonatomic) IBOutlet UILabel *text_view_cell;
@end

@implementation NewsTableViewCell



+(instancetype)newsTableViewCellWithTableView:(UITableView *)tableView{
    //设置静态可重用 id
    static NSString *reuseId = @"reuseCellId";
    /*
     cell的可重用操作
     定义一个可重用的cell队列池
     如果cell == nil
     就从队列池子里面拿出一个cell
     */
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NewsTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
}

//数据模型进行控件赋值

-(void)setModelClass:(NewsModelClass *)modelClass{
//    _modelClass = modelClass;
    self.image_view_cell.image = [UIImage imageNamed:modelClass.icon];
    
    
    self.profile_label_cell.text = modelClass.desc;
    NSString *str1 = modelClass.title_from;
    
    NSString *str2 = [[NSString alloc]initWithFormat:@"文章来源----%@",str1];
    self.title_from_cell.text = str2;
    self.text_view_cell.text = modelClass.title;
    
    
    
//  设置了头像的圆形效果
    CGRect image_view_bounds = self.image_view_cell.bounds;
    CGFloat x_path = image_view_bounds.origin.x + (image_view_bounds.size.width/2);
    CGFloat y_path = image_view_bounds.origin.y+(image_view_bounds.size.height/2);
    UIBezierPath *head_path = [[UIBezierPath alloc]init];
        [head_path addArcWithCenter:CGPointMake(x_path, y_path) radius:15 startAngle:0 endAngle:2*M_PI clockwise:YES];
        CAShapeLayer *head_layer = [CAShapeLayer layer];
        head_layer.path  = head_path.CGPath;
        self.image_view_cell.layer.mask = head_layer;

}


@end
