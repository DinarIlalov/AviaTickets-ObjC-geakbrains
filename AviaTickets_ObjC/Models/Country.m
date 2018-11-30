//
//  Country.m
//  AviaTickets_ObjC
//
//  Created by Илалов Динар on 30/11/2018.
//  Copyright © 2018 Илалов Динар. All rights reserved.
//

#import "Country.h"

@implementation Country


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.currency = [dictionary valueForKey:@"currency"];
        self.translations = [dictionary valueForKey:@"name_translations"];
        self.name = [dictionary valueForKey:@"name"];
        self.code = [dictionary valueForKey:@"code"];
    }
    return self;
}

@end
