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
	[self setAcctId:_acctId];
	[self setLtdApiKey:_ltdApiKey];
	[self setUltdApiKey:_ultdApiKey];
	return self;
}

-(NSArray*)characters {
	if(characters!=nil)
		return characters;
	NSURL *acctCharUrl = [[NSURL alloc]
						  initWithString:[NSString stringWithFormat:
										  @"http://api.eve-online.com/account/Characters.xml.aspx?userID=%d&apiKey=%@",
										  acctId, ltdApiKey]];
	NSError *fetchError = nil;
	NSXMLDocument *doc = [[NSXMLDocument alloc] initWithContentsOfURL:acctCharUrl 
															  options:NSXMLDocumentValidate 
																error:&fetchError];
	[acctCharUrl release];
	if(fetchError)
		return nil;
	NSArray *na = [doc nodesForXPath:@"eveapi/result/rowset/row" 
							   error:&fetchError];
	if(fetchError||[na count]==0)
		return nil;
	NSMutableArray *toReturn = [[NSMutableArray alloc] init];
	
	int tmpId;
	
	for( int i = 0 ; i < [na count] ; ++i ) {
		tmpId = [[[[na objectAtIndex:i] attributeForName:@"characterID"] stringValue] integerValue];
		[toReturn addObject:[[CCPCharacter alloc] initWithId:tmpId
													  userId:acctId
												   ltdapiKey:ltdApiKey
												  ultdApiKey:@""
													   error:&fetchError]];
	}
	
	[doc release];
	characters = [NSArray arrayWithArray:toReturn];
	[toReturn release];
	return characters;
	
}

-(void)dealloc {
	[self setLtdApiKey:nil];
	[self setUltdApiKey:nil];
	if(characters!=nil)
		[characters release];
	[super dealloc];
}

@end
