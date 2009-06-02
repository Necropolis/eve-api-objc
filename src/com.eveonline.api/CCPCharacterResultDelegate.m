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
	
	int i; char c;
	for(i = 0; i < [tempString length]; ++i) {
		c = [tempString characterAtIndex:i];
		if(c != ' ' && c != '\t' && c != '\r' && c != '\n')
			break;
	}
	[self setTempString:[NSMutableString stringWithString:[tempString substringFromIndex:i]]];
	
	// result set parser is done, set the delegate back to the parent CCPCharacterDelegate
	if([elementName isEqualToString:@"result"]) {
		[parser setDelegate:parent];
	} else if([elementName isEqualToString:@"name"]) {
		[character setName:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"race"]) {
		[character setRace:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"bloodLine"]) {
		[character setBloodLine:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"gender"]) {
		[character setGender:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"corporationName"]) {
		[character setCorporationName:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"corporationID"]) {
		[character setCorporationID:[tempString intValue]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"cloneName"]) {
		[character setCloneName:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"cloneSkillPoints"]) {
		[character setCloneSkillPoints:[tempString intValue]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"balance"]) {
		[character setBalance:[tempString doubleValue]];
		[self setTempString:nil];
	} else {
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

