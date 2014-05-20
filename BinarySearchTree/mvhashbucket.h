//
//  mvhashbucket.h
//  hashtable
//
//  Created by Matthew Voss on 5/19/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mvhashbucket : NSObject

@property (nonatomic, strong) mvhashbucket *next;
@property (nonatomic, strong) id obj;
@property (nonatomic, strong) NSString *key;

@end
