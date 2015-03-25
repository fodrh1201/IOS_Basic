//
//  CardDeck.h
//  week4
//
//  Created by Hyungjin Ko on 2015. 3. 25..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardDeck : NSObject
@property (strong, nonatomic) NSArray* cardCategory;
@property (strong, nonatomic) NSMutableArray* cardList;

-(void)randomize;
-(void) makeCardDeck;
-(id) returnCardNumber:(int) number;
@end
