//
//  MainViewController.h
//  MemoryGame
//
//  Created by Ventura Rangel on 4/17/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *timer;
@property (strong, nonatomic) NSString *cardValue;
-(void)getCardValue;
-(IBAction)stopTimer:(id)sender;



@end
