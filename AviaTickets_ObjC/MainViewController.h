//
//  MainViewController.h
//  AviaTickets_ObjC
//
//  Created by Илалов Динар on 29/11/2018.
//  Copyright © 2018 Илалов Динар. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct SearchRequest {
    __unsafe_unretained NSString *origin;
    __unsafe_unretained NSString *destination;
    __unsafe_unretained NSDate *departDate;
    __unsafe_unretained NSDate *returnDate;
} SearchRequest;

@interface MainViewController : UIViewController


@end

