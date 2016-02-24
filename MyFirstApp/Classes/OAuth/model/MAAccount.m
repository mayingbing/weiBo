//
//  MAAccount.m
//  MyFirstApp
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MAAccount.h"

#define MAAccountTokenKey @"token"
#define MAUidKey @"uid"
#define MAExpires_inKey @"exoires"
#define MAExpires_dateKey @"date"

@implementation MAAccount

+(instancetype)accountWithDic:(NSDictionary*)dic{
    
    MAAccount *account = [[self alloc] init];
    
    [account setValuesForKeysWithDictionary:dic];
    
    return account;
    
}

/*
 
 "access_token" = "2.00Yiw6OGJ1iPbB50d2c804c70pGPek";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 5709849610;
 
 */
- (void)setExpires_in:(NSString *)expires_in
{
    _expires_in = expires_in;
    
    // 计算过期的时间 = 当前时间 + 有效期
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:[expires_in longLongValue]];
}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:_access_token forKey:MAAccountTokenKey];
    [aCoder encodeObject:_expires_in forKey:MAExpires_inKey];
    [aCoder encodeObject:_expires_date forKey:MAExpires_dateKey];
    [aCoder encodeObject:_uid forKey:MAUidKey];
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        
        _access_token = [aDecoder decodeObjectForKey:MAAccountTokenKey];
        _expires_in = [aDecoder decodeObjectForKey:MAExpires_inKey];
        _expires_date = [aDecoder decodeObjectForKey:MAExpires_dateKey];
        _uid = [aDecoder decodeObjectForKey:MAUidKey];
        
    }
    return  self;
}


@end
