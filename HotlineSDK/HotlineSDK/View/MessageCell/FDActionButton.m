//
//  FDActionButton.m
//  HotlineSDK
//
//  Created by Srikrishnan Ganesan on 27/10/15.
//  Copyright © 2015 Freshdesk. All rights reserved.
//

#import "FDActionButton.h"
#import "FDMessageCell.h"
#import "HLLocalization.h"
#import "FCTheme.h"
#import "FDUtilities.h"

@implementation FDActionButton

@synthesize actionUrlString,articleID;

- (void) setUpStyle{
    FCTheme *theme = [FCTheme sharedInstance];
    float padding = 10;
    [self setFrame:CGRectZero];
    [self setContentEdgeInsets:UIEdgeInsetsMake(padding/8, padding/2, padding/8, padding/2)];
    [self setBackgroundColor:[theme actionButtonColor]];
    self.titleLabel.font = [theme actionButtonFont];
    self.layer.borderColor=[[theme actionButtonBorderColor] CGColor];
    self.layer.borderWidth=0.5;
    self.layer.cornerRadius=5.0;
}

- (void) setupWithLabel:(NSString*)actionLabel frame:(CGRect)messageFrame
{
    float messageFrameWidth=messageFrame.size.width;
    float messageFrameHeight=messageFrame.size.height;
    float messageOriginX=messageFrame.origin.x;
    float messageOriginY=messageFrame.origin.y;
    float horizontalPadding=KONOTOR_HORIZONTAL_PADDING*3;
    float padding = 10;
    float maxButtonWidth =messageFrameWidth-horizontalPadding*2;
    FCTheme *theme = [FCTheme sharedInstance];
    UIFont *actionLabelFont=[theme agentMessageFont];
    
    if([actionLabel isEqualToString:@""]||(actionLabel==nil))
        actionLabel=HLLocalizedString(LOC_DEFAULT_ACTION_BUTTON_TEXT);
    
    if([FDMessageCell hasButtonForURL:actionUrlString articleID:articleID]){
        
        UITextView *txtView=[[UITextView alloc]init];
        [txtView setFont:actionLabelFont];
        [txtView setText:actionLabel];
        CGSize labelSize=[txtView sizeThatFits:CGSizeMake(messageFrameWidth, KONOTOR_ACTIONBUTTON_HEIGHT)];
        float labelWidth=padding + 20+labelSize.width;
        float buttonWidth=MIN(labelWidth, maxButtonWidth);//MAX(MIN(labelWidth, maxButtonWidth), maxButtonWidth*percentWidth);
        float buttonXCenterAlign=messageOriginX-horizontalPadding/3.0+(messageFrameWidth-buttonWidth)/2;
        self.articleID=articleID;
        self.actionUrlString=actionUrlString;
        [self setFrame:CGRectMake(buttonXCenterAlign,
                                          messageOriginY+messageFrameHeight,
                                          buttonWidth,
                                          KONOTOR_ACTIONBUTTON_HEIGHT)];
        [self setHidden:NO];
   
        [self setAttributedTitle:
         [[NSAttributedString alloc] initWithString:actionLabel attributes:[NSDictionary dictionaryWithObjectsAndKeys:actionLabelFont,NSFontAttributeName,[theme actionButtonTextColor],NSForegroundColorAttributeName,nil]] forState:UIControlStateNormal];
        [self setBackgroundImage:[FDUtilities imageWithColor:[theme actionButtonSelectedColor]] forState: UIControlStateSelected];
    }
    else{
        [self setHidden:YES];
    }
    
}

@end