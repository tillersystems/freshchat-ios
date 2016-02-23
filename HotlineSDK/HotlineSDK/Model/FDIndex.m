//
//  FDIndex.m
//  Hotline
//
//  Created by user on 30/10/15.
//  Copyright © 2015 Freshdesk. All rights reserved.
//

#import "FDIndex.h"
#import "KonotorDataManager.h"

@implementation FDIndex

@dynamic articleID;
@dynamic keyWord;
@dynamic titleMatches;
@dynamic descMatches;

+(NSMutableArray *)indexWithInfo:(NSDictionary *)indexInfo inManagedObjectContext:(NSManagedObjectContext *)context withArticleID:(NSNumber *)articleID{
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    [indexInfo enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        FDIndex *index     = nil;
        index = [NSEntityDescription insertNewObjectForEntityForName:HOTLINE_INDEX_ENTITY inManagedObjectContext:context];
        index.articleID    =  articleID;
        index.keyWord      =  key;
        NSDictionary * matches = obj;
        index.titleMatches = matches[HOTLINE_DB_INDEX_TITLE_MATCHES];
        index.descMatches  = matches[HOTLINE_DB_INDEX_DESC_MATCHES];
        [indexArray addObject:index];
    }];
    return indexArray;
}

@end