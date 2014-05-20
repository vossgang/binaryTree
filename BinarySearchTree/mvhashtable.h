//
//  mvhashtable.h
//  hashtable
//
//  Created by Matthew Voss on 5/19/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mvhashtable : NSObject

@property (nonatomic) NSInteger tableSize;
@property (nonatomic, strong) NSMutableArray *hashArray;
@property (nonatomic) NSInteger count;


-(id)initWithTableSize:(NSInteger)size;
-(void)setHashObject:(id)obj ForKey:(id)Key;

-(id)objectForKey:(NSString *)key;

@end
