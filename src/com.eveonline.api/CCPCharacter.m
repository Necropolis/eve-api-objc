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
-(id)initWithCoder:(NSCoder*)coder {
	[super init];
	if([coder allowsKeyedCoding]) {
		characterId = [coder decodeIntForKey:@"CCPCharacter_characterId"];
		acct = [[coder decodeObjectForKey:@"CCPCharacter_acct"] retain];
		
	} else {
		[coder decodeValueOfObjCType:@encode(int) at:&characterId];
		acct = [[coder decodeObject] retain];
	}
	return self;
}

-(void)encodeWithCoder:(NSCoder*)coder {
	if([coder allowsKeyedCoding]) {
		[coder encodeInt:characterId forKey:@"CCPCharacter_characterId"];
		[coder encodeObject:acct forKey:@"CCPCharacter_acct"];
	} else {
		[coder encodeValueOfObjCType:@encode(int) at:&characterId];
		[coder encodeObject:acct];
	}
}

-(void)dealloc {
	
	[acct release];
	
	[super dealloc];
}

@end
