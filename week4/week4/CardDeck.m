//
//  CardDeck.m
//  week4
//
//  Created by Hyungjin Ko on 2015. 3. 25..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "CardDeck.h"

@implementation CardDeck
- (instancetype)init {
    self = [super init];
    if (self) {
        _cardCategory = @[@"c", @"d", @"h", @"s"];
        _cardList = [[NSMutableArray alloc] init];
        [self makeCardDeck];
    }
    return self;
}

-(void) randomize {
    int random = arc4random() % self.cardList.count;
    NSString* name = [self.cardList objectAtIndex:random];
    NSDictionary* userInfo = @{ @"message": name };
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"randomize-notification" object:nil userInfo:userInfo];
}

-(void) makeCardDeck {
    for (int i = 0; i < _cardCategory.count; i++) {
        for (int j = 1; j <= 13; j++) {
            NSString* name = [NSString stringWithFormat:@"%@%@.png", [_cardCategory objectAtIndex:i], [self returnCardNumber:j]];
            [_cardList addObject:name];
        }
    }
}

-(id) returnCardNumber:(int) number {
    id result;
    
    if (number <1 || number > 13) {
        NSLog(@"error bound exception");
        return nil;
    }
    
    switch (number) {
        case 1:
            result = @"A";
            break;
        case 11:
            result = @"J";
            break;
        case 12:
            result = @"Q";
            break;
        case 13:
            result = @"K";
            break;
        default:
            result = [NSNumber numberWithInt:number];
            break;
    }
    
    return result;
}

@end
