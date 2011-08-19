//
//  NasionalViewController.h
//  tvselangor
//
//  Created by TENGKU KAMAL FAIZAL on 8/13/11.
//  Copyright 2011 ILAUNCH SDN BHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NasionalViewController : UITableViewController{
    UIActivityIndicatorView *activityIndicator;
    NSArray *items;
}

@property (retain, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (retain, nonatomic) NSArray *items;


@end
