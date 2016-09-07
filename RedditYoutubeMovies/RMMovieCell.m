//
//  RMMovieCell.m
//  RedditYoutubeMovies
//
//  Created by Adam Lovastyik on 2016. 09. 07..
//  Copyright © 2016. John N Blanchard. All rights reserved.
//

#import "RMMovieCell.h"
#import "TFHppleElement+RMMovie.h"

@interface RMMovieCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@end

@implementation RMMovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupWithData:(TFHppleElement*)data {
    
    self.titleLabel.text = [data movieTitle];
    self.detailLabel.text = [data movieId];
}

- (void)prepareForReuse {
    
    [super prepareForReuse];
    self.titleLabel.text = @"";
    self.detailLabel.text = @"";
}

@end
