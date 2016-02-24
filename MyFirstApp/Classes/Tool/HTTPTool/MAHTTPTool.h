//
//  MAHTTPTool.h
//  MyFirstApp
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAHTTPTool : NSObject

+(void)GET:URLStr parameters:parames success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

+(void)POST:URLStr parameters:parames success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
