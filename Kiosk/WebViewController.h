//
//  WebViewController.h
//  Kiosk
//
//  Created by Arie on 6/26/16.
//  Copyright © 2016 Arie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (nonatomic,strong) NSString *webviewTitle;
@property (nonatomic,strong) NSString *urlToLoad;
@end
