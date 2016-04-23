//
//  LiveCoding.m
//  linkBlock
//
//  Created by leolevy on 4/22/16.
//  Copyright © 2016 levy. All rights reserved.
//

#import "LiveCoding.h"
#import "Secret.h"
#import "AFNetworking.h"

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
-(LiveCodingAPIAuthRequest *)authorize{
    return [self appendFormatWithSelector:tokenUrl];
}
-(LiveCodingAPIRequest *)follows{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIRequest *)followers{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIRequest *)viewing_key{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIRequest *)chat_account{
    return [self appendFormatWithSelector:@"chat/account"];
}
-(LiveCodingAPIRequest *(^)(NSString *))slug{
    return ^(NSString * slug){
        return [self appendFormatWithSelector:slug];
    };
}
-(LiveCodingAPIRequest *)latest{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIRequest *(^)(NSString *))name{
    return ^(NSString * name){
        return [self appendFormatWithSelector:name];
    };
}
-(LiveCodingAPIRequest *)onair{
    return [self appendFormatWithSelector:NSStringFromSelector(_cmd)];
}
-(LiveCodingAPIRequest *(^)(NSString *))uer_slug{
    return ^(NSString * uer_slug){
        return [self appendFormatWithSelector:uer_slug];
    };
}
-(LiveCodingAPIRequest *(^)(NSString *))pk{
    return ^(NSString * pk){
        return [self appendFormatWithSelector:pk];
    };
}

-(void)requestWithMethod:(NSString *)method oauthCode:(NSString *)oauthCode success:(void (^)(id response, id responseObject))success failure:(void (^)(id response, NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseUrl,self.apiUrl]];
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc] initWithURL:url];
     NSString *authString = [NSString stringWithFormat:@"Bearer %@", oauthCode];
     [request setValue:authString forHTTPHeaderField:@"Authorization"];
    [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            if (failure) {
                failure(response,error);
            }
        } else {
            if (success) {
                success(response,responseObject);
            }
        }
    }];
}

-(void)accessTokenWithCode:(NSString *)code success:(void (^)(id response, id responseObject))success failure:(void (^)(id response, NSError *error))failure{
    
    NSString *userPasswordString = [NSString stringWithFormat:@"%@:%@", client_id, secret_key];
    NSData * userPasswordData = [userPasswordString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64EncodedCredential = [userPasswordData base64EncodedStringWithOptions:0];
    NSString *authString = [NSString stringWithFormat:@"Basic %@", base64EncodedCredential];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseUrl,tokenUrl]];
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc] initWithURL:url];
    [request setValue:authString forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod:@"POST"];
    NSString *str = [NSString stringWithFormat:@"code=%@&grant_type=authorization_code&redirect_uri=%@",code,redirect_uri];
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            if (failure) {
                failure(response,error);
            }
        } else {
            if (success) {
                success(response,responseObject);
            }
        }
    }];
    [dataTask resume];
}

@end

