//
//  MAOAuthParames.h
//  MyFirstApp
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAOAuthParames : NSObject



@property(nonatomic ,copy)NSString *client_id;

@property(nonatomic ,copy)NSString *client_secret;

@property(nonatomic ,copy)NSString *grant_type;

@property(nonatomic ,copy)NSString *code;

@property(nonatomic ,copy)NSString *redirect_uri;

@end
