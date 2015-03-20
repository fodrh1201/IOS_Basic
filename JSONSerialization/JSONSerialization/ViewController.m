//
//  ViewController.m
//  JSONSerialization
//
//  Created by Hyungjin Ko on 2015. 3. 18..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "ViewController.h"
#import "JSONModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JSONModel* model = [[JSONModel alloc] init];
    //NSString* str = @"[ { \"id\": \"001\" },{ \"id\": \"007\", \"name\" : \"james\" } ]";
    //NSString* str = @"[1,2,3,4,5]";
    NSString* str = @"[{\"title\" : \"as df\", \"na me\" : \"vndf\"},[1, 2, 3, {\"ti tle\":\"asd f\"}], {1:\"adsffa\", 3:\"asdf\"}, 4, 5, 6]";
    id result = [model MyJSONSerialzationFrom:str];
    NSLog(@"%@", result);
    NSLog(@"%@", [model dataToString:result]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
