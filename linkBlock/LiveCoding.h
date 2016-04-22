//
//  LiveCoding.h
//  linkBlock
//
//  Created by leolevy on 4/22/16.
//  Copyright © 2016 levy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LiveCodingAPI;
@class LiveCodingAPIEnd;
@class LiveCodingAPIUser;
@class LiveCodingAPIUsers;
@class LiveCodingAPIVideos;
@class LiveCodingAPILanguages;
@class LiveCodingAPILivestreams;
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

@end


@interface LiveCodingAPICodingcategories : LiveCoding
-(LiveCodingAPIEnd *(^)(NSString *))name;
@end

@interface LiveCodingAPILanguages : LiveCoding
-(LiveCodingAPIEnd *(^)(NSString *))name;
@end

@interface LiveCodingAPILivestreams : LiveCoding
-(LiveCodingAPIEnd *)onair;
-(LiveCodingAPIEnd *(^)(NSString *))uer_slug;
@end

@interface LiveCodingAPIScheduledbroadcast : LiveCoding
-(LiveCodingAPIEnd *(^)(NSString *))pk;
@end

@interface LiveCodingAPIUser : LiveCoding
-(LiveCodingAPIEnd *)follows;
-(LiveCodingAPIEnd *)followers;
-(LiveCodingAPIEnd *)viewing_key;
-(LiveCodingAPIEnd *)chat_account;
@end

@interface LiveCodingAPIUsers : LiveCoding
-(LiveCodingAPIEnd *(^)(NSString *))slug;
@end

@interface LiveCodingAPIVideos : LiveCoding
-(LiveCodingAPIEnd *)latest;
@end

@interface LiveCodingAPIEnd : NSObject

@end
