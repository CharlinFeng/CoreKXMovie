//
//  ListTVC.m
//  CoreKXMovie
//
//  Created by 冯成林 on 15/9/14.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "ListTVC.h"
#import "CoreKXMovieVC.h"

@interface ListTVC ()

@property (nonatomic,strong) CoreKXMovieVC *kxVC;

@property (nonatomic,strong) NSArray *dataList;

@end

@implementation ListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataList=@[
                    
                    @"http://211.149.151.92/mytest/Public/video/demo.mp4",
                    @"http://211.149.151.92/mytest/Public/video/test.rmvb",
                    @"http://211.149.151.92/mytest/Public/video/test.mov",
                    @"http://211.149.151.92/mytest/Public/video/test.flv",
                    @"http://211.149.151.92/mytest/Public/video/test.wmv",
                    @"http://211.149.151.92/mytest/Public/video/test.mkv",
                    @"http://211.149.151.92/mytest/Public/video/test.avi"
                    
                    ];
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.dataList==nil) return 0;
    return self.dataList.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rid = @"ListTVC";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    
    if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    
    cell.textLabel.text = [self.dataList[indexPath.row] componentsSeparatedByString:@"."].lastObject;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CoreKXMovieVC *vc = [CoreKXMovieVC movieViewControllerWithContentPath:self.dataList[indexPath.row] parameters:nil];
    
    [self.navigationController pushViewController:vc animated:YES];
}











@end
