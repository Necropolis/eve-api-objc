#import <Cocoa/Cocoa.h>

@class CCPAccount, CCPCharacterDelegate;

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
	int			characterId;		//!< Unique key corresponding to this character.
	CCPAccount	*acct;				//!< Backward reference to the account which holds this character.
	
	NSDate*		lastUpdate;			//!< The time and date on which this character's character sheet was generated.
	
	NSString*	name;				//!< This character's name.
	NSString*	race;				//!< Which one of the four races this character originates from.
	NSString*	bloodLine;			//!< The character's blood line.
	NSString*	gender;				//!< The character's gender.
	NSString*	corporationName;	//!< The common name of the character's corporation.
	NSString*	cloneName;			//!< The common name of the class of jump clone this character has upgraded to.
	
	int			corporationID;		//!< Unique key corresponding to this character's current corporation.
	int			cloneSkillPoints;	//!< Integer value representing the number of skill points this character will retain after being podkilled.
	
	double		balance;			//!< What's in your wallet?
	
	@private
	CCPCharacterDelegate *delegate;
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

/**
 * Initializes the receiver with a given character ID.  The
 * user ID, limited and optionally unlimited API key are stored
 * in the CCPAccount object.
 */
-(id)initWithId:(int)_characterId
		   acct:(CCPAccount*)_acct;

/**
 * Initializes the receiver with a coder, effectively reincarnating
 * the object from a stream, file, or other form of stored medium.
 */
-(id)initWithCoder:(NSCoder*)coder;

/**
 * Causes the receiver character to query the EVE API server for its
 * XML character sheet.  It will then attempt to parse that XML.
 *
 * To reduce strain on the API server, please use this function as
 * sparingly as you can!  Once every six minutes should be enough at
 * the very most!
 */
-(void)update;

/**
 * Encodes the receiver to a coder, allowing you to store the CCPCharacter
 * to a file or stream.
 */
-(void)encodeWithCoder:(NSCoder*)coder;

-(void)dealloc;

@end

