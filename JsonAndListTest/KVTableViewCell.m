//
//  KVTableViewCell.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 2/05/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVTableViewCell.h"

@implementation KVTableViewCell

@synthesize description = _description;
@synthesize value = _value;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
