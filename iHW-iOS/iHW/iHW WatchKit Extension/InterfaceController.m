//
//  InterfaceController.m
//  iHW WatchKit Extension
//
//  Created by Jonathan Damico on 5/2/15.
//  Copyright (c) 2015 Jonathan Burns. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@property (nonatomic, weak) IBOutlet WKInterfaceLabel *currentDay;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *nextPeriodName;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *currentPeriodName;
@property (nonatomic, weak) IBOutlet WKInterfaceTimer *nextPeriodStart;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



