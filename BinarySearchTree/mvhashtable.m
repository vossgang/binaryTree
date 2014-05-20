//
//  mvhashtable.m
//  hashtable
//
//  Created by Matthew Voss on 5/19/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import "mvhashtable.h"
#import "mvhashbucket.h"

@implementation mvhashtable

-(NSInteger)hash:(NSString *)string
{
    NSInteger total = 0;
    
    for (int i = 0; i < string.length; i++) {
        NSInteger asc = [string characterAtIndex:i];
        
        total += asc;
    }
    
    NSInteger index = total % self.tableSize;
    
    return index;
}

-(id)objectForKey:(NSString *)key
{
    NSInteger index = [self hash:key];
    
    mvhashbucket *bucket = self.hashArray[index];
    
    while (bucket) {
        if ([bucket.key isEqualToString:key]) {
            return bucket.obj;
        } else {
            bucket = bucket.next;
        }
    }
    
    return nil;
}

-(void)resizeArray
{
    for (int i = 0; i < self.tableSize; i++)
    {
        mvhashbucket *bucket = [mvhashbucket new];
        [self.hashArray addObject:bucket];
    }
    self.tableSize += self.tableSize;
    
    for (int i = 0; i < self.hashArray.count; i++) {
        //redo all strings and put them in new array ?????
        //or just let it keep going and handle any new collisions
    }
}

-(void)removeObject:(NSString *)obj
{
    mvhashbucket *bucket = [self objectForKey:obj];
    
    if (bucket.next) {
        bucket = bucket.next;
    } else {
        bucket = nil;
    }
}

-(void)setHashObject:(id)obj ForKey:(id)Key
{
    mvhashbucket *bucket = [mvhashbucket new];
    NSInteger index = [self hash:Key];
    
    bucket.obj = obj;
    
    bucket.key = Key;
    
    bucket.next = self.hashArray[index];
    self.hashArray[index] = bucket;
    self.count++;
    if (self.count > (self.tableSize * .7)) {
        [self resizeArray];
    }
}


-(id)initWithTableSize:(NSInteger)size
{
    self = [super init];
    
    if (self) {
        self.hashArray = [NSMutableArray new];
        self.tableSize = size;
        
        for (int i = 0; i < self.tableSize; i++) {
            mvhashbucket *bucket = [mvhashbucket new];
            [self.hashArray addObject:bucket];
        }
    }
    
    return self;
}
@end
