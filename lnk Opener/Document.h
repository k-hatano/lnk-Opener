//
//  Document.h
//  lnk Opener
//
//  Created by HatanoKenta on 2017/05/11.
//  Copyright © 2017年 jp.nita. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument

@property (atomic, strong) NSString *fileName;
@property (atomic, strong) NSString *localPath;
@property (atomic, strong) NSString *networkPath;

@end

