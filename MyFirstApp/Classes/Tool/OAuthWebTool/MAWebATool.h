//
//  MAWebATool.h
//  MyFirstApp
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAWebATool : NSObject
+(void)accessTokenWithCode:(NSString *)code success:(void (^)(NSArray *dataArr))success failure:(void (^)(NSError *))failure;
@end
