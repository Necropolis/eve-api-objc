#import <Cocoa/Cocoa.h>

#import "CCPXMLDelegate.h"

@class CCPCharacter, CCPCharacterResultDelegate;

/* Really only exists to parse the current time */
@interface CCPCharacterDelegate : CCPXMLDelegate {
	CCPCharacterResultDelegate *child;
}

@property(readwrite, retain) CCPCharacterResultDelegate * child;

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict;

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

-(void)dealloc;

@end
