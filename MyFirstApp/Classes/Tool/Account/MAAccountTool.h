//
//  MATool.h
//  MyFirstApp
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MAAccount;

@interface MAAccountTool : NSObject

+(void)saveDataWithAccount:(MAAccount *)account;

+(MAAccount *)account;
@end
