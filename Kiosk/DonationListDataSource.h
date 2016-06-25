//
//  DonationListDataSource.h
//  Masjid Pay
//
//  Created by Arie on 3/14/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DonationListDataSource : NSObject <UITableViewDataSource>
@property (nonatomic,strong) NSArray *data;
@property (nonatomic,assign) BOOL isProject;
@end
