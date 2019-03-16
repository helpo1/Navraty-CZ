
func void b_enter_haradrimarena_kapitel_1()
{
};


var int enterharadrimarena_kapitel2;

func void b_enter_haradrimarena_kapitel_2()
{
	if(ENTERHARADRIMARENA_KAPITEL2 == FALSE)
	{
		ENTERHARADRIMARENA_KAPITEL2 = TRUE;
	};
};


var int enterharadrimarena_kapitel3;

func void b_enter_haradrimarena_kapitel_3()
{
	if(ENTERHARADRIMARENA_KAPITEL3 == FALSE)
	{
		ENTERHARADRIMARENA_KAPITEL3 = TRUE;
	};
};


var int enterharadrimarena_kapitel4;

func void b_enter_haradrimarena_kapitel_4()
{
	if(ENTERHARADRIMARENA_KAPITEL4 == FALSE)
	{
		ENTERHARADRIMARENA_KAPITEL4 = TRUE;
	};
};


var int enterharadrimarena_kapitel5;

func void b_enter_haradrimarena_kapitel_5()
{
	if(ENTERHARADRIMARENA_KAPITEL5 == FALSE)
	{
		ENTERHARADRIMARENA_KAPITEL5 = TRUE;
	};
};


var int enterharadrimarena_kapitel6;

func void b_enter_haradrimarena_kapitel_6()
{
	if(ENTERHARADRIMARENA_KAPITEL6 == FALSE)
	{
		ENTERHARADRIMARENA_KAPITEL6 = TRUE;
	};
};

var int InsXaradWar;
var int InsXaradWarOut;

func void b_enter_haradrimarena()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_haradrimarena_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_haradrimarena_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_haradrimarena_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_haradrimarena_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_haradrimarena_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_haradrimarena_kapitel_6();
	};
	if((CHALANGEHARADRIMSTART == TRUE) && (InsXaradWar == FALSE))
	{
		B_StartOtherRoutine(xor_12206_warriornature,"Start");
		InsXaradWar = TRUE;
	};
	if((TARINAKSBATTLEWIN == TRUE) && (InsXaradWarOut == FALSE))
	{
		B_StartOtherRoutine(xor_12206_warriornature,"TOT");
		InsXaradWarOut = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = HARADRIMARENA_ZEN;
	B_InitNpcGlobals();
};