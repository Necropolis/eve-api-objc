#import "CCPAccount.h"

@implementation CCPAccount

@synthesize acctId;
@synthesize ltdApiKey;
@synthesize ultdApiKey;
@dynamic characters;

-(id)initWithAcctId:(int)_acctId
		  ltdApiKey:(NSString*)_ltdApiKey {
	return [self initWithAcctId:_acctId
					  ltdApiKey:_ltdApiKey
					 ultdApiKey:@""];
}
-(id)initWithAcctId:(int)_acctId
		  ltdApiKey:(NSString*)_ltdApiKey
		 ultdApiKey:(NSString*)_ultdApiKey {
	[super init];
	
	isParsing = NO;
	[self setAcctId:_acctId];
	[self setLtdApiKey:_ltdApiKey];
	[self setUltdApiKey:_ultdApiKey];
	
	return self;
}
-(id)initWithCoder:(NSCoder*)coder {
	[super init];
	if([coder allowsKeyedCoding]) {
		acctId = [coder decodeIntForKey:@"CCPAccount_acctId"];
		ltdApiKey = [[coder decodeObjectForKey:@"CCPAccount_ltdApiKey"] retain];
		ultdApiKey = [[coder decodeObjectForKey:@"CCPAccount_ultdApiKey"] retain];
		characters = [[coder decodeObjectForKey:@"CCPAccount_characters"] retain];
	} else {
		[coder decodeValueOfObjCType:@encode(int) at:&acctId];
		ltdApiKey = [[coder decodeObject] retain];
		ultdApiKey = [[coder decodeObject] retain];
		characters = [[coder decodeObject] retain];
	}
	return self;
}

-(NSMutableArray*)characters {
	NSLog(@"test");
	if(characters!=nil)
		return characters;
	NSURL *acctCharUrl = [[NSURL alloc]
						  initWithString:[NSString stringWithFormat:
										  @"http://api.eve-online.com/account/Characters.xml.aspx?userID=%d&apiKey=%@",
										  acctId, [self ltdApiKey]]];
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:acctCharUrl];
	
	[acctCharUrl release];
	
	if(characters)
		[characters release];
	characters = [[NSMutableArray alloc] init];
	[parser setDelegate:self];
	
	if([parser parse])
		return characters;
	else
		return nil;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
		namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
		attributes:(NSDictionary *)attributeDict {
	if(isParsing&&[elementName isEqualToString:@"row"]) {
		[characters addObject:[[CCPCharacter alloc] initWithId:[[attributeDict valueForKey:@"characterID"] intValue]
														  acct:self]];
		return;
	}
	if([elementName isEqualToString:@"rowset"]) {
		if([[attributeDict valueForKey:@"name"] isEqualToString:@"characters"])
			isParsing = YES;
		return;
	}
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
		namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	if([elementName isEqualToString:@"rowset"]&&isParsing)
		isParsing = NO;
	return;
}

-(void)encodeWithCoder:(NSCoder*)coder {
	if([coder allowsKeyedCoding]) {
		[coder encodeInt:[self acctId] forKey:@"CCPAccount_acctId"];
		[coder encodeObject:[self ltdApiKey] forKey:@"CCPAccount_ltdApiKey"];
		[coder encodeObject:[self ultdApiKey] forKey:@"CCPAccount_ultdApiKey"];
		[coder encodeObject:characters forKey:@"CCPAccount_characters"];
	} else {
		[coder encodeValueOfObjCType:@encode(int) at:&acctId];
		[coder encodeObject:[self ltdApiKey]];
		[coder encodeObject:[self ultdApiKey]];
		[coder encodeObject:characters];
	}
}

-(void)dealloc {
	[self setLtdApiKey:nil];
	[self setUltdApiKey:nil];
	if(characters)
		[characters release];
	[super dealloc];
}

@end
