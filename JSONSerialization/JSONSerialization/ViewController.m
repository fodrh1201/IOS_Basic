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
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UILabel *mTitle;
@property (weak, nonatomic) IBOutlet UILabel *mContents;
@property (strong, nonatomic) id result;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JSONModel* model = [[JSONModel alloc] init];
    
    NSString* str = @"[{\"title\":\"\uc0c8\uae001\",\"image\":\"01.jpg\",\"content\":\"\uc601\ud654\ubcf4\ub7ec \uac00\uc790\",\"comments\":[{\"id\":1,\"user\":\"jobs\",\"comment\":\"apple\"},{\"id\": 4,\"user\":\"cook\",\"comment\":\"apple\"}]}, {\"title\":\"\ud1a0\uc774\uc2a4\ud1a0\ub9ac?\",\"image\":\"02.jpg\",\"content\":\"Pixar\",\"c omments\":[]},{\"title\":\"ToyStory\",\"image\":\"03.jpg\",\"content\":\"\uc6b0\ub514\uac00 \ucd5c\uace0\",\"comments\":[{\"id\":2,\"user\":\"bill\",\"comment\":\"Microsoft\"}]}, {\"title\":\"\uadf9\uc7a5\uc740\",\"image\":\"04.jpg\",\"content\":\"\uc5b4\ub514\ub85c\",\"c omments\":[{\"id\":4,\"user\":\"cook\",\"comment\":\"apple\"}]}]";
    _result = [model MyJSONSerialzationFrom:str];
    NSLog(@"%@", _result);
    NSLog(@"%@", [model dataToString:_result]);
}

- (IBAction)randomButton:(id)sender {
    int cnt = [_result count];
    int randomNum = arc4random() % cnt;
    id elem = [_result objectAtIndex:randomNum];
    NSString* title = [elem objectForKey:@"title"];
    NSString* image = [elem objectForKey:@"image"];
    NSString* contents = [elem objectForKey:@"contents"];
    _mTitle.text = title;
    _mContents.text = contents;
    UIImage* uiImage = [UIImage imageNamed:image];
    [_mImageView setImage:uiImage];
    [self.view addSubview:_mImageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
