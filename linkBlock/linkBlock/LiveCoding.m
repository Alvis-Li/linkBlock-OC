//
//  LiveCoding.m
//  linkBlock
//
//  Created by leolevy on 4/22/16.
//  Copyright © 2016 levy. All rights reserved.
//

#import "LiveCoding.h"
@interface LiveCoding()

@end

@implementation LiveCoding

-(NSMutableString *)apiUrl{
    if (!_apiUrl) {
        _apiUrl = [NSMutableString string];
    }
    return _apiUrl;
}
-(id)appendFormatWithSelector:(NSString *)selector{
    [self.apiUrl appendFormat:@"/%@",selector];
    return self;
}
-(LiveCodingAPI *)api{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}

-(LiveCodingAPICodingcategories *)codingcategories{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPILanguages *)languages{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPILivestreams *)livestreams{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIScheduledbroadcast *)scheduledbroadcast{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIUser *)user{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIUsers *)users{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPI *)v1{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}

-(LiveCodingAPIVideos *)videos{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}

-(LiveCodingAPIEnd *)follows{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIEnd *)followers{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIEnd *)viewing_key{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIEnd *)chat_account{
    return [self appendFormatWithSelector:@"chat/account"];
}
-(LiveCodingAPIEnd *(^)(NSString *))slug{
    return ^(NSString * slug){
        return [self appendFormatWithSelector:slug];
    };
}
-(LiveCodingAPIEnd *)latest{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIEnd *(^)(NSString *))name{
    return ^(NSString * name){
        return [self appendFormatWithSelector:name];
    };
}
-(LiveCodingAPIEnd *)onair{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIEnd *(^)(NSString *))uer_slug{
    return ^(NSString * uer_slug){
        return [self appendFormatWithSelector:uer_slug];
    };
}
-(LiveCodingAPIEnd *(^)(NSString *))pk{
    return ^(NSString * pk){
        return [self appendFormatWithSelector:pk];
    };
}
@end

@implementation LiveCodingAPIEnd

@end
