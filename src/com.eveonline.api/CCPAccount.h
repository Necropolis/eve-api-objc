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

/**
 * Creates a new account object with only the user ID and the
 * limited API key.  You can set the unlimited API key later if
 * you so choose.
 */
-(id)initWithAcctId:(int)_acctId
		  ltdApiKey:(NSString*)_ltdApiKey;

/**
 * Creates a new account object with the user ID, limited API key,
 * and the unlimited API key.  You can remove the unlimited API
 * key later if you so choose.
 */
-(id)initWithAcctId:(int)_acctId
		  ltdApiKey:(NSString*)_ltdApiKey
		 ultdApiKey:(NSString*)_ultdApiKey;

/**
 * Restores an account object and any child objects from a coder.
 */
-(id)initWithCoder:(NSCoder*)coder;

/**
 * A list of all characters registered to this account.  If the list
 * is empty then the account number or limited API key might be
 * incorrect.
 *
 * This selector caches the list of characters.  You need to call
 * <code>setCharacters:nil</code> in order to force a refresh of the
 * character list.  Since characters don't often change accounts, this
 * should be a rarity.
 */
-(NSMutableArray*)characters;

/**
 * Encodes this account and all child objects to the given coder.
 */
-(void)encodeWithCoder:(NSCoder*)coder;

-(void)dealloc;

/**
 * Used by the XML event-driven parser.  Use of this function is highly discouraged
 * unless you have a really good idea of what you want to do.
 */
-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict;
/**
 * Used by the XML event-driven parser.  Use of this function is highly discouraged
 * unless you have a really good idea of what you want to do.
 */
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

@end
