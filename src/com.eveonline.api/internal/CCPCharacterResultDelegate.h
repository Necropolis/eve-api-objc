#import <Cocoa/Cocoa.h>

@class CCPCharacter, CCPCharacterDelegate;

/**
 * Internal use only.
 */
@interface CCPCharacterResultDelegate : NSObject {
	CCPCharacter *character;
	CCPCharacterDelegate *parent;
	NSMutableString *tempString;
}

@property(readwrite, retain) CCPCharacter * character;
@property(readwrite, retain) CCPCharacterDelegate * parent;
@property(readwrite, retain) NSMutableString * tempString;

-(id)initWithCharacter:(CCPCharacter*)_character
				parent:(CCPCharacterDelegate*)_parent;

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict;

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

-(void)dealloc;

@end
