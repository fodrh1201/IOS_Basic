//
//  ViewController.h
//  MidTerm
//
//  Created by Hyungjin Ko on 2015. 4. 15..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KHAlbum.h"
#import "KHTableViewCell.h"
#import "KHDetailViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray* images;
@property (strong, nonatomic) KHAlbum* album;
@property BOOL isSort;

- (void) reloadTableViewNotification:(NSNotification*) notification;

@end

