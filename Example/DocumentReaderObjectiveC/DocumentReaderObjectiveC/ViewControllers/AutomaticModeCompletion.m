//
//  AutomaticModeCompletion.m
//  DocumentReaderObjectiveC
//
//  Created by Dmitry Smolyakov on 5/10/17.
//  Copyright © 2017 Dmitry Smolyakov. All rights reserved.
//

#import "AutomaticModeCompletion.h"
@import DocumentReader;

@implementation AutomaticModeCompletion

- (IBAction)startPressed:(UIButton *)sender {

    DocReader *documentReader = [[DocReader alloc] initWithLicensePath:[NSString new]];
    [documentReader showScannerWithPresenter:self completion:^(enum DocReaderAction action, DocumentReaderResults * _Nullable result) {
        switch (action) {
            case DocReaderActionCancel:
                NSLog(@"Cancelled");
                break;
            case DocReaderActionComplete: {
                NSLog(@"Completed");
                NSLog(@"Result class: %@", result);
            }
            default:
                break;
        }
    }];
}

@end
