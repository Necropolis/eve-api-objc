#import <Cocoa/Cocoa.h>

#import "CCPXMLDelegate.h"
#import "CCPSkillGroupDelegate.h"

@interface CCPSkillTreeDelegate : CCPXMLDelegate {
	CCPSkillGroupDelegate *child;
}

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict;

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

-(void)dealloc;

@end
