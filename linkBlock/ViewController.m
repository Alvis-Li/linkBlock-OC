//
//  ViewController.m
//  linkBlock
//
//  Created by leolevy on 4/21/16.
//  Copyright © 2016 levy. All rights reserved.
//

#import "ViewController.h"
#import "LiveCoding.h"
@interface ViewController (){
    LiveCoding *livecoding;
}
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    livecoding = [LiveCoding manager];
    
    NSString *urlStr=[NSString stringWithFormat:@"%@%@?client_id=%@&scope=read&response_type=code&redirect_uri=%@",baseUrl,authorizeUrl,client_id,redirect_uri];
    NSURL *url=[NSURL URLWithString:urlStr];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSString *urlStr=request.URL.absoluteString;
    NSRange range=[urlStr rangeOfString:@"code="];
    if(range.length)
    {
        NSString *code=[urlStr substringFromIndex:range.length+range.location];
        [self accessTokenWithCode:code];
        return NO;
    }
    return YES;
}


- (void)accessTokenWithCode:(NSString *)code{
    [livecoding.api.authorize accessTokenWithCode:code success:^(id response, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:responseObject];
                                                                  NSLog(@"%@",resultDic);
            if(resultDic[@"access_token"]){
                [self codingcategoriesWithToken:resultDic[@"access_token"]];
            }
        }
    } failure:^(id response, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)codingcategoriesWithToken:(NSString *)token{
    [livecoding.api.codingcategoriesRequest requestWithMethod:@"GET" oauthCode:token success:^(id response, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:responseObject];
            NSLog(@"%@",resultDic);
            if(resultDic[@"access_token"]){
                
            }
        }
        NSLog(@"%@",responseObject);
    } failure:^(id response, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
