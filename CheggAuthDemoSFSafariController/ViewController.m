//
//  ViewController.m
//  CheggAuthDemoSFSafariController
//
//  Created by Victor Borshak on 11/30/17.
//  Copyright © 2017 Victor Borshak. All rights reserved.
//

#import "ViewController.h"
@import SafariServices;

// redirect_uri should be ideally set to 'cheggereader://'
// but since currently we don't have profiles set up with such value on back end,
// we use https://www.chegg.com/auth/external/vst/mobilecallback as a workaround, which internally redirects to 'cheggereader://'.
// It demonstrates that it's possible to intercept cheggereader:// redirect using App delegate's application:openURL: method

#define AUTH_URL @"https://www.chegg.com/oidc/authorize?client_id=VST&response_type=token&redirect_uri=https://www.chegg.com/auth/external/vst/mobilecallback&action=login"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated  {
    NSURL *url = [NSURL URLWithString:AUTH_URL];
    SFSafariViewController *sfvc = [[SFSafariViewController alloc] initWithURL:url];
    [self presentViewController:sfvc animated:YES completion:nil];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
