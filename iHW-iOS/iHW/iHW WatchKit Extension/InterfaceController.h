//
//  InterfaceController.h
//  iHW WatchKit Extension
//
//  Created by Jonathan Damico on 5/2/15.
//  Copyright (c) 2015 Jonathan Burns. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "IHWDate.h"
#import "IHWDay.h"

@interface InterfaceController : WKInterfaceController
@property (nonatomic, strong) IHWDate *date;
@property (nonatomic, strong) IHWDay *day;
@end
