//
//  MainViewController.m
//  MemoryGame
//
//  Created by Ventura Rangel on 4/17/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

NSString *guessOne;
NSString *guessTwo;
NSDictionary *dictionary;

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dictionary = [self dictionaryValues];
    
    for (int y = 0; y<3; y++) {
        for (int x = 0; x<4; x++) {
            UIButton *button = [[UIButton alloc] init];
            button.frame = CGRectMake(x*70+20, y*90+130, 60, 80);
            button.tag = 1;
            [button setBackgroundImage:[UIImage imageNamed:@"cardBack.png"] forState:UIControlStateNormal];
            [self.view addSubview:button];
            [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
            UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(30, 25, 25, 25)];
            title.text = [NSString stringWithFormat:@"%d", y*3+x+1];
            title.textColor = [UIColor clearColor];
            title.backgroundColor = [UIColor clearColor];
            button.titleLabel.text = [NSString stringWithFormat:@"%d", y*4+x+1];
            //[button addSubview:title];
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSDictionary*)dictionaryValues{
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjects:@[@"6",@"3",@"8",@"10",@"2",@"7",@"12",@"4",@"5",@"1",@"9",@"11"]
                forKeys:@[@"1", @"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"]
                        ];
    return dictionary;
}

-(void)handleButton:(UIButton *)button{
    //start timer
    if (guessOne == nil) {
        guessOne = button.titleLabel.text;
        NSLog(@"guess = %@", guessOne);
        
        [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            button.alpha = 0.0;
        }completion:nil];
        
    } else if (![button.titleLabel.text isEqualToString:guessOne]) {
      
        NSString *second = [dictionary objectForKey:button.titleLabel.text];
        
        if ([guessOne isEqualToString:second]) {
            // you win
            NSLog(@"You chose: %@", second);
            NSLog(@"YOU WIN");
            [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                button.alpha = 0.0;
            }completion:nil];
            
            guessOne = nil;

        } else {
            NSLog(@"You chose: %@", second);
            NSLog(@"YOU LOSE");
            
            UIButton *buttonOne;
            for (UIView *subView in self.view.subviews) {
                if ([subView isKindOfClass:[UIButton class]]) {
                    UIButton *subButton = (UIButton*)subView;
                    if ([subButton.titleLabel.text isEqualToString:guessOne]) {
                        buttonOne = subButton;
                    }
                }
            }
            
            [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                button.alpha = 0.0;
            }completion:nil];
            
            [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                button.alpha = 1.0;
                buttonOne.alpha = 1.0;
            }completion:nil];
        }
        guessOne = nil;
    }
    
        
}



-(IBAction)stopTimer:(id)sender{
    //stop timer
}


@end
