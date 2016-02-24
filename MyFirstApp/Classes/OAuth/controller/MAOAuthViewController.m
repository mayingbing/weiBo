//
//  MAOAuthViewController.m
//  MyFirstApp
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MAOAuthViewController.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "MAAccount.h"
#import "MAAccountTool.h"
#import "MARootTool.h"

#import "MAWebATool.h"

@interface MAOAuthViewController ()<UIWebViewDelegate>

@end

@implementation MAOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    NSString *baseUrl = @"https://api.weibo.com/oauth2/authorize";
    NSString *client_id = @"1466602569";
    NSString *redirect_uri = @"http://www.baidu.com";
    
    //https://api.weibo.com/oauth2/authorize?client_id=1466602569&redirect_uri=http://www.baidu.com
    
    NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",baseUrl,client_id,redirect_uri];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    webView.delegate = self;

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [MBProgressHUD hideHUD];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [MBProgressHUD hideHUD];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [MBProgressHUD showMessage:@"正在加载"];
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *urlStr = request.URL.absoluteString;
    NSRange rang = [urlStr rangeOfString:@"code="];
    if (rang.length ) {
        NSString *code = [urlStr substringFromIndex:rang.location + rang.length];
        //http://www.baidu.com/?code=9e300abe4ae38b78f9687029f44a41ed
        
        [self accessTokenWithCode:code];

        return  NO;
    }
    
    return YES;
}

-(void)accessTokenWithCode:(NSString *)code{
    
    
    [MAWebATool accessTokenWithCode:code success:^(NSArray *dataArr) {
        
        
    } failure:^(NSError *error) {
        
        
    }];
    
    
    
}

@end
