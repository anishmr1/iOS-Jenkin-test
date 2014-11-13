//
//  RVMPAVPlayer.h
//  AVVideoPlayer
//
//  Created by Anish Ramachandran on 11/4/14.
//  Copyright (c) 2014 Sap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class AVPlayer;
@class AVPlayerPlaybackView;
@interface RVMPAVPlayer : UIView {
    NSURL* mURL;
}
@property (nonatomic, copy) NSURL* URL;
@property (readwrite, strong, setter=setPlayer:, getter=player) AVPlayer* mPlayer;
@property (strong) AVPlayerItem* mPlayerItem;
@property (nonatomic, strong) IBOutlet AVPlayerPlaybackView *mPlaybackView;
@end
