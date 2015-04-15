//
//  KHDetailViewController.h
//  MidTerm
//
//  Created by Hyungjin Ko on 2015. 4. 15..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHDetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary* imageInfo;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *imageTitle;

@end
