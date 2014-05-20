//
//  node.m
//  BinarySearchTree
//
//  Created by Matthew Voss on 5/19/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import "node.h"

@implementation node

+(id)nodeWithValue:(NSInteger)value
{
    node *newNode = [node new];
    newNode.value = value;
    return newNode;
}

-(void)addNode:(node *)newNode
{
    if (newNode.value < self.value) {
        if (!self.leftChild) {
            self.leftChild = newNode;
            newNode.parent = self.leftChild;
            return;
        } else {
            [self.leftChild addNode:newNode];
            
        }
    } else if (newNode.value > self.value) {
        if (!self.rightChild) {
            self.rightChild = newNode;
            newNode.parent = self.rightChild;
            return;
        } else {
            [self.rightChild addNode:newNode];
        }
    }
}



@end
