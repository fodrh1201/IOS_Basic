//
//  ViewController.m
//  week4
//
//  Created by Hyungjin Ko on 2015. 3. 25..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "ViewController.h"
#import "CardDeck.h"

@interface ViewController ()
@property (strong, nonatomic) CardDeck* cardDeck;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


-(void) didReceiveRandomizeNotification:(NSNotification*) notification;
-(void) registerRandomizeObserver;
- (BOOL)canBecomeFirstResponder;
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cardDeck = [[CardDeck alloc] init];
    [self registerRandomizeObserver];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) didReceiveRandomizeNotification:(NSNotification*) notification {
    id object = [notification.userInfo objectForKey:@"message"];
    NSString* image = [NSString stringWithFormat:@"card_decks/%@", object];
    UIImage* uiImage = [UIImage imageNamed:image];
    [self.imageView setImage:uiImage];
    [self.view addSubview:self.imageView];
}

-(void) registerRandomizeObserver {
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(didReceiveRandomizeNotification:) name:@"randomize-notification" object:nil];
}

- (IBAction)pickCard:(id)sender {
    [self.cardDeck randomize];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        [self.cardDeck randomize];
    } 
}

@end
