//
//  FCChannelUtil.m
//  FreshchatSDK
//
//  Created by Sanjith Kanagavel on 20/11/18.
//  Copyright © 2018 Freshdesk. All rights reserved.
//

#import "FCChannelUtil.h"

@interface ConversationOptions()

-(void) filterByChannelID:(NSNumber *) channelID;

@end

@implementation FCChannelUtil : NSObject

+(void) launchChannelWithTags:(NSArray *)tags withNavigationCtlr:(UIViewController *)viewController {
    ConversationOptions *convOptions = [[ConversationOptions alloc] init];
    [convOptions filterByTags:tags withTitle:nil];
    [[Freshchat sharedInstance] showConversations:viewController withOptions:convOptions];
}

+(void) launchChannelWithId:(NSNumber *)channelID withNavigationCtlr:(UIViewController *)viewController {
    ConversationOptions *convOptions = [[ConversationOptions alloc] init];
    [convOptions filterByChannelID:channelID];
    [[Freshchat sharedInstance] showConversations:viewController withOptions:convOptions];

}

@end