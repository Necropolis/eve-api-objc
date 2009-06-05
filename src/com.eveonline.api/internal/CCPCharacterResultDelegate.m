#import "CCPCharacterResultDelegate.h"

#import "CCPCharacter.h"
#import "CCPCharacterDelegate.h"
#import "CCPCharacterAttributesDelegate.h"

@implementation CCPCharacterResultDelegate

@synthesize attributeChild;

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict {
	if([elementName isEqualToString:@"attributes"]) {
		[self setAttributeChild:[[CCPCharacterAttributesDelegate alloc] initWithMutator:mutator
																				 parent:self]];
		[parser setDelegate:attributeChild];
	}
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	[self cleanTempString];
	
	// result set parser is done, set the delegate back to the parent CCPCharacterDelegate
	if([elementName isEqualToString:@"result"]) {
		[parser setDelegate:parent];
	} else if([elementName isEqualToString:@"name"]) {
		[((CCPCharacter*)mutator) setName:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"race"]) {
		[mutator setRace:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"bloodLine"]) {
		[mutator setBloodLine:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"gender"]) {
		[mutator setGender:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"corporationName"]) {
		[mutator setCorporationName:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"corporationID"]) {
		[mutator setCorporationID:[tempString intValue]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"cloneName"]) {
		[mutator setCloneName:[NSString stringWithString:tempString]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"cloneSkillPoints"]) {
		[mutator setCloneSkillPoints:[tempString intValue]];
		[self setTempString:nil];
	} else if([elementName isEqualToString:@"balance"]) {
		[mutator setBalance:[tempString doubleValue]];
		[self setTempString:nil];
	} else {
		[self setTempString:nil];
	}
	
}

-(void)dealloc {
	[attributeChild release];
	
	[super dealloc];
}

@end

