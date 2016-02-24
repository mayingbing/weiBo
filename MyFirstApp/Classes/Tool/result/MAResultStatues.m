//
//  MAResultStatues.m
//  MyFirstApp
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MAResultStatues.h"
#import "CZStatus.h"

@implementation MAResultStatues

+(NSDictionary *)objectClassInArray{
    
    return @{@"statuses":[CZStatus class]};
    
}

@end
