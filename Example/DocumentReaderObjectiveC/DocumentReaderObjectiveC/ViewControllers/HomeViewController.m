//
//  HomeViewController.m
//  DocumentReaderObjectiveC
//
//  Created by Dmitry Smolyakov on 5/7/17.
//  Copyright © 2017 Dmitry Smolyakov. All rights reserved.
//

#import "HomeViewController.h"

//view controllers
#import "AutomaticModeCompletion.h"
#import "AutomaticModeDelegate.h"
#import "ManualModeCompletion.h"
#import "ManualModeDelegate.h"

@interface HomeViewController ()

@property (strong, nonatomic) NSArray<NSString *> *sectionTitleArray;
@property (strong, nonatomic) NSArray<NSString *> *sectionSubtitleArray;
@property (strong, nonatomic) NSArray<NSArray *> *titleArray;

@end

@implementation HomeViewController

#pragma mark - Examples names
- (NSArray *)sectionTitleArray {
    if (!_sectionTitleArray) { return
        @[@"Automatic mode",
          @"Manual mode",
          @"Results",
          @"Custom mode"]; }
    return _sectionTitleArray;
}

- (NSArray *)sectionSubtitleArray {
    if (!_sectionSubtitleArray) { return
        @[@"default camera",
          @"UIImage",
          @"get results functions",
          @"complex example"]; }
    return _sectionSubtitleArray;
}

- (NSArray *)titleArray {
    if (!_titleArray) { return
        @[
          @[@"Use CameraViewController completion block",
            @"Use CameraViewController delegate"],
          @[@"Use -recognizeImage function with completion. Recognize image from bundle",
            @"Use -recognizeImage function with delegate. Recognize image from bundle"],
          @[@"Constructor for get results functions"],
          @[@"CameraViewController inside another ViewController"]]; }
    return _titleArray;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionTitleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    cell.textLabel.textColor = [UIColor colorWithWhite:0 alpha:0.6];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Regular" size:14.0];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.%ld %@",
                           indexPath.section + 1,
                           indexPath.row + 1,
                           self.titleArray[indexPath.section][indexPath.row]];
    cell.textLabel.numberOfLines = 2;

    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 68.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 42.0;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"%@ (%@)", self.sectionTitleArray[section], self.sectionSubtitleArray[section]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIViewController *vc;
    switch (indexPath.section) {
    case 0: //Automatic mode
        switch (indexPath.row) {
            case 0: { //1.1 Use CameraViewController completion block
                vc = (AutomaticModeCompletion *)[self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(AutomaticModeCompletion.class)];
                break;
            }
            case 1: { //1.2 Use CameraViewController delegate
                vc = (AutomaticModeDelegate *)[self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(AutomaticModeDelegate.class)];
                break;
            }
        default:
            break;
        }
    break;

    case 1: //Manual mode
        switch (indexPath.row) {
            case 0: { //2.1 Use -recognizeImage function with completion. Recognize image from bundle
                vc = (ManualModeCompletion *)[self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(ManualModeCompletion.class)];
                break;
            }
            case 1: { //2.2 Use -recognizeImage function with delegate. Recognize image from bundle
                vc = (ManualModeDelegate *)[self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(ManualModeDelegate.class)];
                break;
            }
            default:
                break;
        }
    break;
    default:
        break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}


@end
