//
//  LiveCoding.h
//  linkBlock
//
//  Created by leolevy on 4/22/16.
//  Copyright © 2016 levy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LiveCodingAPI;
@class LiveCodingAPIUser;
@class LiveCodingAPIUsers;
@class LiveCodingAPIVideos;
@class LiveCodingAPIRequest;
@class LiveCodingAPILanguages;
@class LiveCodingAPILivestreams;
@class LiveCodingAPIAuthRequest;
@class LiveCodingAPICodingcategories;
@class LiveCodingAPIScheduledbroadcast;


@interface LiveCoding : NSObject

@property (nonatomic, readonly) LiveCodingAPI *api;
@property (nonatomic, strong) NSMutableString *apiUrl;

@end

@interface LiveCodingAPI : LiveCoding

-(LiveCodingAPICodingcategories *)codingcategories;
-(LiveCodingAPILanguages *)languages;
-(LiveCodingAPILivestreams *)livestreams;
-(LiveCodingAPIScheduledbroadcast *)scheduledbroadcast;
-(LiveCodingAPIUser *)user;
-(LiveCodingAPIUsers *)users;
-(LiveCodingAPI *)v1;
-(LiveCodingAPIVideos *)videos;
-(LiveCodingAPIAuthRequest *)authorize;
@end


@interface LiveCodingAPICodingcategories : LiveCoding

-(LiveCodingAPIRequest *(^)(NSString *))name;

@end

@interface LiveCodingAPILanguages : LiveCoding

-(LiveCodingAPIRequest *(^)(NSString *))name;

@end

@interface LiveCodingAPILivestreams : LiveCoding

-(LiveCodingAPIRequest *)onair;
-(LiveCodingAPIRequest *(^)(NSString *))uer_slug;

@end

@interface LiveCodingAPIScheduledbroadcast : LiveCoding

-(LiveCodingAPIRequest *(^)(NSString *))pk;

@end

@interface LiveCodingAPIUser : LiveCoding

-(LiveCodingAPIRequest *)follows;
-(LiveCodingAPIRequest *)followers;
-(LiveCodingAPIRequest *)viewing_key;
-(LiveCodingAPIRequest *)chat_account;

@end

@interface LiveCodingAPIUsers : LiveCoding

-(LiveCodingAPIRequest *(^)(NSString *))slug;

@end

@interface LiveCodingAPIVideos : LiveCoding

-(LiveCodingAPIRequest *)latest;

@end

@interface LiveCodingAPIRequest : LiveCoding

-(void)requestWithMethod:(NSString *)method oauthCode:(NSString *)oauthCode success:(void (^)(id response, id responseObject))success failure:(void (^)(id response, NSError *error))failure;

@end

@interface LiveCodingAPIAuthRequest : LiveCoding

-(void)accessTokenWithCode:(NSString *)code  success:(void (^)(id response, id responseObject))success failure:(void (^)(id response, NSError *error))failure;

@end
