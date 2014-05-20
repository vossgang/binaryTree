//
//  mvViewController.m
//  BinarySearchTree
//
//  Created by Matthew Voss on 5/19/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import "mvViewController.h"
#import "SeachObject.h"

@interface mvViewController ()

@end

@implementation mvViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    SeachObject *obj = [SeachObject new];
    
    for (int i = 0; i < 5; i++) {
        [obj addValue:arc4random_uniform(1000)];
    }
    
    [obj printOutAllNodes];
    
    NSLog(@"\n\n\n");

    
    [obj addValue:440];
    [obj addValue:439];
    [obj addValue:441];
    
    [obj printOutAllNodes];
    
    for (int i = 0; i < 5; i++) {
        [obj addValue:arc4random_uniform(1000)];
    }
    NSLog(@"\n\n\n");

    [obj printOutAllNodes];
    
    NSLog(@"\n\n\n");
    
    [obj deleteNode:[obj findNodeForValue:440]];
    sleep(3);
    
    [obj printOutAllNodes];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
