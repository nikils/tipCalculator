//
//  ViewController.m
//  tipCalculator
//
//  Created by Nikhil S on 9/9/16.
//  Copyright © 2016 Nikhil S. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsModel.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SettingsModel *model = [SettingsModel getModel];
    [self.tipControl setSelectedSegmentIndex:model.defaultTipAmount];
    self.title = @"Tip Calculator";
    [self updateValues];
}

- (void)viewDidAppear:(BOOL)animated {
    [self updateValues];
    [self.billTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
- (IBAction)onTipChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.15), @(0.20), @(0.25)];
    NSArray *currencyValues = @[@"$", @"£", @"€", @"¥"];
    SettingsModel *model = [SettingsModel getModel];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"%@%0.2f", currencyValues[model.defaultCurrency], tipAmount ];
    self.totalLabel.text = [NSString stringWithFormat:@"%@%0.2f", currencyValues[model.defaultCurrency], totalAmount];
}

@end
