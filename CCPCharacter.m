#import "CCPCharacter.h"


@implementation CCPCharacter

@synthesize characterId;
@synthesize userId;
@synthesize ltdApiKey;
@synthesize ultdApiKey;

-(id)initWithId:(int)_characterId
		 userId:(int)_userId
	  ltdapiKey:(NSString*)_ltdApiKey
	 ultdApiKey:(NSString*)_ultdApiKey {
	[super init];
	
	[self setCharacterId:_characterId];
	[self setUserId:_userId];
	[self setLtdApiKey:_ltdApiKey];
	[self setUltdApiKey:_ultdApiKey];
	
	return self;
}

-(void)dealloc {
	
	[ltdApiKey release];
	[ultdApiKey release];
	
	[super dealloc];
}

@end
