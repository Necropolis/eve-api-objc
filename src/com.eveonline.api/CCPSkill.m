#import "CCPSkill.h"


@implementation CCPSkill

@synthesize skillId;
@synthesize groupId;

@synthesize name;
@synthesize description;

@synthesize rank;

@synthesize reqs;

@synthesize primary;
@synthesize secondary;

-(void)dealloc {
	[name release];
	[description release];
	
	[reqs release];
	
	[primary release];
	[secondary release];
	
	[super dealloc];
}

@end
