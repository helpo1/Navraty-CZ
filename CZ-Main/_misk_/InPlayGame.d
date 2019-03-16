
var int playerbone1;
var int playerbone2;
var int playerbone3;
var int playerbone4;
var int playerbone5;
var int playercomb;
var int onecount;
var int twocount;
var int threecount;
var int fourcount;
var int fivecount;
var int sixcount;
var int npconecount;
var int npctwocount;
var int npcthreecount;
var int npcfourcount;
var int npcfivecount;
var int npcsixcount;
var int npcbone1;
var int npcbone2;
var int npcbone3;
var int npcbone4;
var int npcbone5;
var int npccomb;
var int playerturn;
var int canrethrow;
var int rethrowfirstbone;
var int rethrowsecondbone;
var int rethrowthirdbone;
var int rethrowfourbone;
var int rethrowfivebone;
var int npcbone1rethrow;
var int npcbone2rethrow;
var int npcbone3rethrow;
var int npcbone4rethrow;
var int npcbone5rethrow;
var int stavka;
var int madestavka;
var int canmadestavka;
var int addstavka;
var int madeaddstavka;

var string playercombination;
var string npccombination;
var string lowstavkatext;
var string midstavkatext;
var string highstavkatext;
var string veryhighstavkatext;
var int gameresult;

func void countcombination()
{
	if(PLAYERTURN == TRUE)
	{
		PLAYERCOMB = 0;
		PLAYERCOMBINATION = "Ty: ";

		if(PLAYERCOMB == 0)
		{
			if((ONECOUNT == 3) || (TWOCOUNT == 3) || (THREECOUNT == 3) || (FOURCOUNT == 3) || (FIVECOUNT == 3) || (SIXCOUNT == 3))
			{
				if(ONECOUNT == 3)
				{
					if(TWOCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '1' a '2'");
						PLAYERCOMB = 24;
					}
					else if(THREECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '1' a '3'");
						PLAYERCOMB = 21;
					}
					else if(FOURCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '1' a '4'");
						PLAYERCOMB = 26;
					}
					else if(FIVECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '1' a '5'");
						PLAYERCOMB = 27;
					}
					else if(SIXCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '1' a '6'");
						PLAYERCOMB = 28;
					}
					else
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"trojice - '1'");
						PLAYERCOMB = 16;
					};
				}
				else if(TWOCOUNT == 3)
				{
					if(ONECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '2' a '1'");
						PLAYERCOMB = 24;
					}
					else if(THREECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '2' a '3'");
						PLAYERCOMB = 26;
					}
					else if(FOURCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '2' a '4'");
						PLAYERCOMB = 27;
					}
					else if(FIVECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '2' a '5'");
						PLAYERCOMB = 28;
					}
					else if(SIXCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '2' a '6'");
						PLAYERCOMB = 29;
					}
					else
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"trojice - '2'");
						PLAYERCOMB = 17;
					};
				}
				else if(THREECOUNT == 3)
				{
					if(ONECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '3' a '1'");
						PLAYERCOMB = 21;
					}
					else if(TWOCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '3' a '2'");
						PLAYERCOMB = 26;
					}
					else if(FOURCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '3' a '4'");
						PLAYERCOMB = 28;
					}
					else if(FIVECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '3' a '5'");
						PLAYERCOMB = 29;
					}
					else if(SIXCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '3' a '6'");
						PLAYERCOMB = 30;
					}
					else
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"trojice - '3'");
						PLAYERCOMB = 18;
					};
				}
				else if(FOURCOUNT == 3)
				{
					if(ONECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '4' a '1'");
						PLAYERCOMB = 26;
					}
					else if(TWOCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '4' a '2'");
						PLAYERCOMB = 27;
					}
					else if(THREECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '4' a '3'");
						PLAYERCOMB = 28;
					}
					else if(FIVECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '4' a '5'");
						PLAYERCOMB = 30;
					}
					else if(SIXCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '4' a '6'");
						PLAYERCOMB = 31;
					}
					else
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"trojice - '4'");
						PLAYERCOMB = 19;
					};
				}
				else if(FIVECOUNT == 3)
				{
					if(ONECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '5' a '1'");
						PLAYERCOMB = 27;
					}
					else if(TWOCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '5' a '2'");
						PLAYERCOMB = 28;
					}
					else if(THREECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '5' a '3'");
						PLAYERCOMB = 29;
					}
					else if(FOURCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '5' a '4'");
						PLAYERCOMB = 30;
					}
					else if(SIXCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '5' a '6'");
						PLAYERCOMB = 32;
					}
					else
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"trojice - '5'");
						PLAYERCOMB = 20;
					};
				}
				else if(ONECOUNT == 2)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '6' a '1'");
					PLAYERCOMB = 28;
				}
				else if(TWOCOUNT == 2)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '6' a '2'");
					PLAYERCOMB = 29;
				}
				else if(THREECOUNT == 2)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '6' a '3'");
					PLAYERCOMB = 30;
				}
				else if(FOURCOUNT == 2)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '6' a '4'");
					PLAYERCOMB = 31;
				}
				else if(FIVECOUNT == 2)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"full house - '6' a '5'");
					PLAYERCOMB = 32;
				}
				else
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"trojice - '6'");
					PLAYERCOMB = 21;
				};
			};
		};
		if(PLAYERCOMB == 0)
		{
			if((ONECOUNT == 2) || (TWOCOUNT == 2) || (THREECOUNT == 2) || (FOURCOUNT == 2) || (FIVECOUNT == 2) || (SIXCOUNT == 2))
			{
				if(ONECOUNT == 2)
				{
					if(TWOCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '1' a '2'");
						PLAYERCOMB = 7;
					}
					else if(THREECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '1' a '3'");
						PLAYERCOMB = 8;
					}
					else if(FOURCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '1' a '4'");
						PLAYERCOMB = 9;
					}
					else if(FIVECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '1' a '5'");
						PLAYERCOMB = 10;
					}
					else if(SIXCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '1' a '6'");
						PLAYERCOMB = 11;
					}
					else
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"pár - '1'");
						PLAYERCOMB = 1;
					};
				}
				else if(TWOCOUNT == 2)
				{
					if(THREECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '2' a '3'");
						PLAYERCOMB = 9;
					}
					else if(FOURCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '2' a '4'");
						PLAYERCOMB = 10;
					}
					else if(FIVECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '2' a '5'");
						PLAYERCOMB = 11;
					}
					else if(SIXCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '2' a '6'");
						PLAYERCOMB = 12;
					}
					else
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"pár - '2'");
						PLAYERCOMB = 2;
					};
				}
				else if(THREECOUNT == 2)
				{
					if(FOURCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '3' a '4'");
						PLAYERCOMB = 11;
					}
					else if(FIVECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '3' a '5'");
						PLAYERCOMB = 12;
					}
					else if(SIXCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '3' a '6'");
						PLAYERCOMB = 13;
					}
					else
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"pár - '3'");
						PLAYERCOMB = 3;
					};
				}
				else if(FOURCOUNT == 2)
				{
					if(FIVECOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '4' a '5'");
						PLAYERCOMB = 13;
					}
					else if(SIXCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '4' a '6'");
						PLAYERCOMB = 14;
					}
					else
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"pár - '4'");
						PLAYERCOMB = 4;
					};
				}
				else if(FIVECOUNT == 2)
				{
					if(SIXCOUNT == 2)
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"dva páry - '5' a '6'");
						PLAYERCOMB = 15;
					}
					else
					{
						PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"pár - '5'");
						PLAYERCOMB = 5;
					};
				}
				else if(SIXCOUNT == 2)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"pár - '6'");
					PLAYERCOMB = 6;
				};
			};
		};
		if(PLAYERCOMB == 0)
		{
			if((ONECOUNT == 1) && (TWOCOUNT == 1) && (THREECOUNT == 1) && (FOURCOUNT == 1) && (FIVECOUNT == 1))
			{
				PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"malá postupka");
				PLAYERCOMB = 22;
			};
		};
		if(PLAYERCOMB == 0)
		{
			if((TWOCOUNT == 1) && (THREECOUNT == 1) && (FOURCOUNT == 1) && (FIVECOUNT == 1) && (SIXCOUNT == 1))
			{
				PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"velká postupka");
				PLAYERCOMB = 23;
			};
		};
		if(PLAYERCOMB == 0)
		{
			if((ONECOUNT == 4) || (TWOCOUNT == 4) || (THREECOUNT == 4) || (FOURCOUNT == 4) || (FIVECOUNT == 4) || (SIXCOUNT == 4))
			{
				PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"čtveřice - ");
				if(ONECOUNT == 4)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'1'");
					PLAYERCOMB = 33;
				}
				else if(TWOCOUNT == 4)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'2'");
					PLAYERCOMB = 34;
				}
				else if(THREECOUNT == 4)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'3'");
					PLAYERCOMB = 35;
				}
				else if(FOURCOUNT == 4)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'4'");
					PLAYERCOMB = 36;
				}
				else if(FIVECOUNT == 4)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'5'");
					PLAYERCOMB = 37;
				}
				else
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'6'");
					PLAYERCOMB = 38;
				};
			};
		};
		if(PLAYERCOMB == 0)
		{
			if((ONECOUNT == 5) || (TWOCOUNT == 5) || (THREECOUNT == 5) || (FOURCOUNT == 5) || (FIVECOUNT == 5) || (SIXCOUNT == 5))
			{
				PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"poker - ");
				if(ONECOUNT == 5)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'1'");
					PLAYERCOMB = 39;
				}
				else if(TWOCOUNT == 5)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'2'");
					PLAYERCOMB = 40;
				}
				else if(THREECOUNT == 5)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'3'");
					PLAYERCOMB = 41;
				}
				else if(FOURCOUNT == 5)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'4'");
					PLAYERCOMB = 42;
				}
				else if(FIVECOUNT == 5)
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'5'");
					PLAYERCOMB = 43;
				}
				else
				{
					PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"'6'");
					PLAYERCOMB = 44;
				};
			};
		};
		if(PLAYERCOMB == 0)
		{
			PLAYERCOMBINATION = ConcatStrings(PLAYERCOMBINATION,"nic");
		};

		PrintScreen(PLAYERCOMBINATION,44,67,FONT_CurTime,9999);
	}
	else
	{
		NPCCOMB = 0;
		NPCCOMBINATION = "Protivník: ";
		if(NPCCOMB == 0)
		{
			if((NPCONECOUNT == 3) || (NPCTWOCOUNT == 3) || (NPCTHREECOUNT == 3) || (NPCFOURCOUNT == 3) || (NPCFIVECOUNT == 3) || (NPCSIXCOUNT == 3))
			{
				if(NPCONECOUNT == 3)
				{
					if(NPCTWOCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '1' a '2'");
						NPCCOMB = 24;
					}
					else if(NPCTHREECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '1' a '3'");
						NPCCOMB = 21;
					}
					else if(NPCFOURCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '1' a '4'");
						NPCCOMB = 26;
					}
					else if(NPCFIVECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '1' a '5'");
						NPCCOMB = 27;
					}
					else if(NPCSIXCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '1' a '6'");
						NPCCOMB = 28;
					}
					else
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"trojice - '1'");
						NPCCOMB = 16;
					};
				}
				else if(NPCTWOCOUNT == 3)
				{
					if(NPCONECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '2' a '1'");
						NPCCOMB = 24;
					}
					else if(NPCTHREECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '2' a '3'");
						NPCCOMB = 26;
					}
					else if(NPCFOURCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '2' a '4'");
						NPCCOMB = 27;
					}
					else if(NPCFIVECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '2' a '5'");
						NPCCOMB = 28;
					}
					else if(NPCSIXCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '2' a '6'");
						NPCCOMB = 29;
					}
					else
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"trojice - '2'");
						NPCCOMB = 17;
					};
				}
				else if(NPCTHREECOUNT == 3)
				{
					if(NPCONECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '3' a '1'");
						NPCCOMB = 21;
					}
					else if(NPCTWOCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '3' a '2'");
						NPCCOMB = 26;
					}
					else if(NPCFOURCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '3' a '4'");
						NPCCOMB = 28;
					}
					else if(NPCFIVECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '3' a '5'");
						NPCCOMB = 29;
					}
					else if(NPCSIXCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '3' a '6'");
						NPCCOMB = 30;
					}
					else
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"trojice - '3'");
						NPCCOMB = 18;
					};
				}
				else if(NPCFOURCOUNT == 3)
				{
					if(NPCONECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '4' a '1'");
						NPCCOMB = 26;
					}
					else if(NPCTWOCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '4' a '2'");
						NPCCOMB = 27;
					}
					else if(NPCTHREECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '4' a '3'");
						NPCCOMB = 28;
					}
					else if(NPCFIVECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '4' a '5'");
						NPCCOMB = 30;
					}
					else if(NPCSIXCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '4' a '6'");
						NPCCOMB = 31;
					}
					else
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"trojice - '4'");
						NPCCOMB = 19;
					};
				}
				else if(NPCFIVECOUNT == 3)
				{
					if(NPCONECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '5' a '1'");
						NPCCOMB = 27;
					}
					else if(NPCTWOCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '5' a '2'");
						NPCCOMB = 28;
					}
					else if(NPCTHREECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '5' a '3'");
						NPCCOMB = 29;
					}
					else if(NPCFOURCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '5' a '4'");
						NPCCOMB = 30;
					}
					else if(NPCSIXCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '5' a '6'");
						NPCCOMB = 32;
					}
					else
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"trojice - '5'");
						NPCCOMB = 20;
					};
				}
				else if(NPCONECOUNT == 2)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '6' a '1'");
					NPCCOMB = 28;
				}
				else if(NPCTWOCOUNT == 2)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '6' a '2'");
					NPCCOMB = 29;
				}
				else if(NPCTHREECOUNT == 2)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '6' a '3'");
					NPCCOMB = 30;
				}
				else if(NPCFOURCOUNT == 2)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '6' a '4'");
					NPCCOMB = 31;
				}
				else if(NPCFIVECOUNT == 2)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"full house - '6' a '5'");
					NPCCOMB = 32;
				}
				else
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"trojice - '6'");
					NPCCOMB = 21;
				};
			};
		};
		if(NPCCOMB == 0)
		{
			if((NPCONECOUNT == 2) || (NPCTWOCOUNT == 2) || (NPCTHREECOUNT == 2) || (NPCFOURCOUNT == 2) || (NPCFIVECOUNT == 2) || (NPCSIXCOUNT == 2))
			{
				if(NPCONECOUNT == 2)
				{
					if(NPCTWOCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '1' a '2'");
						NPCCOMB = 7;
					}
					else if(NPCTHREECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '1' a '3'");
						NPCCOMB = 8;
					}
					else if(NPCFOURCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '1' a '4'");
						NPCCOMB = 9;
					}
					else if(NPCFIVECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '1' a '5'");
						NPCCOMB = 10;
					}
					else if(NPCSIXCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '1' a '6'");
						NPCCOMB = 11;
					}
					else
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"pár - '1'");
						NPCCOMB = 1;
					};
				}
				else if(NPCTWOCOUNT == 2)
				{
					if(NPCTHREECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '2' a '3'");
						NPCCOMB = 9;
					}
					else if(NPCFOURCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '2' a '4'");
						NPCCOMB = 10;
					}
					else if(NPCFIVECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '2' a '5'");
						NPCCOMB = 11;
					}
					else if(NPCSIXCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '2' a '6'");
						NPCCOMB = 12;
					}
					else
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"pár - '2'");
						NPCCOMB = 2;
					};
				}
				else if(NPCTHREECOUNT == 2)
				{
					if(NPCFOURCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '3' a '4'");
						NPCCOMB = 11;
					}
					else if(NPCFIVECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '3' a '5'");
						NPCCOMB = 12;
					}
					else if(NPCSIXCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '3' a '6'");
						NPCCOMB = 13;
					}
					else
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"pár - '3'");
						NPCCOMB = 3;
					};
				}
				else if(NPCFOURCOUNT == 2)
				{
					if(NPCFIVECOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '4' a '5'");
						NPCCOMB = 13;
					}
					else if(NPCSIXCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '4' a '6'");
						NPCCOMB = 14;
					}
					else
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"pár - '4'");
						NPCCOMB = 4;
					};
				}
				else if(NPCFIVECOUNT == 2)
				{
					if(NPCSIXCOUNT == 2)
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"dva páry - '5' a '6'");
						NPCCOMB = 15;
					}
					else
					{
						NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"pár - '5'");
						NPCCOMB = 5;
					};
				}
				else if(NPCSIXCOUNT == 2)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"pár - '6'");
					NPCCOMB = 6;
				};
			};
		};
		if(NPCCOMB == 0)
		{
			if((NPCONECOUNT == 1) && (NPCTWOCOUNT == 1) && (NPCTHREECOUNT == 1) && (NPCFOURCOUNT == 1) && (NPCFIVECOUNT == 1))
			{
				NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"malá postupka");
				NPCCOMB = 22;
			};
		};
		if(NPCCOMB == 0)
		{
			if((NPCTWOCOUNT == 1) && (NPCTHREECOUNT == 1) && (NPCFOURCOUNT == 1) && (NPCFIVECOUNT == 1) && (NPCSIXCOUNT == 1))
			{
				NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"velká postupka");
				NPCCOMB = 23;
			};
		};
		if(NPCCOMB == 0)
		{
			if((NPCONECOUNT == 4) || (NPCTWOCOUNT == 4) || (NPCTHREECOUNT == 4) || (NPCFOURCOUNT == 4) || (NPCFIVECOUNT == 4) || (NPCSIXCOUNT == 4))
			{
				NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"čtveřice - ");
				if(NPCONECOUNT == 4)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'1'");
					NPCCOMB = 33;
				}
				else if(NPCTWOCOUNT == 4)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'2'");
					NPCCOMB = 34;
				}
				else if(NPCTHREECOUNT == 4)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'3'");
					NPCCOMB = 35;
				}
				else if(NPCFOURCOUNT == 4)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'4'");
					NPCCOMB = 36;
				}
				else if(NPCFIVECOUNT == 4)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'5'");
					NPCCOMB = 37;
				}
				else
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'6'");
					NPCCOMB = 38;
				};
			};
		};
		if(NPCCOMB == 0)
		{
			if((NPCONECOUNT == 5) || (NPCTWOCOUNT == 5) || (NPCTHREECOUNT == 5) || (NPCFOURCOUNT == 5) || (NPCFIVECOUNT == 5) || (NPCSIXCOUNT == 5))
			{
				NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"poker - ");
				if(NPCONECOUNT == 5)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'1'");
					NPCCOMB = 39;
				}
				else if(NPCTWOCOUNT == 5)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'2'");
					NPCCOMB = 40;
				}
				else if(NPCTHREECOUNT == 5)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'3'");
					NPCCOMB = 41;
				}
				else if(NPCFOURCOUNT == 5)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'4'");
					NPCCOMB = 42;
				}
				else if(NPCFIVECOUNT == 5)
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'5'");
					NPCCOMB = 43;
				}
				else
				{
					NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"'6'");
					NPCCOMB = 44;
				};
			};
		};
		if(NPCCOMB == 0)
		{
			NPCCOMBINATION = ConcatStrings(NPCCOMBINATION,"nic");
		};

		PrintScreen(NPCCOMBINATION,44,33,FONT_CurTime,9999);
	};
};

func void npcrethrow()
{
	NPCBONE1RETHROW = FALSE;
	NPCBONE2RETHROW = FALSE;
	NPCBONE3RETHROW = FALSE;
	NPCBONE4RETHROW = FALSE;
	NPCBONE5RETHROW = FALSE;
	if((NPCCOMB < 39) && (NPCCOMB != 22) && (NPCCOMB != 23) && (NPCCOMB != 24) && (NPCCOMB != 21) && (NPCCOMB != 26) && (NPCCOMB != 27) && (NPCCOMB != 28) && (NPCCOMB != 29) && (NPCCOMB != 30) && (NPCCOMB != 31) && (NPCCOMB != 32))
	{
		if(NPCCOMB >= 33)
		{
			if(NPCCOMB == 33)
			{
				if(NPCBONE1 != 1)
				{
					NPCBONE1RETHROW = TRUE;
				}
				else if(NPCBONE2 != 1)
				{
					NPCBONE2RETHROW = TRUE;
				}
				else if(NPCBONE3 != 1)
				{
					NPCBONE3RETHROW = TRUE;
				}
				else if(NPCBONE4 != 1)
				{
					NPCBONE4RETHROW = TRUE;
				}
				else
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 34)
			{
				if(NPCBONE1 != 2)
				{
					NPCBONE1RETHROW = TRUE;
				}
				else if(NPCBONE2 != 2)
				{
					NPCBONE2RETHROW = TRUE;
				}
				else if(NPCBONE3 != 2)
				{
					NPCBONE3RETHROW = TRUE;
				}
				else if(NPCBONE4 != 2)
				{
					NPCBONE4RETHROW = TRUE;
				}
				else
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 35)
			{
				if(NPCBONE1 != 3)
				{
					NPCBONE1RETHROW = TRUE;
				}
				else if(NPCBONE2 != 3)
				{
					NPCBONE2RETHROW = TRUE;
				}
				else if(NPCBONE3 != 3)
				{
					NPCBONE3RETHROW = TRUE;
				}
				else if(NPCBONE4 != 3)
				{
					NPCBONE4RETHROW = TRUE;
				}
				else
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 36)
			{
				if(NPCBONE1 != 4)
				{
					NPCBONE1RETHROW = TRUE;
				}
				else if(NPCBONE2 != 4)
				{
					NPCBONE2RETHROW = TRUE;
				}
				else if(NPCBONE3 != 4)
				{
					NPCBONE3RETHROW = TRUE;
				}
				else if(NPCBONE4 != 4)
				{
					NPCBONE4RETHROW = TRUE;
				}
				else
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 37)
			{
				if(NPCBONE1 != 5)
				{
					NPCBONE1RETHROW = TRUE;
				}
				else if(NPCBONE2 != 5)
				{
					NPCBONE2RETHROW = TRUE;
				}
				else if(NPCBONE3 != 5)
				{
					NPCBONE3RETHROW = TRUE;
				}
				else if(NPCBONE4 != 5)
				{
					NPCBONE4RETHROW = TRUE;
				}
				else
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCBONE1 != 6)
			{
				NPCBONE1RETHROW = TRUE;
			}
			else if(NPCBONE2 != 6)
			{
				NPCBONE2RETHROW = TRUE;
			}
			else if(NPCBONE3 != 6)
			{
				NPCBONE3RETHROW = TRUE;
			}
			else if(NPCBONE4 != 6)
			{
				NPCBONE4RETHROW = TRUE;
			}
			else
			{
				NPCBONE5RETHROW = TRUE;
			};
		}
		else if((NPCCOMB <= 21) && (NPCCOMB >= 16))
		{
			if(NPCCOMB == 16)
			{
				if(NPCBONE1 != 1)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 1)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 1)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 1)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 1)
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 17)
			{
				if(NPCBONE1 != 2)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 2)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 2)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 2)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 2)
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 18)
			{
				if(NPCBONE1 != 3)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 3)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 3)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 3)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 3)
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 19)
			{
				if(NPCBONE1 != 4)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 4)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 4)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 4)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 4)
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 20)
			{
				if(NPCBONE1 != 5)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 5)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 5)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 5)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 5)
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else
			{
				if(NPCBONE1 != 6)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 6)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 6)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 6)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 6)
				{
					NPCBONE5RETHROW = TRUE;
				};
			};
		}
		else if((NPCCOMB >= 7) && (NPCCOMB <= 15))
		{
			if(NPCCOMB == 7)
			{
				if((NPCONECOUNT == 2) && (NPCTWOCOUNT == 2))
				{
					if((NPCBONE1 != 1) && (NPCBONE1 != 2))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 1) && (NPCBONE2 != 2))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 1) && (NPCBONE3 != 2))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 1) && (NPCBONE4 != 2))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 1) && (NPCBONE5 != 2))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
			}
			else if(NPCCOMB == 8)
			{
				if((NPCONECOUNT == 2) && (NPCTHREECOUNT == 2))
				{
					if((NPCBONE1 != 1) && (NPCBONE1 != 3))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 1) && (NPCBONE2 != 3))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 1) && (NPCBONE3 != 3))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 1) && (NPCBONE4 != 3))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 1) && (NPCBONE5 != 3))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
			}
			else if(NPCCOMB == 9)
			{
				if((NPCONECOUNT == 2) && (NPCFOURCOUNT == 2))
				{
					if((NPCBONE1 != 1) && (NPCBONE1 != 4))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 1) && (NPCBONE2 != 4))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 1) && (NPCBONE3 != 4))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 1) && (NPCBONE4 != 4))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 1) && (NPCBONE5 != 4))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
				if((NPCTWOCOUNT == 2) && (NPCTHREECOUNT == 2))
				{
					if((NPCBONE1 != 2) && (NPCBONE1 != 3))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 2) && (NPCBONE2 != 3))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 2) && (NPCBONE3 != 3))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 2) && (NPCBONE4 != 3))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 2) && (NPCBONE5 != 3))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
			}
			else if(NPCCOMB == 10)
			{
				if((NPCONECOUNT == 2) && (NPCFIVECOUNT == 2))
				{
					if((NPCBONE1 != 1) && (NPCBONE1 != 5))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 1) && (NPCBONE2 != 5))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 1) && (NPCBONE3 != 5))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 1) && (NPCBONE4 != 5))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 1) && (NPCBONE5 != 5))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
				if((NPCTWOCOUNT == 2) && (NPCFOURCOUNT == 2))
				{
					if((NPCBONE1 != 2) && (NPCBONE1 != 4))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 2) && (NPCBONE2 != 4))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 2) && (NPCBONE3 != 4))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 2) && (NPCBONE4 != 4))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 2) && (NPCBONE5 != 4))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
			}
			else if(NPCCOMB == 11)
			{
				if((NPCONECOUNT == 2) && (NPCSIXCOUNT == 2))
				{
					if((NPCBONE1 != 1) && (NPCBONE1 != 6))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 1) && (NPCBONE2 != 6))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 1) && (NPCBONE3 != 6))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 1) && (NPCBONE4 != 6))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 1) && (NPCBONE5 != 6))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
				if((NPCTWOCOUNT == 2) && (NPCFIVECOUNT == 2))
				{
					if((NPCBONE1 != 2) && (NPCBONE1 != 5))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 2) && (NPCBONE2 != 5))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 2) && (NPCBONE3 != 5))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 2) && (NPCBONE4 != 5))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 2) && (NPCBONE5 != 5))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
				if((NPCTHREECOUNT == 2) && (NPCFOURCOUNT == 2))
				{
					if((NPCBONE1 != 3) && (NPCBONE1 != 4))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 3) && (NPCBONE2 != 4))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 3) && (NPCBONE3 != 4))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 3) && (NPCBONE4 != 4))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 3) && (NPCBONE5 != 4))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
			}
			else if(NPCCOMB == 12)
			{
				if((NPCTWOCOUNT == 2) && (NPCSIXCOUNT == 2))
				{
					if((NPCBONE1 != 2) && (NPCBONE1 != 6))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 2) && (NPCBONE2 != 6))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 2) && (NPCBONE3 != 6))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 2) && (NPCBONE4 != 6))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 2) && (NPCBONE5 != 6))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
				if((NPCTHREECOUNT == 2) && (NPCFIVECOUNT == 2))
				{
					if((NPCBONE1 != 3) && (NPCBONE1 != 5))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 3) && (NPCBONE2 != 5))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 3) && (NPCBONE3 != 5))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 3) && (NPCBONE4 != 5))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 3) && (NPCBONE5 != 5))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
			}
			else if(NPCCOMB == 13)
			{
				if((NPCFOURCOUNT == 2) && (NPCFIVECOUNT == 2))
				{
					if((NPCBONE1 != 4) && (NPCBONE1 != 5))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 4) && (NPCBONE2 != 5))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 4) && (NPCBONE3 != 5))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 4) && (NPCBONE4 != 5))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 4) && (NPCBONE5 != 5))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
			}
			else if(NPCCOMB == 14)
			{
				if((NPCFOURCOUNT == 2) && (NPCSIXCOUNT == 2))
				{
					if((NPCBONE1 != 4) && (NPCBONE1 != 6))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 4) && (NPCBONE2 != 6))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 4) && (NPCBONE3 != 6))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 4) && (NPCBONE4 != 6))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 4) && (NPCBONE5 != 6))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
			}
			else if(NPCCOMB == 15)
			{
				if((NPCFIVECOUNT == 2) && (NPCSIXCOUNT == 2))
				{
					if((NPCBONE1 != 5) && (NPCBONE1 != 6))
					{
						NPCBONE1RETHROW = TRUE;
					};
					if((NPCBONE2 != 5) && (NPCBONE2 != 6))
					{
						NPCBONE2RETHROW = TRUE;
					};
					if((NPCBONE3 != 5) && (NPCBONE3 != 6))
					{
						NPCBONE3RETHROW = TRUE;
					};
					if((NPCBONE4 != 5) && (NPCBONE4 != 6))
					{
						NPCBONE4RETHROW = TRUE;
					};
					if((NPCBONE5 != 5) && (NPCBONE5 != 6))
					{
						NPCBONE5RETHROW = TRUE;
					};
				};
			};
		}
		else if((NPCCOMB > 0) && (NPCCOMB <= 6))
		{
			if(NPCCOMB == 1)
			{
				if(NPCBONE1 != 1)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 1)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 1)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 1)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 1)
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 2)
			{
				if(NPCBONE1 != 2)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 2)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 2)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 2)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 2)
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 3)
			{
				if(NPCBONE1 != 3)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 3)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 3)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 3)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 3)
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 4)
			{
				if(NPCBONE1 != 4)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 4)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 4)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 4)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 4)
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else if(NPCCOMB == 5)
			{
				if(NPCBONE1 != 5)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 5)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 5)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 5)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 5)
				{
					NPCBONE5RETHROW = TRUE;
				};
			}
			else
			{
				if(NPCBONE1 != 6)
				{
					NPCBONE1RETHROW = TRUE;
				};
				if(NPCBONE2 != 6)
				{
					NPCBONE2RETHROW = TRUE;
				};
				if(NPCBONE3 != 6)
				{
					NPCBONE3RETHROW = TRUE;
				};
				if(NPCBONE4 != 6)
				{
					NPCBONE4RETHROW = TRUE;
				};
				if(NPCBONE5 != 6)
				{
					NPCBONE5RETHROW = TRUE;
				};
			};
		};
	}
	else
	{
	};
};

func void throw1bone()
{
	if(PLAYERTURN == TRUE)
	{
		PLAYERBONE1 = Hlp_Random(5);
		PLAYERBONE1 += 1;
		if(PLAYERBONE1 == 1)
		{
			ONECOUNT += 1;
		};
		if(PLAYERBONE1 == 2)
		{
			TWOCOUNT += 1;
		};
		if(PLAYERBONE1 == 3)
		{
			THREECOUNT += 1;
		};
		if(PLAYERBONE1 == 4)
		{
			FOURCOUNT += 1;
		};
		if(PLAYERBONE1 == 5)
		{
			FIVECOUNT += 1;
		};
		if(PLAYERBONE1 == 6)
		{
			SIXCOUNT += 1;
		};
		PrintScreen(IntToString(PLAYERBONE1),30,71,FONT_SYMBOLS,9999);
	}
	else
	{
		NPCBONE1 = Hlp_Random(5);
		NPCBONE1 += 1;
		if(NPCBONE1 == 1)
		{
			NPCONECOUNT += 1;
		};
		if(NPCBONE1 == 2)
		{
			NPCTWOCOUNT += 1;
		};
		if(NPCBONE1 == 3)
		{
			NPCTHREECOUNT += 1;
		};
		if(NPCBONE1 == 4)
		{
			NPCFOURCOUNT += 1;
		};
		if(NPCBONE1 == 5)
		{
			NPCFIVECOUNT += 1;
		};
		if(NPCBONE1 == 6)
		{
			NPCSIXCOUNT += 1;
		};
		PrintScreen(IntToString(NPCBONE1),30,21,FONT_SYMBOLS,9999);
	};
};

func void throw2bone()
{
	if(PLAYERTURN == TRUE)
	{
		PLAYERBONE2 = Hlp_Random(5);
		PLAYERBONE2 += 1;
		if(PLAYERBONE2 == 1)
		{
			ONECOUNT += 1;
		};
		if(PLAYERBONE2 == 2)
		{
			TWOCOUNT += 1;
		};
		if(PLAYERBONE2 == 3)
		{
			THREECOUNT += 1;
		};
		if(PLAYERBONE2 == 4)
		{
			FOURCOUNT += 1;
		};
		if(PLAYERBONE2 == 5)
		{
			FIVECOUNT += 1;
		};
		if(PLAYERBONE2 == 6)
		{
			SIXCOUNT += 1;
		};
		PrintScreen(IntToString(PLAYERBONE2),39,71,FONT_SYMBOLS,9999);
	}
	else
	{
		NPCBONE2 = Hlp_Random(5);
		NPCBONE2 += 1;
		if(NPCBONE2 == 1)
		{
			NPCONECOUNT += 1;
		};
		if(NPCBONE2 == 2)
		{
			NPCTWOCOUNT += 1;
		};
		if(NPCBONE2 == 3)
		{
			NPCTHREECOUNT += 1;
		};
		if(NPCBONE2 == 4)
		{
			NPCFOURCOUNT += 1;
		};
		if(NPCBONE2 == 5)
		{
			NPCFIVECOUNT += 1;
		};
		if(NPCBONE2 == 6)
		{
			NPCSIXCOUNT += 1;
		};
		PrintScreen(IntToString(NPCBONE2),39,21,FONT_SYMBOLS,9999);
	};
};

func void throw3bone()
{
	if(PLAYERTURN == TRUE)
	{
		PLAYERBONE3 = Hlp_Random(5);
		PLAYERBONE3 += 1;
		if(PLAYERBONE3 == 1)
		{
			ONECOUNT += 1;
		};
		if(PLAYERBONE3 == 2)
		{
			TWOCOUNT += 1;
		};
		if(PLAYERBONE3 == 3)
		{
			THREECOUNT += 1;
		};
		if(PLAYERBONE3 == 4)
		{
			FOURCOUNT += 1;
		};
		if(PLAYERBONE3 == 5)
		{
			FIVECOUNT += 1;
		};
		if(PLAYERBONE3 == 6)
		{
			SIXCOUNT += 1;
		};
		PrintScreen(IntToString(PLAYERBONE3),48,71,FONT_SYMBOLS,9999);
	}
	else
	{
		NPCBONE3 = Hlp_Random(5);
		NPCBONE3 += 1;
		if(NPCBONE3 == 1)
		{
			NPCONECOUNT += 1;
		};
		if(NPCBONE3 == 2)
		{
			NPCTWOCOUNT += 1;
		};
		if(NPCBONE3 == 3)
		{
			NPCTHREECOUNT += 1;
		};
		if(NPCBONE3 == 4)
		{
			NPCFOURCOUNT += 1;
		};
		if(NPCBONE3 == 5)
		{
			NPCFIVECOUNT += 1;
		};
		if(NPCBONE3 == 6)
		{
			NPCSIXCOUNT += 1;
		};
		PrintScreen(IntToString(NPCBONE3),48,21,FONT_SYMBOLS,9999);
	};
};

func void throw4bone()
{
	if(PLAYERTURN == TRUE)
	{
		PLAYERBONE4 = Hlp_Random(5);
		PLAYERBONE4 += 1;
		if(PLAYERBONE4 == 1)
		{
			ONECOUNT += 1;
		};
		if(PLAYERBONE4 == 2)
		{
			TWOCOUNT += 1;
		};
		if(PLAYERBONE4 == 3)
		{
			THREECOUNT += 1;
		};
		if(PLAYERBONE4 == 4)
		{
			FOURCOUNT += 1;
		};
		if(PLAYERBONE4 == 5)
		{
			FIVECOUNT += 1;
		};
		if(PLAYERBONE4 == 6)
		{
			SIXCOUNT += 1;
		};
		PrintScreen(IntToString(PLAYERBONE4),57,71,FONT_SYMBOLS,9999);
	}
	else
	{
		NPCBONE4 = Hlp_Random(5);
		NPCBONE4 += 1;
		if(NPCBONE4 == 1)
		{
			NPCONECOUNT += 1;
		};
		if(NPCBONE4 == 2)
		{
			NPCTWOCOUNT += 1;
		};
		if(NPCBONE4 == 3)
		{
			NPCTHREECOUNT += 1;
		};
		if(NPCBONE4 == 4)
		{
			NPCFOURCOUNT += 1;
		};
		if(NPCBONE4 == 5)
		{
			NPCFIVECOUNT += 1;
		};
		if(NPCBONE4 == 6)
		{
			NPCSIXCOUNT += 1;
		};
		PrintScreen(IntToString(NPCBONE4),57,21,FONT_SYMBOLS,9999);
	};
};

func void throw5bone()
{
	if(PLAYERTURN == TRUE)
	{
		PLAYERBONE5 = Hlp_Random(5);
		PLAYERBONE5 += 1;
		if(PLAYERBONE5 == 1)
		{
			ONECOUNT += 1;
		};
		if(PLAYERBONE5 == 2)
		{
			TWOCOUNT += 1;
		};
		if(PLAYERBONE5 == 3)
		{
			THREECOUNT += 1;
		};
		if(PLAYERBONE5 == 4)
		{
			FOURCOUNT += 1;
		};
		if(PLAYERBONE5 == 5)
		{
			FIVECOUNT += 1;
		};
		if(PLAYERBONE5 == 6)
		{
			SIXCOUNT += 1;
		};
		PrintScreen(IntToString(PLAYERBONE5),66,71,FONT_SYMBOLS,9999);
	}
	else
	{
		NPCBONE5 = Hlp_Random(5);
		NPCBONE5 += 1;
		if(NPCBONE5 == 1)
		{
			NPCONECOUNT += 1;
		};
		if(NPCBONE5 == 2)
		{
			NPCTWOCOUNT += 1;
		};
		if(NPCBONE5 == 3)
		{
			NPCTHREECOUNT += 1;
		};
		if(NPCBONE5 == 4)
		{
			NPCFOURCOUNT += 1;
		};
		if(NPCBONE5 == 5)
		{
			NPCFIVECOUNT += 1;
		};
		if(NPCBONE5 == 6)
		{
			NPCSIXCOUNT += 1;
		};
		PrintScreen(IntToString(NPCBONE5),66,21,FONT_SYMBOLS,9999);
	};
};

func void throwbones()
{
	throw1bone();
	throw2bone();
	throw3bone();
	throw4bone();
	throw5bone();
	countcombination();
};

func void endpocker()
{
	_bCanSave = TRUE;
	AI_StopProcessInfos(self);

	MustTellResult_Kardif = TRUE;
	MustTellResult_Salandril = TRUE;
	MustTellResult_Orlan = TRUE;
	MustTellResult_Raoul = TRUE;
	MustTellResult_Snaf = TRUE;
	MustTellResult_Samuel = TRUE;

	hero.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	Wld_StopEffect("POCKERTABLE");
	STARTPOCKERMATCH = 0;
	ISINDIALOG = 0;
	MADEADDSTAVKA = 0;
	MADESTAVKA = 0;
	ADDSTAVKA = 0;
	PLAYERCOMBINATION = "";
	NPCCOMBINATION = "";
	PrintScreen("",44,67,FONT_CurTime,5);
	PrintScreen("",44,33,FONT_CurTime,5);
	PrintScreen("",30,71,FONT_SYMBOLS,5);
	PrintScreen("",39,71,FONT_SYMBOLS,5);
	PrintScreen("",48,71,FONT_SYMBOLS,5);
	PrintScreen("",57,71,FONT_SYMBOLS,5);
	PrintScreen("",66,71,FONT_SYMBOLS,5);
	PrintScreen("",30,21,FONT_SYMBOLS,5);
	PrintScreen("",39,21,FONT_SYMBOLS,5);
	PrintScreen("",48,21,FONT_SYMBOLS,5);
	PrintScreen("",57,21,FONT_SYMBOLS,5);
	PrintScreen("",66,21,FONT_SYMBOLS,5);
	PrintScreen("",45,YPOS_LOGENTRY,FONT_NEWLEVEL,5);
	PLAYERCOMB = 0;
	NPCCOMB = 0;
	ONECOUNT = 0;
	TWOCOUNT = 0;
	THREECOUNT = 0;
	FOURCOUNT = 0;
	FIVECOUNT = 0;
	SIXCOUNT = 0;
	NPCONECOUNT = 0;
	NPCTWOCOUNT = 0;
	NPCTHREECOUNT = 0;
	NPCFOURCOUNT = 0;
	NPCFIVECOUNT = 0;
	NPCSIXCOUNT = 0;
	POCKERENEMY = Hlp_GetNpc(hero);
};


func void endpocker_no()
{
	_bCanSave = TRUE;
	AI_StopProcessInfos(self);

	hero.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	Wld_StopEffect("POCKERTABLE");
	STARTPOCKERMATCH = 0;
	ISINDIALOG = 0;
	MADEADDSTAVKA = 0;
	MADESTAVKA = 0;
	ADDSTAVKA = 0;
	PLAYERCOMBINATION = "";
	NPCCOMBINATION = "";
	GAMERESULT = FALSE;
	PrintScreen("",44,67,FONT_CurTime,5);
	PrintScreen("",44,33,FONT_CurTime,5);
	PrintScreen("",30,71,FONT_SYMBOLS,5);
	PrintScreen("",39,71,FONT_SYMBOLS,5);
	PrintScreen("",48,71,FONT_SYMBOLS,5);
	PrintScreen("",57,71,FONT_SYMBOLS,5);
	PrintScreen("",66,71,FONT_SYMBOLS,5);
	PrintScreen("",30,21,FONT_SYMBOLS,5);
	PrintScreen("",39,21,FONT_SYMBOLS,5);
	PrintScreen("",48,21,FONT_SYMBOLS,5);
	PrintScreen("",57,21,FONT_SYMBOLS,5);
	PrintScreen("",66,21,FONT_SYMBOLS,5);
	PrintScreen("",45,YPOS_LOGENTRY,FONT_NEWLEVEL,5);
	PLAYERCOMB = 0;
	NPCCOMB = 0;
	ONECOUNT = 0;
	TWOCOUNT = 0;
	THREECOUNT = 0;
	FOURCOUNT = 0;
	FIVECOUNT = 0;
	SIXCOUNT = 0;
	NPCONECOUNT = 0;
	NPCTWOCOUNT = 0;
	NPCTHREECOUNT = 0;
	NPCFOURCOUNT = 0;
	NPCFIVECOUNT = 0;
	NPCSIXCOUNT = 0;

	MustTellResult_Kardif = TRUE;
	MustTellResult_Salandril = TRUE;
	MustTellResult_Orlan = TRUE;
	MustTellResult_Snaf = TRUE;
	MustTellResult_Raoul = TRUE;
	MustTellResult_Samuel = TRUE;

	POCKERENEMY = Hlp_GetNpc(hero);
};

func void npcdorethrow()
{
	if(NPCBONE1RETHROW == TRUE)
	{
		if(NPCBONE1 == 1)
		{
			NPCONECOUNT -= 1;
		};
		if(NPCBONE1 == 2)
		{
			NPCTWOCOUNT -= 1;
		};
		if(NPCBONE1 == 3)
		{
			NPCTHREECOUNT -= 1;
		};
		if(NPCBONE1 == 4)
		{
			NPCFOURCOUNT -= 1;
		};
		if(NPCBONE1 == 5)
		{
			NPCFIVECOUNT -= 1;
		};
		if(NPCBONE1 == 6)
		{
			NPCSIXCOUNT -= 1;
		};
		throw1bone();
	};
	if(NPCBONE2RETHROW == TRUE)
	{
		if(NPCBONE2 == 1)
		{
			NPCONECOUNT -= 1;
		};
		if(NPCBONE2 == 2)
		{
			NPCTWOCOUNT -= 1;
		};
		if(NPCBONE2 == 3)
		{
			NPCTHREECOUNT -= 1;
		};
		if(NPCBONE2 == 4)
		{
			NPCFOURCOUNT -= 1;
		};
		if(NPCBONE2 == 5)
		{
			NPCFIVECOUNT -= 1;
		};
		if(NPCBONE2 == 6)
		{
			NPCSIXCOUNT -= 1;
		};
		throw2bone();
	};
	if(NPCBONE3RETHROW == TRUE)
	{
		if(NPCBONE3 == 1)
		{
			NPCONECOUNT -= 1;
		};
		if(NPCBONE3 == 2)
		{
			NPCTWOCOUNT -= 1;
		};
		if(NPCBONE3 == 3)
		{
			NPCTHREECOUNT -= 1;
		};
		if(NPCBONE3 == 4)
		{
			NPCFOURCOUNT -= 1;
		};
		if(NPCBONE3 == 5)
		{
			NPCFIVECOUNT -= 1;
		};
		if(NPCBONE3 == 6)
		{
			NPCSIXCOUNT -= 1;
		};
		throw3bone();
	};
	if(NPCBONE4RETHROW == TRUE)
	{
		if(NPCBONE4 == 1)
		{
			NPCONECOUNT -= 1;
		};
		if(NPCBONE4 == 2)
		{
			NPCTWOCOUNT -= 1;
		};
		if(NPCBONE4 == 3)
		{
			NPCTHREECOUNT -= 1;
		};
		if(NPCBONE4 == 4)
		{
			NPCFOURCOUNT -= 1;
		};
		if(NPCBONE4 == 5)
		{
			NPCFIVECOUNT -= 1;
		};
		if(NPCBONE4 == 6)
		{
			NPCSIXCOUNT -= 1;
		};
		throw4bone();
	};
	if(NPCBONE5RETHROW == TRUE)
	{
		if(NPCBONE5 == 1)
		{
			NPCONECOUNT -= 1;
		};
		if(NPCBONE5 == 2)
		{
			NPCTWOCOUNT -= 1;
		};
		if(NPCBONE5 == 3)
		{
			NPCTHREECOUNT -= 1;
		};
		if(NPCBONE5 == 4)
		{
			NPCFOURCOUNT -= 1;
		};
		if(NPCBONE5 == 5)
		{
			NPCFIVECOUNT -= 1;
		};
		if(NPCBONE5 == 6)
		{
			NPCSIXCOUNT -= 1;
		};
		throw5bone();
	};
};

func void playerwon()
{
	GAMERESULT = -1;

	if(STAVKA != -1)
	{
		Snd_Play("Geldbeutel");
		CreateInvItems(hero,ItMi_Gold,STAVKA * 2);
	};
	if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(VLK_431_Kardif))
	{
		KardifLost = TRUE;

		if(KardifPlayResult >= STAVKA)
		{ 
			KardifPlayResult = KardifPlayResult - STAVKA;
		}
		else
		{
			KardifPlayResult = FALSE;
		};
	}
	else if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(VLK_422_Salandril))
	{
		SalandrilLost = TRUE;

		if(SalandrilPlayResult >= STAVKA)
		{ 
			SalandrilPlayResult = SalandrilPlayResult - STAVKA;
		}
		else
		{
			SalandrilPlayResult = FALSE;
		};
	}
	else if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(BAU_970_Orlan))
	{
		OrlanLost = TRUE;

		if(OrlanPlayResult >= STAVKA)
		{ 
			OrlanPlayResult = OrlanPlayResult - STAVKA;
		}
		else
		{
			OrlanPlayResult = FALSE;
		};
	}
	else if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(Sld_822_Raoul))
	{
		RaoulLost = TRUE;

		if(RaoulPlayResult >= STAVKA)
		{ 
			RaoulPlayResult = RaoulPlayResult - STAVKA;
		}
		else
		{
			RaoulPlayResult = FALSE;
		};
	}
	else if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(BDT_1098_Addon_Snaf))
	{
		SnafLost = TRUE;

		if(SnafPlayResult >= STAVKA)
		{ 
			SnafPlayResult = SnafPlayResult - STAVKA;
		}
		else
		{
			SnafPlayResult = FALSE;
		};
	}
	else if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(PIR_1351_Addon_Samuel))
	{
		SamuelLost = TRUE;

		if(SamuelPlayResult >= STAVKA)
		{ 
			SamuelPlayResult = SamuelPlayResult - STAVKA;
		}
		else
		{
			SamuelPlayResult = FALSE;
		};
	};

	ACH_POCKERLACK += 1;
	endpocker();
};

func void playerlost()
{
	GAMERESULT = 1;

	if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(VLK_431_Kardif))
	{
		KardifWon = TRUE;
		KardifPlayResult = KardifPlayResult + STAVKA;
	}
	else if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(VLK_422_Salandril))
	{
		SalandrilWon = TRUE;
		SalandrilPlayResult = SalandrilPlayResult + STAVKA;
	}
	else if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(BAU_970_Orlan))
	{
		OrlanWon = TRUE;
		OrlanPlayResult = OrlanPlayResult + STAVKA;
	}
	else if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(Sld_822_Raoul))
	{
		RaoulWon = TRUE;
		RaoulPlayResult = RaoulPlayResult + STAVKA;
	}
	else if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(BDT_1098_Addon_Snaf))
	{
		SnafWon = TRUE;
		SnafPlayResult = SnafPlayResult + STAVKA;
	}
	else if(Hlp_GetInstanceID(pockerenemy) == Hlp_GetInstanceID(PIR_1351_Addon_Samuel))
	{
		SamuelWon = TRUE;
		SamuelPlayResult = SamuelPlayResult + STAVKA;
	};

	ACH_POCKERLACK = 0;
	endpocker();
};

func void playerequial()
{
	if(STAVKA != -1)
	{
		CreateInvItems(hero,ItMi_Gold,STAVKA);
	};

	STARTPOCKERMATCH = 2;
};

func void b_pockerdialog_s1()
{
	AI_StopProcessInfos(self);
	hero.aivar[AIV_INVINCIBLE] = TRUE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_TALK;
	ISINDIALOG = 1;
	_bCanSave = FALSE;
	//Wld_PlayEffect("POCKERTABLE",hero,hero,0,0,0,FALSE);
	PrintScreen("7",30,71,FONT_SYMBOLS,9999);
	PrintScreen("7",39,71,FONT_SYMBOLS,9999);
	PrintScreen("7",48,71,FONT_SYMBOLS,9999);
	PrintScreen("7",57,71,FONT_SYMBOLS,9999);
	PrintScreen("7",66,71,FONT_SYMBOLS,9999);
	PrintScreen("7",30,21,FONT_SYMBOLS,9999);
	PrintScreen("7",39,21,FONT_SYMBOLS,9999);
	PrintScreen("7",48,21,FONT_SYMBOLS,9999);
	PrintScreen("7",57,21,FONT_SYMBOLS,9999);
	PrintScreen("7",66,21,FONT_SYMBOLS,9999);
	AI_ProcessInfos(hero);
};

instance PC_PLAYPOCKER_END(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = pc_playpocker_end_condition;
	information = pc_playpocker_end_info;
	permanent = TRUE;
	description = "Vzdát se";
};

func int pc_playpocker_end_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 3) && (MADESTAVKA == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_end_info()
{
	playerlost();
};

instance PC_PLAYPOCKER_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_playpocker_stop_condition;
	information = pc_playpocker_stop_info;
	permanent = TRUE;
	description = "Ukončit hru";
};

func int pc_playpocker_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 2) && (CANMADESTAVKA == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_stop_info()
{
	endpocker_no();
};


instance PC_PLAYPOCKER_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = pc_playpocker_back_condition;
	information = pc_playpocker_back_info;
	permanent = TRUE;
	description = "ZPĚT";
};

func int pc_playpocker_back_condition()
{
	if(((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 2) && (CANMADESTAVKA == TRUE)) || ((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE)) || ((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (ADDSTAVKA == TRUE)))
	{
		return TRUE;
	};
};

func void pc_playpocker_back_info()
{
	if(CANMADESTAVKA == TRUE)
	{
		CANMADESTAVKA = FALSE;
	};
	if(CANRETHROW == TRUE)
	{
		CANRETHROW = FALSE;
		RETHROWFIRSTBONE = FALSE;
		RETHROWSECONDBONE = FALSE;
		RETHROWTHIRDBONE = FALSE;
		RETHROWFOURBONE = FALSE;
		RETHROWFIVEBONE = FALSE;
	};
	if(ADDSTAVKA == TRUE)
	{
		ADDSTAVKA = FALSE;
	};
};

instance PC_PLAYPOCKER_MAKESTAVKA(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_playpocker_makestavka_condition;
	information = pc_playpocker_makestavka_info;
	permanent = TRUE;
	description = "Vsadit...";
};

func int pc_playpocker_makestavka_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 2) && (CANMADESTAVKA == FALSE) && (STAVKA <= 4) && (STAVKA != -1))
	{
		return TRUE;
	};
};

func void pc_playpocker_makestavka_info()
{
	CANMADESTAVKA = TRUE;
};

instance PC_PLAYPOCKER_MIDSTAVKA_1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_playpocker_midstavka_1_condition;
	information = pc_playpocker_midstavka1_info;
	permanent = TRUE;
	description = "... 25 zlatých mincí";
};

func int pc_playpocker_midstavka_1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 2) && (CANMADESTAVKA == TRUE) && (STAVKA == 1))
	{
		return TRUE;
	};
};

instance PC_PLAYPOCKER_MIDSTAVKA_2(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_playpocker_midstavka_2_condition;
	information = pc_playpocker_midstavka2_info;
	permanent = TRUE;
	description = "... 50 zlatých mincí";
};

func int pc_playpocker_midstavka_2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 2) && (CANMADESTAVKA == TRUE) && (STAVKA == 1))
	{
		return TRUE;
	};
};

instance PC_PLAYPOCKER_MIDSTAVKA_3(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_playpocker_midstavka_3_condition;
	information = pc_playpocker_midstavka3_info;
	permanent = TRUE;
	description = "... 100 zlatých mincí";
};

func int pc_playpocker_midstavka_3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 2) && (CANMADESTAVKA == TRUE) && (STAVKA == 1))
	{
		return TRUE;
	};
};

instance PC_PLAYPOCKER_MIDSTAVKA_4(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_playpocker_midstavka_4_condition;
	information = pc_playpocker_midstavka4_info;
	permanent = TRUE;
	description = "... 200 zlatých mincí";
};

func int pc_playpocker_midstavka_4_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 2) && (CANMADESTAVKA == TRUE) && (STAVKA == 1))
	{
		return TRUE;
	};
};
func void pc_playpocker_midstavka1_info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 25)
	{
		Snd_Play("Geldbeutel");
		STAVKA = 25;
		Npc_RemoveInvItems(hero,ItMi_Gold,STAVKA);
		CANMADESTAVKA = FALSE;
		MADESTAVKA = TRUE;
	}
	else
	{
		PrintScreen("Nemáš dostatek zlata...",-1,YPOS_LOGENTRY,FONT_NEWLEVEL,3);
	};
};

func void pc_playpocker_midstavka2_info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Snd_Play("Geldbeutel");
		STAVKA = 50;
		Npc_RemoveInvItems(hero,ItMi_Gold,STAVKA);
		CANMADESTAVKA = FALSE;
		MADESTAVKA = TRUE;
	}
	else
	{
		PrintScreen("Nemáš dostatek zlata...",-1,YPOS_LOGENTRY,FONT_NEWLEVEL,3);
	};
};

func void pc_playpocker_midstavka3_info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Snd_Play("Geldbeutel");
		STAVKA = 100;
		Npc_RemoveInvItems(hero,ItMi_Gold,STAVKA);
		CANMADESTAVKA = FALSE;
		MADESTAVKA = TRUE;
	}
	else
	{
		PrintScreen("Nemáš dostatek zlata...",-1,YPOS_LOGENTRY,FONT_NEWLEVEL,3);
	};
};

func void pc_playpocker_midstavka4_info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 200)
	{
		Snd_Play("Geldbeutel");
		STAVKA = 200;
		Npc_RemoveInvItems(hero,ItMi_Gold,STAVKA);
		CANMADESTAVKA = FALSE;
		MADESTAVKA = TRUE;
	}
	else
	{
		PrintScreen("Nemáš dostatek zlata...",-1,YPOS_LOGENTRY,FONT_NEWLEVEL,3);
	};
};

instance PC_PLAYPOCKER_THROWBONES(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_playpocker_throwbones_condition;
	information = pc_playpocker_throwbones_info;
	permanent = TRUE;
	description = "Hodit kostky";
};

func int pc_playpocker_throwbones_condition()
{
	if(((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 2) && (MADESTAVKA == TRUE)) || ((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 2) && (STAVKA == -1)))
	{
		return TRUE;
	};
};

func void pc_playpocker_throwbones_info()
{
	ONECOUNT = 0;
	TWOCOUNT = 0;
	THREECOUNT = 0;
	FOURCOUNT = 0;
	FIVECOUNT = 0;
	SIXCOUNT = 0;
	NPCONECOUNT = 0;
	NPCTWOCOUNT = 0;
	NPCTHREECOUNT = 0;
	NPCFOURCOUNT = 0;
	NPCFIVECOUNT = 0;
	NPCSIXCOUNT = 0;
	PLAYERTURN = TRUE;
	throwbones();
	PLAYERTURN = FALSE;
	throwbones();
	STARTPOCKERMATCH = 3;
};

instance PC_PLAYPOCKER_CONTINUE(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_playpocker_continue_condition;
	information = pc_playpocker_continue_info;
	permanent = TRUE;
	description = "Pokračovat ve hře";
};

func int pc_playpocker_continue_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 3) && (CANRETHROW == FALSE) && (ADDSTAVKA == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_continue_info()
{
	npcrethrow();
	npcdorethrow();
	countcombination();
	STARTPOCKERMATCH = 4;

	if(PLAYERCOMB > NPCCOMB)
	{
		PrintScreen("Vyhrál jsi!",45,YPOS_LOGENTRY,FONT_NEWLEVEL,9999);

		if(KnowOtherPlayers == FALSE)
		{
			KnowOtherPlayers = TRUE;
		};
	}
	else if(PLAYERCOMB < NPCCOMB)
	{
		PrintScreen("Prohrál jsi.",45,YPOS_LOGENTRY,FONT_NEWLEVEL,9999);
	}
	else
	{
		PrintScreen("Remíza...",45,YPOS_LOGENTRY,FONT_NEWLEVEL,9999);
	};
};

instance PC_PLAYPOCKER_ADDSTAVKA(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_playpocker_addstavka_condition;
	information = pc_playpocker_addstavka_info;
	permanent = TRUE;
	description = "Navýšit sázku...";
};

func int pc_playpocker_addstavka_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 3) && (CANRETHROW == FALSE) && (ADDSTAVKA == FALSE) && (MADEADDSTAVKA == FALSE) && (STAVKA != -1) && (Npc_HasItems(other,ItMi_Gold) >= 25))
	{
		return TRUE;
	};
};

func void pc_playpocker_addstavka_info()
{
	ADDSTAVKA = TRUE;
};

instance PC_PLAYPOCKER_ADDSTAVKA10(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_playpocker_addstavka10_condition;
	information = pc_playpocker_addstavka10_info;
	permanent = TRUE;
	description = "... na 25 zlatých mincí";
};

func int pc_playpocker_addstavka10_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 3) && (CANRETHROW == FALSE) && (ADDSTAVKA == TRUE) && (MADEADDSTAVKA == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_addstavka10_info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 25)
	{
		Snd_Play("Geldbeutel");
		STAVKA += 25;
		Npc_RemoveInvItems(hero,ItMi_Gold,25);
		ADDSTAVKA = FALSE;
		MADEADDSTAVKA = TRUE;
	}
	else
	{
		PrintScreen("Nemáš dostatek zlata...",-1,YPOS_LOGENTRY,FONT_NEWLEVEL,3);
	};
};

instance PC_PLAYPOCKER_ADDSTAVKA20(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_playpocker_addstavka20_condition;
	information = pc_playpocker_addstavka20_info;
	permanent = TRUE;
	description = "... na 50 zlatých mincí";
};

func int pc_playpocker_addstavka20_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 3) && (CANRETHROW == FALSE) && (ADDSTAVKA == TRUE) && (MADEADDSTAVKA == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_addstavka20_info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Snd_Play("Geldbeutel");
		STAVKA += 50;
		Npc_RemoveInvItems(hero,ItMi_Gold,50);
		ADDSTAVKA = FALSE;
		MADEADDSTAVKA = TRUE;
	}
	else
	{
		PrintScreen("Nemáš dostatek zlata...",-1,YPOS_LOGENTRY,FONT_NEWLEVEL,3);
	};
};

instance PC_PLAYPOCKER_RETHROWBONES(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_playpocker_rethrowbones_condition;
	information = pc_playpocker_rethrowbones_info;
	permanent = TRUE;
	description = "Hodit kostky znovu...";
};

func int pc_playpocker_rethrowbones_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 3) && (CANRETHROW == FALSE) && (ADDSTAVKA == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_info()
{
	RETHROWFIRSTBONE = FALSE;
	RETHROWSECONDBONE = FALSE;
	RETHROWTHIRDBONE = FALSE;
	RETHROWFOURBONE = FALSE;
	RETHROWFIVEBONE = FALSE;
	CANRETHROW = TRUE;
};

instance PC_PLAYPOCKER_RETHROWBONES_FIRST(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_playpocker_rethrowbones_first_condition;
	information = pc_playpocker_rethrowbones_first_info;
	permanent = TRUE;
	description = "... (vybrat první kostku)";
};

func int pc_playpocker_rethrowbones_first_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE) && (RETHROWFIRSTBONE == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_first_info()
{
	RETHROWFIRSTBONE = TRUE;
};

instance PC_PLAYPOCKER_RETHROWBONES_FIRST_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_playpocker_rethrowbones_first_BACK_condition;
	information = pc_playpocker_rethrowbones_first_BACK_info;
	permanent = TRUE;
	description = "... (zrušit výběr první kostky)";
};

func int pc_playpocker_rethrowbones_first_BACK_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE) && (RETHROWFIRSTBONE == TRUE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_first_BACK_info()
{
	RETHROWFIRSTBONE = FALSE;
};

instance PC_PLAYPOCKER_RETHROWBONES_SECOND(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_playpocker_rethrowbones_second_condition;
	information = pc_playpocker_rethrowbones_second_info;
	permanent = TRUE;
	description = "... (vybrat druhou kostku)";
};

func int pc_playpocker_rethrowbones_second_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE) && (RETHROWSECONDBONE == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_second_info()
{
	RETHROWSECONDBONE = TRUE;
};

instance PC_PLAYPOCKER_RETHROWBONES_SECOND_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_playpocker_rethrowbones_second_BACK_condition;
	information = pc_playpocker_rethrowbones_second_BACK_info;
	permanent = TRUE;
	description = "... (zrušit výběr druhé kostky)";
};

func int pc_playpocker_rethrowbones_second_BACK_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE) && (RETHROWSECONDBONE == TRUE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_second_BACK_info()
{
	RETHROWSECONDBONE = FALSE;
};

instance PC_PLAYPOCKER_RETHROWBONES_THIRD(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_playpocker_rethrowbones_third_condition;
	information = pc_playpocker_rethrowbones_third_info;
	permanent = TRUE;
	description = "... (vybrat třetí kostku)";
};

func int pc_playpocker_rethrowbones_third_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE) && (RETHROWTHIRDBONE == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_third_info()
{
	RETHROWTHIRDBONE = TRUE;
};

instance PC_PLAYPOCKER_RETHROWBONES_THIRD_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_playpocker_rethrowbones_third_BACK_condition;
	information = pc_playpocker_rethrowbones_third_BACK_info;
	permanent = TRUE;
	description = "... (zrušit výběr třetí kostky)";
};

func int pc_playpocker_rethrowbones_third_BACK_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE) && (RETHROWTHIRDBONE == TRUE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_third_BACK_info()
{
	RETHROWTHIRDBONE = FALSE;
};

instance PC_PLAYPOCKER_RETHROWBONES_FOUR(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_playpocker_rethrowbones_four_condition;
	information = pc_playpocker_rethrowbones_four_info;
	permanent = TRUE;
	description = "... (vybrat čtvrtou kostku)";
};

func int pc_playpocker_rethrowbones_four_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE) && (RETHROWFOURBONE == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_four_info()
{
	RETHROWFOURBONE = TRUE;
};

instance PC_PLAYPOCKER_RETHROWBONES_FOUR_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_playpocker_rethrowbones_four_BACK_condition;
	information = pc_playpocker_rethrowbones_four_BACK_info;
	permanent = TRUE;
	description = "... (zrušit výběr čtvrté kostky)";
};

func int pc_playpocker_rethrowbones_four_BACK_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE) && (RETHROWFOURBONE == TRUE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_four_BACK_info()
{
	RETHROWFOURBONE = FALSE;
};

instance PC_PLAYPOCKER_RETHROWBONES_FIVE(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = pc_playpocker_rethrowbones_five_condition;
	information = pc_playpocker_rethrowbones_five_info;
	permanent = TRUE;
	description = "... (vybrat pátou kostku)";
};

func int pc_playpocker_rethrowbones_five_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE) && (RETHROWFIVEBONE == FALSE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_five_info()
{
	RETHROWFIVEBONE = TRUE;
};

instance PC_PLAYPOCKER_RETHROWBONES_FIVE_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = pc_playpocker_rethrowbones_five_BACK_condition;
	information = pc_playpocker_rethrowbones_five_BACK_info;
	permanent = TRUE;
	description = "... (zrušit výběr páté kostky)";
};

func int pc_playpocker_rethrowbones_five_BACK_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE) && (RETHROWFIVEBONE == TRUE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_five_BACK_info()
{
	RETHROWFIVEBONE = FALSE;
};


instance PC_PLAYPOCKER_RETHROWBONES_DORETHROW(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_playpocker_rethrowbones_dorethrow_condition;
	information = pc_playpocker_rethrowbones_dorethrow_info;
	permanent = TRUE;
	description = "Hodit vybrané kostky znovu";
};

func int pc_playpocker_rethrowbones_dorethrow_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (CANRETHROW == TRUE))
	{
		return TRUE;
	};
};

func void pc_playpocker_rethrowbones_dorethrow_info()
{
	PLAYERTURN = TRUE;
	if(RETHROWFIRSTBONE == TRUE)
	{
		if(PLAYERBONE1 == 1)
		{
			ONECOUNT -= 1;
		};
		if(PLAYERBONE1 == 2)
		{
			TWOCOUNT -= 1;
		};
		if(PLAYERBONE1 == 3)
		{
			THREECOUNT -= 1;
		};
		if(PLAYERBONE1 == 4)
		{
			FOURCOUNT -= 1;
		};
		if(PLAYERBONE1 == 5)
		{
			FIVECOUNT -= 1;
		};
		if(PLAYERBONE1 == 6)
		{
			SIXCOUNT -= 1;
		};
		throw1bone();
	};
	if(RETHROWSECONDBONE == TRUE)
	{
		if(PLAYERBONE2 == 1)
		{
			ONECOUNT -= 1;
		};
		if(PLAYERBONE2 == 2)
		{
			TWOCOUNT -= 1;
		};
		if(PLAYERBONE2 == 3)
		{
			THREECOUNT -= 1;
		};
		if(PLAYERBONE2 == 4)
		{
			FOURCOUNT -= 1;
		};
		if(PLAYERBONE2 == 5)
		{
			FIVECOUNT -= 1;
		};
		if(PLAYERBONE2 == 6)
		{
			SIXCOUNT -= 1;
		};
		throw2bone();
	};
	if(RETHROWTHIRDBONE == TRUE)
	{
		if(PLAYERBONE3 == 1)
		{
			ONECOUNT -= 1;
		};
		if(PLAYERBONE3 == 2)
		{
			TWOCOUNT -= 1;
		};
		if(PLAYERBONE3 == 3)
		{
			THREECOUNT -= 1;
		};
		if(PLAYERBONE3 == 4)
		{
			FOURCOUNT -= 1;
		};
		if(PLAYERBONE3 == 5)
		{
			FIVECOUNT -= 1;
		};
		if(PLAYERBONE3 == 6)
		{
			SIXCOUNT -= 1;
		};
		throw3bone();
	};
	if(RETHROWFOURBONE == TRUE)
	{
		if(PLAYERBONE4 == 1)
		{
			ONECOUNT -= 1;
		};
		if(PLAYERBONE4 == 2)
		{
			TWOCOUNT -= 1;
		};
		if(PLAYERBONE4 == 3)
		{
			THREECOUNT -= 1;
		};
		if(PLAYERBONE4 == 4)
		{
			FOURCOUNT -= 1;
		};
		if(PLAYERBONE4 == 5)
		{
			FIVECOUNT -= 1;
		};
		if(PLAYERBONE4 == 6)
		{
			SIXCOUNT -= 1;
		};
		throw4bone();
	};
	if(RETHROWFIVEBONE == TRUE)
	{
		if(PLAYERBONE5 == 1)
		{
			ONECOUNT -= 1;
		};
		if(PLAYERBONE5 == 2)
		{
			TWOCOUNT -= 1;
		};
		if(PLAYERBONE5 == 3)
		{
			THREECOUNT -= 1;
		};
		if(PLAYERBONE5 == 4)
		{
			FOURCOUNT -= 1;
		};
		if(PLAYERBONE5 == 5)
		{
			FIVECOUNT -= 1;
		};
		if(PLAYERBONE5 == 6)
		{
			SIXCOUNT -= 1;
		};
		throw5bone();
	};

	countcombination();
	CANRETHROW = FALSE;
	PLAYERTURN = FALSE;
	npcrethrow();
	npcdorethrow();
	countcombination();
	STARTPOCKERMATCH = 4;

	if(PLAYERCOMB > NPCCOMB)
	{
		PrintScreen("Vyhrál jsi!",45,YPOS_LOGENTRY,FONT_NEWLEVEL,9999);

		if(KnowOtherPlayers == FALSE)
		{
			KnowOtherPlayers = TRUE;
		};
	}
	else if(PLAYERCOMB < NPCCOMB)
	{
		PrintScreen("Prohrál jsi.",45,YPOS_LOGENTRY,FONT_NEWLEVEL,9999);
	}
	else
	{
		PrintScreen("Remíza...",45,YPOS_LOGENTRY,FONT_NEWLEVEL,9999);
	};
};

instance PC_PLAYPOCKER_ENDGAME(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_playpocker_endgame_condition;
	information = pc_playpocker_endgame_info;
	permanent = TRUE;
	description = "Ukončit hru";
};

func int pc_playpocker_endgame_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TALK) && (STARTPOCKERMATCH == 4))
	{
		return TRUE;
	};
};

func void pc_playpocker_endgame_info()
{
	if(PLAYERCOMB > NPCCOMB)
	{
		playerwon();
	}
	else if(PLAYERCOMB < NPCCOMB)
	{
		playerlost();
	}
	else
	{
		playerequial();
	};
};

func void playpocker(var int chosenstavka,var C_Npc enemy)
{
	STAVKA = chosenstavka;
	POCKERENEMY = Hlp_GetNpc(enemy);
	STARTPOCKERMATCH = 1;
	AI_StopProcessInfos(self);
};