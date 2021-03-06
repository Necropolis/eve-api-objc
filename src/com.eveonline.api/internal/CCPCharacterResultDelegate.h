#import <Cocoa/Cocoa.h>

#import "CCPXMLDelegate.h"

@class CCPCharacter, CCPCharacterDelegate, CCPCharacterAttributesDelegate;

/**
 * Internal use only.
 */
@interface CCPCharacterResultDelegate : CCPXMLDelegate {
	CCPCharacterAttributesDelegate *attributeChild;
}

@property(readwrite, retain) CCPCharacterAttributesDelegate * attributeChild;

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict;

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

-(void)dealloc;

@end
