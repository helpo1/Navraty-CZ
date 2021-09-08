
instance DIA_NASH_EXIT(C_Info)
{
	npc = vlk_6010_nash;
	nr = 999;
	condition = dia_nash_exit_condition;
	information = dia_nash_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_nash_exit_condition()
{
	return TRUE;
};

func void dia_nash_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NASH_HELLO(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = dia_nash_hello_condition;
	information = dia_nash_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Hej, chlape, jak se máš?";
};


func int dia_nash_hello_condition()
{
	if(MEETNASH == FALSE)
	{
		return TRUE;
	};
};

func void dia_nash_hello_info()
{
	AI_Output(other,self,"DIA_Nash_Hello_01_01");	//Hej, chlape, jak se máš?
	AI_Output(self,other,"DIA_Nash_Hello_01_02");	//Jako obyčejně, kamaráde. Ty jsi ten nováček, co se tu objevil.
	AI_Output(other,self,"DIA_Nash_Hello_01_03");	//Ano, jsem to já. A co s tím?
	AI_Output(self,other,"DIA_Nash_Hello_01_04");	//Pokud chceš slyšet můj názor, jseš blázen!
	AI_Output(self,other,"DIA_Nash_Hello_01_05");	//Na tvém místě bych zdrhal co by mi nohy stačily...
	AI_Output(other,self,"DIA_Nash_Hello_01_06");	//Ale nejsi na mém místě...
	AI_Output(self,other,"DIA_Nash_Hello_01_07");	//Ne, nejsem. Neber to jako urážku. Jenom jsem si nemyslel, že tady někdo přijde, a ještě z vlastní vůle.
	AI_Output(self,other,"DIA_Nash_Hello_01_08");	//Jsi asi odvážný...
	AI_Output(other,self,"DIA_Nash_Hello_01_09");	//A ty ne?
	AI_Output(self,other,"DIA_Nash_Hello_01_10");	//Já?!... Nemám ani přátelé. Raději zůstávám sedět na zadku tady. Daleko od problémů!
	AI_Output(other,self,"DIA_Nash_Hello_01_11");	//Celý den jsi jen v téhle jeskyni?!
	AI_Output(self,other,"DIA_Nash_Hello_01_12");	//Jo. Taky nemůžu říct, že se mi to nelíbí.
	AI_Output(other,self,"DIA_Nash_Hello_01_13");	//A co tady děláš?!
	AI_Output(self,other,"DIA_Nash_Hello_01_14");	//Pomáhám Hasanovi střežit sklad, když odpočívá. Nejsem dobrý lovec.
	AI_Output(self,other,"DIA_Nash_Hello_01_15");	//Né jako například Bagrus nebo Gunmar! Ti chlápci vědí, co dělaj.
	AI_Output(self,other,"DIA_Nash_Hello_01_16");	//A kdo jiný by dával pozor, aby po návrate z lovu nechcípli od hladu?
	AI_Output(other,self,"DIA_Nash_Hello_01_17");	//Jsi kuchař?!...
	AI_Output(self,other,"DIA_Nash_Hello_01_18");	//Něco takovýho. Velice se mi daří připravit masovou polévku s kořeny rostliny. Budeš si až olizovat prsty!
	AI_Output(self,other,"DIA_Nash_Hello_01_19");	//Kdyby někdo řekl, že ještě někdo takovou připraví, byl bych schopen vyrvat mu vlasy...
	AI_Output(self,other,"DIA_Nash_Hello_01_20");	//Chceš zkusit?
	Info_ClearChoices(dia_nash_hello);
	Info_AddChoice(dia_nash_hello,"S potěšením.",dia_nash_hello_yes);
	Info_AddChoice(dia_nash_hello,"Ne, děkuji.",dia_nash_hello_no);
};

func void dia_nash_hello_yes()
{
	AI_Output(other,self,"DIA_Nash_Hello_01_21");	//S potěšením...
	AI_Output(self,other,"DIA_Nash_Hello_01_22");	//Tady.
	CreateInvItems(other,itfo_nashsoup,1);
	B_UseItem(other,itfo_nashsoup);
	AI_Output(self,other,"DIA_Nash_Hello_01_23");	//A jaká je?
	Info_ClearChoices(dia_nash_hello);
	Info_AddChoice(dia_nash_hello,"Výjimečně dobrá!",dia_nash_hello_ok);
	Info_AddChoice(dia_nash_hello,"Nic moc.",dia_nash_hello_not);
};

func void dia_nash_hello_no()
{
	AI_Output(other,self,"DIA_Nash_Hello_01_24");	//Ne, děkuji.
	AI_Output(self,other,"DIA_Nash_Hello_01_25");	//Tvá věc. I když, je to škoda!... (lítostivě)
	MEETNASH = TRUE;
};

func void dia_nash_hello_ok()
{
	AI_Output(other,self,"DIA_Nash_Hello_01_26");	//Výjimečně dobrá!
	AI_Output(self,other,"DIA_Nash_Hello_01_27");	//Věděl jsem, že ti bude chutnat. Ještě se nikdo nestěžoval!
	AI_Output(other,self,"DIA_Nash_Hello_01_28");	//Popravdě chutná trocha divně.
	AI_Output(self,other,"DIA_Nash_Hello_01_29");	//Poprvé jo. Ale pak si zvykneš a než se vzpamatuješ, nepustíš talíř z ruky.
	AI_Output(other,self,"DIA_Nash_Hello_01_30");	//A maso je z čeho?
	AI_Output(self,other,"DIA_Nash_Hello_01_31");	//Raději ti to neřeknu...
	AI_StopProcessInfos(self);
	NASH_STEW_DAY = Wld_GetDay();
	MEETNASH = TRUE;
	NASHREADYTEACH = TRUE;
};

func void dia_nash_hello_not()
{
	AI_Output(other,self,"DIA_Nash_Hello_01_33");	//Nic moc.
	AI_Output(self,other,"DIA_Nash_Hello_01_34");	//Hmm... Divné. Děcka v táboře jsou z ní celé pryč. Ještě chtějí přidat...
	AI_Output(other,self,"DIA_Nash_Hello_01_35");	//Tak budu první, co odmítne.
	AI_Output(self,other,"DIA_Nash_Hello_01_36");	//Škoda, že ti nechutná. Ale jak říkají, kolik lidí -... vždyť víš, jak to de dál.
	AI_StopProcessInfos(self);
	MEETNASH = TRUE;
};


instance DIA_NASH_HELLO_VALLEY(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = dia_nash_hello_valley_condition;
	information = dia_nash_hello_valley_info;
	permanent = TRUE;
	important = FALSE;
	description = "Můžeš mi říct něco o údolí?";
};


func int dia_nash_hello_valley_condition()
{
	if((MEETNASH == TRUE) && (ASKNASHVALLEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_nash_hello_valley_info()
{
	AI_Output(other,self,"DIA_Nash_Hello_Valley_01_01");	//Můžeš mi říct něco o údolí?
	AI_Output(self,other,"DIA_Nash_Hello_Valley_01_02");	//Nevím, kamaráde. Zkus prokecnout Elvaise nebo někoho z chlapů.
	AI_Output(self,other,"DIA_Nash_Hello_Valley_01_03");	//Poznaj to tu lépe než já.
	AI_Output(other,self,"DIA_Nash_Hello_Valley_01_04");	//Ale něco musíš vědět i ty.
	AI_Output(self,other,"DIA_Nash_Hello_Valley_01_05");	//Hmm... popřemýšlím... (promýšlí)
	if(NASHREADYTEACH == TRUE)
	{
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_06");	//Pamatuju si, že jeden z lovců, Karrok, mi řekl o divném podzemním komlexu... Jestli je to krypta nebo chrám...
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_07");	//... si nepamatuju... Jenom vím, že říkal, že je to východně od tábora... (přemýšlí) Je to dlouho.
		AI_Output(other,self,"DIA_Nash_Hello_Valley_01_08");	//Kde je teď Karrok?
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_09");	//Bohužel se nevrátil z lovu.
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_10");	//Každýmu vyprávěl, jak se do toho chrámu ještě vrátí.
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_11");	//Asi tam taky našel smrt...
		B_LogEntry(TOPIC_URNAZULRAGE,"V táboře jsem našel chlápka jménem Nash. Řekl mi, že lovec Karrok našel podzemní chrám, někde na východě údolí. Naneštěstí se ho na to nemůžu zeptat, protože Karroka již dlouho neviděli. Asi se ztratil, když hledal cestu zpět do chrámu.");
	}
	else
	{
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_12");	//Ne... Nic takovýho si už nepamatuju... Promiň, chlape.
		AI_Output(other,self,"DIA_Nash_Hello_Valley_01_13");	//No, co nemůžeme napravit, musíme tolerovat.
	};
	ASKNASHVALLEY = TRUE;
};


instance DIA_NASH_HELLO_SOUPAGAIN(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = dia_nash_hello_soupagain_condition;
	information = dia_nash_hello_soupagain_info;
	permanent = TRUE;
	important = FALSE;
	description = "Dej mi trochu tvé polévky.";
};


func int dia_nash_hello_soupagain_condition()
{
	if((MEETNASH == TRUE) && (NASHREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_nash_hello_soupagain_info()
{
	AI_Output(other,self,"DIA_Nash_Hello_SoupAgain_01_01");	//Dej mi trochu tvé polévky.
	if(NASH_STEW_DAY != Wld_GetDay())
	{
		B_GiveInvItems(self,other,itfo_nashsoup,1);
		AI_Output(self,other,"DIA_Nash_Hello_SoupAgain_01_02");	//Tady, vezmi si...
		NASH_STEW_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Nash_Hello_SoupAgain_01_03");	//Dnes jsi už svou porci dostal! Vrať se zítra.
	};
};

instance DIA_Nash_Shield(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = DIA_Nash_Shield_condition;
	information = DIA_Nash_Shield_info;
	permanent = FALSE;
	description = "Vidím, že nosíš štít.";
};

func int DIA_Nash_Shield_condition()
{
	if((MEETNASH == TRUE) && (hero.attribute[ATR_REGENERATEMANA] >= 1))
	{
		return TRUE;
	};
};

func void DIA_Nash_Shield_info()
{
	AI_Output(other,self,"DIA_Nash_Shield_01_01");	//Vidím, že nosíš štít.
	AI_Output(self,other,"DIA_Nash_Shield_01_02");	//A to tě překvapuje? Na takovémhle místě může spolehlivý štít zachránit život!
	AI_Output(self,other,"DIA_Nash_Shield_01_04");	//Pokud tedy víš jak ho používat.
	AI_Output(other,self,"DIA_Nash_Shield_01_05");	//A můžeš mmne naučit, jak s ním bojovat?
	AI_Output(self,other,"DIA_Nash_Shield_01_06");	//Samozřejmě! Ale k tomu musíš už něco umět...
	AI_Output(self,other,"DIA_Nash_Shield_01_07");	//Pro zelenáče budou mé lekce zcela zbytečné.
	AI_Output(self,other,"DIA_Nash_Shield_01_08");	//Navíc budeš muset zaplatit.
	AI_Output(self,other,"DIA_Nash_Shield_01_09");	//Ale ne zlatem! Cinkot mincí tady netáhne! 
	AI_Output(other,self,"DIA_Nash_Shield_01_10");	//A co chceš?
	AI_Output(self,other,"DIA_Nash_Shield_01_11");	//Jídlo! Jídla máme tak málo!
	AI_Output(self,other,"DIA_Nash_Shield_01_12");	//Za to že tě budu cvičit mi doneseš 50 kousků masa!
	AI_Output(other,self,"DIA_Nash_Shield_01_13");	//Dobře, popřemýšlím o tvojí nabídce.
	MIS_MeetNashShield = LOG_Running;
	Log_CreateTopic(TOPIC_MeetNashShield,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MeetNashShield,LOG_Running);
	B_LogEntry(TOPIC_MeetNashShield,"Nash mne může naučit, jak lépe ovládat štít. Nicméně za to chce, aby mu přinesl padesát kusů masa.");
};

instance DIA_Nash_ShieldDone(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = DIA_Nash_ShieldDone_condition;
	information = DIA_Nash_ShieldDone_info;
	permanent = FALSE;
	description = "Zde je to maso.";
};

func int DIA_Nash_ShieldDone_condition()
{
	if((MIS_MeetNashShield == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >= 50))
	{
		return TRUE;
	};
};

func void DIA_Nash_ShieldDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Nash_ShieldDone_01_01");	//Zde je to maso.
	B_GiveInvItems(other,self,ItFoMuttonRaw,50);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,50);
	AI_Output(other,self,"DIA_Nash_ShieldDone_01_02");	//Naučíš mne teď svoje triky.
	AI_Output(self,other,"DIA_Nash_ShieldDone_01_03");	//Samozřejmě. Záležíjen jestli máš dostatek zkušeností.
	AI_Output(self,other,"DIA_Nash_ShieldDone_01_04");	//Řekni až budeš připraven.
	MIS_MeetNashShield = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MeetNashShield,LOG_SUCCESS);
	B_LogEntry(TOPIC_MeetNashShield,"Donesl jsem Nashovi 5é kusů masa. Nyní mne naučí jak správně používat štít.");
};

instance DIA_Nash_Shield_Teach(C_Info)
{
	npc = vlk_6010_nash;
	nr = 7;
	condition = DIA_Nash_Shield_Teach_Condition;
	information = DIA_Nash_Shield_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě lépe ovládat štít!";
};

func int DIA_Nash_Shield_Teach_Condition()
{
	if((MIS_MeetNashShield == LOG_SUCCESS) && ((hero.attribute[ATR_REGENERATEMANA] <= 100) || (SkillBlockShield == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Nash_Shield_Teach_Info()
{
	AI_Output(other,self,"DIA_Nash_Shield_Teach_15_00");	//Nauč mě lépe ovládat štít!
	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};

func void DIA_Nash_Shield_Teach_Back()
{
	Info_ClearChoices(DIA_Nash_Shield_Teach);
};

func void DIA_Nash_Shield_Teach_Block()
{
	AI_Output(other,self,"DIA_Nash_Shield_Teach_Block_01_00");	//Nauč mě štítem blokovat magii.

	if(hero.lp >= 10)
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_01");	//Vše je závislé na tvojí síle a samozřejmě také na druhu štítu.
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_02");	//Všechny magické útoky patrně nedokážeš zblokovat, můžeš je ale oslabit.
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_03");	//Pokud štít vydrží nápor, absorbuje některé z magických sil kouzla.
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_04");	//No a když ne...
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_05");	//Měl by sis hlavně obstarat pořádný štít!
		AI_Print("Naučeno: Magický štít");
		Snd_Play("LevelUP");
		SkillBlockShield = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_06");	//Nemáš dostatečné zkušenosti!
	};

	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};

func void DIA_Nash_Shield_Teach_1()
{
	B_TeachShieldNoMoney(self,other,1,100);

	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};

func void DIA_Nash_Shield_Teach_5()
{
	B_TeachShieldNoMoney(self,other,5,100);

	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};