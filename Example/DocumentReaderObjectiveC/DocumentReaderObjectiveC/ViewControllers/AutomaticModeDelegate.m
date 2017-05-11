//
//  AutomaticModeDelegate.m
//  DocumentReaderObjectiveC
//
//  Created by Dmitry Smolyakov on 5/10/17.
//  Copyright © 2017 Dmitry Smolyakov. All rights reserved.
//

#import "AutomaticModeDelegate.h"
@import DocumentReader;

@interface AutomaticModeDelegate () <DocumentReaderDelegate>

@end

@implementation AutomaticModeDelegate

- (IBAction)startPressed:(UIButton *)sender {

    DocReader *documentReader = [[DocReader alloc] initWithLicensePath:[NSString new]];
    documentReader.cameraDelegate = self;
    [documentReader showScannerWithPresenter:self completion:nil];
}

#pragma mark - DocumentReaderDelegate

- (void)documentReader:(DocReader * _Nonnull)documentReader didCompleteCameraScanning:(DocumentReaderResults * _Nullable)result {
    NSLog(@"Completed");
    NSLog(@"Result class: %@", result);
}

- (void)documentReaderDidCancelScaning:(DocReader * _Nonnull)documentReader {
    NSLog(@"Cancelled");
}

@end
