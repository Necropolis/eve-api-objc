#import "CCPCharacter.h"

#import "CCPAccount.h"
#import "CCPCharacterDelegate.h"

@implementation CCPCharacter

@synthesize characterId;
@synthesize acct;

@synthesize lastUpdate;

@synthesize name;
@synthesize race;
@synthesize bloodLine;
@synthesize gender;
@synthesize corporationName;
@synthesize cloneName;

@synthesize corporationID;
@synthesize cloneSkillPoints;

@synthesize balance;

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
		
		name = [[coder decodeObjectForKey:@"CCPCharacter_name"] retain];
		race = [[coder decodeObjectForKey:@"CCPCharacter_race"] retain];
		bloodLine = [[coder decodeObjectForKey:@"CCPCharacter_bloodLine"] retain];
		gender = [[coder decodeObjectForKey:@"CCPCharacter_gender"] retain];
		corporationName = [[coder decodeObjectForKey:@"CCPCharacter_corporationName"] retain];
		cloneName = [[coder decodeObjectForKey:@"CCPCharacter_cloneName"] retain];
		
		corporationID = [coder decodeIntForKey:@"CCPCharacter_corporationID"];
		cloneSkillPoints = [coder decodeIntForKey:@"CCPCharacter_cloneSkillPoints"];
		
		balance = [coder decodeDoubleForKey:@"CCPCharacter_balance"];
	} else {
		[coder decodeValueOfObjCType:@encode(int) at:&characterId];
		acct = [[coder decodeObject] retain];
		
		name = [[coder decodeObject] retain];
		race = [[coder decodeObject] retain];
		bloodLine = [[coder decodeObject] retain];
		gender = [[coder decodeObject] retain];
		corporationName = [[coder decodeObject] retain];
		cloneName = [[coder decodeObject] retain];
		
		[coder decodeValueOfObjCType:@encode(int) at:&corporationID];
		[coder decodeValueOfObjCType:@encode(int) at:&cloneSkillPoints];
		
		[coder decodeValueOfObjCType:@encode(double) at:&balance];
	}
	return self;
}

-(NSDate*)lastUpdate {
	if(!lastUpdate)
		[self update];
	return lastUpdate;
}

-(NSString*)name {
	if(!name)
		[self update];
	return name;
}

-(NSString*)race {
	if(!race)
		[self update];
	return race;
}

-(NSString*)bloodLine {
	if(!bloodLine)
		[self update];
	return bloodLine;
}

-(NSString*)gender {
	if(!gender)
		[self update];
	return gender;
}

-(NSString*)corporationName {
	if(!corporationName)
		[self update];
	return corporationName;
}

-(NSString*)cloneName {
	if(!cloneName)
		[self update];
	return cloneName;
}

-(int)corporationID {
	if(!name) // use a nil-differentiable property
		[self update];
	return corporationID;
}

-(int)cloneSkillPoints {
	if(!name)
		[self update];
	return cloneSkillPoints;
}

-(double)balance {
	if(!name)
		[self update];
	return balance;
}

-(void)update {
	NSURL *charSheetUrl = [[NSURL alloc]
						  initWithString:[NSString stringWithFormat:
										  @"http://api.eve-online.com/char/CharacterSheet.xml.aspx?userID=%d&characterID=%d&apiKey=%@",
										  [acct acctId], characterId, [acct ltdApiKey]]];
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:charSheetUrl];
	
	delegate = [[CCPCharacterDelegate alloc] initWithCharacter:self];
	[parser setDelegate:delegate];
	
	[parser parse];
	
	[delegate release];
	[parser release];
	[charSheetUrl release];
}

-(void)encodeWithCoder:(NSCoder*)coder {
	if([coder allowsKeyedCoding]) {
		[coder encodeInt:characterId forKey:@"CCPCharacter_characterId"];
		[coder encodeObject:acct forKey:@"CCPCharacter_acct"];
		
		[coder encodeObject:lastUpdate forKey:@"CCPCharacter_lastUpdate"];
		
		[coder encodeObject:name forKey:@"CCPCharacter_name"];
		[coder encodeObject:race forKey:@"CCPCharacter_race"];
		[coder encodeObject:bloodLine forKey:@"CCPCharacter_bloodLine"];
		[coder encodeObject:gender forKey:@"CCPCharacter_gender"];
		[coder encodeObject:corporationName forKey:@"CCPCharacter_corporationName"];
		[coder encodeObject:cloneName forKey:@"CCPCharacter_cloneName"];
		
		[coder encodeInt:corporationID forKey:@"CCPCharacter_corporationID"];
		[coder encodeInt:cloneSkillPoints forKey:@"CCPCharacter_cloneSkillPoints"];
		
		[coder encodeDouble:balance forKey:@"CCPCharacter_balance"];
	} else {
		[coder encodeValueOfObjCType:@encode(int) at:&characterId];
		[coder encodeObject:acct];
		
		[coder encodeObject:name];
		[coder encodeObject:race];
		[coder encodeObject:bloodLine];
		[coder encodeObject:gender];
		[coder encodeObject:corporationName];
		[coder encodeObject:cloneName];
		
		[coder encodeValueOfObjCType:@encode(int) at:&corporationID];
		[coder encodeValueOfObjCType:@encode(int) at:&cloneSkillPoints];
		
		[coder encodeValueOfObjCType:@encode(double) at:&balance];
	}
}

-(void)dealloc {
	
	[acct release];
	
	[name release];
	[race release];
	[bloodLine release];
	[gender release];
	[corporationName release];
	[cloneName release];
	
	[super dealloc];
}

@end



