//
//  RMNetworkManager.m
//  RedditYoutubeMovies
//
//  Created by Adam Lovastyik on 2016. 09. 07..
//  Copyright © 2016. John N Blanchard. All rights reserved.
//

#import "RMNetworkManager.h"
#import "TFHpple.h"

@implementation RMNetworkManager

static RMNetworkManager *q_sharedInstance;

NSString *const moviesURLString = @"https://www.reddit.com/r/fullmoviesonyoutube";

+ (instancetype)sharedInstance {
    
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        q_sharedInstance = [[RMNetworkManager alloc] init];
    });
    
    return q_sharedInstance;
}

- (void)fetchMoviesWithCompletion:(void(^)(NSArray *movies, NSError *error))completion {
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        
        TFHpple* redditParser = [TFHpple hppleWithHTMLData:[NSData dataWithContentsOfURL:[NSURL URLWithString:moviesURLString]]];
        NSMutableArray* titleArray = [NSMutableArray arrayWithArray:[redditParser searchWithXPathQuery:@"//p[@class=\"title\"]"]];
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            
            if (completion) {
                completion(titleArray, nil);
            }
            
        });
    });
}

@end
