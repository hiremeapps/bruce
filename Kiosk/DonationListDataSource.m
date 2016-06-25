//
//  DonationListDataSource.m
//  Masjid Pay
//
//  Created by Arie on 3/14/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "DonationListDataSource.h"
#import "DonationTableViewCell.h"
#import "PaymentListDataModels.h"
#import "ProjectData.h"
@implementation DonationListDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.isProject) {
        ProjectData *contentResponse = [self.data objectAtIndex:indexPath.row];
        static NSString *CellIdentifier = @"DonationTableViewCell";
        DonationTableViewCell *cell = (DonationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            UINib *cellNib = [UINib nibWithNibName:[DonationTableViewCell debugDescription] bundle:nil];
            [tableView registerNib:cellNib forCellReuseIdentifier:[DonationTableViewCell debugDescription]];
            cell = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil][0];
        }
        [cell configureProjectWithType:contentResponse];
        return cell;
    }
    else {
        PaymentListData *paymentType = [self.data objectAtIndex:indexPath.row];
        static NSString *CellIdentifier = @"DonationTableViewCell";
        DonationTableViewCell *cell = (DonationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            UINib *cellNib = [UINib nibWithNibName:[DonationTableViewCell debugDescription] bundle:nil];
            [tableView registerNib:cellNib forCellReuseIdentifier:[DonationTableViewCell debugDescription]];
            cell = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil][0];
        }
        [cell configureDonationWithpaymentType:paymentType];
        return cell;
    }
    
}

@end
