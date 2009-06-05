#import "CCPCharacterDelegate.h"

#import "CCPCharacter.h"
#import "CCPCharacterResultDelegate.h"

@implementation CCPCharacterDelegate

@synthesize child;

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict {
	
	// if we start into the results section then let's use that delegate
	if([elementName isEqualToString:@"result"]) {

		[self setChild:[[CCPCharacterResultDelegate alloc] initWithMutator:mutator
																	parent:self]];
		[parser setDelegate:child];
		return;
	}
	
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	[self cleanTempString];
	
	if([elementName isEqualToString:@"currentTime"]) {
		/*
		 (from NSDate docs)
		 A string that specifies a date and time value in the international string
		 representation format—YYYY-MM-DD HH:MM:SS ±HHMM, where ±HHMM is a time
		 zone offset in hours and minutes from GMT (for example, “2001-03-24 10:45:32 +0600”).
		 
		 You must specify all fields of the format string, including the time zone
		 offset, which must have a plus or minus sign prefix.
		 
		 (from EVE API XML examples)
		 <currentTime>2007-06-18 22:49:01</currentTime>
		 */
		[tempString appendString:@" +0000"];
		[mutator setLastUpdate:[[NSDate alloc] initWithString:tempString]];
	}
		
	
}

-(void)dealloc {
	[child release];
	
	[super dealloc];
}

@end

