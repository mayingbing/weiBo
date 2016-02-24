//
//  MAWebATool.m
//  MyFirstApp
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MAWebATool.h"
#import "MAHTTPTool.h"
#import "MAOAuthParames.h"
#import "MJExtension.h"

#import "MAAccount.h"
#import "MAAccountTool.h"
#import "MARootTool.h"

@implementation MAWebATool




+(void)accessTokenWithCode:(NSString *)code success:(void (^)(NSArray *dataArr))success failure:(void (^)(NSError *))failure{
    
    MAOAuthParames *parame = [[MAOAuthParames alloc]init];
    
    
    parame.code = code;
    parame.client_id = @"1466602569";
    parame.client_secret =@"6ae5c30025c1c6322de18947cd716180";
    parame.grant_type =@"authorization_code";
    parame.redirect_uri =@"http://www.baidu.com";
    
    [MAHTTPTool POST:@"https://api.weibo.com/oauth2/access_token" parameters:parame.keyValues success:^(id responseObject) {
        
        MAAccount *account = [MAAccount accountWithDic:responseObject];
        
        [MAAccountTool saveDataWithAccount:account];
        
        [MARootTool chooseVersion:MYKeyWindow];
        

        
    } failure:^(NSError *error) {
        
        
        
    }];


}

@end
