//
//  InterfaceController.m
//  iHW WatchKit Extension
//
//  Created by Jonathan Damico on 5/2/15.
//  Copyright (c) 2015 Jonathan Burns. All rights reserved.
//

#import "InterfaceController.h"
#import "IHWCurriculum.h"
#import "IHWHoliday.h"




@interface InterfaceController()

@property (nonatomic, weak) IBOutlet WKInterfaceLabel *currentDay;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *nextPeriodName;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *currentPeriodName;
@property (nonatomic, weak) IBOutlet WKInterfaceTimer *nextPeriodStart;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *holiday;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *dayGroup;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *period;

@end


@implementation InterfaceController

- (void)initWithDate:(IHWDate *)date {
        self.date = date;
        self.day = [[IHWCurriculum currentCurriculum] dayWithDate:self.date];
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    if([self.day isKindOfClass:[IHWHoliday class]] && ![((IHWHoliday*)self.day).name isEqualToString:@""]) {
        [self.holiday setHidden:NO];
    } else {
        [self.holiday setHidden:YES];
    }
}

- (void)showCurrentDay {

}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


@end



