//
//  GPAPIHeader.h
//  GraduationProject
//
//  Created by CoDancer on 15/12/13.
//  Copyright © 2015年 onwer. All rights reserved.
//


#ifndef GPAPIHeader_h
#define GPAPIHeader_h

typedef void (^FMHTTPClientSuccessBlock)(id responseObject);
typedef void (^FMHTTPClientFailureBlock)(NSError *error, id cacheData);


#define FM_HTTP_FAILURE ^(AFHTTPRequestOperation *operation, NSError *error, id cacheData) { \
if (failure) { \
failure(error, cacheData); \
}\
}

#define FM_DEFAULT_API(METHOD) \
- (NSOperation*)METHOD ## Success:(FMHTTPClientSuccessBlock)success failure:(FMHTTPClientFailureBlock)failure
#define FM_DEFAULT_PARAMS_API(METHOD) \
- (NSOperation*)METHOD success:(FMHTTPClientSuccessBlock)success failure:(FMHTTPClientFailureBlock)failure


#endif /* GPAPIHeader_h */
