//
//  NXFile.m
//  Week1
//
//  Created by Hyungjin Ko on 2015. 3. 4..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "NXFile.h"

@implementation NXFile

+(void)NXDisplayAllFileAtPath:(NSString *)path {

    NSFileManager* fileManager = [[NSFileManager alloc] init];
    NSArray* list = [fileManager contentsOfDirectoryAtPath:path error:nil];

    if (list == nil)
        return;
    
    for (int i = 0; i < [list count]; i++) {
        NSLog(@"%@", [list objectAtIndex:i]);
        NSString* newPath =
                    [NSString stringWithFormat:@"%@/%@", path, [list objectAtIndex:i]];
        [self NXDisplayAllFileAtPath:newPath];
    }
}

@end
