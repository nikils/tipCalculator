//
//  SettingsModel.h
//  tipCalculator
//
//  Created by Nikhil S on 9/9/16.
//  Copyright © 2016 Nikhil S. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsModel : NSObject
@property long defaultTipAmount;
@property long defaultCurrency;
- (void)saveModel;
+ (SettingsModel *) getModel;
@end
