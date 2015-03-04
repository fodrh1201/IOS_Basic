//
//  NXPerson.h
//  Week1
//
//  Created by Hyungjin Ko on 2015. 3. 4..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXPerson : NSObject {
    int _age;
    NSString* _name;
}

-(NXPerson*) initWithName:(NSString *)name age:(int) age;
-(void)setAge:(int)age name:(NSString *) name;
-(int)age;
-(NSString *) name;
-(void)display;
-(NSString *) description;

@end


//c 영역