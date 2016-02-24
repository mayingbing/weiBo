//
//  MAWebStatuses.m
//  MyFirstApp
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MAWebStatuses.h"
#import "MAHTTPTool.h"
#import "CZStatus.h"
#import "MAAccountTool.h"
#import "MAAccount.h"
#import "MAParames.h"

#import "MAResultStatues.h"

@implementation MAWebStatuses

+(void)receiveWebStatusesWithSinceId:(NSString *)sinceId success:(void(^)(NSArray *statuse))success failure:(void(^)(NSError *error))failure{

    MAParames *parames = [[MAParames alloc]init];

    parames.access_token= [MAAccountTool account].access_token;
    NSString *urlStr =@"https://api.weibo.com/2/statuses/friends_timeline.json";
    
    [MAHTTPTool GET:urlStr parameters:parames success:^(id responseObject) {
        

        NSArray *dictArr = responseObject[@"statuses"];
        NSArray *statuse = [CZStatus objectArrayWithKeyValuesArray:dictArr];
        if (success) {
            success(statuse);
        }
       
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)moreStatusWithMaxId:(NSString *)maxId success:(void (^)(NSArray *dataArr))success failure:(void (^)(NSError *))failure{
    
    NSMutableDictionary *parames = [NSMutableDictionary dictionary];
    
    
    parames[@"access_token"]= [MAAccountTool account].access_token;
    
    [MAHTTPTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:parames success:^(id responseObject) {
        // 请求成功代码先保存
        
        // 把结果字典转换结果模型
        MAResultStatues *result = [MAResultStatues objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}

@end




