//
//  SeachObject.m
//  BinarySearchTree
//
//  Created by Matthew Voss on 5/19/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import "SeachObject.h"

@interface SeachObject ()

@property (nonatomic, strong) node *root;

@end

@implementation SeachObject


-(void)addValue:(NSInteger)value
{
    node *newNode = [node nodeWithValue:value];
    
    if (!self.root) {
        self.root = newNode;
        return;
    }
    //add our node
    [self.root addNode:newNode];
    
    
}

-(node *)findNodeForValue:(NSInteger)value
{
    
    node *searchNode = [self findNodeForValue:value onNode:self.root];
    
    return searchNode;
}

-(node *)findNodeForValue:(NSInteger)value onNode:(node *)node
{
    if (node) {
        if (value == node.value){
            return node;
        } else if (value < node.value){
            return [self findNodeForValue:value onNode:node.leftChild];
        } else if (value > node.value){
            return [self findNodeForValue:value onNode:node.rightChild];
        }
    }
    return node;
}

-(void)deleteNode:(node *)DELnode
{
    node *foundNode = DELnode;
    
    if ([foundNode isEqual:_root]) {
        return;
    }
    
    if (foundNode) {
        if (!foundNode.leftChild && !foundNode.rightChild) {
            foundNode = nil;
            return;
        }
        
        node *nodeToRelocate;
        
        if (foundNode.rightChild) {
            if (foundNode.leftChild) {
                nodeToRelocate = foundNode.leftChild;
            } else {
                foundNode.parent.rightChild = foundNode.rightChild;
                return;
            }
        } else  {
            foundNode.parent.leftChild = foundNode.leftChild;
            return;
        }
        
        node *leftMostNode = nodeToRelocate;
        
        while (leftMostNode.leftChild) {
            NSLog(@"loop");
            leftMostNode = leftMostNode.leftChild;
        }
        
        leftMostNode.leftChild = nodeToRelocate;
        
    }
    
}



-(void)printOutAllNodes
{
    [self printOutValueForNode:self.root];
}

-(void)printOutValueForNode:(node *)node
{
    if (!node) {
        return;
    }
    [self printOutValueForNode:node.leftChild];
    NSLog(@"%d", node.value);
    [self printOutValueForNode:node.rightChild];
    
}

-(void)deleteNodeForValue:(NSInteger)value {
    
    node *nodePendingDeletion = [self findNodeForValue:value];
    
    //if there is no node associated with the input value, exit method
    if (!nodePendingDeletion) return;
    
    
    //handel root node deletion
    if ([nodePendingDeletion isEqual:_root]) {
    }
    
    //if the node has no children, delete it explicitly
    if (!nodePendingDeletion.rightChild && !nodePendingDeletion.leftChild) {
        nodePendingDeletion = NULL; return;
    }
    
    //assign the left child of the node pending deletion as it's successor in the tree
    if (nodePendingDeletion.parent.leftChild == nodePendingDeletion) {
        nodePendingDeletion.parent.leftChild = nodePendingDeletion.leftChild;
        return;
    } else {
        nodePendingDeletion.parent.rightChild = nodePendingDeletion.leftChild;
        return;
    }

}
    


@end
