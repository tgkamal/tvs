//
//  VideoNextController.h
//  tvselangor
//
//  Created by TENGKU KAMAL FAIZAL on 8/19/11.
//  Copyright 2011 ILAUNCH SDN BHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoNextController : UIViewController{
    NSDictionary *item;
    IBOutlet UILabel *itemTitle;
    IBOutlet UILabel *itemDate;
    IBOutlet UIWebView *itemSummary;
}

@property (retain, nonatomic) NSDictionary *item;
@property (retain, nonatomic) IBOutlet UILabel *itemTitle;
@property (retain, nonatomic) IBOutlet UILabel *itemDate;
@property (retain, nonatomic) IBOutlet UIWebView *itemSummary;

- (id)initWithItem:(NSDictionary *)theItem;

- (IBAction)playYoutube:(id)sender;

@end
