//
//  FDVideoFragment.h
//  HotlineSDK
//
//  Created by user on 07/06/17.
//  Copyright © 2017 Freshdesk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "Fragment.h"

@interface FDVideoFragment: UIButton
    -(id) initWithFragment: (FragmentData *) fragment;
    @property FragmentData *fragmentData;
@end
