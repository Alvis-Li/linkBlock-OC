//
//  ViewController.m
//  linkBlock
//
//  Created by leolevy on 4/21/16.
//  Copyright © 2016 levy. All rights reserved.
//

#import "ViewController.h"
#import "LiveCoding.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LiveCoding *livecoding = [LiveCoding new];
//    livecoding.api.v1.user.follows.requst;
    
    NSLog(@"%@",livecoding.apiUrl);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
