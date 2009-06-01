#import <Cocoa/Cocoa.h>

@class CCPAccount;

/**
 * Functions as a simple structure of data related to a character sheet.  Also
 * abstracts the tasks of retrieving specific information about training skills,
 * training queue, certificates, corporation information, and other such information.
 *
 * This other information is provided as a link to that specifc EVE API object
 * and is not precisely under the direct control of CCPCharacter.
 * 
 * Note that by calling the accessor selector you will initiate the API's process
 * of querying the API server if it does not already have cached information about
 * the character.  If it already has cached information it will use this indefinitely
 * until you clear the cache by using the appropraite selector.
 */
@interface CCPCharacter : NSObject<NSCoding> {
	int characterId;
	CCPAccount *acct;
	
	NSDate* lastUpdate;
	
	NSString* name;
	NSString* race;
	NSString* bloodLine;
	NSString* gender;
	NSString* corporationName;
	NSString* cloneName;
	
	int corporationID;
	int cloneSkillPoints;
	
	double balance;
}

@property(readwrite, assign) int characterId;
@property(readwrite, retain) CCPAccount * acct;

@property(readwrite, retain) NSDate * lastUpdate;

@property(readwrite, retain) NSString * name;
@property(readwrite, retain) NSString * race;
@property(readwrite, retain) NSString * bloodLine;
@property(readwrite, retain) NSString * gender;
@property(readwrite, retain) NSString * corporationName;
@property(readwrite, retain) NSString * cloneName;

@property(readwrite, assign) int corporationID;
@property(readwrite, assign) int cloneSkillPoints;

@property(readwrite, assign) double balance;

-(id)initWithId:(int)_characterId
		   acct:(CCPAccount*)_acct;
-(id)initWithCoder:(NSCoder*)coder;

-(void)encodeWithCoder:(NSCoder*)coder;

-(void)dealloc;

@end
