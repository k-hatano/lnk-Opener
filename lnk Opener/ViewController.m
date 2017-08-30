//
//  ViewController.m
//  lnk Opener
//
//  Created by HatanoKenta on 2017/05/11.
//  Copyright © 2017年 jp.nita. All rights reserved.
//

#import "ViewController.h"
#import "Document.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)viewDidAppear {
    Document *document = (Document *)(self.view.window.windowController.document);
    self.tf_fileName.stringValue = [document.fileName lastPathComponent];
    self.tf_localPath.stringValue = document.localPath;
    self.tf_networkPath.stringValue = document.networkPath;
    self.tf_relativePath.stringValue = document.relativePath;
    self.tv_output.string = document.output;
    
    if (document.networkPath && [document.networkPath length] > 0) {
        self.bt_goToNetworkPath.hidden = NO;
    } else {
        self.bt_goToNetworkPath.hidden = YES;
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

}

- (IBAction)networkPathClicked:(id)sender {
    Document *document = (Document *)(self.view.window.windowController.document);
    NSString *networkPath = document.networkPath;
    if (!networkPath || [networkPath length] <= 0) {
        return;
    }
    
    NSString *url = [[[[networkPath lowercaseString] stringByReplacingOccurrencesOfString:@"\\\\" withString:@"smb://"] stringByReplacingOccurrencesOfString:@"\\" withString:@"/"] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:url]];
}


@end
