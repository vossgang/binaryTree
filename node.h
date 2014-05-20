//
//  node.h
//  BinarySearchTree
//
//  Created by Matthew Voss on 5/19/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface node : NSObject

@property (nonatomic) NSInteger value;
@property (nonatomic, strong) node *leftChild;
@property (nonatomic, strong) node *rightChild;
@property (nonatomic, weak)   node *parent;

+(id)nodeWithValue:(NSInteger)value;

-(void)addNode:(node *)newNode;

@end
