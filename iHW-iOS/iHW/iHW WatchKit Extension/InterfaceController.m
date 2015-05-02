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
#import "IHWDate.h"
#import "IHWPeriodCellView.h"




@interface InterfaceController()


@property (nonatomic, weak) IBOutlet WKInterfaceTimer *nextPeriodStart;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *holidayGroup;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *dayGroup;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *currentPeriodGroup;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *passingPeriodGroup;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *currentPeriodName;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *currentDay;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *nextPeriodName;
@property (weak, nonatomic) IBOutlet WKInterfaceTimer *nextPeriodCountdown;


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
        [self.holidayGroup setHidden:NO];
        [self.dayGroup setHidden:YES];
    } else {
        [self.holidayGroup setHidden:YES];
        [self.dayGroup setHidden:NO];
    }
    bool good = false;
    int index = 1;
    IHWPeriodCellView *view;
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"period%@.%d", self.date.description, index]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    while(!good){
        view = [[IHWPeriodCellView alloc] initWithPeriod:[self.day.periods objectAtIndex:index] atIndex:index forTableViewCell:cell];
        if([view createCountdownViewIfNeeded]) good=true;
    }
    int currentPeriod = index;
    
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


@end



