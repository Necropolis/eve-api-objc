#import "CCPCharacter.h"


@implementation CCPCharacter

@synthesize characterId;
@synthesize acct;

-(id)initWithId:(int)_characterId
		   acct:(CCPAccount*)_acct {
	[super init];
	
	[self setCharacterId:_characterId];
	[self setAcct:_acct];
	
	return self;
}

-(void)dealloc {
	
	[acct release];
	
	[super dealloc];
}

@end
