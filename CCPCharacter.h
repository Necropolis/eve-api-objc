#import <Cocoa/Cocoa.h>

@class CCPAccount;

@interface CCPCharacter : NSObject {
	int characterId;
	CCPAccount *acct;
}

@property(readwrite, assign) int characterId;
@property(readwrite, retain) CCPAccount * acct;

-(id)initWithId:(int)_characterId
		   acct:(CCPAccount*)_acct;

-(void)dealloc;

@end
