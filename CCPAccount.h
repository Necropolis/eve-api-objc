#import <Cocoa/Cocoa.h>

#import "CCPCharacter.h"

/**
 * A simple class which returns arrays of CCPCharacters.  This is much
 * simpler than requesting that the user supply a character ID.
 */
@interface CCPAccount : NSObject<NSCoding> {
	
	int acctId;
	NSString *ltdApiKey;
	NSString *ultdApiKey;
	
	NSMutableArray *characters;
	
	@private BOOL isParsing;
	
}

@property(readwrite, assign) int acctId;
@property(readwrite, retain) NSString * ltdApiKey;
@property(readwrite, retain) NSString * ultdApiKey;
/**
 * Use <code>setCharacters:nil</code> to force a refresh of the
 * character list from the API server.
 */
@property(readwrite, retain) NSMutableArray * characters;

-(id)initWithAcctId:(int)_acctId
		  ltdApiKey:(NSString*)_ltdApiKey;
-(id)initWithAcctId:(int)_acctId
		  ltdApiKey:(NSString*)_ltdApiKey
		 ultdApiKey:(NSString*)_ultdApiKey;
-(id)initWithCoder:(NSCoder*)coder;

-(NSMutableArray*)characters;

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict;
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

-(void)encodeWithCoder:(NSCoder*)coder;

-(void)dealloc;

@end
