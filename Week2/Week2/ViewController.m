//
//  ViewController.m
//  Week2
//
//  Created by Hyungjin Ko on 2015. 3. 11..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "ViewController.h"
#import "NXPersonModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NXPersonModel* test = [[NXPersonModel alloc] init];
    [test makeDictList];
    NSArray* testArr = test.dictList;
    NSLog(@"%@", testArr);
    NSLog(@"number %@", [test findPersonByName:@"고형진"]);
    NSLog(@"name %@", [test findPersonByNumber:@141004]);
    for (NSDictionary* line in [test sortedByName]) {
        NSLog(@"sortedName %@", line[@"name"]);
    }
    for (NSDictionary* line in [test sortedByNumber]) {
        NSLog(@"sortedNumber %@", line[@"number"]);
    }
    for (NSDictionary* line in [test sortedByTeam]) {
        NSLog(@"sortedTeam %@", line[@"team"]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
