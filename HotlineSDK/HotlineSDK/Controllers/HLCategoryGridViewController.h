//
//  HLCollectionView.h
//  HotlineSDK
//
//  Created by kirthikas on 22/09/15.
//  Copyright © 2015 Freshdesk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLViewController.h"

@interface HLCategoryGridViewController : HLViewController <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchDisplayDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *searchResults;

@end