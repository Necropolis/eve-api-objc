#import "CCPCharacterAttributesDelegate.h"

#import "CCPCharacter.h"
#import "CCPCharacterResultDelegate.h"

@implementation CCPCharacterAttributesDelegate

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict {
	
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	if([elementName isEqualToString:@"attributes"]) {
		[parser setDelegate:parent];
		return;
	}
	
	[self cleanTempString];
	
	if([elementName isEqualToString:@"intelligence"]) {
		[mutator setBaseIntelligence:[tempString intValue]];
	} else if([elementName isEqualToString:@"memory"]) {
		[mutator setBaseMemory:[tempString intValue]];
	} else if([elementName isEqualToString:@"charisma"]) {
		[mutator setBaseCharisma:[tempString intValue]];
	} else if([elementName isEqualToString:@"perception"]) {
		[mutator setBasePerception:[tempString intValue]];
	} else if([elementName isEqualToString:@"willpower"]) {
		[mutator setBaseWillpower:[tempString intValue]];
	}
	[self setTempString:nil];
}

@end
