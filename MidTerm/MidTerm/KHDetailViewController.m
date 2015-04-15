//
//  KHDetailViewController.m
//  MidTerm
//
//  Created by Hyungjin Ko on 2015. 4. 15..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHDetailViewController.h"

@interface KHDetailViewController ()

@end

@implementation KHDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageTitle.text = self.imageInfo[@"title"];
    self.date.text = self.imageInfo[@"date"];
    UIImage* image = [UIImage imageNamed:self.imageInfo[@"image"]];
    [self.imageView setImage:image];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
