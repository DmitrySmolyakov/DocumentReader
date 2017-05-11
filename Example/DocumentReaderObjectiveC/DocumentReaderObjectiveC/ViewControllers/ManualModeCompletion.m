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

    DocReader *documentReader = [[DocReader alloc] initWithLicensePath:[NSString string]];
    [documentReader recognizeImageWithImage:image completion:^(enum DocReaderAction action, DocumentReaderResults * _Nullable result) {
        if (action == DocReaderActionComplete) {
            NSLog(@"Completed");
            NSLog(@"Result class: %@", result);
        }
    }];
}

@end
