//
//  JSONModel.h
//  JSONSerialization
//
//  Created by Hyungjin Ko on 2015. 3. 18..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONModel : NSObject

-(NSArray* ) MyJSONSerialzationToArrayFrom:(NSString*) jsonData;
-(NSDictionary*) MyJSONSerialzationToDictFrom:(NSString*) jsonData;

-(NSString*) MyJSONSerialzationToStringFrom:(NSString *)jsonData;
-(id) MyJSONSerialzationFrom:(NSString*) jsonData;
-(int) pairElementIndex:(NSString* ) jsonData initIndex:(int) firstIndex;   
-(NSString *) eliminateWhiteSpace:(NSString *) data;
-(NSString *) dataToString:(id) jsonData;
@end
