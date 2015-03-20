//
//  JSONModel.m
//  JSONSerialization
//
//  Created by Hyungjin Ko on 2015. 3. 18..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "JSONModel.h"

@implementation JSONModel

-(NSString *) dataToString:(id) jsonData {
    if ([jsonData isKindOfClass:[NSDictionary class]]) {
        NSString* result = @"{";
        NSArray* keys = [jsonData allKeys];
        NSUInteger length = [keys count];
        
        if (length == 0) {
            return [result stringByAppendingString:@"}"];
        }
        
        for (int i = 0; i < length - 1; i++) {
            id object = [jsonData objectForKey:keys[i]];
            NSString* elem = [NSString stringWithFormat:@"%@ : %@, ", keys[i], [self dataToString:object] ];
            result = [result stringByAppendingString:elem];
        }
        id object = [jsonData objectForKey:keys[length -1]];
        NSString* elem = [NSString stringWithFormat:@"%@ : %@", keys[length-1], [self dataToString:object] ];
        
        result = [result stringByAppendingString:elem];
        result = [result stringByAppendingString:@"}"];

        return result;
    } else if ([jsonData isKindOfClass:[NSArray class]]) {
        NSString* result = @"[";
        NSUInteger length = [jsonData count];
        
        if (length == 0) {
            return [result stringByAppendingString:@"]"];
        }
        
        for (int i = 0; i < length - 1; i++) {
            id object = [jsonData objectAtIndex:i];
            NSString* elem = [NSString stringWithFormat:@"%@, ", [self dataToString:object] ];
            result = [result stringByAppendingString:elem];
        }
        id object = [jsonData objectAtIndex:length - 1];
        NSString* elem = [NSString stringWithFormat:@"%@ ", [self dataToString:object] ];
        result = [result stringByAppendingString:elem];
        result = [result stringByAppendingString:@"]"];
        
        return result;
    } else if ([jsonData isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"%@", jsonData];
    } else {
        return [NSString stringWithFormat:@"%@", jsonData];
    }
    return nil;
}

-(NSArray* ) MyJSONSerialzationToArrayFrom:(NSString *)jsonData {
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    int index = 0;
    //jsonData = [self eliminateWhiteSpace:jsonData];
    while (index < [jsonData length]) {
        int secondIndex = [self pairElementIndex:jsonData initIndex:index];
        
        [array addObject:[self MyJSONSerialzationFrom:[jsonData substringWithRange:NSMakeRange(index, secondIndex - index + 1)]]];
        index = secondIndex+2;
    }
    
    return array;
}

-(NSString*) MyJSONSerialzationToStringFrom:(NSString *)jsonData {
    
    int secondIndex = [self pairElementIndex:jsonData initIndex:0];
    NSString* result = [jsonData substringWithRange:NSMakeRange(1, secondIndex - 1)];
    
    return result;
}

-(NSDictionary *) MyJSONSerialzationToDictFrom:(NSString *)jsonData {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    //jsonData = [self eliminateWhiteSpace:jsonData];
    
    NSArray* array = [self MyJSONSerialzationToArrayFrom:jsonData];
    
    int i = 0;
    while (i < [array count]) {
        [dict setValue:[array objectAtIndex:i+1] forKey:[array objectAtIndex:i]];
        i = i + 2;
    }
    
    return dict;
}

-(NSString *) eliminateWhiteSpace:(NSString *)data {
//    BOOL isQuatation = false;
//    char* removeWhiteSpace = (char*) malloc(sizeof(char)*([data length]+1));
//    int index = 0;
//    
//    for (int i= 0; i < [data length]; i++) {
//        char character = [data characterAtIndex:i];
//        switch (character) {
//            case '\'':
//                if (isQuatation) {
//                    isQuatation = false;
//                } else {
//                    isQuatation = true;
//                }
//                removeWhiteSpace[index] = character;
//                index++;
//                break;
//            case '"':
//                if (isQuatation) {
//                    isQuatation = false;
//                } else {
//                    isQuatation = true;
//                }
//                removeWhiteSpace[index] = character;
//                index++;
//                break;
//            case ' ':
//                if (isQuatation) {
//                    removeWhiteSpace[index] = character;
//                    index++;
//                }
//                break;
//            default:
//                removeWhiteSpace[index] = character;
//                index++;
//                break;
//        }
//        printf("%s\n", removeWhiteSpace);
//    }
//    removeWhiteSpace[index] = '\0';
//    
//    NSString* result = [NSString stringWithUTF8String:removeWhiteSpace];
//    free(removeWhiteSpace);
//    
//    if (index == 0)
//        result = @"";
//    
//    return result;
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    data = [data stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //data = [data stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    return data;
}

-(id) MyJSONSerialzationFrom:(NSString *)json {
    NSString* jsonData = [self eliminateWhiteSpace:json];
    char type = [jsonData characterAtIndex:0];
    if (type == '[') {
        if ([jsonData length] -2 == 0){
            return [[NSArray alloc] init];
        }
        NSString* subStr = [jsonData substringWithRange:NSMakeRange(1, [jsonData length] -2)];
        
        return [self MyJSONSerialzationToArrayFrom:subStr];
        
    } else if (type == '{') {
        if ([jsonData length] -2 == 0){
            return [[NSDictionary alloc] init];
        }
        
        NSString* subStr = [jsonData substringWithRange:NSMakeRange(1, [jsonData length] -2)];
        
        return [self MyJSONSerialzationToDictFrom:subStr];
    } else if (type == '\'' || type == '\"') {
        //return json;
        return [self MyJSONSerialzationToStringFrom: jsonData];
    } else
        return json;
        // 타입에 따라 출력 다르게 레귤러 익스프레스 사용해서
}

-(int) pairElementIndex:(NSString* ) jsonData initIndex:(int) firstIndex {
    //jsonData = [self eliminateWhiteSpace:jsonData];
    char type = [jsonData characterAtIndex:firstIndex];
    int index = firstIndex + 1;
    int count = 1;
    
    if (type == '\"') {
        for (int i = index; i < [jsonData length]; i++) {
            if ([jsonData characterAtIndex:i] == '\"') {
                index = i;
                break;
            }
        }
    } else if (type == '\'') {
        for (int i = index; i < [jsonData length]; i++) {
            if ([jsonData characterAtIndex:i] == '\'') {
                index = i;
                break;
            }
        }
    } else if (type == '{') {
        for (int i = index; i < [jsonData length]; i++) {
            if ([jsonData characterAtIndex:i] == '{') {
                count += 1;
            } else if ([jsonData characterAtIndex:i] == '}') {
                count -= 1;
            }
            if (count == 0) {
                index = i;
                break;
            }
        }
    } else if (type == '[') {
        for (int i = index; i < [jsonData length]; i++) {
            if ([jsonData characterAtIndex:i] == '[') {
                count += 1;
            } else if ([jsonData characterAtIndex:i] == ']') {
                count -= 1;
            }
            if (count == 0) {
                index = i;
                break;
            }
        }
    } else {
        
        for (int i = index; i < [jsonData length]; i++) {
            if ([jsonData characterAtIndex:i] == ',') {
                index = i - 1;
                break;
            } else if ([jsonData characterAtIndex:i] == ':') {
                index = i - 1;
                break;
            } else if ([jsonData characterAtIndex:i] == '}') {
                index = i - 1;
                break;
            } else if ([jsonData characterAtIndex:i] == ']') {
                index = i - 1;
                break;
            }
        }
        if (index >= [jsonData length])
            index -= 1;
    }
    
    return index;
}

@end
