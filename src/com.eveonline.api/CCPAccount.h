/**
 * \mainpage EVE Online API - Objective-C Wrapper
 *
 * \section intro_sec Introduction
 *
 * This wrapper is designed to allow you to access information from the EVE Online API in a simple and
 * object-oriented way from within Cocoa/CocoaTouch -based Objective-C applications both on Apple Mac
 * OS X and iPhone 2.0 and 3.0 platforms.  This API is built to comply with as many Objective-C design
 * patterns as possible and to be compliant with as many Cocoa technologies as appropriate as well.
 * Among these built-in functionalities are NSCoding support as well as the ability of the API to function
 * in contexts where the garbage collector is present and in contexts where there is no automatic garbage
 * collection.
 *
 * This API is not endorsed or supported in any way shape or form by Crowd Control Productions (CCP) or
 * any of its affiliates or subsidiaries.  This is a "third-party" API and carries no guarantee or
 * liability from CCP, its affiliates and/or subsidiaries.  This API is "free software" under no specific
 * license agreement whatsoever.  You are responsible for the actions and behavior of this API on your
 * systems and the systems of your users - not the API author.
 *
 * \section install Installation
 * 
 * Installing the API in Xcode so that you can use it is a simple task of cloning the API repository using
 * the Git distributed version control software.  From there open the Xcode project to make Xcode aware of
 * the API.  In your project, add the API as a dependent project and framework in order to link against
 * the API code.  From here the process is completely automated and you can optionally use Git to freshen
 * your repository for API updates.
 *
 * If you wish to develop or rebuild the API's automatic documentation without downloading a binary release
 * you will need the Doxygen automatic documentation system installed on your system.  After installing
 * Doxygen.app to your /Applications directory, add the user-defined build setting "DOXYGEN_PATH" and set it
 * as /Applications/Doxygen.app/contents/resources/doxygen in your local copy of the API project.  When you
 * build the API it will now automatically generate and install and up-to-date copy of the documentation set
 * for you.
 *
 * To set up unit testing for your local copy of the API framework, you need to create a local test credentials
 * file.  Find the file in the API project directory called "testAcct.example" and make a copy called "testAcct"
 * Edit this file and fill in your own EVE Online API credentials.  Once you do this the unit tests will be
 * supplied with sufficient information to automatically perform their functionality tests provided that the
 * system they are run on has an active Internet connection and that the EVE Online API servers are in a functional
 * state.
 */
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
