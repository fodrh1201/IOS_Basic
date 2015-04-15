//
//  KHAlbum.m
//  MidTerm
//
//  Created by Hyungjin Ko on 2015. 4. 15..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHAlbum.h"

@implementation KHAlbum

-(instancetype)init {
    self = [super init];
    if (self) {
        _data = "[{\"title\":\"초록\",\"image\":\"01.jpg\",\"date\":\"20140116\"},\
        {\"title\":\"장미\",\"image\":\"02.jpg\",\"date\":\"20140505\"},\
        {\"title\":\"낙엽\",\"image\":\"03.jpg\",\"date\":\"20131212\"},\
        {\"title\":\"계단\",\"image\":\"04.jpg\",\"date\":\"20130301\"},\
        {\"title\":\"벽돌\",\"image\":\"05.jpg\",\"date\":\"20140101\"},\
        {\"title\":\"바다\",\"image\":\"06.jpg\",\"date\":\"20130707\"},\
        {\"title\":\"벌레\",\"image\":\"07.jpg\",\"date\":\"20130815\"},\
        {\"title\":\"나무\",\"image\":\"08.jpg\",\"date\":\"20131231\"},\
        {\"title\":\"흑백\",\"image\":\"09.jpg\",\"date\":\"20140102\"}]";
        
        [self setImagesOnImageArray];
    }
    
    return self;
}

- (void) setImagesOnImageArray {
    NSError* jsonError;
    NSData* objectData = [[NSString stringWithUTF8String:self.data] dataUsingEncoding:NSUTF8StringEncoding];
    self.images = [NSJSONSerialization JSONObjectWithData:objectData
                                                  options:NSJSONReadingMutableContainers
                                                    error:&jsonError];
    
    
    NSDictionary* userInfo = @{@"data" : self.images};
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"init-images" object:nil userInfo:userInfo];
    [self setYearArray];
    [self setStartSectionIndex];
}

- (void) sort {
    NSArray* sortedArray = [self.images sortedArrayUsingComparator:^NSComparisonResult(NSDictionary* a, NSDictionary* b) {
        NSString* first = a[@"date"];
        NSString* second = b[@"date"];
        return [first compare:second];
    }];
    
    
    self.images = [NSMutableArray arrayWithArray:sortedArray];
    NSDictionary* userInfo = @{@"data" : self.images};
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"init-images" object:nil userInfo:userInfo];
    
//    NSLog(@"%@", self.images);
}

- (void) setYearArray {
    NSMutableSet* years = [[NSMutableSet alloc] init];
    for (NSDictionary* image in self.images) {
        NSString* date = image[@"date"];
        [years addObject:[date substringToIndex:4]];
    }
    self.years = [NSArray arrayWithArray:[years allObjects]];
}

- (void) setStartSectionIndex {
    int count = 0;
    int anotherCount = 0;
    for (NSDictionary* image in self.images) {
        NSString* date = image[@"date"];
        if ([self.years[0] isEqualToString:[date substringToIndex:4]])
            count++;
        else
            anotherCount++;
    }
    self.startSectionIndex = @[ @0, [NSNumber numberWithInt:count]];
    self.sectionCount = @[ [NSNumber numberWithInteger:count], [NSNumber numberWithInteger:anotherCount]];
}

@end
