//
//  ViewController.m
//  MidTerm
//
//  Created by Hyungjin Ko on 2015. 4. 15..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self initImages];
    self.album = [[KHAlbum alloc] init];
    self.isSort = NO;
    UIBarButtonItem* sortButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(sortImageList:)];
    self.navigationItem.rightBarButtonItem = sortButton;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) sortImageList:(id)sender {
    self.isSort = YES;
    [self.album sort];
}

- (void) initImages {
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(reloadTableViewNotification:) name:@"init-images" object:nil];
}

- (void) reloadTable {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void) reloadTableViewNotification:(NSNotification *)notification {
    self.images = [notification.userInfo objectForKey:@"data"];
    [self reloadTable];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.isSort)
        return self.album.years.count;
    else
        return 1;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.isSort)
        return [self.album.years objectAtIndex:section];
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isSort)
        return [[self.album.sectionCount objectAtIndex:section] intValue];
    return self.images.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self cellAtIndexPath:indexPath];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (self.isSort) {
            int index = [[self.album.startSectionIndex objectAtIndex:indexPath.section] intValue];
            [self.images removeObjectAtIndex:index + indexPath.row];
            [self reloadTable];
        } else {
            [self.images removeObjectAtIndex:indexPath.row];
            [self reloadTable];
        }
            
    }
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        self.album = [[KHAlbum alloc] init];
        self.isSort = NO;
    }
}

- (KHTableViewCell*) cellAtIndexPath:(NSIndexPath*)indexPath {
    KHTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void) configureCell:(KHTableViewCell*)cell atIndexPath:(NSIndexPath*) indexPath {
    int index = [[self.album.startSectionIndex objectAtIndex:indexPath.section] intValue];
    NSDictionary* image;
    if (self.isSort) {
        image = self.images[index + indexPath.row];
    } else {
        image = self.images[indexPath.row];
    }
    cell.title.text = image[@"title"];
    cell.date.text = image[@"date"];
    [self setBackGroundImage:image[@"image"] forCell:cell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void) setBackGroundImage:(NSString*)imageName forCell:(KHTableViewCell*)cell {
    CGRect cellRect = cell.frame;
    UIImageView* backgroundView = [[UIImageView alloc] initWithFrame:cellRect];
    cell.backgroundView = backgroundView;
    backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundView.clipsToBounds = YES;
    [backgroundView setImage:[UIImage imageNamed:imageName]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        int index = [[self.album.startSectionIndex objectAtIndex:indexPath.section] intValue];
        NSDictionary* imageInfo;
        if (self.isSort) {
            imageInfo = self.images[index + indexPath.row];
            
        } else {
            imageInfo = self.images[indexPath.row];
        }
        KHDetailViewController* detailController = [segue destinationViewController];
        detailController.imageInfo = imageInfo;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
