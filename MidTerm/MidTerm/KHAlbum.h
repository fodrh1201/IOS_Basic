//
//  KHAlbum.h
//  MidTerm
//
//  Created by Hyungjin Ko on 2015. 4. 15..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHAlbum : NSObject 

@property (strong, nonatomic) NSMutableArray* images;
@property char* data;
@property (strong, nonatomic) NSArray* years;
@property (strong, nonatomic) NSArray* startSectionIndex;
@property (strong, nonatomic) NSArray* sectionCount;

-(instancetype)init;
-(void) sort;

@end
