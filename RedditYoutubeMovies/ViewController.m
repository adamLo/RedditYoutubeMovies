//
//  ViewController.m
//  RedditYoutubeMovies
//
//  Created by John N Blanchard on 8/25/16.
//  Copyright © 2016 John N Blanchard. All rights reserved.
//

#import "ViewController.h"
@import JavaScriptCore;
#import "TFHpple.h"
#import "YoutubePlayerViewController.h"
#import "RMNetworkManager.h"
#import "RMMovieCell.h"
#import "TFHppleElement+RMMovie.h"

#define urlRedditString @"https://www.reddit.com/r/fullmoviesonyoutube"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *movies;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self fetchMovies];
}

- (BOOL)prefersStatusBarHidden
{
    return true;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RMMovieCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell setupWithData:_movies[indexPath.row]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    TFHppleElement *movie = [self.movies objectAtIndex:indexPath.row];
    NSString *movieId = [movie movieId];
    if (movieId) {
        [self performSegueWithIdentifier:@"vid" sender:movie];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"vid"]) {
        TFHppleElement *movie = sender;
        YoutubePlayerViewController* ypvc = (YoutubePlayerViewController*)segue.destinationViewController;
        ypvc.ytID = [movie movieId];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Data integration

- (void)fetchMovies {
    
    __weak typeof(self) weakSelf = self;
    
    [[RMNetworkManager sharedInstance] fetchMoviesWithCompletion:^(NSArray *movies, NSError *error) {
        weakSelf.movies = movies;
        [weakSelf.tableView reloadData];
    }];
}

@end
