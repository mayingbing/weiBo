//
//  MAWebStatuses.h
//  MyFirstApp
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAWebStatuses : NSObject

+(void)receiveWebStatusesWithSinceId:(NSString *)sinceId success:(void(^)(NSArray *))success failure:(void(^)(NSError *error))failure;

+ (void)moreStatusWithMaxId:(NSString *)maxId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure;

@end
