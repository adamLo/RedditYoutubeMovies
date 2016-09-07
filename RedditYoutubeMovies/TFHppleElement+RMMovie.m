//
//  TFHppleElement+RMMovie.m
//  RedditYoutubeMovies
//
//  Created by Adam Lovastyik on 2016. 09. 07..
//  Copyright © 2016. John N Blanchard. All rights reserved.
//

#import "TFHppleElement+RMMovie.h"

@implementation TFHppleElement (RMMovie)

- (NSString*)movieTitle {
    
    NSString *title = [[self children][1] content];
    
    return title;
}

- (NSString*)movieLink {
    
    NSString *linkString = [[self children][1] objectForKey:@"data-href-url"];
    
    return linkString;
}

- (NSString*)movieId {
    
    NSString *youTubeLink = [[self movieLink] lastPathComponent];
    NSString *youtubeId;
    NSInteger position = [youTubeLink rangeOfString:@"="].location;
    if (position != NSNotFound) {
        youtubeId = [youTubeLink substringFromIndex:position + 1];
    }
    
    return youtubeId;
}

@end
