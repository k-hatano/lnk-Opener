//
//  Document.m
//  lnk Opener
//
//  Created by HatanoKenta on 2017/05/11.
//  Copyright © 2017年 jp.nita. All rights reserved.
//

#import "Document.h"
#import "ViewController.h"

#define STRING_LENGTH 256

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (void)makeWindowControllers {
    // Override to return the Storyboard file name of the document.
    [self addWindowController:[[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"Document Window Controller"]];
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}


- (BOOL)readFromURL:(NSURL *)url
             ofType:(NSString *)typeName
              error:(NSError * _Nullable *)outError {
    NSString *fullPath = [url path];
    
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = @"/usr/local/bin/lnkinfo";
    task.arguments = [NSArray arrayWithObjects:fullPath, nil];
    
    NSPipe *outPipe = [NSPipe pipe];
    task.standardOutput = outPipe;
    
    [task launch];
    
    NSData *data = [[outPipe fileHandleForReading] readDataToEndOfFile];
    NSString *strOut = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", strOut);
    
    NSRange localPathRange = [strOut rangeOfString:@"	Local path			: "];
    self.localPath = @"";
    if (localPathRange.length > 0) {
        NSRange lineRange = [strOut lineRangeForRange:localPathRange];
        NSString *tmpLocalPath = [strOut substringWithRange:lineRange];
        self.localPath = [tmpLocalPath stringByReplacingOccurrencesOfString:@"	Local path			: "
                                                            withString:@""];
    }
    
    NSRange networkPathRange = [strOut rangeOfString:@"	Network path			: "];
    self.networkPath = @"";
    if (networkPathRange.length > 0) {
        NSRange lineRange = [strOut lineRangeForRange:networkPathRange];
        NSString *tmpNetworkPath = [strOut substringWithRange:lineRange];
        self.networkPath = [tmpNetworkPath stringByReplacingOccurrencesOfString:@"	Network path			: "
                                                                withString:@""];
    }
    
    return YES;
}


@end
