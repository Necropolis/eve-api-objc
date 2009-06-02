#import "CCPCharacterResultDelegate.h"

#import "CCPCharacter.h"
#import "CCPCharacterDelegate.h"

@implementation CCPCharacterResultDelegate

@synthesize character;
@synthesize parent;
@synthesize tempString;

-(id)initWithCharacter:(CCPCharacter*)_character
				parent:(CCPCharacterDelegate*)_parent {
	[super init];
	
	[self setCharacter:_character];
	[self setParent:_parent];
	
	return self;
}

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict {
	
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	if(!tempString)
		tempString = [[NSMutableString alloc] init];
	
	[tempString appendString:string];
	
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	// result set parser is done, set the delegate back to the parent CCPCharacterDelegate
	if([elementName isEqualToString:@"result"]) {
		[parser setDelegate:parent];
	} else if([elementName isEqualToString:@"name"]) {
		[character setName:tempString];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"race"]) {
		[character setRace:tempString];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"bloodLine"]) {
		[character setBloodLine:tempString];
		[self setTempString:nil];
	}
	
}

-(void)dealloc {
	[character release];
	[parent release];
	[tempString release];
	
	[super dealloc];
}

@end

