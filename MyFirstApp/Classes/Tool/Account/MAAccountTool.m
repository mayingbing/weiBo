//
//  MATool.m
//  MyFirstApp
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MAAccountTool.h"
#import "MAAccount.h"

#define MAAccountFileName  [ NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation MAAccountTool

static MAAccount *_account;

+(void)saveDataWithAccount:(MAAccount *)account{
    
   
    [NSKeyedArchiver archiveRootObject:account toFile:MAAccountFileName];
    
}


+(MAAccount *)account{
    
    if (_account == nil) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:MAAccountFileName];
        
        if ([[NSDate date] compare:_account.expires_date] != NSOrderedAscending) {//过期
            return  nil;
        }
    }
    return _account;
}

@end
