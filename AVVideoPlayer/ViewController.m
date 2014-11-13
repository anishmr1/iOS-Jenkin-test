//
//  ViewController.m
//  AVVideoPlayer
//
//  Created by Anish Ramachandran on 11/4/14.
//  Copyright (c) 2014 Sap. All rights reserved.
//

#import "ViewController.h"
#import "EventCollectionViewCell.h"
#define degreesToRadians(x) (M_PI * (x) / 180.0)

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak) IBOutlet UICollectionView *eventCollectionView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UIDevice *device = [UIDevice currentDevice];					//Get the device object
    [device beginGeneratingDeviceOrientationNotifications];			//Tell it to start monitoring the accelerometer for orientation
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];	//Get the notification centre for the app
    [nc addObserver:self											//Add yourself as an observer
           selector:@selector(rotateToInterfaceOrientation:)
               name:UIDeviceOrientationDidChangeNotification
             object:device];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}


- (void) rotateToInterfaceOrientation:(NSNotification *)note {

    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.eventCollectionView.collectionViewLayout;
    UIDevice *device = note.object;
    UIDeviceOrientation orientation=[device orientation];
    switch (orientation) {
        case UIDeviceOrientationLandscapeRight: {
            self.eventCollectionView.pagingEnabled =YES;
            [[UIApplication sharedApplication] setStatusBarHidden:YES];
            self.navigationController.navigationBarHidden = YES;
            flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            flowLayout.itemSize = CGSizeMake(568, 320);
            self.eventCollectionView.transform = CGAffineTransformIdentity;
            self.eventCollectionView.transform = CGAffineTransformMakeRotation(degreesToRadians(-90));
            CGRect frame=[[UIScreen mainScreen] applicationFrame];
            frame.size.height+=frame.origin.y;
            frame.origin.x = frame.origin.y = 0;
            self.eventCollectionView.frame = frame;
        }
            break;
            
        case UIDeviceOrientationLandscapeLeft: {
            self.eventCollectionView.pagingEnabled =YES;
            [[UIApplication sharedApplication] setStatusBarHidden:YES];
            self.navigationController.navigationBarHidden = YES;
            //flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            flowLayout.itemSize = CGSizeMake(568, 320);
            self.eventCollectionView.transform = CGAffineTransformIdentity;
            self.eventCollectionView.transform = CGAffineTransformMakeRotation(degreesToRadians(-90));
            CGRect frame=[[UIScreen mainScreen] applicationFrame];
            frame.size.height+=frame.origin.y;
            frame.origin.x = frame.origin.y = 0;
            self.eventCollectionView.frame = frame;
        }
            break;
        case UIDeviceOrientationPortrait: {
            self.eventCollectionView.pagingEnabled =NO;
            [[UIApplication sharedApplication] setStatusBarHidden:NO];
            self.navigationController.navigationBarHidden = NO;
           // flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
            flowLayout.itemSize = CGSizeMake(320, 180);
            self.eventCollectionView.transform = CGAffineTransformIdentity;
            self.eventCollectionView.transform = CGAffineTransformMakeRotation(degreesToRadians(0));
            self.eventCollectionView.frame = self.view.frame;
        }
            break;
            
        default:
            break;
    }
   // dispatch_queue_t
    //self.eventCollectionView.collectionViewLayout = flowLayout;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section; {
    return 5;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath; {
    
    EventCollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventCollectionViewCell" forIndexPath:indexPath];
    [collectionViewCell configureCellItem:indexPath];
    return  collectionViewCell;
}

@end
