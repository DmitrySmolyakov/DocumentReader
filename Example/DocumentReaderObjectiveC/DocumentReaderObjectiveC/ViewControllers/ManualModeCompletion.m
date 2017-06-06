//
//  ManualModeCompletion.m
//  DocumentReaderObjectiveC
//
//  Created by Dmitry Smolyakov on 5/10/17.
//  Copyright © 2017 Dmitry Smolyakov. All rights reserved.
//

#import "ManualModeCompletion.h"
@import DocumentReader;

@implementation ManualModeCompletion

- (IBAction)recognizeImagePressed:(UIButton *)sender {

    UIImage *image = [UIImage imageNamed:@"TestPhoto"];

    DocReader *documentReader = [[DocReader alloc] initWithLicense:[NSData data]];
    [documentReader recognizeImage:image completion:^(enum DocReaderAction action, DocumentReaderResults * _Nullable result, NSString * _Nullable error) {
        if (action == DocReaderActionComplete) {
            if (result) {
                NSLog(@"Completed");
                NSLog(@"Result class: %@", result);
            } else {
                NSLog(@"Completed without result");
            }
        } else if (action == DocReaderActionError) {
            NSLog(@"Eror");
            NSLog(@"Eror string: %@", error);
        }
    }];
}

@end
