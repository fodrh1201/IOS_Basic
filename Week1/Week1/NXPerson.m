//
//  NXPerson.m
//  Week1
//
//  Created by Hyungjin Ko on 2015. 3. 4..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "NXPerson.h"

@implementation NXPerson

-(NXPerson *)initWithName:(NSString *)name age:(int)age {
    self = [super init];
    
    if (self != nil) {
        _name = name;
        _age = age;
    }

    return self;
}
-(void)setAge:(int)age name:(NSString *)name {
    _name = name;
    _age = age;
}

-(int)age {
    return _age;
}

-(NSString *)name {
    return _name;
}

-(void)display {
    NSLog(@"Name=%@, Age=%d", [self name], [self age]);
}

-(NSString*)description {
    return [NSString stringWithFormat:@"Name=%@, Age=%d", _name, _age];
}

@end


//c 영역