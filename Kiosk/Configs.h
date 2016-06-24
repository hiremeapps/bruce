//
//  Configs.h
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

static NSString * const FONT_NAME_DEFAULT   = @"MuseoSans-300";
static NSString * const FONT_NAME_MEDIUM    = @"MuseoSans-500";
static NSString * const FONT_NAME_BOLD      = @"MuseoSans-700";
static NSString * const FONT_NAME_THIN      = @"MuseoSans-100";
static NSString * const API_STATUS_SUCCESS  = @"SUCCESS";
static NSString * const API_STATUS_ERROR    = @"ERROR";
static const float FONT_SIZE_DEFAULT        = 15.0f;
//Positioning
static const float STATUS_BAR_HEIGHT = 20.0f;
static const float NAVIGATION_BAR_HEIGHT = 44.0f;

#ifdef STAGING
static NSString * const BATCH_KEY = @"DEV57604602F089429E2E0C232E0EA";
static NSString * const BASE_API_URL = @"http://staging-api.masjidpay.com";
static NSString * const MIXPANEL_TOKEN = @"d95cf0d7d688a8f9405a5afb7a741858";
static NSString * const MIXPANEL_API_KEY = @"2f4860cfa790b9047b5385f504ca2716";
//static NSString * const BASE_API_URL = @"http://localhost:3001";
static NSString * const BASE_PAYMENT_URL = @"http://staging-app.masjidpay.com";
//static NSString * const BASE_PAYMENT_URL = @"http://localhost:3000";

#else
static NSString * const BATCH_KEY = @"57604602ED4021429E4B632E9F98FA";
static NSString * const MIXPANEL_TOKEN = @"3283cd2914683b95f2795a7cd4d7c372";
static NSString * const MIXPANEL_API_KEY = @"847b3414e12f317479894d7759bf3ea3";
static NSString * const BASE_API_URL = @"http://api.masjidpay.com";
static NSString * const BASE_PAYMENT_URL = @"http://app.masjidpay.com";
#endif

static NSString * const WEB_PAYMENT_URL = @"webpayment?";
static NSString * const TOSA_URL = @"http://masjidpay.com/page/tosa.html";
static NSString * const POLICY_URL = @"http://masjidpay.com/page/policy.html";

#define SYSTEM_VERSION                              ([[UIDevice currentDevice] systemVersion])
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IS_IOS8_OR_ABOVE                            (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))

/////preferences

static NSString * const PREFS_ONBOARDING_DONE = @"prefs.onboarding.done";
static NSString * const PREFS_USER_TOKEN = @"prefs.user.token";

static NSString * const PREFS_CREDENTIALS_USER_TOKEN = @"prefs.credentials.user.token";
static NSString * const PREFS_CREDENTIALS_USER_EMAIL= @"prefs.credentials.user.email";
static NSString * const PREFS_CREDENTIALS_USER_PHONE_NUMBER = @"prefs.credentials.user.phoneNumber";
static NSString * const PREFS_CREDENTIALS_USER_ID = @"prefs.credentials.user.id";
static NSString * const PREFS_CREDENTIALS_USER_NAME = @"prefs.credentials.user.name";


///tracking

static NSString *ACTION_APP_OPEN                          = @"app_activated";
static NSString *ACTION_MASJID_SELECTED                          = @"app_masjid_selected";
static NSString *ACTION_MASJID_SELECTED_CONTENT                          = @"app_detail_masjid_selected";
static NSString *ACTION_MASJID_SELECTED_BOOKMARK                          = @"app_detail_masjid_bookmark";
static NSString *ACTION_MASJID_DONATION                         = @"app_donation_masjid";
static NSString *ACTION_APP_PAUSED                        = @"app_paused";
static NSString *ADJUST_APP_TOKEN                         = @"8d9srrtl39db";
static NSString *ACTION_TYPE                              = @"action_type";



/**
 *  tracking common parameters
 */
static NSString * const PREFS_NOTIFICATION_DEVICE_TOKEN    = @"Prefs.notificationDeviceToken";
static NSString * const COMMON_TRACKING_DEVICE_OS = @"OS";
static NSString * const COMMON_TRACKING_DEVICE_OS_VERSION = @"OS";

