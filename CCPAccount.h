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
	
	NSArray *characters;
	
}

@property(readwrite, assign) int acctId;
@property(readwrite, retain) NSString * ltdApiKey;
@property(readwrite, retain) NSString * ultdApiKey;
/**
 * Use <code>setCharacters:nil</code> to force a refresh of the
 * character list from the API server.
 */
@property(readwrite, retain) NSArray * characters;

-(id)initWithAcctId:(int)_acctId
		  ltdApiKey:(NSString*)_ltdApiKey;
-(id)initWithAcctId:(int)_acctId
		  ltdApiKey:(NSString*)_ltdApiKey
		 ultdApiKey:(NSString*)_ultdApiKey;
-(id)initWithCoder:(NSCoder*)coder;

-(NSArray*)characters;

-(void)encodeWithCoder:(NSCoder*)coder;

-(void)dealloc;

@end
