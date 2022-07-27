/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Bosper_SellBows_Info - upraveny výpisy

*/




instance DIA_Bosper_EXIT(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 999;
	condition = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bosper_EXIT_Info()
{
	Value_Pfeil = 5;
	Value_Bolzen = 10;
	AI_StopProcessInfos(self);
};

var int FirstTalkBosper;

instance DIA_Bosper_NoTalkAtAll(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_NoTalkAtAll_Condition;
	information = DIA_Bosper_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Bosper_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_NoTalkAtAll_Info()
{
	if(FirstTalkBosper == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_NoTalkAtAll_12_00");	//Co tady chceš? Hm?
		AI_Output(self,other,"DIA_Bosper_NoTalkAtAll_12_01");	//Nemáš tu co dělat. Vypadni!
		FirstTalkBosper = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_NoTalkAtAll_12_03");	//Řekl jsem, vypadni!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Bosper_HALLO(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_HALLO_Condition;
	information = DIA_Bosper_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bosper_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_HALLO_Info()
{
	if(Wld_IsTime(14,0,16,0) == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//Vítej v mém obchodě cizinče.
	};

	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//Jmenuji se Bosper! Vyrábím, luky a obchoduji s kůžemi.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//Co tě přivádí do Khorinisu?
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Bosper vyrábí luky a obchoduje s nimi. Jeho prodejna je u východní brány, v dolní čtvrti.");
};


instance DIA_Bosper_IntoOV(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent = FALSE;
	description = "Musím se dostat do horní čtvrti...";
};


func int DIA_Bosper_IntoOV_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_IntoOV_Info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//Musím se dostat do horní čtvrti...
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//Tam kde žijí paladinové? Zapomeň na to.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//Musíš být občanem města, nebo mít respektovanou práci.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//Cizinci, jako jsi ty, se tam nemůžou dostat.
	if(Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//Všiml jsem si toho...
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_Running);
	B_LogEntry(TOPIC_OV,"Abych se dostal do horní čtvrti musím se stát uznávaným občanem, nebo získat práci.");
};


instance DIA_Bosper_SeekWork(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent = FALSE;
	description = "Hledám práci!";
};


func int DIA_Bosper_SeekWork_Condition()
{
	return TRUE;
};

func void DIA_Bosper_SeekWork_Info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//Hledám práci!
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//Mmm... (zamyšleně) dost by se mi hodil nový učedník.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//Ten poslední to vzdal zrovna předevčírem.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//Víš něco o lovu?

	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Nooo...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//Mohl bych tě naučit, jak získat kůži ze zvířat.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//Dobře ti zaplatím za každou kůži, kterou mi přineseš.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//Mám ti přinest nějaké kůže, pokud myslíš tohle.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//Přesně tak! Přines mi všechny kůže, které máš k dispozici a dostaneš za to slušně zaplaceno.
	};
	B_LogEntry(TOPIC_Lehrling,"Bosper hledá nového učedníka. Můžu u něj začít pracovat.");
};


var int Bosper_HintToJob;
var int Bosper_StartGuild;

instance DIA_Bosper_LEHRLING(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent = TRUE;
	description = "Chci se stát tvým učedníkem!";
};

func int DIA_Bosper_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//Chci se stát tvým učedníkem!
	if(MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(s nadšením...) To je skvělé! Vypadá to, že už znáš základy.
		stimmen = stimmen + 1;
		if(Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//Harad si myslí, že jsi dobrý a silný člověk.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//Harad ještě není přesvědčen o tvých schopnostech.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//Ale Harad říká, že tě nikdy neviděl.
		};
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//Thorben ti dává požehnání. Nejsem tak zbožný jako on, ale přesto je to dobré.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//Thorben ti dá souhlas jen s požehnáním bohů.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//Thorben netuší, kdo jsi.
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//Constantino říká, že mu je jedno, čím účedníkem se staneš.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//Constantino říká, že jsi ve městě obviněn z trestného činu - doufám, že je to nějaký nesmysl?
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//Dbej na to, aby se tento problém vyřešil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//Constantino o tobě nikdy ani neslyšel.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//Matteo říká, že stojíš jako zlato, které se rovná tvé hmotnosti.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//Matteo zmínil některé dluhy - nevím, co to myslí, ale radši bys sis s ním měl promluvil.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//Matteo říká, že o tom ještě nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//Matteo říká, že tě nikdy neviděl.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//To znamená, že jsi obdržel souhlas od všech mistrů!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//Získal jsi souhlas čtyř mistrů. To stačí, abych tě přijal do učení.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//Můžeš začít pracovat pro mě kdykoli, kdy budeš chtít chtít.
			Info_ClearChoices(DIA_Bosper_LEHRLING);
			Info_AddChoice(DIA_Bosper_LEHRLING,"No, přemýšlím o tom.",DIA_Bosper_LEHRLING_Later);
			Info_AddChoice(DIA_Bosper_LEHRLING,"Jsem připraven být tvým učedníkem.",DIA_Bosper_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//Potřebuješ souhlas nejméně čtyř mistrů. Bez toho nemůžete stát se učedníkem v dolní čtvrti.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//To znamená, že musíš mluvit se všemi ostatními, kteří o tobě pochybují.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//Předtím, než tě vezmu do učení, musím nejprve pochopit, zda jsi vhodný.
		if(MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//Vrátil jsi mi luk, ale neříká mi to nic o tom, jak jsi dobrý lovec.
		};
		Bosper_HintToJob = TRUE;
	};
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//Jsem připraven být tvým učedníkem.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//Nebudeš litovat! Myslím, že si budeme rozumět.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_02");	//Ach jo, skoro jsem zapomněl. Tady - vezmi si tuto zbroj! Bude tě chránit, když půjdeš na lov.
	B_GiveInvItems(self,other,ITAR_Leather_L,1);
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_03");	//A tenhle luk!
	B_GiveInvItems(self,other,itrw_bospbow_l_03,1);
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_04");	//A abys to s ním uměl, naučím tě pár nových triků.
	B_RaiseAttribute_Bonus_Many(other,ATR_DEXTERITY,5);
	B_RaiseFightTalent_Bonus(other,NPC_TALENT_BOW,5);
	AI_Print(PRINT_BOSPERBONUS);
	Player_IsApprentice = APP_Bosper;
	Npc_ExchangeRoutine(Lothar,"START");
	Bosper_StartGuild = other.guild;
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP(XP_Lehrling);
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Bosper mě přijal za učedníka. Teď mám přístup do horní čtvrti města.");
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//Ok, přemýšlím o tom.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//Podívej, nerozhodni se špatně! Ty se nejlépe hodíš pro tuto práci.
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};

var int Bosper_LeatherBought;

instance DIA_Bosper_LEATHER(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 850;
	condition = DIA_Bosper_LEATHER_Condition;
	information = DIA_Bosper_LEATHER_Info;
	permanent = TRUE;
	description = "Koupit těžkou koženou zbroj (cena: 500 zlatých)";
};

func int DIA_Bosper_LEATHER_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && (Bosper_LeatherBought == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_LEATHER_Info()
{
	AI_Output(other,self,"DIA_Bosper_LEATHER_01_00");	//Prodej mi těžkou koženou zbroj.

	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other,"DIA_Bosper_LEATHER_01_01");	//Jak řekneš! Tady ji máš. Bude se ti líbit!
		B_GiveInvItems(self,other,ITAR_Leather_M,1);
		Bosper_LeatherBought = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEATHER_01_02");	//Nemáš dost zlata, příteli.
	};
};

instance DIA_Bosper_OtherMasters(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent = FALSE;
	description = "Co když chci vstoupit do učení k jinému mistrovi?";
};

func int DIA_Bosper_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//Co když chci vstoupit do učení k jinému mistrovi?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//Blbost!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//Harad a Matteo už mají učedníky.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//Alchymista Constantino je samotář, neměl učedníka už dlouhé roky.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//Thorben je moc chudý, neměl by ti jak platit.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//Já potřebuju učedníka opravdu hodně. A platím skvěle!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//Ale nezáleží jen na mě, koho učedníkem se chceš stát - budeš potřebovat souhlas všech mistrů z dolní čtvrti...
};

instance DIA_Bosper_Bartok(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent = FALSE;
	description = "Proč to tvůj minulý učedník vzdal?";
};

func int DIA_Bosper_Bartok_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Bartok_Info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//Proč to tvůj minulý učedník vzdal?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//Jak jsem řekl, lovit je v poslední době nebezpečné.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//Pokud tě to opravdu zajímá, můžeš se ho zeptat sám.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//Jmenuje se Bartok. Pravděpodobně je někde u Coragonovy hospody.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//Projdi podzemní chodbou u kovárny a budeš ji mít přímo před sebou.
};

instance DIA_Bosper_ZUSTIMMUNG(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "Dostanu tvůj souhlas k práci u jiného mistra?";
};

func int DIA_Bosper_ZUSTIMMUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//Dostanu tvůj souhlas k práci u jiného mistra?
	if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//(zklamaně) Doufal jsem, že si vybereš za mistra mě.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//Ale pokud ses rozhodl...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//Znamená to, že pro mě budeš hlasovat?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//Pokud nikdo jiný z mistrů nevznese námitku... pak ano.
		if(MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//Koneckonců jsi mi vrátil luk.
		};
		if(MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//Ale byl bys skvělým lovcem.
		};
		if(Bosper_Zustimmung_Once == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
			B_LogEntry(TOPIC_Lehrling,"Bosper mi dá souhlas, pokud se chci stát učedníkem jiného mistra.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//(povzdech) Dobrá! Máš mé schválení... Ale za jedné podmínky.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//Pracuj pro mě, alespoň na chvíli.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//Takže můžeš pochopit, zda se ti líbí moje řemeslo, nebo ne.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//A kdo ví... Možná se ti to bude líbit tolik, že zůstaneš u mě.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//Pokud jsi dost dobrý, aby ses stal mým učedníkem, pak se budeš také stýkat s jinými mistry.
		Bosper_HintToJob = TRUE;
	};
};

instance DIA_Bosper_Job(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent = FALSE;
	description = "Co můžu pro tebe udělat?";
};

func int DIA_Bosper_Job_Condition()
{
	if(Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Job_Info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//Co můžu pro tebe udělat?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//Naučím tě, jak stáhnout zvířata z kůže. Pak mi je přines, dejme tomu půl tuctu vlčich kůží.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Bosper mě může naučit, jak stáhnout zvířata z kůže.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//Přines mi půl tuctu vlčich kůží.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//Pak se rozhodnu zda se hodíš pro toto řemeslo.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//Pokud ti to nepotrvá věčnost a jestli ty kůže budou ve slušném stavu, přijmu tě, když budeš chtít.
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//(s povzdechem) Nebo se můžeš stát učedníkem jiného mistra... Pokud opravdu chceš.
	};
	MIS_Bosper_WolfFurs = LOG_Running;
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperWolf,LOG_Running);
	B_LogEntry(TOPIC_BosperWolf,"Musím přinést Bosperovi šest vlčich kůží. Pak mohu buď pracovat pro něj, nebo od něj získat jeho souhlas k práci pro jiné mistry.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry(TOPIC_BosperWolf,"Musím ho požádat, aby mě naučil, jak stáhnout zvířata z kůže.");
	};
};


instance DIA_Bosper_BringFur(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 102;
	condition = DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent = TRUE;
	description = "Ohledně těch vlčích kůží...";
};


func int DIA_Bosper_BringFur_Condition()
{
	if(MIS_Bosper_WolfFurs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BringFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//Ohledně těch vlčích kůží...

	if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//Už jsi učedníkem jiného mistra. Koupím od tebe kůže za obvyklou cenu.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	if(B_GiveInvItems(other,self,ItAt_WolfFur,6))
	{
		B_GivePlayerXP(XP_Bosper_Bogen);
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//Přinesl jsem je...
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//Skvělé! Věděl jsem, že se hodíš na tuto práci.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//Tady máš peníze, jak jsem slíbil.
		B_GiveInvItems(self,other,ItMi_Gold,Value_WolfFur * 3);
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//A? Co na to říkáš? Není to lepší než celý den být u kovadliny, nebo se honit za bylinkami na špinavém poli?
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry(TOPIC_Lehrling,"Bosper mě vezme za učedníka, pokud nebudou ostatní mistři mít nic proti.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//Dohodli jsme se na půl tuctu, nicméně máš pořád čas, běž a získej ty kůže.
	};
};

instance DIA_Bosper_TeachFUR(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent = TRUE;
	description = "Nauč mě, jak stáhnout zvířata z kůže.";
};

func int DIA_Bosper_TeachFUR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_TeachFUR_Info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Nauč mě, jak stáhnout zvířata z kůže.
	Info_ClearChoices(DIA_Bosper_TeachFUR);
	Info_AddChoice(DIA_Bosper_TeachFUR,Dialog_Back,DIA_Bosper_TeachFUR_Back);
	Info_AddChoice(DIA_Bosper_TeachFUR,b_buildlearnstringforsmithhunt("Stahování kůží",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Bosper_TeachFUR_Fur);
};

func void DIA_Bosper_TeachFUR_Back()
{
	Info_ClearChoices(DIA_Bosper_TeachFUR);
};

func void DIA_Bosper_TeachFUR_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Dobře, poslouchej, je to docela jednoduché.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//Vezmi si ostrý nůž a nařízni břicho zvířete. Potom proveď několik malých řezů na vnitřní straně nohou a odstraň kůži.
	};

	Info_ClearChoices(DIA_Bosper_TeachFUR);
};

instance DIA_Bosper_Trade(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 700;
	condition = DIA_Bosper_Trade_Condition;
	information = DIA_Bosper_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};

func int DIA_Bosper_Trade_Condition()
{
	if((MIS_Bosper_WolfFurs == LOG_Success) && (Wld_IsTime(5,0,14,0) || Wld_IsTime(16,0,23,0)))
	{
		return TRUE;
	};
	if((Player_IsApprentice > APP_NONE) && (Wld_IsTime(5,0,14,0) || Wld_IsTime(16,0,23,0)))
	{
		return TRUE;
	};
};

var int bosperarrowsday;
var int bosperarrowssay;
var int BosperTradeLowBows;

func void DIA_Bosper_Trade_Info()
{
	var int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//Ukaž mi své zboží.

	daynow = Wld_GetDay();

	if((Player_IsApprentice == APP_Bosper) && (BosperTradeBows == FALSE) && (MIS_Bosper_Bogen == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_06");	//Protože jsi mi pomohl dostat zpátky můj luk a jsi můj učedník.
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_07");	//... to možná ti budu moci prodat nejen šipky a šípy, ale také docela dobré luky.
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_08");	//Samozřejmě, nejsou nic extra, ale jsou vhodné pro lov.
		BosperTradeBows = TRUE;
	};
	if((BosperTradeBows == TRUE) && (BosperTradeLowBows == FALSE))
	{
		CreateInvItems(self,ItRw_Bow_L_01,1);
		CreateInvItems(self,ItRw_Bow_L_02,1);
		CreateInvItems(self,ItRw_Bow_L_03,1);
		CreateInvItems(self,ItRw_Bow_L_04,1);
		CreateInvItems(self,ItRw_Bow_M_01,1);
		CreateInvItems(self,ItRw_Bow_M_02,1);
		CreateInvItems(self,ItRw_Bow_M_03,1);
		CreateInvItems(self,ItRw_Bow_M_04,1);
		BosperTradeLowBows = TRUE;
	};
	if(BOSPERARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (BOSPERARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 25) + (10 * (daynow - BOSPERARROWSDAY - 1));

			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};

			BOSPERARROWSDAY = daynow;
		};
	}
	else if(BOSPERARROWSSAY == FALSE)
	{
		if((Npc_HasItems(self,ItRw_Bolt) == 0) && (Npc_HasItems(self,ItRw_Arrow) == 0))
		{
			AI_Output(self,other,"DIA_Bosper_Trade_11_03");	//Šípy a šipky už došly - stav se zítra.
		}
		else if(Npc_HasItems(self,ItRw_Bolt) == 0)
		{
			AI_Output(self,other,"DIA_Bosper_Trade_11_04");	//Šipky už došly - stav se zítra.
		}
		else if(Npc_HasItems(self,ItRw_Arrow) == 0)
		{
			AI_Output(self,other,"DIA_Bosper_Trade_11_05");	//Šípy už došly - stav se zítra.
		};

		AI_Output(self,other,"DIA_Bosper_Trade_11_06");	//Nové zboží přijde zítra v poledne.
		BOSPERARROWSSAY = TRUE;
	};

	B_GiveTradeInv(self);
};

instance DIA_Bosper_BogenRunning(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BogenRunning_Condition;
	information = DIA_Bosper_BogenRunning_Info;
	permanent = FALSE;
	description = "Slyšel jsem, že jsi byl okraden.";
};

func int DIA_Bosper_BogenRunning_Condition()
{
	if(MIS_Bosper_Bogen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenRunning_Info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//Slyšel jsem, že jsi byl okraden.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//Kdo ti to řekl? Pravděpodobně Bartok, ne? Neměl ti co jiného povědět? No dobře.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//Ale pokud se dostanu k tomu bastardovi, nebudu mít žádné slitování.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//Zanechal jsem můj obchod jen minutu bez dozoru. A když jsem se vrátil, viděl jsem, jak šel ven... s lukem na rameni.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//Okamžitě jsem zavolal stráže, ale ten špinavec běžel hned do přístavu a tam se jim ztratil.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//Stráže prohledali celou přístavní čtvrť, ale nic nenašli.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//Bastard!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//Přísahám, že můj luk je někde ve městě. Hovořil jsem s hlídkami u obou městských bran, ale neviděli, jak by někdo vyšel z města s lukem.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//Pokud toho hajzla dostanu...
	Log_CreateTopic(TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperBogen,LOG_Running);
	B_LogEntry(TOPIC_BosperBogen,"Bosperovi byl ukraden luk. Zloděj běžel do přístavu a zmizel tam. Domobrana hledala v přístavní čtvrti, ale nic nenalezli, ačkoliv luk stále musí být ve městě.");
};

instance DIA_Bosper_BogenSuccess(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 6;
	condition = DIA_Bosper_BogenSuccess_Condition;
	information = DIA_Bosper_BogenSuccess_Info;
	permanent = FALSE;
	description = "Myslím, že je to tvůj luk.";
};

func int DIA_Bosper_BogenSuccess_Condition()
{
	if((MIS_Bosper_Bogen == LOG_Running) && (Npc_KnowsInfo(other,DIA_Bosper_BogenRunning) == TRUE) && (Npc_HasItems(other,ItRw_Bow_L_03_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenSuccess_Info()
{
	B_GivePlayerXP(XP_Bosper_Bogen);
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//Myslím, že je to tvůj luk.
	B_GiveInvItems(other,self,ItRw_Bow_L_03_MIS,1);
	Npc_RemoveInvItems(self,ItRw_Bow_L_03_MIS,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//Můj luk! Kdes ho našel?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//V temné a smrduté díře plné krys.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//Doufám, že díky tím nemáš žádné problémy.
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//Ne! Poradil jsem si.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//Hmmm... (souhlasně) Ale díky. Dlužím ti moc!
	MIS_Bosper_Bogen = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BosperBogen,LOG_SUCCESS);
	B_LogEntry(TOPIC_BosperBogen,"Vrátil jsem Bosperovi jeho luk.");

	if((Player_IsApprentice == APP_Bosper) && (BosperTradeBows == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_06");	//Protože jsi mi pomohl dostat můj luk a jsi můj učedník...
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_07");	//... Pak ti kromě šípů a šipek prodám docela dobré luky.
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_08");	///Samozřejmě, nejsou nic extra, ale jsou vhodné pro lov.
		BosperTradeBows = TRUE;
	};
};

instance DIA_Bosper_MakeBow(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_MakeBow_Condition;
	information = DIA_Bosper_MakeBow_Info;
	permanent = FALSE;
	description = "A kdy budou luky?";
};

func int DIA_Bosper_MakeBow_Condition()
{
	if((BosperTradeBows == TRUE) && (Player_IsApprentice == APP_Bosper))
	{
		return TRUE;
	};
};

func void DIA_Bosper_MakeBow_Info()
{
	AI_Output(other,self,"DIA_Bosper_MakeBow_01_00");	//A kdy budou luky?
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_01");	//(překvapeně) Za jak dlouho? Dělám je sám!
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_02");	//Je pravda, za dlouho, protože výroba každého z nich trvá poměrně dlouho.
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_03");	//Ale z dlouhodobého hlediska to stojí za to! Toto povolání se vyplatí.
	AI_Output(other,self,"DIA_Bosper_MakeBow_01_04");	//Můžeš mě učit?
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_05");	//(zamyšleně) No, proč ne. Koneckonců jsi můj učedník.
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_06");	//Nicméně, pro to budeš potřebovat nějaké zkušenosti, řemeslo je docela těžké!
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_07");	//No, samozřejmě, na to nemám peníze.
	BosperTeachMakeBows = TRUE;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows,"Bosper mě může naučit, jak vyrábět luky.");
};

instance DIA_Bosper_BOWTEACH1(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BOWTEACH1_condition;
	information = DIA_Bosper_BOWTEACH1_info;
	permanent = TRUE;
	description = "Nauč mě, vyrábět luky.";
};

func int DIA_Bosper_BOWTEACH1_condition()
{
	if((BosperTeachMakeBows == TRUE) && (BowMake_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BOWTEACH1_info()
{
	AI_Output(other,self,"DIA_Bosper_BOWTEACH1_01_00");	//Nauč mě, vyrábět luky.

	if(hero.lp >= 1)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_01");	//Nauč mě, vyrábět luky.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_02");	//Hlavní věc, kterou bys měl vědět, je, že luk se skládá ze dvou základních částí - lučiště a tětivy.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_03");	//Čím jsou kvalitnější tyto části, tím bude lepší luk, který vyrobíš.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_04");	//Pro lučiště se používají různé typy dřeva, z nichž každé má různé kombinace ohýbání a pružnosti.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_05");	//Pokud vezmeš obyčejné dřevo a uděláš z něj luk, hned při prvním výstřelu se zlomí.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_06");	//Měl bys pečlivě vybírat materiál, z kterého budeš luk tvořit.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_07");	//Nyní o tětivě, i zde je důležitý výběr.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_08");	//V podstatě je tětiva vyrobena z kůže zvířat - vlků, divočáků, stínových šelem a wargů.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_09");	//Tyto materiály umožní tětivě dodržet napínací vlastnosti.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_10");	//Nikdy se neopotřebí když prší nebo mrzne.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_11");	//K tomu však bude třeba také ošetřit různými mazivy, jako je tuk nebo pryskyřice.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_12");	//Co se týče samotného výrobního procesu, je vše jednoduché.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_13");	//Vezmeš si potřebné záznamy, kleště a truhlářský pracovní stůl.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_14");	//Pak vezmeš kousek kůže, řezací nůž a nakrájíš ho na tenké kousky.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_15");	//Dále zpracuješ každý z těchto kusů tukem nebo pryskyřicí, propleteš je a vysušíš.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_16");	//Vlastně je to tak, jak je vytvořena tětiva, no, pak na té samé lavici zkompletuješ celý luk.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_17");	//Tvé první luky nebudou určitě žádný skvost, ale pokud budeš trénovat, budeš se zlepšovat.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_18");	//... obecně, vše přichází se zkušenostmi.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_19");	//No, v budoucnosti ti mohu ukázat, jak udělat ještě lepší a nebezpečnější luky.
		hero.lp = hero.lp - 1;
		BowMake_01 = TRUE;
		AI_Print("Naučeno: Výroba luků - 'Krátký luk'");
		B_LogEntry(Topic_TalentMakeBows,"Na výrobu lučiště budu potřebovat truhlářský ponk, řezivo z určitého druhu dřeva a obyčejné kleště.");
		B_LogEntry_Quiet(Topic_TalentMakeBows,"Na výrobu tětivy budu potřebovat koželužský stůl, porcovací nůž a zvířecí kůži.");
		B_LogEntry_Quiet(Topic_TalentMakeBows,"Abych sestavil kompletní luk, budu potřebovat truhlářský ponk, lučiště, tětivu a obyčejné kleště.");
		B_LogEntry_Quiet(Topic_TalentMakeBows,"Materiály pro výrobu KRÁTKÉHO LUKU: krátké lučiště, tětiva z vlčí kůže a pryskyřice.");
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 1)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_22");	//Nejsi ještě na to připraven! Přijď, až budeš mít zkušenosti.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Bosper_WhereBowWood(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_WhereBowWood_Condition;
	information = DIA_Bosper_WhereBowWood_Info;
	permanent = FALSE;
	description = "Kde najdu ty dřevěné polotovary?";
};

func int DIA_Bosper_WhereBowWood_Condition()
{
	if(BowMake_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_WhereBowWood_Info()
{
	AI_Output(other,self,"DIA_Bosper_WhereBowWood_01_00");	//Kde najdu ty dřevěné polotovary?
	AI_Output(self,other,"DIA_Bosper_WhereBowWood_01_01");	//O tom si promluv s Thorbenem, jistě jich má spoustu.
	AI_Output(self,other,"DIA_Bosper_WhereBowWood_01_02");	//Možná ti něco prodá.
	TorbenSellWood = TRUE;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows,"O různých druzích řeziva na výrobu luků si mám promluvit s Thorbenem.");
};

instance DIA_Bosper_BosperBuyAllBows(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_BosperBuyAllBows_Condition;
	information = DIA_Bosper_BosperBuyAllBows_Info;
	permanent = FALSE;
	description = "A co mám dělat s vyrobenými luky?";
};

func int DIA_Bosper_BosperBuyAllBows_Condition()
{
	if(BowMake_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BosperBuyAllBows_Info()
{
	AI_Output(other,self,"DIA_Bosper_BosperBuyAllBows_01_00");	//A co mám dělat s vyrobenými luky?
	AI_Output(self,other,"DIA_Bosper_BosperBuyAllBows_01_01");	//Můžeš je prodat obchodníkům na tržišti, pár drobáků za to dostaneš.
	AI_Output(self,other,"DIA_Bosper_BosperBuyAllBows_01_02");	//Ale lepší bude, když mi je přineseš.
	AI_Output(other,self,"DIA_Bosper_BosperBuyAllBows_01_03");	//Popřemýšlím o tom.
	BosperBuyAllBows = TRUE;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows,"Bosper ode mě koupí všechny luky, které vyrobím.");
};

instance DIA_Bosper_SellBows(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 200;
	condition = DIA_Bosper_SellBows_Condition;
	information = DIA_Bosper_SellBows_Info;
	permanent = TRUE;
	description = "Chci ti prodat luky, které jsem vyrobil.";
};

func int DIA_Bosper_SellBows_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && (BosperBuyAllBows == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_SellBows_Info()
{
	var C_Item EquipWeap;
	var int anzahl_common;
	var int anzahl_eve;
	var int anzahl_vyz;
	var int anzahl_ysuo;
	var int anzahl_bok;
	var int gesamt;
	var int lohnbow;
	var string concatText;


	AI_Output(other,self,"DIA_Bosper_SellBows_15_00");	//Chci ti prodat luky, které jsem vyrobil.
	EquipWeap = Npc_GetEquippedRangedWeapon(other);

	anzahl_common = Npc_HasItems(other,ItRw_BowCraft_01);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_01) == TRUE)
	{
		if(anzahl_common > 1)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_01,anzahl_common);
		};
		anzahl_common -= 1;
	};

	anzahl_eve = Npc_HasItems(other,ItRw_BowCraft_02);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_02) == TRUE)
	{
		if(anzahl_eve > 1)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_02,anzahl_eve);
		};
		anzahl_eve = anzahl_eve - 1;
	};

	anzahl_vyz = Npc_HasItems(other,ItRw_BowCraft_03);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_03) == TRUE)
	{
		if(anzahl_vyz > 1)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_03,anzahl_vyz);
		};
		anzahl_vyz = anzahl_vyz - 1;
	};

	anzahl_ysuo = Npc_HasItems(other,ItRw_BowCraft_04);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_04) == TRUE)
	{
		if(anzahl_ysuo > 1)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_04,anzahl_ysuo);
		};
		anzahl_ysuo = anzahl_ysuo - 1;
	};

	anzahl_bok = Npc_HasItems(other,ItRw_BowCraft_05);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_05) == TRUE)
	{
		if(anzahl_bok > 1)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_05,anzahl_bok);
		};
		anzahl_bok = anzahl_bok - 1;
	};

	gesamt = anzahl_common + anzahl_eve + anzahl_vyz + anzahl_ysuo + anzahl_bok;

	if(gesamt == 0)
	{
		if((Hlp_IsItem(EquipWeap,ItRw_BowCraft_01) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_02) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_03) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_04) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_05) == TRUE))
		{
			AI_Output(self,other,"DIA_Bosper_SellBows_12_01");	//Kromě toho co máš na zádech nevidím žádný luk.
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_SellBows_12_04");	//Takže první!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellBows_12_02");	//Dobře pojď.

		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_01) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_01,anzahl_common);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_02) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_02,anzahl_eve);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_03) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_03,anzahl_vyz);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_04) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_04,anzahl_ysuo);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_05) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_05,anzahl_bok);
		};

		// concatText = b_formgivestring(other,gesamt);
		concatText = ConcatStrings("Předáno ",IntToString(gesamt));
		concatText = ConcatStrings(concatText," předmětů");
		AI_Print(concatText);
		AI_Output(self,other,"DIA_Bosper_SellBows_12_03");	//Skvělé, tady jsou tvé peníze.
		lohnbow = (anzahl_common * 50) + (anzahl_eve * 100) + (anzahl_vyz * 200) + (anzahl_ysuo * 300) + (anzahl_bok * 500);
		B_GiveInvItems(self,other,ItMi_Gold,lohnbow);
	};
};

instance DIA_Bosper_BOWTEACH_Other(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BOWTEACH_Other_condition;
	information = DIA_Bosper_BOWTEACH_Other_info;
	permanent = TRUE;
	description = "Jaké další luky mě můžeš naučit vyrábět?";
};

func int DIA_Bosper_BOWTEACH_Other_condition()
{
	if((BosperTeachMakeBows == TRUE) && (BowMake_01 == TRUE) && ((BowMake_02 == FALSE) || (BowMake_03 == FALSE) || (BowMake_04 == FALSE) || (BowMake_05 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BOWTEACH_Other_info()
{
	AI_Output(other,self,"DIA_Bosper_BOWTEACH_Other_01_00");	//Jaké další luky mě můžeš naučit vyrábět?
	AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_01_01");	//Podívej se sám...
	Info_ClearChoices(DIA_Bosper_BOWTEACH_Other);
	Info_AddChoice(DIA_Bosper_BOWTEACH_Other,Dialog_Back,DIA_Bosper_BOWTEACH_Other_Back);

	if((BowMake_01 == TRUE) && (BowMake_02 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Weidenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other,"Vrbový luk (VB: 1)",DIA_Bosper_BOWTEACH_Other_Bow_01);
	};
	if((BowMake_02 == TRUE) && (BowMake_03 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Ulmenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other,"Jilmový luk (VB: 2)",DIA_Bosper_BOWTEACH_Other_Bow_02);
	};
	if((BowMake_03 == TRUE) && (BowMake_04 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Eschenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other,"Jasanový luk (VB: 3)",DIA_Bosper_BOWTEACH_Other_Bow_03);
	};
	if((BowMake_04 == TRUE) && (BowMake_05 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Buchenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other,"Bukový luk (VB: 4)",DIA_Bosper_BOWTEACH_Other_Bow_04);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Back()
{
	Info_ClearChoices(DIA_Bosper_BOWTEACH_Other);
};

func void DIA_Bosper_BOWTEACH_Other_Bow_01()
{
	if(hero.lp >= 1)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_01_01_01");	//Dobře, teď víš jak na to.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_01_01_02");	//Doufám, že se ti to podaří.
		hero.lp = hero.lp - 1;
		BowMake_02 = TRUE;
		AI_Print("Naučeno: Výroba luků - 'Vrbový luk'");
		B_LogEntry(Topic_TalentMakeBows,"Materiály pro výrobu VRBOVÉHO LUKU: vrbové lučiště, tětiva z kůže divočáka a pryskyřice.");
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 1)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_01_01_03");	//Nejsi na to připraven! Přijď až budeš mít dostatek zkušenosti.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Bow_02()
{
	if(hero.lp >= 2)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_02_01_01");	//Dobře, teď víš jak na to.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_02_01_02");	//Doufám, že se ti to podaří.
		hero.lp = hero.lp - 2;
		BowMake_03 = TRUE;
		AI_Print("Naučeno: Výroba luků - 'Jilmový luk'");
		B_LogEntry(Topic_TalentMakeBows,"Materiály pro výrobu JILMOVÉHO LUKU: jilmové lučiště, tětiva z kůže warga a pryskyřice.");
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 2)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_02_01_03");	//Nejsi na to připraven! Přijď až budeš mít dostatek zkušenosti.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Bow_03()
{
	if(hero.lp >= 3)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_03_01_01");	//Dobře, teď víš jak na to.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_03_01_02");	//Doufám, že se ti to podaří.
		hero.lp = hero.lp - 3;
		BowMake_04 = TRUE;
		AI_Print("Naučeno: Výroba luků - 'Jasanový luk'");
		B_LogEntry(Topic_TalentMakeBows,"Materiály pro výrobu JASANOVÉHO LUKU: jasanové lučiště, tětiva z kůže stínové šelmy a pryskyřice.");
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 3)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_03_01_03");	//Nejsi na to připraven! Přijď až budeš mít dostatek zkušenosti.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Bow_04()
{
	if(hero.lp >= 4)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_04_01_01");	//Dobře, teď víš jak na to.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_04_01_02");	//Doufám, že se ti to podaří.
		hero.lp = hero.lp - 4;
		BowMake_05 = TRUE;
		AI_Print("Naučeno: Výroba luků - 'Bukový luk'");
		B_LogEntry(Topic_TalentMakeBows,"Materiály pro výrobu BUKOVÉHO LUKU: bukové lučiště, tětiva z trolí kůže a 2x pryskyřice.");
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 4)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_04_01_03");	//Nejsi na to připraven! Přijď až budeš mít dostatek zkušenosti.
		AI_StopProcessInfos(self);
	};
};

var int Bosper_Island;

instance DIA_Bosper_PERM(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 10;
	condition = DIA_Bosper_PERM_Condition;
	information = DIA_Bosper_PERM_Info;
	permanent = TRUE;
	description = "Jaká je situace ve městě?";
};

func int DIA_Bosper_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Bosper_PERM_Info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//Jaká je situace ve městě?
	if(Bosper_Island == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//Pokud skřeti zaútočí bude to velmi špatné.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//V přístavu je pouze jediná loď a ta je hlídaná paladiny. Pochybuji, že ji použijí k záchraně lidí z města.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//Není tu i jiná cesta úniku?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//Není, nikdo nemůže opustit ostrov bez lodi.
		Bosper_Island = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//Žádné novinky nemám. Vrať se jindy.
	};
};

var int Bosper_MILKommentar;
var int Bosper_PALKommentar;
var int Bosper_INNOSKommentar;
var int Bosper_KDWKommentar;
var int Bosper_SEKKommentar;
var int Bosper_KDMKommentar;

instance DIA_Bosper_AlsLehrling(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Bosper_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bosper_AlsLehrling_Info()
{
	if((other.guild == GIL_MIL) && (Bosper_StartGuild != GIL_MIL) && (Bosper_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//Koukám, že ses přidal k domobraně, co?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//Nevadí mi to. Pokud budeš kromě banditů a skřetů lovit i vlky. (s úsměvem)
		Bosper_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Bosper_StartGuild != GIL_PAL) && (Bosper_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//Koukám, že tvá kariéra nabrala rychlý vzestup. Paladine!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//Kamkoli tě vítr zanese, prosím nezapomeň na svého starého učitele...
		Bosper_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Bosper_StartGuild != GIL_NOV) && (Bosper_StartGuild != GIL_KDF) && (Bosper_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//Koukám, že tě vzali do kláštera, že? Doufám, že tě čas od času pustí ven, abys mi donesl nějaké kůže.
		Bosper_INNOSKommentar = TRUE;
	}
	else if((other.guild == GIL_KDW) && (Bosper_KDWKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_08");	//Přidal ses ke kruhu mágů Vody. Doufám, že ti nezakázali lovit a nosit mi kůže. Nezapomeneš na mě, viď?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_09");	//Prosím... dej pozor na ty kůže ano? Jsi mág Vody, ale mokré kůže nemůžu použít. 
		Bosper_KDWKommentar = TRUE;
	}
	else if((Bosper_SEKKommentar == FALSE) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR) || (other.guild == GIL_SEK)))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_10");	//Ááá, přidal ses k těm skvělým lidem z bažiny! Výborně! Skvělé rozhodnutí! Bratrstvo je pro tebe jako dělané!

		if(other.guild == GIL_TPL)
		{
			AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_11");	//V klášteře by ti určitě zakázali se mnou spolupracovat, ale s Bratrstvem budeš mít blízko k přírodě, blízko ke kůžím, blízko ke mě...
		};

		Bosper_SEKKommentar = TRUE;
	}
	else if((Bosper_KDMKommentar == FALSE) && ((other.guild == GIL_KDM) || (other.guild == GIL_NDM)))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_12");	//Ty jsi temný mág? Nekromant, je to tak? To... to mi vůbec nevadí, věř mi. 
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_13");	//Koupím tvé kůže i kdyby ses rozhodl stát při Beliarovi. Jenom je přines osobně. Neposílej svoje... jak se nazývají. Nemrtvé služebníky. Dohodnuto?
		Bosper_KDMKommentar = TRUE;
	}
	else if((Bosper_Lehrling_Day <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//Kde jsi byl tak dlouho?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//Potřebuji kůže. Máš nějaké?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//Přišel jsi, konečně...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Bosper_Aufgaben(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_Aufgaben_Condition;
	information = DIA_Bosper_Aufgaben_Info;
	permanent = FALSE;
	description = "Jaké mám povinnosti?";
};

func int DIA_Bosper_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//Jaké mám povinnosti?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//Nijak těžké. Prostě mě přines všechny kůže.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//Dám ti za ně daleko víc než místní obchodníci.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//No, pro zbytek času tu být nemusíš. Obchod zvládnu sám.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//Kde se můžu vyspat?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//Nemám tu pro tebe místo. Ale v hotelu na náměstí se určitě volná postel najde.
	};
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Bosper mi dá za zvířecí kůže lepší cenu než ostatní obchodníci.");
};


var int Bosper_TrollFurSold;

instance DIA_Bosper_SellFur(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 600;
	condition = DIA_Bosper_SellFur_Condition;
	information = DIA_Bosper_SellFur_Info;
	permanent = TRUE;
	description = "Přinesl jsem ti nějaké kůže.";
};

func int DIA_Bosper_SellFur_Condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_SellFur_Info()
{
	var int wargfur;
	var int SummRabbitFur;
	var int dogfur;
	var int wolffur;
	var int icewolffur;
	var int summwolf;
	var int LurkerSkin;
	var int SharkSkin;
	var int SummSkin;
	var int pumafur;
	var int icepumafur;
	var int summpuma;

	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//Přinesl jsem ti nějaké kůže.

	if((Npc_HasItems(other,ItAt_RabbitFur) > 0) || (Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0) || (Npc_HasItems(other,itat_pumafur) > 0) || (Npc_HasItems(other,itat_LurkerSkin) > 0))
	{
		if(Npc_HasItems(other,ItAt_RabbitFur) > 0)
		{
			SummRabbitFur = Npc_HasItems(other,ItAt_RabbitFur) * 5;
			AI_Output(self,other,"DIA_Bosper_SellFur_11_95A");	//Hmm... Králičí kůže, dej mi je. Na něco je využiju.
			B_GiveInvItems(self,other,ItMi_Gold,SummRabbitFur);
			Npc_RemoveInvItems(other,ItAt_RabbitFur,Npc_HasItems(other,ItAt_RabbitFur));
		};
		if((Npc_HasItems(other,itat_LurkerSkin) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0))
		{
			LurkerSkin = Npc_HasItems(other,itat_LurkerSkin);
			SharkSkin = Npc_HasItems(other,ItAt_SharkSkin);
			SummSkin = (LurkerSkin * Value_ReptileSkin) + (SharkSkin * Value_SharkSkin);

			AI_Output(self,other,"DIA_Bosper_SellFur_11_15A");	//Kůže z plazů. Velmi dobré na zbroje.
			B_GiveInvItems(self,other,ItMi_Gold,SummSkin);
			Npc_RemoveInvItems(other,itat_LurkerSkin,Npc_HasItems(other,itat_LurkerSkin));
			Npc_RemoveInvItems(other,ItAt_SharkSkin,Npc_HasItems(other,ItAt_SharkSkin));
		};
		if(Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_15B");	//Kůže z divočáka. Velmi dobré...
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Addon_KeilerFur) * Value_Keilerfur);
			Npc_RemoveInvItems(other,ItAt_Addon_KeilerFur,Npc_HasItems(other,ItAt_Addon_KeilerFur));
		};
		if(Npc_HasItems(other,ItAt_SheepFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//Ovčí kůže? Nezabil jsi nějakému farmáři ovci na pastvě, že ne?
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//To bych si nedovolil.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_SheepFur) * Value_SheepFur);
			Npc_RemoveInvItems(other,ItAt_SheepFur,Npc_HasItems(other,ItAt_SheepFur));
		};
		if((Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0))
		{
			wolffur = Npc_HasItems(other,ItAt_WolfFur);
			icewolffur = Npc_HasItems(other,ItAt_IceWolfFur);
			summwolf = (wolffur * Value_WolfFur) + (icewolffur * Value_IceWolfFur);

			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//Vlčí kůže, výborné...
			B_GiveInvItems(self,other,ItMi_Gold,summwolf);
			Npc_RemoveInvItems(other,ItAt_WolfFur,Npc_HasItems(other,ItAt_WolfFur));
			Npc_RemoveInvItems(other,ItAt_IceWolfFur,Npc_HasItems(other,ItAt_IceWolfFur));
		};
		if((Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0))
		{
			wargfur = Npc_HasItems(other,ItAt_WargFur);
			dogfur = Npc_HasItems(other,ItAt_OrcDogFur);
			wargfur = wargfur + dogfur;

			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//Kůže warga? Pěkně nebezpečné potvory...
			B_GiveInvItems(self,other,ItMi_Gold,wargfur * Value_WargFur);
			Npc_RemoveInvItems(other,ItAt_WargFur,Npc_HasItems(other,ItAt_WargFur));
			Npc_RemoveInvItems(other,ItAt_OrcDogFur,Npc_HasItems(other,ItAt_OrcDogFur));
		};
		if((Npc_HasItems(other,itat_pumafur) > 0) || (Npc_HasItems(other,ItAt_WhitePuma) > 0))
		{
			pumafur = Npc_HasItems(other,itat_pumafur);
			icepumafur = Npc_HasItems(other,ItAt_WhitePuma);
			summpuma = (pumafur * Value_PumaFur) + (icepumafur * Value_IcePumaFur);

			AI_Output(self,other,"DIA_Bosper_SellFur_11_14");	//Panteří kůže? Velmi vzácná na tuto oblast.
			B_GiveInvItems(self,other,ItMi_Gold,summpuma);
			Npc_RemoveInvItems(other,itat_pumafur,Npc_HasItems(other,itat_pumafur));
			Npc_RemoveInvItems(other,ItAt_WhitePuma,Npc_HasItems(other,ItAt_WhitePuma));
		};
		if(Npc_HasItems(other,ItAt_ShadowFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//Teda... (překvapeně) Ty máš kůži z stínové šelmy? Má velkou cenu!
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_ShadowFur) * Value_ShadowFur);
			Npc_RemoveInvItems(other,ItAt_ShadowFur,Npc_HasItems(other,ItAt_ShadowFur));
		};
		if((Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0))
		{
			if(Bosper_TrollFurSold == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//A co je k čertu tohle?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//Stáhnul jsem ji z trola.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//Teda... stojí hotové jmění!
				Bosper_TrollFurSold = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//Další trolí kůže! Lovíš je schválně?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//Když nějakého potkám, nemůžu si prostě pomoct...
			};
			if(Npc_HasItems(other,ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollFur) * Value_TrollFur);
				Npc_RemoveInvItems(other,ItAt_TrollFur,Npc_HasItems(other,ItAt_TrollFur));
			};
			if(Npc_HasItems(other,ItAt_TrollBlackFur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//Kůže černého trola! Páni!
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollBlackFur) * Value_TrollBlackFur);
				Npc_RemoveInvItems(other,ItAt_TrollBlackFur,Npc_HasItems(other,ItAt_TrollBlackFur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//Skvělá práce! Přijď až budeš mít další.
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//Zajímají mě hlavně vlčí kůže, kůže stínových šelem a další.
	};
};


instance DIA_Bosper_Minenanteil(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_Minenanteil_Condition;
	information = DIA_Bosper_Minenanteil_Info;
	description = "Vidím, že prodáváš podíl v dole.";
};

func int DIA_Bosper_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//Vidím, že prodáváš podíl v dole.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//Ehm. O tom nic nevím. Jestli je chceš tak si je vezmi.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bosper_PICKPOCKET(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 900;
	condition = DIA_Bosper_PICKPOCKET_Condition;
	information = DIA_Bosper_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bosper_PICKPOCKET_Condition()
{
	return C_Beklauen(67,120);
};

func void DIA_Bosper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
	Info_AddChoice(DIA_Bosper_PICKPOCKET,Dialog_Back,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bosper_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};

func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};


instance DIA_BOSPER_BRINGARROW(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = dia_bosper_bringarrow_condition;
	information = dia_bosper_bringarrow_info;
	permanent = FALSE;
	description = "Mám pro tebe dopis od Falka.";
};


func int dia_bosper_bringarrow_condition()
{
	if((MIS_LETTERFALK == LOG_Running) && ((Npc_HasItems(hero,itwr_letterfalk) >= 1) || (Npc_HasItems(hero,itwr_letterfalk_open) >= 1)))
	{
		return TRUE;
	};
};

func void dia_bosper_bringarrow_info()
{
	AI_Output(other,self,"DIA_Bosper_BringArrow_01_00");	//Mám pro tebe dopis od Falka.
	AI_Output(self,other,"DIA_Bosper_BringArrow_01_03");	//Dobře, tak mi ho dej.
	if(Npc_HasItems(hero,itwr_letterfalk) >= 1)
	{
		B_GivePlayerXP(150);
		B_GiveInvItems(other,self,itwr_letterfalk,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_05");	//Aha! Tahle zakázka nebude žádný problém.
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_06");	//Tady, vezmi tyto šípy Falkovi.
		B_GiveInvItems(self,other,ITRW_ZUNTARROW,100);
		Npc_RemoveInvItems(self,itwr_letterfalk,1);
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_07");	//A neztrať je... (vážně) Nepoděkoval by ti za to.
		B_LogEntry(TOPIC_LETTERFALK,"Bosper si přečetl dopis a pak mi předal sto šípů, které mám donést Falkovi.");
		BOSPERGIVEARROWS = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(hero,itwr_letterfalk_open) >= 1)
	{
		B_GiveInvItems(other,self,itwr_letterfalk_open,1);
		Npc_RemoveInvItems(self,itwr_letterfalk_open,1);
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_13");	//Tak, koukneme se, kdo mi to píše. Ale co je tohle... je otevřený! Pečeť je zlomená!
		AI_Output(other,self,"DIA_Bosper_BringArrow_01_14");	//Vážně?! Netuším jak se to stalo.
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_17");	//Nevoď mě za nos, hošánku! (rozzlobeně) Takhle se to nestalo!
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_18");	//Lepší bude když mi zmizíš z dohledu než na tobě vyzkouším svůj nový luk.
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_19");	//Nic ode mě nedostaneš. VEN!
		B_LogEntry(TOPIC_LETTERFALK,"Bosper mě vyhodil ze dvěří, protože jsi všiml otevřeného dopisu, který byl pro něho a já ho otevřel. Teď se budu muset Falkovi přiznat.");
		BOSPERREFUSEARROW = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_BOSPER_SHADOWBOW(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = dia_bosper_shadowbow_condition;
	information = dia_bosper_shadowbow_info;
	permanent = FALSE;
	description = "Poznáváš tento luk?";
};

func int dia_bosper_shadowbow_condition()
{
	if((MIS_HUNTERCHALLANGE == LOG_SUCCESS) && (Npc_HasItems(hero,itrw_shadowbow) >= 1) && (TakeShadowBow == TRUE))
	{
		return TRUE;
	};
};

func void dia_bosper_shadowbow_info()
{
	AI_Output(other,self,"DIA_Bosper_ShadowBow_01_00");	//Poznáváš tento luk?
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_01");	//Hmmm, kerenický luk... (zkoumá ho) Tady je značka... Teď už vím komu patří.
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_02");	//Moc ale nerozumím tomu, co ten luk dělá u tebe!
	AI_Output(other,self,"DIA_Bosper_ShadowBow_01_03");	//Falk mi ho dal.
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_04");	//Falk?! Hmmm... (překvapeně) To může mít pouze jedno vysvětlení... máme tu nového mistra!
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_06");	//Přijmi mou gratulaci, hochu! Věř mi, málokomu se podaří pyšnit takovým titulem.
	if(Player_IsApprentice == APP_Bosper)
	{
		AI_Output(self,other,"DIA_Bosper_ShadowBow_01_07");	//Samozřejmě jsem nikdy nepochyboval, že dosáhneš toho titulu.
		AI_Output(self,other,"DIA_Bosper_ShadowBow_01_10");	//Říkal jsem si to hned jak jsem tě uviděl u sebe v obchodě.
		AI_Output(self,other,"DIA_Bosper_ShadowBow_01_11");	//A jsem velmi rád, že jsem tě vzal jako svého učedníka.
	};
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_14");	//Patrně potřebuješ šípy k takovému luku.
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_16");	//Můžu ti je vyrobit.
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_17");	//Bohužel, zadarmo to nebude.
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_18");	//Za práci nic nechci, ale materiál potřebuju zaplatit.
	BOSPERMAKESHADOWARROW = TRUE;
};

instance DIA_Bosper_ShadowBowArrowMake(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_ShadowBowArrowMake_condition;
	information = DIA_Bosper_ShadowBowArrowMake_info;
	permanent = FALSE;
	description = "Můžu si je vyrobit sám?";
};

func int DIA_Bosper_ShadowBowArrowMake_condition()
{
	if((BOSPERMAKESHADOWARROW == TRUE) && (Player_IsApprentice == APP_Bosper) && (KNOWHOWTOMAKEARROWS == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_ShadowBowArrowMake_info()
{
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrowMake_01_00");	//Můžu si je vyrobit sám?
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMake_01_01");	//(zamyšleně) Výroba těchto šípů je velké tajemství!
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMake_01_02");	//Ale protože jsi můj učedník tak tě to naučím.
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMake_01_03");	//Řeknu ti co potřebuješ na kerenické šípy.
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMake_01_04");	//Ale chci za to zaplatit. Zadarmo tě to nenaučím.
	Log_CreateTopic(TOPIC_TALENTMAKEARROWS,LOG_NOTE);
	B_LogEntry(TOPIC_TALENTMAKEARROWS,"Jelikož jsem Bosperovým učedníkem, naučí mě vyrábět kerenické šípy.");
};

instance DIA_Bosper_ShadowBowArrowMakeDone(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_ShadowBowArrowMakeDone_condition;
	information = DIA_Bosper_ShadowBowArrowMakeDone_info;
	permanent = TRUE;
	description = "Nauč mě jak vyrobit kerenické šípy. (VB: 5, cena: 3000 zlatých)";
};

func int DIA_Bosper_ShadowBowArrowMakeDone_condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_ShadowBowArrowMake) && (KNOWHOWTOMAKEARROWSKER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_ShadowBowArrowMakeDone_info()
{
	var int kosten;
	var int money;

	kosten = 5;
	money = 3000;

	AI_Output(other,self,"DIA_Bosper_ShadowBowArrowMakeDone_01_00");	//Nauč mě jak vyrobit kerenické šípy.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_03_90");	//Nemáš dostatek zlata! Vrať se později.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_01_01");	//Dobře. Poslouchej pozorně.
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_01_02");	//Tajemství kerenických šípů je v jejich vyvážení. 
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_01_03");	//To je to proč letí dál než je běžné a prorazí i dobrou zbroj.
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_01_04");	//Šíp je z obyčejného dřeva, ale špička je ukována z magické rudy místo z obyčejného železa.
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_01_05");	//A to je všechno.
		hero.lp = hero.lp - kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		RankPoints = RankPoints + kosten;
		Npc_SetTalentSkill(hero,NPC_TALENT_MAKEARROWS,1);
		AI_Print("Naučeno: Výroba kerenických šípů");
		KNOWHOWTOMAKEARROWSKER = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TALENTMAKEARROWS,LOG_NOTE);
		B_LogEntry(TOPIC_TALENTMAKEARROWS,"Materiály pro výrobu KERENICKÝCH ŠÍPŮ: 50x dřík šípu, 50x rudný hrot šípu a pírka harpyje.");
	};
};

instance DIA_BOSPER_SHADOWBOWARROW(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = dia_bosper_shadowbowarrow_condition;
	information = dia_bosper_shadowbowarrow_info;
	permanent = TRUE;
	description = "Potřebuji šípy pro kerenický luk.";
};


func int dia_bosper_shadowbowarrow_condition()
{
	if((BOSPERMAKESHADOWARROW == TRUE) && (BOSPERMAKESHADOWARROWPROGRESS == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_shadowbowarrow_info()
{
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_01_00");	//Potřebuji šípy pro kerenický luk.
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_01_01");	//Žádný problém! Pokud máš zlato.
	if(KNOWSHADOWBOWARROW == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_01_02");	//Kolik?
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_01_03");	//Myslím, že stačí 200 zlatých.
		KNOWSHADOWBOWARROW = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_01_04");	//Znáš mou cenu. 200 zlatých.
	};
	Info_ClearChoices(dia_bosper_shadowbowarrow);
	Info_AddChoice(dia_bosper_shadowbowarrow,"Možná jindy.",dia_bosper_shadowbowarrow_no);
	if(Npc_HasItems(hero,ItMi_Gold) >= 200)
	{
		Info_AddChoice(dia_bosper_shadowbowarrow,"Tady máš zlato.",dia_bosper_shadowbowarrow_yes);
	};
};

func void dia_bosper_shadowbowarrow_no()
{
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_No_01_00");	//Možná jindy.
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_No_01_01");	//Jak myslíš...
	Info_ClearChoices(dia_bosper_shadowbowarrow);
};

func void dia_bosper_shadowbowarrow_yes()
{
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_Yes_01_00");	//Tady máš zlato.
	B_GiveInvItems(other,self,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_Yes_01_01");	//Skvělé okamžitě začnu pracovat.
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_Yes_01_02");	//Kdy budou šípy hotové?
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_Yes_01_03");	//Myslím, že tvou objednávku dodělám až zítra, zatím musíš počkat.
	BOSPERMAKESHADOWARROWPROGRESS = TRUE;
	TIMER_SHADOWBOWARROW = Wld_GetDay();
	Info_ClearChoices(dia_bosper_shadowbowarrow);
};


instance DIA_BOSPER_SHADOWBOWARROWDONE(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = dia_bosper_shadowbowarrowdone_condition;
	information = dia_bosper_shadowbowarrowdone_info;
	permanent = TRUE;
	description = "Jak je na tom má objednávka?";
};


func int dia_bosper_shadowbowarrowdone_condition()
{
	if((BOSPERMAKESHADOWARROW == TRUE) && (BOSPERMAKESHADOWARROWPROGRESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_bosper_shadowbowarrowdone_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrowDone_01_00");	//Jak je na tom má objednávka?

	if(TIMER_SHADOWBOWARROW < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (TIMER_SHADOWBOWARROW < (daynow - 1)))
		{
			AI_Output(self,other,"DIA_Bosper_ShadowBowArrowDone_01_01");	//Vše je připraveno. Padesát kerenických šípů nejlepší kvality.
			B_GiveInvItems(self,other,ITRW_MYHUNTARROW,50);
			AI_Output(self,other,"DIA_Bosper_ShadowBowArrowDone_01_04");	//Ale pokud budeš potřebovat více, klidně se zastav.
			BOSPERMAKESHADOWARROWPROGRESS = FALSE;
			TIMER_SHADOWBOWARROW = 0;
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_ShadowBowArrowDone_01_06");	//Zatím nejsou hotové. Vrať se později!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowDone_01_06");	//Zatím nejsou hotové. Vrať se později!
	};
};

var int BosperBuyMace;

instance DIA_Bosper_CanBuyGoblinWeapon(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_CanBuyGoblinWeapon_Condition;
	information = DIA_Bosper_CanBuyGoblinWeapon_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bosper_CanBuyGoblinWeapon_Condition()
{
	if(Player_IsApprentice != APP_NONE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_CanBuyGoblinWeapon_Info()
{
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_00");	//Počkej, mám pro tebe návrh.
	AI_Output(other,self,"DIA_Bosper_CanBuyGoblinWeapon_01_01");	//Poslouchám.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_02");	//Pokud máš nějaké gobliní klacky, vyměním je s tebou za šípy!
	AI_Output(other,self,"DIA_Bosper_CanBuyGoblinWeapon_01_03");	//Na co je potřebuješ?
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_04");	//Víš, goblini vypadají jako primitivní stvoření, ale ve skutečnosti tomu tak není.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_05");	//Pro své klacky si vybírají co nejrovnější větve a pečlivě je vysušují.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_06");	//Z jednoho takového klacku můžu udělat skvělé šípy a bez předběžného sušení.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_07");	//Gobliní klacky musí být jen trochu upravena. Pro mistra jako já, to není moc těžké.
	AI_Output(other,self,"DIA_Bosper_CanBuyGoblinWeapon_01_08");	//A jak to děláš?
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_09");	//Když řeknu všem o tajemstvích mého řemesla všechno, brzy budu bydlet na ulici.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_10");	//Ale můžeš mi dost pomoci. Přines mi gobliní klacky a já ti dám šípy.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_11");	//Samozřejmě dostaneš méně šípů, než udělám z jednoho klacku. Vzhledem kolik práce tomu věnuji, stále je to výhodná výměna!
	AI_Output(other,self,"DIA_Bosper_CanBuyGoblinWeapon_01_12");	//A kolik šípů dostanu za jeden klacek?
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_13");	//(zamyšleně) No, řekněme, že ti dám dva šípy. Souhlasíš?
	AI_Output(other,self,"DIA_Bosper_CanBuyGoblinWeapon_01_14");	//Dobře, souhlasím.
	BosperBuyMace = TRUE;
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Pokud Bosperovi donesu klacky goblinů, dostanu za každý dva šípy.");
};

instance DIA_Bosper_BuyGoblinWeapon(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_BuyGoblinWeapon_Condition;
	information = DIA_Bosper_BuyGoblinWeapon_Info;
	permanent = TRUE;
	description = "Mám pro tebe pár gobliních klacků.";
};

func int DIA_Bosper_BuyGoblinWeapon_Condition()
{
	if((BosperBuyMace == TRUE) && (Npc_HasItems(hero,ItMw_1h_Bau_Mace) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BuyGoblinWeapon_Info()
{
	var int allarrow;

	allarrow = Npc_HasItems(hero,ItMw_1h_Bau_Mace);
	Npc_RemoveInvItems(hero,ItMw_1h_Bau_Mace,allarrow);
	AI_Output(other,self,"DIA_Bosper_BuyGoblinWeapon_01_00");	//Mám pro tebe pár gobliních klacků.
	AI_Output(self,other,"DIA_Bosper_BuyGoblinWeapon_01_01");	//Tak se ukaž, kolik jich máš...
	AI_Output(self,other,"DIA_Bosper_BuyGoblinWeapon_01_02");	//(radostně) Skvělé! Vezmu je všechny.
	AI_Output(self,other,"DIA_Bosper_BuyGoblinWeapon_01_03");	//Tady jsou tvé šípy.
	B_GiveInvItems(self,other,ItRw_Arrow,allarrow * 2);
};
