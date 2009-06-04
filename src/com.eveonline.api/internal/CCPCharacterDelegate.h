#import <Cocoa/Cocoa.h>

@class CCPCharacter, CCPCharacterResultDelegate;

/* Really only exists to parse the current time */
@interface CCPCharacterDelegate : NSObject {
	CCPCharacter *character;
	NSMutableString *tempString;
	CCPCharacterResultDelegate *child;
}

@property(readwrite, retain) CCPCharacter * character;
@property(readwrite, retain) CCPCharacterResultDelegate * child;

-(id)initWithCharacter:(CCPCharacter*)_character;

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict;

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

-(void)dealloc;

@end
