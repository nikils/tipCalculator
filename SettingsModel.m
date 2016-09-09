//
//  SettingsModel.m
//  tipCalculator
//
//  Created by Nikhil S on 9/9/16.
//  Copyright © 2016 Nikhil S. All rights reserved.
//

#import "SettingsModel.h"

static SettingsModel *model = nil;

@interface SettingsModel()
- (void)loadModel;
@end

@implementation SettingsModel
+ (SettingsModel *) getModel {
    if (model != nil) {
        return model;
    }
    model = [[SettingsModel alloc] init];
    [model loadModel];
    return model;
}

- (void)loadModel {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.defaultCurrency = [defaults integerForKey:@"default_currency"];
    self.defaultTipAmount = [defaults integerForKey:@"default_tipamount"];
    if (!self.defaultCurrency) {
        self.defaultCurrency = 0;
    }
    if (!self.defaultTipAmount) {
        self.defaultTipAmount = 0;
    }
}

- (void)saveModel {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultCurrency forKey:@"default_currency"];
    [defaults setInteger:self.defaultTipAmount forKey:@"default_tipamount"];
    [defaults synchronize];
}
@end
