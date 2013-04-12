//
//  ViewController.m
//  SNBDelLineDemo
//
//  Created by Fang Yang on 4/12/13.
//  Copyright (c) 2013 Snowball. All rights reserved.
//

#import "ViewController.h"
#import "SNBDelLineLabel.h"

@interface ViewController ()

@end

@implementation ViewController
{
    IBOutlet SNBDelLineLabel *testLabel;
}

- (IBAction)addDelLine:(id)sender
{
    [testLabel addDeleteLine];
}

@end
