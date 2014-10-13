//
//  ViewController.h
//  Hangman
//
//  Created by Jenny Chen on 10/11/14.
//  Copyright (c) 2014 Jenny Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HangmanWords.h"

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic) NSString *secretWord;
@property (nonatomic) NSMutableString *s;
@property (nonatomic) NSString *wrongGuesses;
@property (nonatomic) NSInteger numWrongGuesses;
@property (nonatomic) NSInteger totalGuesses;

// @property (weak, nonatomic) IBOutlet UITextField *textField;

-(void) initUI: (NSString*) word;
-(void) checkLetter: (NSString *) currentLetter;


@end

