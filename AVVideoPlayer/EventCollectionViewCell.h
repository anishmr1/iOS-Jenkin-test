//
//  EventCollectionViewCell.h
//  AVVideoPlayer
//
//  Created by Anish Ramachandran on 11/4/14.
//  Copyright (c) 2014 Sap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RVMPAVPlayer.h"


@interface EventCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet RVMPAVPlayer *playerHolderView;
- (void) configureCellItem:(NSIndexPath *)indexPath;
@end
