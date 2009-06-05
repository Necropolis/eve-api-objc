#import <Cocoa/Cocoa.h>

#import "CCPXMLDelegate.h"

@class CCPCharacter, CCPCharacterResultDelegate;

@interface CCPCharacterAttributesDelegate : CCPXMLDelegate {

}

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict;

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

@end
