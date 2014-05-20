//
//  SeachObject.h
//  BinarySearchTree
//
//  Created by Matthew Voss on 5/19/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "node.h"

@interface SeachObject : NSObject

-(void)addValue:(NSInteger)value;
-(node *)findNodeForValue:(NSInteger)value;
-(void)deleteNode:(node *)DELnode;
-(void)printOutAllNodes;

-(void)deleteNodeForValue:(NSInteger)value;
@end
