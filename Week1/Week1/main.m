//
//  main.m
//  Week1
//
//  Created by Hyungjin Ko on 2015. 3. 4..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NXPerson.h"
#import "NXFile.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        NXPerson* aPerson = [[NXPerson alloc] initWithName: @"jin"
//                                                       age: 20];
        [NXFile NXDisplayAllFileAtPath:@"/Users/fodrh/Documents/Hyungjin/Algorithm"];

//        [aPerson display];
//        
//        [aPerson setAge:13
//                   name:@"hyungjin"];
//        
//        [aPerson display];
    }
    return 0;
}
