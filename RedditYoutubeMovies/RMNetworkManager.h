//
//  RMNetworkManager.h
//  RedditYoutubeMovies
//
//  Created by Adam Lovastyik on 2016. 09. 07..
//  Copyright © 2016. John N Blanchard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMNetworkManager : NSObject

+ (instancetype)sharedInstance;

- (void)fetchMoviesWithCompletion:(void(^)(NSArray *movies, NSError *error))completion;

@end
