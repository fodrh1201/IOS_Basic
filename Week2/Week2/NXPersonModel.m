//
//  NXPersonModel.m
//  Week2
//
//  Created by Hyungjin Ko on 2015. 3. 11..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "NXPersonModel.h"

@implementation NXPersonModel

-(void) makePath {
    _filePath = [[NSBundle mainBundle] pathForResource:@"persons" ofType:@"txt"];
}

-(void) makelinedList {
    NSString* fileContents = [NSString stringWithContentsOfFile:_filePath encoding:NSUTF8StringEncoding error:nil];
    _linedList = [fileContents componentsSeparatedByString:@"\n"];
}

-(void) makeDictList {
    [self makePath];
    [self makelinedList];
    
    NSMutableArray* listStore = [[NSMutableArray alloc] init];
    for (NSString* line in _linedList) {
        if (![line isEqualToString:@""]) {
            NSArray* lineElems = [line componentsSeparatedByString:@","];
            NSDictionary* lineDict = @{
                                        @"name" : lineElems[0],
                                        @"number" : @([lineElems[1] integerValue]),
                                        @"team" : @([lineElems[2] integerValue])
                                       };
            [listStore addObject:lineDict];
        }
    }
    _dictList = listStore;
}

-(NSString*) findPersonByNumber:(NSNumber *)number {
    NSString* name = nil;
    for (NSDictionary* record in _dictList) {
        if ([number isEqualToNumber:record[@"number"]]) {
            name = record[@"name"];
            break;
        }
    }
    return name;
}

-(NSNumber*) findPersonByName:(NSString *)name {
    NSNumber* number = nil;
    for (NSDictionary* record in _dictList) {
        if ([name isEqualToString:record[@"name"]]) {
            number = record[@"number"];
            break;
        }
    }
    return number;
}

-(NSArray*) sortedByName {
    NSSortDescriptor* sdName = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    return [_dictList sortedArrayUsingDescriptors:@[sdName]];
}

-(NSArray*) sortedByNumber {
    NSSortDescriptor* sdNumber = [[NSSortDescriptor alloc] initWithKey:@"number" ascending:YES];
    return [_dictList sortedArrayUsingDescriptors:@[sdNumber]];
}

-(NSArray*) sortedByTeam {
    NSSortDescriptor* sdTeam = [[NSSortDescriptor alloc] initWithKey:@"team" ascending:YES];
    return [_dictList sortedArrayUsingDescriptors:@[sdTeam]];
}

@end
