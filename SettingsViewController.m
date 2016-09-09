//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Nikhil S on 9/9/16.
//  Copyright © 2016 Nikhil S. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsModel.h"


@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *currencyControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SettingsModel *model = [SettingsModel getModel];
    [self.tipControl setSelectedSegmentIndex:model.defaultTipAmount];
    [self.currencyControl setSelectedSegmentIndex:model.defaultCurrency];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onDefaultTipChange:(UISegmentedControl *)sender {
    SettingsModel *model = [SettingsModel getModel];
    model.defaultTipAmount = self.tipControl.selectedSegmentIndex;
    [model saveModel];
}
- (IBAction)onDefaultCurrencyChange:(UISegmentedControl *)sender {
    SettingsModel *model = [SettingsModel getModel];
    model.defaultCurrency = self.currencyControl.selectedSegmentIndex;
    [model saveModel];
}

@end
