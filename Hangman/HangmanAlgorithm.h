//
//  HangmanAlgorithm.h
//  Hangman
//
//  Created by Jenny Chen on 10/11/14.
//  Copyright (c) 2014 Jenny Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HangmanAlgorithm : NSObject
{
    @private
    NSMutableArray* spaces;
    NSString* word;
    NSInteger numGuessesLeft;
    NSInteger currentState;
}
-(void)createSpaceBounds;

-(void)generateWord;
-(NSString*)getCurrentWord;
- (NSMutableArray*)getSpaces;
-(NSInteger) getNumGuessesLeft;
-(NSMutableArray*)guessedLetter: (NSString*)guess;
- (void)removeSpace: (spaces*)s;
@end
