//
//  MAAccount.h
//  MyFirstApp
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MAAccount : NSObject<NSCoding>

@property(nonatomic ,copy) NSString *access_token;

@property(nonatomic ,copy) NSString *expires_in;

@property(nonatomic ,copy) NSString *remind_in;

@property(nonatomic ,copy) NSString *uid;

@property (nonatomic, strong) NSDate *expires_date;

+(instancetype)accountWithDic:(NSDictionary*)dic;


@end
