#import "CCPSkillTreeDelegate.h"

#import "CCPSkillTree.h"

@implementation CCPSkillTreeDelegate

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict {
	
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	[self cleanTempString];
	
	if([elementName isEqualToString:@"currentTime"]) {
		[tempString appendString:@" +0000"];
		[mutator setLastUpdate:[[NSDate alloc] initWithString:tempString]];
	} else if([elementName isEqualToString:@"cachedUntil"]) {
		[tempString appendString:@" +0000"];
		[mutator setCachedUntil:[[NSDate alloc] initWithString:tempString]];
	} else {
		[self setTempString:nil];
	}
}

@end
