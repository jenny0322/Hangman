//
//  ViewController.m
//  Hangman
//
//  Created by Jenny Chen on 10/11/14.
//  Copyright (c) 2014 Jenny Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageDis;


@end

@implementation ViewController
// @synthesize textField;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    HangmanWords *initWord=[[HangmanWords alloc]init];
    self.secretWord=[initWord getWord];
    [self initUI:self.secretWord];
    NSLog(@"secret word = %@", self.secretWord);
}

- (IBAction)newGame:(id)sender {
    HangmanWords *initializeWord=[[HangmanWords alloc]init];
        self.secretWord=[initializeWord getWord];
        [self initUI:self.secretWord];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"Value of letter = %@", string);
    NSString *upperCase = [string uppercaseString];
    
    [self checkLetter:upperCase];
    [textField resignFirstResponder];
    return NO;
}

- (void) initUI: (NSString*) word {
    self.secretWord = word;
    self.wrongGuesses = @"";
    self.totalGuesses = 14;
    self.numWrongGuesses = 0;
    self.wordLabel.text=@"";
    self.imageDis.image =[UIImage imageNamed: @"Hangman0.gif"];
    for (int i=0; i<word.length; i++) {
        self.wordLabel.text=[self.wordLabel.text stringByAppendingString:@"-"];
    }
}

-(void) checkLetter: (NSString *) currentLetter {
    Boolean match = NO;
    NSRange letterRange;
    char charToCheck = [currentLetter characterAtIndex:0];
    for (int i=0; i<self.secretWord.length; i++) {
        char temp=[self.secretWord characterAtIndex:i];
        if (charToCheck==temp) {
            match=YES;
            letterRange=NSMakeRange(i, 1);
            self.wordLabel.text=[self.wordLabel.text stringByReplacingCharactersInRange:letterRange withString:currentLetter];
            }
    }
    if ([self.wordLabel.text isEqualToString:self.secretWord]) {
        NSLog(@"WIN IS TRUE");
        [self winAlert];
    }
    if (match == NO){
        NSLog(@"no such letter");
                self.wrongGuesses=[self.wrongGuesses stringByReplacingOccurrencesOfString:currentLetter withString:@""];
               self.wrongGuesses=[self.wrongGuesses stringByAppendingString:currentLetter];
              _numWrongGuesses = _wrongGuesses.length;
                 if (_numWrongGuesses == 1) {
                     NSLog(@"one");
                    self.imageDis.image =[UIImage imageNamed: @"Hangman1.gif"];
                 }
                 if (_numWrongGuesses == 2) {
                     NSLog(@"two");
                     self.imageDis.image =[UIImage imageNamed: @"Hangman2.gif"];                 }
                 if(_numWrongGuesses == 3) {
                     NSLog(@"three");
                     self.imageDis.image =[UIImage imageNamed: @"Hangman3.gif"];
                 }
                 if (_numWrongGuesses == 4) {
                     NSLog(@"four");
                     self.imageDis.image =[UIImage imageNamed: @"Hangman4.gif"];
                 }
                 if (_numWrongGuesses == 5) {
                     NSLog(@"five");
                     self.imageDis.image =[UIImage imageNamed: @"Hangman5.gif"];
                 }
                 if(_numWrongGuesses == 6) {
                     NSLog(@"six");
                     self.imageDis.image =[UIImage imageNamed: @"Hangman6.gif"];
                 }
                 if (_numWrongGuesses == 7) {
                     NSLog(@"seven");
                     self.imageDis.image =[UIImage imageNamed: @"Hangman7.gif"];
                 }
                 if (_numWrongGuesses == 8) {
                     NSLog(@"eight");
                    self.imageDis.image =[UIImage imageNamed: @"Hangman8.gif"];
                 }
                 if(_numWrongGuesses == 9) {
                     NSLog(@"nine");
                     self.imageDis.image =[UIImage imageNamed: @"Hangman9.gif"];
                 }
                 if (_numWrongGuesses == 10) {
                     NSLog(@"ten");
                     self.imageDis.image =[UIImage imageNamed: @"Hangman10.gif"];
                 }
                 if (_numWrongGuesses == 11) {
                     NSLog(@"eleven");
                    self.imageDis.image =[UIImage imageNamed: @"Hangman11.gif"];
                 }
                 if(_numWrongGuesses == 12) {
                     NSLog(@"twelve");
                     self.imageDis.image =[UIImage imageNamed: @"Hangman12.gif"];

                 }
                 if (_numWrongGuesses == 13) {
                     NSLog(@"thirteen");
                     self.imageDis.image = [UIImage imageNamed: @"Hangman13.gif"];
                 }
                 if (_numWrongGuesses == 14) {
                    NSLog(@"end");
                    self.imageDis.image = [UIImage imageNamed: @"Hangman14.gif"];
                    [self loseAlert];
              
                 }

    }
    
    

}

-(void) winAlert{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Congratulation!"
                          message:@"You won!"
                          delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil];
    
    [alert show];

}
-(void) loseAlert{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Sorry!"
                          message: [NSString stringWithFormat:@"You lost! The correct word is \n%@.", self.secretWord]
                          delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil];
    
    [alert show];
    
    
}

- (IBAction)enter:(id)sender {
}
@end
