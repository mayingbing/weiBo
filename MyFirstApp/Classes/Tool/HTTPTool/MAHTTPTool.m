//
//  MAHTTPTool.m
//  MyFirstApp
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MAHTTPTool.h"
#import "AFNetworking.h"

@implementation MAHTTPTool


+(void)GET:URLStr parameters:parames success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr GET:URLStr parameters:parames success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
}


+(void)POST:URLStr parameters:parames success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    
     AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    [mgr POST:URLStr parameters:parames success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }

        
    }];
    
}



@end
