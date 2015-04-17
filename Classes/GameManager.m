
#import "GameManager.h"

static int myGameState;
static int myPreviousGameState;
static int myOffensivePositionSelected;
static int myAttackZoneSelected;
static int myDefensiveStanceSelected;
static int myHomeScore;
static int myVisitorScore;
static int myDown;
static int myYardsToGo;
static int myLineOfScrimmage;
static int myClock;
static int myQuarter;
static int myPossession;
static int myPlayResult;
static int myGameInProgress;
static int myHomeTeamType;
static int myAwayTeamType;
static int myNavFlag;
static int myKickedFirst;
static int myQuarterLength;
static int myHighlightedZone;
static int myDefensiveFormation;
static int myHomeTeamTimeOuts;
static int myAwayTeamTimeOuts;
static int myGameClockStatus;
static int myWonCoinToss;
static int myAttemptingTwoPoints;
static int myBasicPlayResult;

////////////////
// Statistics //
////////////////

static int myHomeRushingPlays;

static NSString *myCommentary;
static BOOL myWasSacked = FALSE;

@implementation GameManager

+ (void)resetGameState
{
	myGameState = SPLASH_SCREEN_STATE;
	myPreviousGameState = MAIN_MENU;
	myOffensivePositionSelected = KICKER;
	myAttackZoneSelected = NORMAL_KICK_OFF;
	myDefensiveStanceSelected = NORMAL_KICK_OFF_RETURN;
	myHomeScore = 0;
	myVisitorScore = 0;
	myDown = 1;
	myYardsToGo = 10;
	myLineOfScrimmage = 70;
	myClock = 150;
	myQuarter = 1;
	myPossession = 1; //Away Team Always Kicks Off Until The Coin toss Screen Is Ready...
	myPlayResult = 0;
	myGameInProgress = 0;
	myHomeTeamType = HUMAN_COACH;
	myAwayTeamType = COMPUTER_COACH;
	myNavFlag = NEED_KICKOFF_NAV_FLAG;
	myKickedFirst = 1; // Away Team Always Kicks Off Until The Coin Toss Screen is Ready...
	myQuarterLength = QUARTER_LENGTH_2_HALF_MINUTES;
	myHighlightedZone = NO_POSITION_SELECTED;
	myDefensiveFormation = FIVE_THREE_THREE_DEFENSIVE_FORMATION;
	myHomeTeamTimeOuts = 3;
	myAwayTeamTimeOuts = 3;
	myGameClockStatus = GAME_CLOCK_STOPPED;
	myCommentary = @" ";
	
	[OffensiveFormationData setLeftWideReceiver: 1];
	[OffensiveFormationData setLeftSplitEnd: 0];
	[OffensiveFormationData setLeftTightEnd: 0];
	[OffensiveFormationData setRightTightEnd: 1];
	[OffensiveFormationData setRightSplitEnd: 0];
	[OffensiveFormationData setRightWideReceiver: 1];
	[OffensiveFormationData setQuarterBack: 1];
	[OffensiveFormationData setFullBack: 1];
	[OffensiveFormationData setLeftHalfBack: 0];
    [OffensiveFormationData setRightHalfBack: 0];
	[OffensiveFormationData setTailBack: 1];
	
	[DefensiveFormationData setSweepLeftRushingZone: 1];
	[DefensiveFormationData setOffTackleLeftRushingZone: 1];
	[DefensiveFormationData setInsideRushingZone: 1];
	[DefensiveFormationData setOffTackleRightRushingZone: 1];
	[DefensiveFormationData setSweepRightRushingZone: 1];
	[DefensiveFormationData setShortLeftPassingZone: 1];
	[DefensiveFormationData setShortMiddlePassingZone: 1];
	[DefensiveFormationData setShortRightPassingZone: 1];
	[DefensiveFormationData setMiddleLeftPassingZone: 1];
	[DefensiveFormationData setMiddleRightPassingZone: 1];
	[DefensiveFormationData setLongPassingZone: 1];
}

+ (void)initializeGameSettings
{
	NSUserDefaults *currentGameSettings = [NSUserDefaults standardUserDefaults];
	
	if ([currentGameSettings integerForKey:@"GameState"] == 0)
	{
		[GameManager resetGameState];
	}
	else
	{
		myGameState = [currentGameSettings integerForKey:@"GameState"];
		myPreviousGameState = [currentGameSettings integerForKey:@"PreviousGameState"];
		myOffensivePositionSelected = [currentGameSettings integerForKey:@"OffensivePositionSelected"];
		myAttackZoneSelected = [currentGameSettings integerForKey:@"AttackZoneSelected"];
		myDefensiveStanceSelected = [currentGameSettings integerForKey:@"DefensiveStanceSelected"];
		myHomeScore = [currentGameSettings integerForKey:@"HomeScore"];
		myVisitorScore = [currentGameSettings integerForKey:@"VisitorScore"];
		myDown = [currentGameSettings integerForKey:@"Down"];
		myYardsToGo = [currentGameSettings integerForKey:@"YardsToGo"];
		myLineOfScrimmage = [currentGameSettings integerForKey:@"LineOfScrimmage"];
		myClock = [currentGameSettings integerForKey:@"Clock"];
		myQuarter =	[currentGameSettings integerForKey:@"Quarter"];
		myPossession = [currentGameSettings integerForKey:@"Possession"];
		myPlayResult = [currentGameSettings integerForKey:@"PlayResult"];
		myGameInProgress = [currentGameSettings integerForKey:@"GameInProgress"];
		myHomeTeamType = [currentGameSettings integerForKey:@"HomeTeamType"];
		myAwayTeamType = [currentGameSettings integerForKey:@"AwayTeamType"];
		myNavFlag =	[currentGameSettings integerForKey:@"NavFlag"];
		myKickedFirst =	[currentGameSettings integerForKey:@"KickedFirst"];
		myQuarterLength = [currentGameSettings integerForKey:@"QuarterLength"];
		myHighlightedZone =	[currentGameSettings integerForKey:@"HighlightedZone"];
		myDefensiveFormation = [currentGameSettings integerForKey:@"DefensiveFormation"];
		myHomeTeamTimeOuts = [currentGameSettings integerForKey:@"HomeTeamTimeOuts"];
		myAwayTeamTimeOuts = [currentGameSettings integerForKey:@"AwayTeamTimeOuts"];
		myGameClockStatus =	[currentGameSettings integerForKey:@"GameClockStatus"];
		myWonCoinToss =	[currentGameSettings integerForKey:@"WonCoinToss"];
		myAttemptingTwoPoints =	[currentGameSettings integerForKey:@"AttemptingTwoPoints"];
		myCommentary = [currentGameSettings stringForKey:@"Commentary"];
		
		[OffensiveFormationData setLeftWideReceiver: [currentGameSettings integerForKey:@"LeftWideReceiver"]];
		[OffensiveFormationData setLeftSplitEnd: [currentGameSettings integerForKey:@"LeftSplitEnd"]];
		[OffensiveFormationData setLeftTightEnd: [currentGameSettings integerForKey:@"LeftTightEnd"]];
		[OffensiveFormationData setRightTightEnd: [currentGameSettings integerForKey:@"RightTightEnd"]];
		[OffensiveFormationData setRightSplitEnd: [currentGameSettings integerForKey:@"RightSplitEnd"]];
		[OffensiveFormationData setRightWideReceiver: [currentGameSettings integerForKey:@"RightWideReceiver"]];
		[OffensiveFormationData setQuarterBack: [currentGameSettings integerForKey:@"QuarterBack"]];
		[OffensiveFormationData setFullBack: [currentGameSettings integerForKey:@"FullBack"]];
		[OffensiveFormationData setLeftHalfBack: [currentGameSettings integerForKey:@"LeftHalfBack"]];
        [OffensiveFormationData setRightHalfBack: [currentGameSettings integerForKey:@"RightHalfBack"]];
		[OffensiveFormationData setTailBack: [currentGameSettings integerForKey:@"TailBack"]];
		 		 
		[DefensiveFormationData setSweepLeftRushingZone: [currentGameSettings integerForKey:@"SweepLeftRushingZone"]];
		[DefensiveFormationData setOffTackleLeftRushingZone: [currentGameSettings integerForKey:@"OffTackleLeftRushingZone"]];
		[DefensiveFormationData setInsideRushingZone: [currentGameSettings integerForKey:@"InsideRushingZone"]];
		[DefensiveFormationData setOffTackleRightRushingZone: [currentGameSettings integerForKey:@"OffTackleRightRushingZone"]];
		[DefensiveFormationData setSweepRightRushingZone: [currentGameSettings integerForKey:@"SweepRightRushingZone"]];
		[DefensiveFormationData setShortLeftPassingZone: [currentGameSettings integerForKey:@"ShortLeftPassingZone"]];
		[DefensiveFormationData setShortMiddlePassingZone: [currentGameSettings integerForKey:@"ShortMiddlePassingZone"]];
		[DefensiveFormationData setShortRightPassingZone: [currentGameSettings integerForKey:@"ShortRightPassingZone"]];
		[DefensiveFormationData setMiddleLeftPassingZone: [currentGameSettings integerForKey:@"MiddleLeftPassingZone"]];
		[DefensiveFormationData setMiddleRightPassingZone: [currentGameSettings integerForKey:@"MiddleRightPassingZone"]];
		[DefensiveFormationData setLongPassingZone: [currentGameSettings integerForKey:@"LongPassingZone"]];
	}
}

+ (void)saveGameSettings
{
	NSUserDefaults *currentGameSettings = [NSUserDefaults standardUserDefaults];
	
	[currentGameSettings setObject:[[NSNumber numberWithInt:myGameState] stringValue] forKey:@"GameState"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myPreviousGameState] stringValue] forKey:@"PreviousGameState"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myOffensivePositionSelected] stringValue] forKey:@"OffensivePositionSelected"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myAttackZoneSelected] stringValue] forKey:@"AttackZoneSelected"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myDefensiveStanceSelected] stringValue] forKey:@"DefensiveStanceSelected"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myHomeScore] stringValue] forKey:@"HomeScore"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myVisitorScore] stringValue] forKey:@"VisitorScore"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myDown] stringValue] forKey:@"Down"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myYardsToGo] stringValue] forKey:@"YardsToGo"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myLineOfScrimmage] stringValue] forKey:@"LineOfScrimmage"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myClock] stringValue] forKey:@"Clock"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myQuarter] stringValue] forKey:@"Quarter"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myPossession] stringValue] forKey:@"Possession"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myPlayResult] stringValue] forKey:@"PlayResult"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myGameInProgress] stringValue] forKey:@"GameInProgress"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myHomeTeamType] stringValue] forKey:@"HomeTeamType"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myAwayTeamType] stringValue] forKey:@"AwayTeamType"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myNavFlag] stringValue] forKey:@"NavFlag"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myKickedFirst] stringValue] forKey:@"KickedFirst"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myQuarterLength] stringValue] forKey:@"QuarterLength"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myHighlightedZone] stringValue] forKey:@"HighlightedZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myDefensiveFormation] stringValue] forKey:@"DefensiveFormation"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myHomeTeamTimeOuts] stringValue] forKey:@"HomeTeamTimeOuts"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myAwayTeamTimeOuts] stringValue] forKey:@"AwayTeamTimeOuts"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myGameClockStatus] stringValue] forKey:@"GameClockStatus"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myWonCoinToss] stringValue] forKey:@"WonCoinToss"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:myAttemptingTwoPoints] stringValue] forKey:@"AttemptingTwoPoints"];
	[currentGameSettings setObject:myCommentary forKey:@"Commentary"];
	
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getLeftWideReceiver]] stringValue] forKey:@"LeftWideReceiver"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getLeftSplitEnd]] stringValue] forKey:@"LeftSplitEnd"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getLeftTightEnd]] stringValue] forKey:@"LeftTightEnd"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getRightTightEnd]] stringValue] forKey:@"RightTightEnd"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getRightSplitEnd]] stringValue] forKey:@"RightSplitEnd"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getRightWideReceiver]] stringValue] forKey:@"RightWideReceiver"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getQuarterBack]] stringValue] forKey:@"QuarterBack"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getFullBack]] stringValue] forKey:@"FullBack"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getLeftHalfBack]] stringValue] forKey:@"LeftHalfBack"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getRightHalfBack]] stringValue] forKey:@"RightHalfBack"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[OffensiveFormationData getTailBack]] stringValue] forKey:@"TailBack"];
	
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getSweepLeftRushingZone]] stringValue] forKey:@"SweepLeftRushingZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getOffTackleLeftRushingZone]] stringValue] forKey:@"OffTackleLeftRushingZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getInsideRushingZone]] stringValue] forKey:@"InsideRushingZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getOffTackleRightRushingZone]] stringValue] forKey:@"OffTackleRightRushingZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getSweepRightRushingZone]] stringValue] forKey:@"SweepRightRushingZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getShortLeftPassingZone]] stringValue] forKey:@"ShortLeftPassingZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getShortMiddlePassingZone]] stringValue] forKey:@"ShortMiddlePassingZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getShortRightPassingZone]] stringValue] forKey:@"ShortRightPassingZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getMiddleLeftPassingZone]] stringValue] forKey:@"MiddleLeftPassingZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getMiddleRightPassingZone]] stringValue] forKey:@"MiddleRightPassingZone"];
	[currentGameSettings setObject:[[NSNumber numberWithInt:[DefensiveFormationData getLongPassingZone]] stringValue] forKey:@"LongPassingZone"];
}

+ (void)setupGameForTheDriveMode
{
	myGameState = WAITING_TO_PICK_OFFENSIVE_PLAYER;
	myPreviousGameState = MAIN_MENU;
	myOffensivePositionSelected = NO_POSITION_SELECTED;
	myAttackZoneSelected = NO_POSITION_SELECTED;
	myDefensiveStanceSelected = BALANCED_DEFENSIVE_STANCE;
	myHomeScore = 0;
	myVisitorScore = 7;
	myDown = 1;
	myYardsToGo = 10;
	myLineOfScrimmage = 80;
	myClock = 120;
	myQuarter = 4;
	myPossession = HOME_TEAM;
	myPlayResult = 0;
	myGameInProgress = 1;
	myHomeTeamType = HUMAN_COACH;
	myAwayTeamType = COMPUTER_COACH;
	myNavFlag = NO_NAV_FLAG;
	myKickedFirst = HOME_TEAM;
	myQuarterLength = QUARTER_LENGTH_5_MINUTES;
	myHighlightedZone = NO_POSITION_SELECTED;
	myDefensiveFormation = FIVE_THREE_THREE_DEFENSIVE_FORMATION;
	myHomeTeamTimeOuts = 3;
	myAwayTeamTimeOuts = 3;
	myGameClockStatus = GAME_CLOCK_STOPPED;
	myWonCoinToss =					HOME_TEAM;
	myAttemptingTwoPoints =			0;
	myCommentary = @" ";
	
	[OffensiveFormationData setLeftWideReceiver: 1];
	[OffensiveFormationData setLeftSplitEnd: 0];
	[OffensiveFormationData setLeftTightEnd: 0];
	[OffensiveFormationData setRightTightEnd: 1];
	[OffensiveFormationData setRightSplitEnd: 0];
	[OffensiveFormationData setRightWideReceiver: 1];
	[OffensiveFormationData setQuarterBack: 1];
	[OffensiveFormationData setFullBack: 1];
	[OffensiveFormationData setLeftHalfBack: 0];
	[OffensiveFormationData setRightHalfBack: 0];
	[OffensiveFormationData setTailBack: 1];
	
	[DefensiveFormationData setSweepLeftRushingZone: 1];
	[DefensiveFormationData setOffTackleLeftRushingZone: 1];
	[DefensiveFormationData setInsideRushingZone: 1];
	[DefensiveFormationData setOffTackleRightRushingZone: 1];
	[DefensiveFormationData setSweepRightRushingZone: 1];
	[DefensiveFormationData setShortLeftPassingZone: 1];
	[DefensiveFormationData setShortMiddlePassingZone: 1];
	[DefensiveFormationData setShortRightPassingZone: 1];
	[DefensiveFormationData setMiddleLeftPassingZone: 1];
	[DefensiveFormationData setMiddleRightPassingZone: 1];
	[DefensiveFormationData setLongPassingZone: 1];
}

+ (int)getPlayResult
{
	return myPlayResult;
}

+ (void)setPlayResult:(int)newPlayResult
{
    myPlayResult = newPlayResult;
}

+ (void)setWasSacked:(bool)wasSacked
{
    myWasSacked = wasSacked;
}

+ (void)updateLog
{
	NSLog(@"Game State: %d", myGameState);
}

+ (void)buildCommentary:(NSString *)newText
{
	NSString *currentCommentary = myCommentary; 
	NSString *newCommentary = newText;
	
	myCommentary = [currentCommentary stringByAppendingString:newCommentary];
	
	[myCommentary retain];
}

+ (NSString *)getCommentary
{
	return myCommentary;
}

+ (int)getGameState
{
	return myGameState;
}

+ (void)setGameState:(int)newGameState
{
	myGameState = newGameState;
}

+ (int)getAttemptingTwoPoints
{
	return myAttemptingTwoPoints;
}

+ (void)setAttemptingTwoPoints:(int)attempting
{
	myAttemptingTwoPoints = attempting;
}

+ (int)getBasicPlayResult
{
	return myBasicPlayResult;
}

+ (void)setBasicPlayResult:(int)basicPlayResult
{
	myBasicPlayResult = basicPlayResult;
}

+ (int)getKickedFirst
{
	return myKickedFirst;
}

+ (void)setKickedFirst:(int)kickedFirst
{
	myKickedFirst = kickedFirst;
}

+ (int)getWonCoinToss
{
	return myWonCoinToss;
}

+ (void)setWonCoinToss:(int)wonCoinToss
{
	myWonCoinToss = wonCoinToss;
}

+ (int)getDefensiveFormation
{
	return myDefensiveFormation;
}

+ (void)setDefensiveFormation:(int)newDefensiveFormation
{
	myDefensiveFormation = newDefensiveFormation;
}

+ (void)incrementDefensiveFormation
{
	if (myDefensiveFormation == CUSTOM_DEFENSIVE_FORMATION)
	{
		myDefensiveFormation = FIVE_THREE_THREE_DEFENSIVE_FORMATION;
	}
	else if (myDefensiveFormation == FIVE_THREE_THREE_DEFENSIVE_FORMATION)
	{
		myDefensiveFormation = FOUR_THREE_FOUR_DEFENSIVE_FORMATION;
	}
	else if (myDefensiveFormation == FOUR_THREE_FOUR_DEFENSIVE_FORMATION)
	{
		myDefensiveFormation = THREE_FOUR_FOUR_DEFENSIVE_FORMATION;
	}
	else if (myDefensiveFormation == THREE_FOUR_FOUR_DEFENSIVE_FORMATION)
	{
		myDefensiveFormation = FIVE_THREE_THREE_DEFENSIVE_FORMATION;
	}
}

+ (int)getPreviousGameState
{
	return myPreviousGameState;
}

+ (void)setPreviousGameState:(int)previousGameState
{
	myPreviousGameState = previousGameState;
}

+ (int)getOffensivePositionSelected
{
	return myOffensivePositionSelected;
}

+ (void)setOffensivePositionSelected:(int)newOffensivePositionSelected
{
	myOffensivePositionSelected = newOffensivePositionSelected;
}

+ (int)getAttackZoneSelected
{
	return myAttackZoneSelected;
}

+ (void)setAttackZoneSelected:(int)newAttackZoneSelected
{
	myAttackZoneSelected = newAttackZoneSelected;
}

+ (int)getDefensiveStanceSelected
{
	return myDefensiveStanceSelected;
}

+ (void)setDefensiveStanceSelected:(int)newDefensiveStanceSelected
{
	myDefensiveStanceSelected = newDefensiveStanceSelected;
}

+ (int)getHighlightedZone
{
	return myHighlightedZone;
}

+ (void)setHighlightedZone:(int)zone
{
	myHighlightedZone = zone;
}

+ (int)getNavFlag
{
	return myNavFlag;
}

+ (void)setNavFlag:(int)NavFlag
{
	myNavFlag = NavFlag;
}

+ (int)getQuarterLength
{
	return myQuarterLength;
}

+ (void)setQuarterLength:(int)quarterLength
{
	myQuarterLength = quarterLength;
}

+ (int)getGameClockStatus
{
	return myGameClockStatus;
}

+ (void)setGameClockStatus:(int)newStatus
{
	myGameClockStatus = newStatus;
}

+ (int)getHomeTemType
{
	return myHomeTeamType;
}

+ (void)setHomeTeamType:(int)homeTeamType
{
	myHomeTeamType = homeTeamType;
}

+ (int)getAwayTemType
{
	return myAwayTeamType;
}

+ (void)setAwayTeamType:(int)awayTeamType
{
	myAwayTeamType = awayTeamType;
}

+ (int)getHomeTeamTimeOuts
{
	return myHomeTeamTimeOuts;
}

+ (void)useHomeTeamTimeOut
{
	if (myHomeTeamTimeOuts > 0)
	{
		myGameClockStatus = GAME_CLOCK_STOPPED;
		myHomeTeamTimeOuts--;
	}
}

+ (int)getAwayTeamTimeOuts
{
	return myAwayTeamTimeOuts;
}

+ (void)useAwayTeamTimeOut
{
	if (myAwayTeamTimeOuts > 0)
	{
		myGameClockStatus = GAME_CLOCK_STOPPED;
		myAwayTeamTimeOuts--;
	}
}

+ (bool)isOffenseHuman
{
	if (myPossession == 0)
	{
		if (myHomeTeamType == HUMAN_COACH)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}
	else // Ball possed by the Away Team
	{
		if (myAwayTeamType == HUMAN_COACH)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}
}

+ (bool)isDefenseHuman
{
	if (myPossession == 0)
	{
		if (myAwayTeamType == HUMAN_COACH)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}
	else // Ball possed by the Away Team
	{
		if (myHomeTeamType == HUMAN_COACH)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}
}

+ (bool)isHomeTeamOffense
{
	if (myPossession == HOME_TEAM)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}

+ (bool)isAwayTeamOffense
{
	if (myPossession == AWAY_TEAM)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}

+ (int)getOffensiveScore
{
	if (myPossession == HOME_TEAM)
	{
		return myHomeScore;
	}
	else
	{
		return myVisitorScore;
	}
}

+ (int)getDefensiveScore
{
	if (myPossession == HOME_TEAM)
	{
		return myVisitorScore;
	}
	else
	{
		return myVisitorScore;
	}
}

+ (NSString *)getOffensivePlayerSelectedString:(int)player
{
	if (player == 0)
	{
		return @"Left Wide Receiver";
	}
	else if (player == 6)
	{
		return @"Tightend";
	}
	else if (player == 7)
	{
		return @"Right Wide Receiver";
	}
	else if (player == 8)
	{
		return @"Quaterback";
	}
	else if (player == 9)
	{
		return @"Fullback";
	}
	else if (player == 10)
	{
		return @"Tailback";
	}
	else if (player == 11)
	{
		return @"Kicker";
	}
	else if (player == 12)
	{
		return @"Punter";
	}
	else 
	{
		return @"Unknown";
	}
}

+ (NSString *)getAttackZoneSelectedString:(int)zone
{
	if (zone == 23)
	{
		return @"Right Linebuck";
	}
	else if (zone == 24)
	{
		return @"Left Linebuck";
	}
	else if (zone == 25)
	{
		return @"Right Inside";
	}
	else if (zone == 26)
	{
		return @"Left Inside";
	}
	else if (zone == 27)
	{
		return @"Right Off Tackle";
	}
	else if (zone == 28)
	{
		return @"Left Off Tackle";
	}
	else if (zone == 29)
	{
		return @"Right Sweep";
	}
	else if (zone == 30)
	{
		return @"Left Sweep";
	}
	else if (zone == 31)
	{
		return @"Short Left Pass";
	}
	else if (zone == 32)
	{
		return @"Short Middle Pass";
	}
	else if (zone == 33)
	{
		return @"Short Right Pass";
	}
	else if (zone == 34)
	{
		return @"Medium Right Pass";
	}
	else if (zone == 35)
	{
		return @"Medium Left Pass";
	}
	else if (zone == 36)
	{
		return @"Deep Pass";
	}
	else if (zone == 37)
	{
		return @"Normal Kick Off";
	}
	else if (zone == 38)
	{
		return @"Squib Kick Off";
	}
	else if (zone == 39)
	{
		return @"On Side Kick Off";
	}
	else if (zone == 40)
	{
		return @"Normal Punt";
	}
	else if (zone == 41)
	{
		return @"Fake Punt";
	}
	else if (zone == 42)
	{
		return @"Normal Field Goal";
	}
	else if (zone == 43)
	{
		return @"Fake Field Goal";
	}
	else
	{
		return @"Unknown";
	}
}

+ (NSString *)getDefensiveStanceSelectedString:(int)stance
{
	if (stance == 0)
	{
		return @"All Run";
	}
	else if (stance == 1)
	{
		return @"Run";
	}
	else if (stance == 2)
	{
		return @"Balanced";
	}
	else if (stance == 3)
	{
		return @"Pass";
	}
	else if (stance == 4)
	{
		return @"All Pass";
	}
	else if (stance == 5)
	{
		return @"Normal Kick Return";
	}
	else if (stance == 6)
	{
		return @"Reverse Kick Return";
	}
	else if (stance == 7)
	{
		return @"Normal Punt Return";
	}
	else if (stance == 8)
	{
		return @"Block Punt";
	}
	else if (stance == 9)
	{
		return @"Field Goal Block";
	}
	else
	{
		return @"Unknown";
	}
}

////////////////
// Statistics //
////////////////

+ (int)getHomeRushingPlays
{
	return myHomeRushingPlays;
}

+ (void)setHomeRushingPlays:(int)newValue
{
	myHomeRushingPlays = newValue;
}

+ (int)getClock
{
	return myClock;
}

+ (void)setClock:(int)newClock
{
	myClock = newClock;
}

+ (int)getQuarter
{
	return myQuarter;
}

+ (void)setQuarter:(int)newQuarter
{
	myQuarter = newQuarter;
}

+ (void)incrementQuarter
{
	myQuarter++;
}

+ (int)getHomeScore
{
	return myHomeScore;
}

+ (void)setHomeScore:(int)newScore
{
    myHomeScore = newScore;
}

+ (int)getVisitorScore
{
	return myVisitorScore;
}

+ (void)setVisitorScore:(int)newScore
{
    myVisitorScore = newScore;
}

+ (int)getDown
{
	return myDown;
}

+ (void)setDown:(int)newDown
{
    myDown = newDown;
}

+ (int)getYardsToGo
{
	return myYardsToGo;
}

+ (NSString *)getSideOfField
{
	if (myLineOfScrimmage > 50)
	{
		return @"\u2193";
	}
	else if (myLineOfScrimmage < 50)
	{
		return @"\u2191";
	}
	else // Must be on the 50
	{
		return @"";
	}
}

+ (int)getLineOfScrimmage
{
    return myLineOfScrimmage;
}

+ (void)setLineOfScrimmage:(int)newLineOfScrimmage
{
	myLineOfScrimmage = newLineOfScrimmage;
}

+ (int)getPossession
{
	return myPossession;
}

+ (void)setPossession:(int)possession
{
	myPossession = possession;
}

+ (void)changePossession
{
	if (myPossession == 0)
	{
		myPossession = 1;
	}
	else
	{
		myPossession = 0;
	}
}

+ (int)getGameInProgress
{
	return myGameInProgress;
}

+ (void)setGameInProgress:(int)gameInProgress
{
	myGameInProgress = gameInProgress;
}

+ (void)setYardsToGo:(int)newYardsToGo
{
	myYardsToGo = newYardsToGo;
}

+ (void)incrementDown
{
	myDown = myDown++;
}

+ (void)runPlay
{
	// Clear the commentary
	myCommentary = @"";
	
	/////////////////////////
	// Process Rushing Plays
	/////////////////////////
	
	if (myAttackZoneSelected == LEFT_SWEEP_RUSHING_LANE ||
		myAttackZoneSelected == LEFT_OFFTACKLE_RUSHING_LANE ||
		myAttackZoneSelected == LEFT_INSIDE_RUSHING_LANE ||
		myAttackZoneSelected == RIGHT_OFFTACKLE_RUSHING_LANE ||
		myAttackZoneSelected == RIGHT_SWEEP_RUSHING_LANE)
	{
		[GameManager runRushingPlay];
	}
	
	////////////////////////
	// Process Pasing Plays
	////////////////////////
	
	else if (myAttackZoneSelected == SHORT_LEFT_PASSING_ZONE ||
			 myAttackZoneSelected == SHORT_MIDDLE_PASSING_ZONE ||
			 myAttackZoneSelected == SHORT_RIGHT_PASSING_ZONE ||
			 myAttackZoneSelected == MIDDLE_LEFT_PASSING_ZONE ||
			 myAttackZoneSelected == MIDDLE_RIGHT_PASSING_ZONE ||
			 myAttackZoneSelected == DEEP_PASSING_ZONE)
	{
		[PassingPlay run];
	}
	
	////////////////////////
	// Process Kicking Play
	////////////////////////
	else if (myOffensivePositionSelected == KICKER && 
			 (myAttackZoneSelected == NORMAL_KICK_OFF ||
			  myAttackZoneSelected == SQUIB_KICK_OFF ||
			  myAttackZoneSelected == ONSIDE_KICK_OFF))
	{
		[KickOffPlay run];
	}
	
	///////////////////////////
	// Process Field Goal Play
	///////////////////////////
	else if (myOffensivePositionSelected == KICKER && 
			 (myAttackZoneSelected == NORMAL_FIELD_GOAL ||
			  myAttackZoneSelected == FAKE_FIELD_GOAL))
	{
		[GameManager runFieldGoalPlay];
	} 
	
	/////////////////////
	// Process Punt Plays
	/////////////////////
	else if (myOffensivePositionSelected == PUNTER)
	{
		[PuntPlay run];
	}
	
	///////////////////////////
	// Process Extra Point Attempts
	///////////////////////////
	else if (myOffensivePositionSelected == KICKER && myAttackZoneSelected == EXTRA_POINT)
	{
		[GameManager runExtraPointPlay];
	}
	
	[self buildCommentary:@"The play ran "];
	[self buildCommentary:[[NSNumber numberWithInt:[ClockManager getLastPlayDuration]] stringValue]];
	[self buildCommentary:@" seconds off the clock.\n"];
}

+ (void)runRushingPlay
{	
	myPlayResult = [[[RushingPlay alloc] init] getResult];
	
	// This is here to test the notification system
	[[NSNotificationCenter defaultCenter] postNotificationName:@"CompletedARushingPlay" object:self];
	
	[GameManager runEndOfPlay];
}

+ (void)runEndOfPlay
{
	int rollForFumble = [RollManager rollOneHundredSidedDice];
	int rollForFumbleRecovery = [RollManager rollOneHundredSidedDice];
	int rollForOutOfBounds = [RollManager rollOneHundredSidedDice];
	
	// I need to record this in case a touchdown is score. Because in that
	// situation you can not just go by yards gained because the yards gained
	// could be more than the yards required to score the touchdown.
	int potentialTouchdownYardage = myLineOfScrimmage;
	
	// Update Line of Scrimmage
	myLineOfScrimmage = myLineOfScrimmage - myPlayResult;
	
	// Check for Two Point Conversion
	if ([GameManager getAttemptingTwoPoints] == 1)
	{
		if (myLineOfScrimmage < 1)
		{
			[self buildCommentary:@"A gain of "];
			[self buildCommentary:[[NSNumber numberWithInt:potentialTouchdownYardage] stringValue]];
			[self buildCommentary:@" yards on the play.\n"];
			[self buildCommentary:@"The Two Point Conversion is succesfull!\n"];
			
			// Update Score
			if (myPossession == 0)
			{
				myHomeScore = myHomeScore + 2;
			}
			else
			{
				myVisitorScore = myVisitorScore + 2;
			}
		}
		else
		{
			// Comment on the yardage change.
			if (myPlayResult < 0)
			{
				[self buildCommentary:@"A loss of "];
				[self buildCommentary:[[NSNumber numberWithInt:myPlayResult*-1] stringValue]];
				[self buildCommentary:@" yards on the play.\n"];
			}
			else if (myPlayResult > 0)
			{
				[self buildCommentary:@"A gain of "];
				[self buildCommentary:[[NSNumber numberWithInt:myPlayResult] stringValue]];
				[self buildCommentary:@" yards on the play.\n"];
			}
			else
			{
				[self buildCommentary:@"No gain on the play.\n"];
			}
			
			[self buildCommentary:@"The Two Point Conversion fails!\n"];
		}
		
		myDown = 1;
		myYardsToGo = 10;
		myNavFlag = NEED_KICKOFF_NAV_FLAG;
		
		// We don't have to worry about the possability of overtime here
		// because you can never get to a two point conversion in overtime.
		myGameClockStatus = GAME_CLOCK_STOPPED;
		[ClockManager runPlayTimeOffClock];
		
		// There are no saftely, fumbles, etc.. .so we can exit now
		// After we reset the flag...
		myAttemptingTwoPoints = 0;
		return;
	}
	
	// Check For Touchdown
	if (myLineOfScrimmage < 1)
	{
		// Update Yardage Gained on the play. We need to do this here because
		// this method will exit after the touchdown and not run the normal
		// yardage gained commentary.
		[self buildCommentary:@"A gain of "];
		[self buildCommentary:[[NSNumber numberWithInt:potentialTouchdownYardage] stringValue]];
		[self buildCommentary:@" yards on the play.\n"];
		
		// Update Commentary
		[self buildCommentary:@"Touchdown!\n"];
		
		// Update Score
		if (myPossession == 0)
		{
			myHomeScore = myHomeScore + 6;
		}
		else
		{
			myVisitorScore = myVisitorScore + 6;
		}
		
		if (myQuarter == 5)
		{
			myNavFlag = END_OF_OVERTIME_NAV_FLAG;
		}
		else
		{
			myNavFlag = EXTRA_POINT_NAV_FLAG;
		}
		
		// Update Clock
		myGameClockStatus = GAME_CLOCK_STOPPED;
		[ClockManager runPlayTimeOffClock];

		myDown = 1;
		myYardsToGo = 10;
		
		return;
	}
	
	// Check For Safety
	if (myLineOfScrimmage > 99)
	{
		// Update Commentary
		[self buildCommentary:@"Safety! "];
		
		// Update Score
		if (myPossession == 0)
		{
			myVisitorScore = myVisitorScore + 2;
		}
		else
		{
			myHomeScore = myHomeScore + 2;
		}
		
		if (myQuarter == 5)
		{
			myNavFlag = END_OF_OVERTIME_NAV_FLAG;
		}
		else
		{
			myNavFlag = NEED_KICKOFF_NAV_FLAG;
		}
		
		// Adjust Clock
		myGameClockStatus = GAME_CLOCK_STOPPED;
		[ClockManager runPlayTimeOffClock];
		
		// Set Kickoff Flag
		myDown = 1;
		myYardsToGo = 10;
		
		return;
	}
	
	// Comment on the yardage change.
	if (myPlayResult < 0)
	{
		[self buildCommentary:@"A loss of "];
		[self buildCommentary:[[NSNumber numberWithInt:myPlayResult*-1] stringValue]];
		[self buildCommentary:@" yards on the play.\n"];
	}
	else if (myPlayResult > 0)
	{
		[self buildCommentary:@"A gain of "];
		[self buildCommentary:[[NSNumber numberWithInt:myPlayResult] stringValue]];
		[self buildCommentary:@" yards on the play.\n"];
	}
	else
	{
		[self buildCommentary:@"No gain on the play.\n"];
	}
	
	// Base Chance For Fumble
	int chanceOfFumble = 2;
	
	if ((myOffensivePositionSelected == QUARTER_BACK) ||
		(myOffensivePositionSelected == FULL_BACK) ||
		(myOffensivePositionSelected == RIGHT_TIGHT_END) ||
		(myOffensivePositionSelected == LEFT_TIGHT_END)) 
	{
		chanceOfFumble = 0;
	}
	else if ((myOffensivePositionSelected == LEFT_HALF_BACK) ||
		(myOffensivePositionSelected == RIGHT_HALF_BACK) ||
		(myOffensivePositionSelected == LEFT_SPLIT_END) ||
		(myOffensivePositionSelected == RIGHT_SPLIT_END))
	{
		chanceOfFumble = 1;
	}
	
	// If it is a sack than it really doesn't matter who was the selected player.
	if (myWasSacked)
	{
		chanceOfFumble = 2;
	}
	
	// Check for fumble
	if (rollForFumble <= chanceOfFumble)
	{
		[self buildCommentary:@"The ball is fumbled!\n"];
		
		if (rollForFumbleRecovery <= 45) // Recovered by defense
		{
			[self buildCommentary:@"Recovered by the defense!\n"];
			
			[self changePossession];
	 
			myDown = 1;
	 
			// Invert the LOS
			myLineOfScrimmage = 100 - myLineOfScrimmage;
			myGameClockStatus = GAME_CLOCK_STOPPED;
			[ClockManager runPlayTimeOffClock];
	 
			// Determine if the Yard Marker is at the Goal Line
			if (myLineOfScrimmage > 10)
			{
				myYardsToGo = 10;
			}
			else
			{
				myYardsToGo = myLineOfScrimmage;
			}
	 
			return;
		}
		else // Recovered By Offense
		{
			[self buildCommentary:@"Recovered by the offense!\n"];
		}
	}
	
	// Check to see if the ball carrier is pushed out of bounds.
	bool pushedOutOfBounds = FALSE;
	
	if (myAttackZoneSelected != LEFT_OFFTACKLE_RUSHING_LANE &&
		myAttackZoneSelected != LEFT_INSIDE_RUSHING_LANE &&
		myAttackZoneSelected != RIGHT_OFFTACKLE_RUSHING_LANE &&
		myAttackZoneSelected != SHORT_MIDDLE_PASSING_ZONE &&
		!myWasSacked)
	{
		if (rollForOutOfBounds > 50)
		{
			[self buildCommentary:@"The ball carrier is forced out of bounds.\n"];
			pushedOutOfBounds = TRUE;
		}
	}
	
	myWasSacked = FALSE;
	
	// Adjust YardsToGo
	myYardsToGo = myYardsToGo - myPlayResult;
	
	// adjust down
	myDown++;
	
	// Check for a first down
	if (myYardsToGo < 1)
	{
		[self buildCommentary:@"First Down!\n"];
		
		// Update Down
		myDown = 1;
		
		// Determine if the Yard Marker is at the Goal Line
		if (myLineOfScrimmage > 10)
		{
			myYardsToGo = 10;
		}
		else
		{
			myYardsToGo = myLineOfScrimmage;
		}
		
		// do NOT update clock here because it will depend on whether rusher staying in bounds or not.
	}
	
	// Check for a change of possession on downs
	else if (myDown > 4)
	{
		[self buildCommentary:@"The ball changes possession on loss of downs!\n"];
		
		[self changePossession];
		myDown = 1;
		
		// Invert the LOS
		myLineOfScrimmage = 100 - myLineOfScrimmage;
		
		myGameClockStatus = GAME_CLOCK_STOPPED;
		[ClockManager runPlayTimeOffClock];
		
		// Determine if the Yard Marker is at the Goal Line
		if (myLineOfScrimmage > 10)
		{
			myYardsToGo = 10;
		}
		else
		{
			myYardsToGo = myLineOfScrimmage;
		}
		
		return;
	}
	
	// Adjust Game Clock
	// Determine if Game clock should keep running after play
	if (pushedOutOfBounds)
	{
		myGameClockStatus = GAME_CLOCK_STOPPED;
	}
	else
	{
		myGameClockStatus = GAME_CLOCK_RUNNING;
	}
	[ClockManager runPlayTimeOffClock];
}

+ (void)runFieldGoalPlay
{
	int rollFieldGoalAttempt = [RollManager rollOneHundredSidedDice];
	bool goodFieldGoal = FALSE;
	int los = [GameManager getLineOfScrimmage];
	int chanceToMakeFieldGoal = 100 - los - los * .75;
	
	if (myAttackZoneSelected == NORMAL_FIELD_GOAL)
	{
		if (rollFieldGoalAttempt <= chanceToMakeFieldGoal)
		{
			goodFieldGoal = TRUE;
			
			[self buildCommentary:@"The kick is good!\n"];
		}
		else
		{
			goodFieldGoal = FALSE;
			
			[self buildCommentary:@"The kick is no good!\n"];
		}
		
		if (goodFieldGoal)
		{
			if (myPossession == 0)
			{
				myHomeScore = myHomeScore + 3;
			}
			else
			{
				myVisitorScore = myVisitorScore + 3;
			}
			myDown = 1;
			myYardsToGo = 10;
			myLineOfScrimmage = 70;
			
			if (myQuarter == 5)
			{
				myNavFlag = END_OF_OVERTIME_NAV_FLAG;
			}
			else
			{
				myNavFlag = NEED_KICKOFF_NAV_FLAG;
			}
		}
		else
		{
			myDown = 1;
			myYardsToGo = 10;
			myLineOfScrimmage = 100 - los - 7;
			[GameManager changePossession];
		}
	}
	
	myGameClockStatus = GAME_CLOCK_STOPPED;
	[ClockManager runPlayTimeOffClock];
}

+ (void)runExtraPointPlay
{
	int rollForExtraPointAttempt = [RollManager rollTwoSixSidedDice];
	
	if (rollForExtraPointAttempt != 2)
	{
		[self buildCommentary:@"The kick is good!\n"];
		
		if (myPossession == 0)
		{
			myHomeScore = myHomeScore + 1;
		}
		else
		{
			myVisitorScore = myVisitorScore + 1;
		}
	}
	else
	{
		[self buildCommentary:@"The kick is no good!\n"];
	}
	
	myDown = 1;
	myYardsToGo = 10;
	myNavFlag = NEED_KICKOFF_NAV_FLAG;
	
	myGameClockStatus = GAME_CLOCK_STOPPED;
	[ClockManager runPlayTimeOffClock];
}

+ (void)runEndOfFirstQuarter:(int)navFlag;
{
	// Clear the commentary
	myCommentary = @"";
	
	// Build the commentary
	[self buildCommentary:@"The whistle blows for the end of the first quarter. "];
	
	// reset the nav flag
	myNavFlag = navFlag;
}

+ (void)runEndOfSecondQuarter
{
	// Clear the commentary
	myCommentary = @"";
	
	// Build the commentary
	[self buildCommentary:@"The whistle blows for the end of the first half. "];
	
	// Switch possession to the team who received first. They will be the kicking team.
	if (myKickedFirst == 0)
	{
		myPossession = 1;
	}
	else
	{
		myPossession = 0;
	}
	
	// Reset Time Outs for second half
	myHomeTeamTimeOuts = 3;
	myAwayTeamTimeOuts = 3;
	
	// reset the nav flag
	myDown = 1;
	myYardsToGo = 10;
	myNavFlag = NEED_KICKOFF_NAV_FLAG;
}

+ (void)runEndOfThirdQuarter:(int)navFlag
{
	// Clear the commentary
	myCommentary = @"";
	
	// Build the commentary
	[self buildCommentary:@"The whistle blows for the end of the third quarter. "];
	
	// reset the nav flag
	myNavFlag = navFlag;
}

+ (void)runEndOfFourthQuarter
{
	// Clear the commentary
	myCommentary = @"";
	
	if (myHomeScore != myVisitorScore)
	{
		// Build the commentary
		[self buildCommentary:@"The whistle blows for the end of the game.\n\n"];
		[self buildCommentary:@"The game ends with a final score of\n\n"];
		[self buildCommentary:@"HOME: "];
		NSString *homeScore = [[NSNumber numberWithInt:myHomeScore] stringValue];
		[self buildCommentary:homeScore];
		[self buildCommentary:@" AWAY: "];
		NSString *awayScore = [[NSNumber numberWithInt:myVisitorScore] stringValue];
		[self buildCommentary:awayScore];
		
		// Set Navigation Flag
		myNavFlag = END_OF_GAME_NAV_FLAG;
	}
	else
	{
		// Build the commentary
		[self buildCommentary:@"The whistle blows for the end of regulation with the score tied!\n\nWelcome to overtime! Overtime will begin with a coin toss, each team receives three time outs and the first team to score wins. "];
	
		// reset the nav flag
		myNavFlag = OVERTIME_NAV_FLAG;
	}
}

+ (void)runEndOfOvertime
{
	// Clear the commentary
	myCommentary = @"";
	
	// Build the commentary
	[self buildCommentary:@"The whistle blows for the end of the game.\n\n"];
	[self buildCommentary:@"The game ends with a final score of\n\n"];
	[self buildCommentary:@"HOME: "];
	NSString *homeScore = [[NSNumber numberWithInt:myHomeScore] stringValue];
	[self buildCommentary:homeScore];
	[self buildCommentary:@" AWAY: "];
	NSString *awayScore = [[NSNumber numberWithInt:myVisitorScore] stringValue];
	[self buildCommentary:awayScore];
	
	// Set Navigation Flag
	myNavFlag = END_OF_GAME_NAV_FLAG;
}

+ (void)prepareForOvertime
{
	myQuarter = 5;
	[ClockManager reset];
	myGameState = GAME_CLOCK_STOPPED;
	myHomeTeamTimeOuts = 3;
	myAwayTeamTimeOuts = 3;
	myNavFlag = NEED_KICKOFF_NAV_FLAG;
	myGameInProgress = 0;
	myOffensivePositionSelected = KICKER;
	myAttackZoneSelected = NORMAL_KICK_OFF;
	myDefensiveStanceSelected = NORMAL_KICK_OFF_RETURN;
	myDown = 1;
	myYardsToGo = 10;
	myLineOfScrimmage = 70;
}

+ (void)runTwoMinuteWarning
{
	// Clear the commentary
	myCommentary = @"";
	
	// Build the commentary
	[self buildCommentary:@"The clock stops for the Two Minute Warning. "];
	
	// reset the nav flag
	myNavFlag = NO_NAV_FLAG;
}

+ (void)runVerifyNewGame
{
	// Clear the commentary
	myCommentary = @"";
	
	// Build the commentary
	[self buildCommentary:@"WARNING: If you continue, your current game will be erased forever!"];
}

+ (void)runTimeOut:(int)team
{
	int RemainingTimeOuts = 0;
	NSString *RemainingTimeOutsString = @"";
	
	// Clear the commentary
	myCommentary = @"";
	
	// Build the commentary
	[self buildCommentary:@"The "];
	
	if (team == HOME_TEAM)
	{
		[self buildCommentary:@" Home Team has been charged with a time out and has "];
		RemainingTimeOuts = myHomeTeamTimeOuts;
		RemainingTimeOutsString = [[NSNumber numberWithInt:RemainingTimeOuts] stringValue];
		[self buildCommentary:RemainingTimeOutsString];
		[self buildCommentary:@" remaining."];
	}
	else
	{
		[self buildCommentary:@" Away Team has been charged with a time out and has "];
		RemainingTimeOuts = myAwayTeamTimeOuts;
		RemainingTimeOutsString = [[NSNumber numberWithInt:RemainingTimeOuts] stringValue];
		[self buildCommentary:RemainingTimeOutsString];
		[self buildCommentary:@" remaining."];
	}
	
	// reset the nav flag
	myNavFlag = NO_NAV_FLAG;
}

@end