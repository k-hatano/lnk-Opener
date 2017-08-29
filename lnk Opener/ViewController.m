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
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

}


@end
