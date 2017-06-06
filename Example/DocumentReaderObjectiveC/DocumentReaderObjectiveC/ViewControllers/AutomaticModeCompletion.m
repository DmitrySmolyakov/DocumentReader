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

    DocReader *documentReader = [[DocReader alloc] initWithLicense:[NSData data]];
    [documentReader showScanner:self completion:^(enum DocReaderAction action, DocumentReaderResults * _Nullable result, NSString * _Nullable error) {
        switch (action) {
            case DocReaderActionCancel:
                NSLog(@"Cancelled by user");
                break;
            case DocReaderActionComplete: {
                NSLog(@"Completed");
                NSLog(@"Result class: %@", result);
            }
            case DocReaderActionError:
                NSLog(@"Error");
                NSLog(@"Error string: %@", error);
                break;
            default:
                break;
        }
    }];
}

@end
