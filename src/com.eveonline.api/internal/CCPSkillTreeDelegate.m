#import "CCPSkillTreeDelegate.h"

#import "CCPSkillTree.h"
#import "CCPSkillTreeDelegate.h"

@implementation CCPSkillTreeDelegate

// <rowset name="skillGroups" key="groupID" columns="groupName,groupID">
-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict {
	if([elementName isEqualToString:@"rowset"]
	   &&[[attributeDict objectForKey:@"name"] isEqualToString:@"skillGroups"]) {
		if(!child)
			child = [[CCPSkillGroupDelegate alloc] initWithMutator:mutator
															parent:self];
		[parser setDelegate:child];
	}
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

-(void)dealloc {
	[child release];
	
	[super dealloc];
}

@end
