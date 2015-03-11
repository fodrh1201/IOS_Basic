//
//  NXPersonModel.h
//  Week2
//
//  Created by Hyungjin Ko on 2015. 3. 11..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXPersonModel : NSObject

-(void) makePath;
-(void) makelinedList;
-(void) makeDictList;
-(NSString*) findPersonByNumber:(NSNumber*)number;
-(NSNumber*) findPersonByName:(NSString*)name;
-(NSArray*) sortedByName;
-(NSArray*) sortedByNumber;
-(NSArray*) sortedByTeam;

@property NSString* filePath;
@property NSArray* linedList;
@property NSArray* dictList;

@end
