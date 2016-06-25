
#import <Foundation/Foundation.h>

@class ProjectPostMeta, ProjectEvent, ProjectProject;

@interface ProjectData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) ProjectPostMeta *postMeta;
@property (nonatomic, strong) NSString *publishedStatus;
@property (nonatomic, assign) double v;
@property (nonatomic, strong) ProjectEvent *event;
@property (nonatomic, strong) NSString *writer;
@property (nonatomic, strong) NSString *creator;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) ProjectProject *project;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
