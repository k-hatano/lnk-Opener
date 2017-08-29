//
//  ViewController.h
//  lnk Opener
//
//  Created by HatanoKenta on 2017/05/11.
//  Copyright © 2017年 jp.nita. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (nonatomic, weak) IBOutlet NSTextField *tf_fileName;
@property (nonatomic, weak) IBOutlet NSTextField *tf_localPath;
@property (nonatomic, weak) IBOutlet NSTextField *tf_networkPath;

@end

