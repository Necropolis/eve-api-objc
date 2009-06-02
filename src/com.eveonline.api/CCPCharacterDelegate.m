#import "CCPCharacterDelegate.h"

#import "CCPCharacter.h"
#import "CCPCharacterResultDelegate.h"

@implementation CCPCharacterDelegate

@synthesize character;
@synthesize child;

-(id)initWithCharacter:(CCPCharacter*)_character {
	[super init];
	
	[self setCharacter:_character];
	
	return self;
}

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict {
	
	// if we start into the results section then let's use that delegate
	if([elementName isEqualToString:@"result"]) {

		[self setChild:[[CCPCharacterResultDelegate alloc] initWithCharacter:character parent:self]];
		[parser setDelegate:child];
		return;
	}
	
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	if(!tempString)
		tempString = [[NSMutableString alloc] init];
	
	[tempString appendString:string];
	
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"currentTime"])
		[character setLastUpdate:[[NSDate alloc] initWithString:tempString]];
	
}

-(void)dealloc {
	[character release];
	[tempString release];
	[child release];
	
	[super dealloc];
}

@end

