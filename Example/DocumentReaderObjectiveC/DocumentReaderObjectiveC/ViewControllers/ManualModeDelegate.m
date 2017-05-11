//
//  ManualModeDelegate.m
//  DocumentReaderObjectiveC
//
//  Created by Dmitry Smolyakov on 5/11/17.
//  Copyright © 2017 Dmitry Smolyakov. All rights reserved.
//

#import "ManualModeDelegate.h"
@import DocumentReader;

@interface ManualModeDelegate () <DocumentReaderDelegate>

@end

@implementation ManualModeDelegate

- (IBAction)recognizeImagePressed:(UIButton *)sender {

    UIImage *image = [UIImage imageNamed:@"TestPhoto"];

    DocReader *documentReader = [[DocReader alloc] initWithLicensePath:[NSString string]];
    documentReader.cameraDelegate = self;
    [documentReader recognizeImageWithImage:image completion:nil];
}

#pragma mark - DocumentReaderDelegate

- (void)documentReader:(DocReader * _Nonnull)documentReader didCompleteCameraScanning:(DocumentReaderResults * _Nullable)result {
    NSLog(@"Completed");
    NSLog(@"Result class: %@", result);
}

@end
