
var int CassiaTellsAttila;
var int CassiaRecievePay;

instance DIA_Cassia_EXIT(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 999;
	condition = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Cassia_PICKME(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 900;
	condition = DIA_Cassia_PICKME_Condition;
	information = DIA_Cassia_PICKME_Info;
	permanent = TRUE;
	description = Pickpocket_100_Female;
};

func int DIA_Cassia_PICKME_Condition()
{
	return C_Beklauen(100,400);
};

func void DIA_Cassia_PICKME_Info()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
	Info_AddChoice(DIA_Cassia_PICKME,Dialog_Back,DIA_Cassia_PICKME_BACK);
	Info_AddChoice(DIA_Cassia_PICKME,DIALOG_PICKPOCKET,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,80);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
};


instance DIA_Cassia_Gilde(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Gilde_Condition()
{
	if((Cassia_Gildencheck == TRUE) && (Join_Thiefs == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Gilde_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//Vidím, že ses přidal na stranu práva a řádu.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//Nevadí, že ses stal služebníkem Innose. Jsi jedním z nás. A já doufám, že se nějaký způsob najde
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//Tak teď patříš k Innosově církvi. Fajn, ale ještě pořád jsi jedním z nás - doufám, že jsi na to nezapomněl.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Cassia_Abgelaufen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Abgelaufen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Cassia_Frist == TRUE) && (Cassia_Day < (B_GetDayPlus() - 2)) && (Join_Thiefs != TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Abgelaufen_Info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//Neměl ses vracet!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Cassia_News(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_News_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_News_Info()
{
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//Vidím, že jsi dostal náš dar. Jsem Cassia.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//Dobrá, Cassio, tak mi řekni, proč jsem tady.
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//Upoutal jsi naši pozornost tím, že jsi dokázal získat důvěru jednoho z našich přátel.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//A my ti chceme dát šanci. Můžeš se k nám přidat.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//To se podívejme, kdo sem našel cestu. Attila tě podcenil. Nehodlám udělat stejnou chybu.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//Co to tady kujete?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//Chceme tě připravit o život za to, že jsi donášel na našeho přítele. Proto jsme poslali Attilu.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//Nicméně, tvá přítomnost tady nám poskytuje nové možnosti...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//... co mi chceš nabídnout?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//Můžeš se k nám přidat.
	};
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		Cassia_Gildencheck = TRUE;
	};
	DG_gefunden = TRUE;
};


instance DIA_Cassia_mehr(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent = FALSE;
	description = "Řekni mi o vaší organizaci víc.";
};

func int DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

func void DIA_Cassia_mehr_Info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//Řekni mi o vaší organizaci víc.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//Lidé z města jsou námi trochu znepokojeni. Ale nikdo nezná náš úkryt.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//Ta hrstka lidí, co ví o existenci stok, věří, že jsou zamčené a nikdo se do nich nemůže dostat.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//A dokud se do nich nikdo nedostane, můžeme v klidu pracovat.
};


instance DIA_Cassia_MissingPeople(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent = FALSE;
	description = "Je tu něco, co mi můžeš říct o ztracených obyvatelích?";
};

func int DIA_Cassia_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_00");	//Je tu něco, co mi můžeš říct o ztracených obyvatelích?
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_01");	//Proč bys to chtěl vědet?
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_02");	//Rád bych zjistil, co se jim stalo.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_03");	//Když budeš opouštet stoku, plav mírně doprava po pobreží.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_04");	//Tam najdeš odpovědi na své otázky...
};

instance DIA_Cassia_Vorteil(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent = FALSE;
	description = "Co z toho budu mít, když se k vám přidám?";
};

func int DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

func void DIA_Cassia_Vorteil_Info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//Co z toho budu mít, když se k vám přidám?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//Můžeš se od nás naučit pár zajímavejch věcí - schopnosti, které ti umožní žít v přepychu.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//Ale nemusím se skrývat tady dole, nebo jo?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//(tichý smích) Ne. Musíš jen dodržovat naše pravidla. To je všechno.
};

instance DIA_Cassia_Lernen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 4;
	condition = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent = FALSE;
	description = "Co se od vás můžu naučit?";
};

func int DIA_Cassia_Lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Lernen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//Co se od vás můžu naučit?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//Jesper je mistrem v plížení. Ukáže ti, jak se nehlučně pohybovat.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_98");	//Taky ti může prodat nějaké zbroje.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//Ramirez je výjimečně nadaný zloděj. Jeho ručičkám neodolá žádný zámek.
	AI_Output(self,other,"DIA_Cassia_Lernen_77_11");	//Ale hlavně ti ukáže jak vyrábět zlodějské zbraně.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//A já tě naučím, jak si přivlastňovat obsahy kapes. Cizích.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//Taky ti pomůžu s tím, jak dosáhnout větší obratnosti. Protože obratnost je klíčem ke tvým schopnostem.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_99");	//Taky tě mohu naučit akrobacii.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_97");	//Je to velmi důležitá dovednost. Hlavně v situacích, kdy potřebuješ rychle zareagovat na nebezpečí.
	Log_CreateTopic(TOPIC_ThiefTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_ThiefTeacher,"Cassia mě naučí kapsářství, akrobacii a pomůže mi zvýšit obratnost.");
	B_LogEntry_Quiet(TOPIC_ThiefTeacher,"Ramirez mě může naučit, jak páčit zámky. Taky mi ukáže, jak vyrábět zlodějské zbraně.");
	B_LogEntry_Quiet(TOPIC_ThiefTeacher,"Jesper mě naučí plížení a mohu si u něho i koupit zbroj.");
};

instance DIA_Cassia_Regeln(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent = FALSE;
	description = "Jaká jsou vaše pravidla?";
};

func int DIA_Cassia_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Regeln_Info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//Jaká jsou vaše pravidla?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//Za prvé: Nešpitneš o nás ani slůvko. Nikomu. Nikdy.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Za druhé: Nenecháš se chytit.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Za třetí: Jestli tady dole na někoho vytáhneš zbraň, zabijeme tě.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//A čtvrté, poslední pravidlo je: Každý, kdo se k nám chce přidat, musí prokázat, že k něčemu je.
};

instance DIA_Cassia_Erwischen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent = FALSE;
	description = "Co se stane, když mě chytnou?";
};

func int DIA_Cassia_Erwischen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Erwischen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//Co se stane, když mě chytnou?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//Prostě se nenech chytit, jasné?
};

instance DIA_Cassia_beweisen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent = TRUE;
	description = "Jak mám dokázat, že jsem co k čemu?";
};

var int DIA_Cassia_beweisen_permanent;

func int DIA_Cassia_beweisen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln) && (DIA_Cassia_beweisen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_beweisen_Info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//Jak mám dokázat, že jsem co k čemu?

	if(Join_Thiefs == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//Tak přidáš se k nám, nebo ne?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//Ten paličatej starej alchymista - Constantino - má nádherný prsten.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//Ale jemu vážně není k ničemu. Chci, aby zdobil mou ruku.
		MIS_CassiaRing = LOG_Running;
		DIA_Cassia_beweisen_permanent = TRUE;
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaRing,LOG_Running);
		B_LogEntry(Topic_CassiaRing,"Cassia po mně chce, abych jí přinesl Constantinův prsten.");
	};
};

instance DIA_Cassia_Beitreten(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent = FALSE;
	description = "Dobrá, jdu do toho.";
};

func int DIA_Cassia_Beitreten_Condition()
{
	if((Join_Thiefs == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Beitreten_Info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//Dobrá, jdu do toho.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//Výborně. Dostal jsi šanci prokázat, co v tobě vězí. A jestli se chceš od nás něčemu přiučit, jsi tady vítán.
	Join_Thiefs = TRUE;
};

instance DIA_Cassia_Ablehnen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 9;
	condition = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent = FALSE;
	description = "A co když se k vám nebudu chtít přidat...?";
};

func int DIA_Cassia_Ablehnen_Condition()
{
	if((Join_Thiefs == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Ablehnen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//A co když se k vám nebudu chtít přidat...?

	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//Zahazuješ šanci, která se naskytne jen jednou, ale můžeš jít.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//(vážně) A ani nepomysli na to, že bys nás někomu prozradil. Mohl bys toho trpce litovat.
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Dobrá, jdu do toho.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Musím si to rozmyslet.",DIA_Cassia_Ablehnen_Frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//V tom případě tě zabiju.
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Dobrá, jdu do toho.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen,"No tak si mě zkus zabít.",DIA_Cassia_Ablehnen_Kill);
	};
};

func void DIA_Cassia_Ablehnen_Okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//Dobrá, jdu do toho.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//(usmívá se) Učinil jsi správné rozhodnutí. Jestli uspěješ ve zkoušce, můžeš rozšířit naše řady.
	Join_Thiefs = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

func void DIA_Cassia_Ablehnen_Kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//No tak si mě zkus zabít.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//To je zlé. Měla jsem dojem, že jsi chytřejší.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Ablehnen_Frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//Musím si to rozmyslet.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//Jak chceš. Dávám ti dva dny na rozmyšlenou. Po uplynutí lhůty už se tu nesmíš ukázat.
	Cassia_Day = B_GetDayPlus();
	Cassia_Frist = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

instance DIA_Cassia_BevorLernen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 5;
	condition = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};

func int DIA_Cassia_BevorLernen_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_BevorLernen_Info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");		//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Cassia_BevorLernen_900_02");	//Jasně, žádný problém. Jsi přece jden z nás.
	Cassia_TeachPickpocket = TRUE;
	Cassia_TeachDEX = TRUE;
	Cassia_TeachAcrobat = TRUE;
};

instance DIA_Cassia_TEACH(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 12;
	condition = DIA_Cassia_TEACH_Condition;
	information = DIA_Cassia_TEACH_Info;
	permanent = TRUE;
	description = "Chtěl bych být o něco obratnější.";
};

func int DIA_Cassia_TEACH_Condition()
{
	if(Cassia_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_TEACH_Info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//Chtěl bych být o něco obratnější.

	if((AttilaIsDead == TRUE) && (CassiaRecievePay == FALSE))
	{
		if(CassiaTellsAttila == FALSE)
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_05");	//Ne tak rychle příteli. Než začneme náš trénink musíš pro mě něco udělat.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_06");	//A to co?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_07");	//Zaplatit mi malou kompenzaci za smrt Attily.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_08");	//Dělal pro mě docela důležité úkoly a nyní se můžou zvrtnout v problémy.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_09");	//Kolik chceš?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_10");	//Myslím že 1000 mincí mi bude stačit na zapomnění tohodle nedorozumění.
			CassiaTellsAttila = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_11");	//Tak co třeba malé odškodnění?
		};

		Info_ClearChoices(DIA_Cassia_TEACH);

		if(Npc_HasItems(other,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(DIA_Cassia_TEACH,"Dobře, tady máš.",DIA_Cassia_TEACH_Ok);
		};

		Info_AddChoice(DIA_Cassia_TEACH,"Nemám tolik peněz.",DIA_Cassia_TEACH_No);
		Info_AddChoice(DIA_Cassia_TEACH,"Jestli nechceš navštívit peklo...",DIA_Cassia_TEACH_Damn);

		if(RhetorikSkillValue[1] >= 10)
		{
			Info_AddChoice(DIA_Cassia_TEACH,"Mám na tohle jiný názor.",DIA_Cassia_TEACH_Agreed);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cassia_TEACH);
		Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
		Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
		Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
	};
};

func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

instance DIA_Cassia_Pickpocket(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak vybírat kapsy. (VB: 10)";
};

func int DIA_Cassia_Pickpocket_Condition()
{
	if((Cassia_TeachPickpocket == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE) && (MIS_CassiaRing == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Pickpocket_Info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//Ukaž mi, jak se vybírají kapsy.

	if((AttilaIsDead == TRUE) && (CassiaRecievePay == FALSE))
	{
		if(CassiaTellsAttila == FALSE)
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_05");	//Ne tak rychle příteli. Než začneme náš trénink musíš pro mě něco udělat.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_06");	//A to co?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_07");	//Zaplatit mi malou kompenzaci za smrt Attily.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_08");	//Dělal pro mě docela důležité úkoly a nyní se můžou zvrtnout v problémy.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_09");	//Kolik chceš?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_10");	//Myslím že 1000 mincí mi bude stačit na zapomnění tohodle nedorozumění.
			CassiaTellsAttila = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_11");	//Tak co třeba malé odškodnění?
		};

		Info_ClearChoices(DIA_Cassia_Pickpocket);

		if(Npc_HasItems(other,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(DIA_Cassia_Pickpocket,"Dobře, tady máš.",DIA_Cassia_Pickpocket_Ok);
		};

		Info_AddChoice(DIA_Cassia_Pickpocket,"Nemám tolik peněz.",DIA_Cassia_Pickpocket_No);
		Info_AddChoice(DIA_Cassia_Pickpocket,"Jestli nechceš navštívit peklo...",DIA_Cassia_Pickpocket_Damn);

		if(RhetorikSkillValue[1] >= 10)
		{
			Info_AddChoice(DIA_Cassia_Pickpocket,"Mám na tohle jiný názor.",DIA_Cassia_Pickpocket_Agreed);
		};
	}
	else
	{
		if(b_teachthieftalentfree(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//Jestli chceš někomu vyprázdnit kapsy, rozptyl ho. Prostě si s ním začni povídat, hoďte řeč.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//Zatímco na něj mluvíš, pořádně si ho odhadni. Všímej si nacpaných kapes, šperků nebo kožených řemínků kolem krku. A hlavně si hlídej, jak moc je ten chlápek všímavý.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//Obrat nalitého nádeníka není to samé jako okrást ostražitého obchodníka, měj to na paměti.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//Když budeš neohrabaný, tak samozřejmě bude čuchat zradu. Tak hlavně klídek.
		};
	};
};

var int CassiaAcrobatPerm;

instance DIA_Cassia_Acrobat(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Acrobat_Condition;
	information = DIA_Cassia_Acrobat_Info;
	permanent = TRUE;
	description = "Nauč mě akrobacii. (VB: 10)";
};

func int DIA_Cassia_Acrobat_Condition()
{
	if((Cassia_TeachAcrobat == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE) && (MIS_CassiaRing == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Acrobat_Info()
{
	AI_Output(other,self,"DIA_Cassia_Acrobat_15_00");	//Ukaž mi, jak kontrolovat své tělo - akrobacii.

	if((AttilaIsDead == TRUE) && (CassiaRecievePay == FALSE))
	{
		if(CassiaTellsAttila == FALSE)
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_05");	//Ne tak rychle příteli. Než začneme náš trénink musíš pro mě něco udělat.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_06");	//A to co?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_07");	//Zaplatit mi malou kompenzaci za smrt Attily.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_08");	//Dělal pro mě docela důležité úkoly a nyní se můžou zvrtnout v problémy.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_09");	//Kolik chceš?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_10");	//Myslím že 1000 mincí mi bude stačit na zapomnění tohodle nedorozumění.
			CassiaTellsAttila = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_11");	//Tak co třeba malé odškodnění?
		};

		Info_ClearChoices(DIA_Cassia_Acrobat);

		if(Npc_HasItems(other,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(DIA_Cassia_Acrobat,"Dobře, tady máš.",DIA_Cassia_Acrobat_Ok);
		};

		Info_AddChoice(DIA_Cassia_Acrobat,"Nemám tolik peněz.",DIA_Cassia_Acrobat_No);
		Info_AddChoice(DIA_Cassia_Acrobat,"Jestli nechceš navštívit peklo...",DIA_Cassia_Acrobat_Damn);

		if(RhetorikSkillValue[1] >= 10)
		{
			Info_AddChoice(DIA_Cassia_Acrobat,"Mám na tohle jiný názor.",DIA_Cassia_Acrobat_Agreed);
		};
	}
	else
	{
		if(hero.attribute[ATR_DEXTERITY] >= 120)
		{
			if(B_TeachThiefTalentFree(self,other,NPC_TALENT_ACROBAT))
			{
				AI_Output(self,other,"DIA_Cassia_Acrobat_16_01");	//Budeš moci skákat dál.
				AI_Output(self,other,"DIA_Cassia_Acrobat_16_02");	//Také se méně zraníš při pádu.
				AI_Output(self,other,"DIA_Cassia_Acrobat_16_03");	//Ale nezapomeň, že nejsi nesmrtelný!
				AI_Output(self,other,"DIA_Cassia_Acrobat_16_04");	//Akrobacie je velmi užitečná v boji!
				AI_Output(self,other,"DIA_Cassia_Acrobat_16_05");	//Dokážeš rychle změnit vzdálenost mezi sebou a nepřítelem.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Cassia_Acrobat_16_98");	//Nejsi na to dost obratný.
			AI_Output(self,other,"DIA_Cassia_Acrobat_16_99");	//Možná později.

			if(CassiaAcrobatPerm == FALSE)
			{
				B_LogEntry_Quiet(TOPIC_ThiefTeacher,"Pro naučení akrobacie musím být obratnější. (Obratnost: 120 a více)");
				CassiaAcrobatPerm = TRUE;
			};
		};
	};
};

func void DIA_Cassia_Pickpocket_Ok()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Ok_16_01");	//Dobře, tady máš.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Ok_16_02");	//Vynikající! Nyní můžem začít pracovat. 
	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Pickpocket);
};

func void DIA_Cassia_Pickpocket_No()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_No_16_01");	//Nemám tolik peněz.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_No_16_02");	//Tak je najdi! Nebo můžeš zapomenout na trénink.
	Info_ClearChoices(DIA_Cassia_Pickpocket);
};

func void DIA_Cassia_Pickpocket_Damn()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Damn_16_01");	//Jestli nechceš navštívit peklo...
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_02");	//Myslím, že to bylo od tebe dost odvážný.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_03");	//Budu muset začít s lekcí dobrých mravů.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Pickpocket_Agreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_01");	//Mám na tohle jiný názor.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_02");	//Hmmm... zajímavé... jaký?
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_03");	//Attila mě chtěl zabít! Beztak to bylo na tvůj rozkaz.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_04");	//Skutečnost že neuspěl znamená že pro tyto případy musíme vybírat pečlivěji lidi s většími zkušenostmi.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_05");	//Byl často nemocný, jestli je to pro tebe důležité. Dlouho poté by jiné případy neměl.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_06");	//Takže vinu za jeho smrt neseš ty, a nikdo jiný.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_07");	//No, dobře! Děvko, ty dcero... Myslím že za to teda můžu já.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_08");	//Zapomeňme na to nedorozumění a pojďme podnikat dále.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_09");	//Tak, co si teda přeješ?

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Pickpocket);
};

func void DIA_Cassia_Acrobat_Ok()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Ok_16_01");	//Dobře, tady máš.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Ok_16_02");	//Vynikající! Nyní můžem začít pracovat. 
	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Acrobat);
};

func void DIA_Cassia_Acrobat_No()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_No_16_01");	//Nemám tolik peněz.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_No_16_02");	//Tak je najdi! Nebo můžeš zapomenout na trénink.
	Info_ClearChoices(DIA_Cassia_Acrobat);
};

func void DIA_Cassia_Acrobat_Damn()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Damn_16_01");	//Jestli nechceš navštívit peklo...
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_02");	//Myslím, že to bylo od tebe dost odvážný.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_03");	//Budu muset začít s lekcí dobrých mravů.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Acrobat_Agreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_01");	//Mám na tohle jiný názor.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_02");	//Hmmm... zajímavé... jaký?
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_03");	//Attila mě chtěl zabít! Beztak to bylo na tvůj rozkaz.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_04");	//Skutečnost že neuspěl znamená že pro tyto případy musíme vybírat pečlivěji lidi s většími zkušenostmi.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_05");	//Byl často nemocný, jestli je to pro tebe důležité. Dlouho poté by jiné případy neměl.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_06");	//Takže vinu za jeho smrt neseš ty, a nikdo jiný.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_07");	//No, dobře! Děvko, ty dcero... Myslím že za to teda můžu já.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_08");	//Zapomeňme na to nedorozumění a pojďme podnikat dále.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_09");	//Tak, co si teda přeješ?

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Acrobat);
};

func void DIA_Cassia_TEACH_Ok()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Ok_16_01");	//Dobře, tady máš.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Ok_16_02");	//Vynikající! Nyní můžem začít pracovat. 
	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_No()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_No_16_01");	//Nemám tolik peněz.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_No_16_02");	//Tak je najdi! Nebo můžeš zapomenout na trénink.
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_Damn()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Damn_16_01");	//Jestli nechceš navštívit peklo...
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_02");	//Myslím, že to bylo od tebe dost odvážný.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_03");	//Budu muset začít s lekcí dobrých mravů.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_TEACH_Agreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_01");	//Mám na tohle jiný názor.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_02");	//Hmmm... zajímavé... jaký?
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_03");	//Attila mě chtěl zabít! Beztak to bylo na tvůj rozkaz.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_04");	//Skutečnost že neuspěl znamená že pro tyto případy musíme vybírat pečlivěji lidi s většími zkušenostmi.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_05");	//Byl často nemocný, jestli je to pro tebe důležité. Dlouho poté by jiné případy neměl.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_06");	//Takže vinu za jeho smrt neseš ty, a nikdo jiný.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_07");	//No, dobře! Děvko, ty dcero... Myslím že za to teda můžu já.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_08");	//Zapomeňme na to nedorozumění a pojďme podnikat dále.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_09");	//Tak, co si teda přeješ?

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_TEACH);
};

instance DIA_Cassia_Aufnahme(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent = FALSE;
	description = "Dostal jsem Constantinův prsten.";
};

func int DIA_Cassia_Aufnahme_Condition()
{
	if((MIS_CassiaRing == LOG_Running) && (Npc_HasItems(other,ItRi_Prot_Point_01_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Aufnahme_Info()
{
	B_GivePlayerXP(XP_CassiaRing);
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//Dostal jsem Constantinův prsten.
	B_GiveInvItems(other,self,ItRi_Prot_Point_01_MIS,1);
	Npc_RemoveInvItems(self,ItRi_Prot_Point_01_MIS,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//Gratuluju. Prošel jsi vstupní zkouškou. Teď se můžeš považovat za jedného z nás.
	MIS_CassiaRing = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_CassiaRing,LOG_SUCCESS);
	B_LogEntry(Topic_CassiaRing,"Cassia se mnou byla spokojená.");
};


instance DIA_Cassia_In_Guild_Invite(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_In_Guild_Invite_condition;
	information = DIA_Cassia_In_Guild_Invite_info;
	permanent = FALSE;
	description = "Jsem připraven přidat sa k cechu zlodějů.";
};

func int DIA_Cassia_In_Guild_Invite_condition()
{
	if(MIS_CassiaRing == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Cassia_In_Guild_Invite_info()
{
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW))
	{
		AI_Output(other,self,"DIA_Cassia_In_Guild_Invite_01_01");	//Jsem připraven přidat sa k cechu zlodějů.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_00");	//Promiň chlape, ale náboženské fanatiky nepřijímáme.
		AI_StopProcessInfos(self);
	}
	else
	{
		Snd_Play("LEVELUP");
		IS_LOVCACH = TRUE;
		Knows_SecretSign = TRUE;

		if(AttilaIsDead == FALSE)
		{
			THIEF_REPUTATION = THIEF_REPUTATION + 3;
		};

		AI_Output(other,self,"DIA_Cassia_In_Guild_Invite_01_01");	//Jsem připraven přidat sa k cechu zlodějů.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_02");	//Gratuluju. Teď je z tebe pravý člen cechu zlodějů.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_03");	//Zvolil sis cestu zloděje a mistra meče.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_04");	//Časem se ti otevře mnoho nových možností.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_05");	//Zlepši své schopnosti a nauč se ovládat své tělo, šermování a střílení z luku.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_06");	//A jsem si jistá, že co nevidět budeš stát mezi ostatními slavnými zloději Khorinisu.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_07");	//Například jako můj mentor Fingers.
		AI_Output(other,self,"DIA_Cassia_In_Guild_Invite_01_08");	//Díky.
		AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//Vezmi si tenhle klíč. Je od dveří od hotelu. (úsměv) Tak nebudeš muset pokaždé plavat.
		B_GiveInvItems(self,other,ItKe_XhiefGuildKey_Hotel_MIS,1);
		AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//Taky bys měl vědět, že máme tajné znamení. Zvláštní kývnutí.
		AI_PlayAni(self,"T_YES");
		AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//Přesně. Když budeš mluvit s tím pravým člověkem a uděláš tenhle posunek, bude vědět, že jsi jedním z nás.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_09");	//Nezapomeň se stavit za Ramirezem, myslím, že tě chtěl něco naučit.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_10");	//Prvý krát to udělá zdarma.
		B_LogEntry(Topic_Diebesgilde,"Byl jsem přijat do zlodějského cechu. Cassie mi odporučila jít za Ramirezem.");
	};
};

instance DIA_Cassia_Fingers(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Fingers_Condition;
	information = DIA_Cassia_Fingers_Info;
	permanent = FALSE;
	description = "Fingers byl tvůj mentor?";
};

func int DIA_Cassia_Fingers_Condition()
{
	if((IS_LOVCACH == TRUE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Fingers_Info()
{
	AI_Output(other,self,"DIA_Cassia_Fingers_01_00");	//Fingers byl tvůj mentor?
	AI_Output(self,other,"DIA_Cassia_Fingers_01_01");	//Ano, byl to on kdo mě naučil všechno co teď umím.
	AI_Output(other,self,"DIA_Cassia_Fingers_01_02");	//A kde je teď?
	AI_Output(self,other,"DIA_Cassia_Fingers_01_03");	//Neslyšela jsem o něm ani slovo od kdy ho odvlekli do kolonie.
	AI_Output(self,other,"DIA_Cassia_Fingers_01_04");	//Takže jestli se o něm něco dozvíš, dej mi vědět.
	AI_Output(other,self,"DIA_Cassia_Fingers_01_05");	//Dobrá.
	MIS_WhereFingers = LOG_Running;
	Log_CreateTopic(Topic_WhereFingers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WhereFingers,LOG_Running);
	B_LogEntry(TOPIC_WhereFingers,"Cassia by ráda věděla co se stalo jejímu mentorovi Fingersovi.");
};

instance DIA_Cassia_Fingers_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Fingers_Done_Condition;
	information = DIA_Cassia_Fingers_Done_Info;
	permanent = FALSE;
	description = "Našel jsem tvého mentora.";
};

func int DIA_Cassia_Fingers_Done_Condition()
{
	if((MIS_WhereFingers == LOG_Running) && (FingersMeet == TRUE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Fingers_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Cassia_Fingers_Done_01_00");	//Našel jsem tvého mentora.
	AI_Output(self,other,"DIA_Cassia_Fingers_Done_01_01");	//Skutečně? A co s ním?
	AI_Output(other,self,"DIA_Cassia_Fingers_Done_01_02");	//Je v pořádku a vede si dobře.
	AI_Output(self,other,"DIA_Cassia_Fingers_Done_01_03");	//To jsou skvělé správy. Doufám, že se k nám jednoho dne vrátí.
	AI_Output(self,other,"DIA_Cassia_Fingers_Done_01_04");	//A vše bude jak kdysi.
	MIS_WhereFingers = LOG_Success;
	Log_SetTopicStatus(TOPIC_WhereFingers,LOG_Success);
	B_LogEntry(TOPIC_WhereFingers,"Cassiu potěšilo, že je její mentor naživu.");
};


instance DIA_Cassia_Fingers_Dead(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Fingers_Dead_Condition;
	information = DIA_Cassia_Fingers_Dead_Info;
	permanent = FALSE;
	description = "Našel jsem tvého mentora.";
};

func int DIA_Cassia_Fingers_Dead_Condition()
{
	if((MIS_WhereFingers == LOG_Running) && (FingersIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Fingers_Dead_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Cassia_Fingers_Dead_01_00");	//Našel jsem tvého mentora.
	AI_Output(self,other,"DIA_Cassia_Fingers_Dead_01_01");	//Skutečně? A co s ním?
	AI_Output(other,self,"DIA_Cassia_Fingers_Dead_01_02");	//Je mrtvý.
	AI_Output(self,other,"DIA_Cassia_Fingers_Dead_01_03");	//To jsou špatné zprávy, ale nejako to přežiju.
	AI_Output(self,other,"DIA_Cassia_Fingers_Dead_01_04");	//V každém případě, díky.
	MIS_WhereFingers = LOG_Success;
	Log_SetTopicStatus(TOPIC_WhereFingers,LOG_Success);
	B_LogEntry(TOPIC_WhereFingers,"Cassia byla zklamána ze smrti svého mentora.");
};

instance DIA_Cassia_Versteck(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent = FALSE;
	description = "Tak kde ukrýváte svou kořist?";
};

func int DIA_Cassia_Versteck_Condition()
{
	if((IS_LOVCACH == TRUE) && Npc_KnowsInfo(other,DIA_Ramirez_Beute))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Versteck_Info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//Tak kde ukrýváte svou kořist?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//Hele, snad si vážně nemyslíš, že ti tohle řeknu?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//Budeš mít dost příležitostí, aby sis užil své vlastní kořisti. Pamatuj - kdo je moc nenasytný, skončí s prázdnýma rukama.
};

instance DIA_Cassia_Blutkelche(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent = TRUE;
	description = "Máš pro mě práci?";
};

func int DIA_Cassia_Blutkelche_Condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_CassiaKelche == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Blutkelche_Info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//Máš pro mě práci?

	if(hero.attribute[ATR_DEXTERITY] >= 50)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//Ano. Je tady sada kalichů. Je jich šest.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//Král Rhobar je získal na jedné ze svých válečných výprav - ale obětoval mnoho mužů na to, aby si je mohl odvézt. Proto se jim říká Krvavé kalichy.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//Žádný z těch kalichů nemá sám o sobě velkou cenu - ale všech šest pohromadě představuje celé jmění.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//Kde jsou ty kalichy?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//Jsou tady, ve městě - patří bohatým obchodníkům z horní čtvrti.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//Přines mi je. Já se zatím pokusím sehnat na ně kupce.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//Co z toho budu mít?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//Buď polovinu zisku, nebo si můžeš vzít jeden zajímavý předmět z mé kořisti.
		MIS_CassiaKelche = LOG_Running;
		Log_CreateTopic(Topic_CassiaKelche,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaKelche,LOG_Running);
		B_LogEntry(Topic_CassiaKelche,"Cassia mě požádala, abych jí přinesl šest Krvavých kalichů. Nejspíš je všechny najdu kdesi ve městě.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_20");	//Hmm... Promiň, ale s tvou obratností ukradneš leda tak opilcovi prázdnou flašku.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_21");	//Nejdřív budeš muset zlepšit své zlodějské schopnosti.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_22");	//Pak tady pro tebe možná bude práce.
	};
};

instance DIA_Cassia_abgeben(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent = TRUE;
	description = "O Krvavých kališích...";
};

func int DIA_Cassia_abgeben_Condition()
{
	if(MIS_CassiaKelche == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Cassia_abgeben_Info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//O Krvavých kališích...

	if(B_GiveInvItems(other,self,ItMi_ZloodCup_MIS,6))
	{
		B_GivePlayerXP(XP_CassiaBlutkelche);
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//Mám všech šest kalichů.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//Dobrá práce. Já jsem zatím našla kupce.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//Můžeš si hned vzít svou odměnu. Dík, žes to pro mě udělal.
		Npc_RemoveInvItems(self,ItMi_ZloodCup_MIS,6);
		THIEF_REPUTATION = THIEF_REPUTATION + 3;
		MIS_CassiaKelche = LOG_SUCCESS;
		Log_SetTopicStatus(Topic_CassiaKelche,LOG_SUCCESS);
		B_LogEntry(Topic_CassiaKelche,"Donesl jdsem Cassii všech šest kalichů.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//Můžu ty kalichy prodat jen jako sadu. Přines mi je všechny.
	};
};


instance DIA_Cassia_Belohnung(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent = FALSE;
	description = "Přišel jsem si pro svoji odměnu.";
};

func int DIA_Cassia_Belohnung_Condition()
{
	if(MIS_CassiaKelche == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Cassia_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//Přišel jsem si pro svoji odměnu.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//Co sis vybral?
	Info_ClearChoices(DIA_Cassia_Belohnung);
	Info_AddChoice(DIA_Cassia_Belohnung,"1500 zlatých.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice(DIA_Cassia_Belohnung,"10 elixírů hojivé síly.",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice(DIA_Cassia_Belohnung,"Prsten podvodníka.",DIA_Cassia_Belohnung_Ring);
};

func void DIA_Cassia_Belohnung_Gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//Dej mi zlato.
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//Dej mi lektvary.
	B_GiveInvItems(self,other,ItPo_Health_03,10);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//Dej mi prsten.
	B_GiveInvItems(self,other,itri_dex_03,1);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

instance DIA_Cassia_In_Guild(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_In_Guild_condition;
	information = DIA_Cassia_In_Guild_info;
	permanent = FALSE;
	description = "Nějaké další objednávky?";
};

func int DIA_Cassia_In_Guild_condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_CassiaKelche == LOG_SUCCESS) && (hero.attribute[ATR_DEXTERITY] >= 75))
	{
		return TRUE;
	};
};

func void DIA_Cassia_In_Guild_info()
{
	AI_Output(other,self,"DIA_Cassia_In_Guild_01_01");	//Nějaké další objednávky?
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_02");	//Jasně, pro lidy jako jsi ty mám vždycky práci.
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_03");	//Jeden z našich... pravidelných zákazníků si objednal zasvěcenou sošku Innose.
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_04");	//A je ochotný za ni dobře zaplatit. Máš zájem?
	AI_Output(other,self,"DIA_Cassia_In_Guild_01_05");	//Samozřejmě.
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_06");	//Výborně! Tady jsou detaily...
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_07");	//Buď opatrný - nechci dát našemu zákazníkovy padělek.
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_08");	//A sehnat tuhle sošku nebude jednoduché.
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_09");	//Až bude soška naše můžeme si pohovořit o tvé odměně.
	MISS_KASSIA_IN_GUILD = LOG_Running;
	Log_CreateTopic(TOPIC_CASSIA_STATUETTE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_Running);
	B_LogEntry(TOPIC_CASSIA_STATUETTE,"Cassia po mě chce zasvěcenou sošku Innose. Ale varovala mě, že můžu narazit i na padělek.");
};

instance DIA_Cassia_In_Guild_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_In_Guild_Done_condition;
	information = DIA_Cassia_In_Guild_Done_info;
	permanent = FALSE;
	description = "Mám tu sošku.";
};

func int DIA_Cassia_In_Guild_Done_condition()
{
	if((Npc_HasItems(hero,ItMi_LostInnosStatue_Daron) || Npc_HasItems(hero,ItMi_GoblinnosStatue_Daron_New)) && (MISS_KASSIA_IN_GUILD == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_In_Guild_Done_info()
{
	AI_Output(other,self,"DIA_Cassia_In_Guild_Done_01_01");	//Mám tu sošku.

	if(Npc_HasItems(hero,ItMi_LostInnosStatue_Daron) && Npc_HasItems(hero,ItMi_GoblinnosStatue_Daron_New))
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(hero,self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItems(self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItems(hero,ItMi_GoblinnosStatue_Daron_New,1);
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_02");	//Ano to vidím. A přinesl jsi i další - falošnou.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_03");	//Dobrá, skuśim ji prodat.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_04");	//Co se tebe týče, skvělá práce.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_05");	//Tady, vem si tenhle lektvar.
		B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
		THIEF_REPUTATION = THIEF_REPUTATION + 3;
		MISS_KASSIA_IN_GUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_SUCCESS);
		B_LogEntry(TOPIC_CASSIA_STATUETTE,"Cassia byla potěšena mou prací.");
	}
	else if(Npc_HasItems(hero,ItMi_GoblinnosStatue_Daron_New))
	{
		B_GivePlayerXP(100);
		B_GiveInvItems(hero,self,ItMi_GoblinnosStatue_Daron_New,1);
		Npc_RemoveInvItems(self,ItMi_GoblinnosStatue_Daron_New,1);
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_06");	//Ano to vidím. Ale na mé velké zklamání je to jen padělek.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_07");	//Dobrá, skuśim ji prodat.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_08");	//Co se tebe týče, jsem sklamaná.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_09");	//Ale neboj, nic proti tobě nemám.
		THIEF_REPUTATION = THIEF_REPUTATION + 1;
		MISS_KASSIA_IN_GUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_SUCCESS);
		B_LogEntry(TOPIC_CASSIA_STATUETTE,"Cassia by sklamaná, že jsem ji donesl padělek.");
	}
	else if(Npc_HasItems(hero,ItMi_LostInnosStatue_Daron))
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(hero,self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItems(self,ItMi_LostInnosStatue_Daron,1);
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_10");	//Ano to vidím.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_11");	//Zákazník bude spokojen.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_12");	//Co se tebe týče, skvělá práce.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_13");	//Tady je tvá odměna.
		B_GiveInvItems(self,other,ItMi_Gold,350);
		THIEF_REPUTATION = THIEF_REPUTATION + 2;
		MISS_KASSIA_IN_GUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_SUCCESS);
		B_LogEntry(TOPIC_CASSIA_STATUETTE,"Cassia byla potěšena mou prací.");
	};
};

instance DIA_CASSIA_ANOTHERJOB(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = dia_cassia_anotherjob_condition;
	information = dia_cassia_anotherjob_info;
	permanent = FALSE;
	description = "A co nějaká práce pro mě mimo město?";
};

func int dia_cassia_anotherjob_condition()
{
	if((IS_LOVCACH == TRUE) && (MISS_KASSIA_IN_GUILD == LOG_SUCCESS) && (hero.attribute[ATR_DEXTERITY] >= 100))
	{
		return TRUE;
	};
};

func void dia_cassia_anotherjob_info()
{
	AI_Output(other,self,"DIA_Cassia_AnotherJob_15_00");	//A co nějaká práce pro mě mimo město?
	AI_Output(self,other,"DIA_Cassia_AnotherJob_16_03");	//Hm... Něco by tu bylo, ale je to složité. Můžeš to zkusit.
	AI_Output(other,self,"DIA_Cassia_AnotherJob_16_99");	//Co to je?
	AI_Output(self,other,"DIA_Cassia_AnotherJob_16_04");	//Jeden blázen mě požádal, abych mu donesla číši rudobarona. Říká, že mu donese štěstí.
	AI_Output(self,other,"DIA_Cassia_AnotherJob_16_05");	//Ten idiot. A kde ten rudobaron vězí...? Nicméně, za tuhle vykonanou prácičku bude velkorysá odměna.
	AI_Output(other,self,"DIA_Cassia_AnotherJob_15_06");	//A předpokládám, že ta číše je na hradě v Hornickém údolí, že?
	AI_Output(self,other,"DIA_Cassia_AnotherJob_16_07");	//Ano, někde tam, ale nevím, kde.
	AI_Output(other,self,"DIA_Cassia_AnotherJob_15_09");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_Cassia_AnotherJob_16_10");	//Jako vždy, buď polovinu zisku nebo si můžeš vybrat nějaké věci z mé kořisti.
	AI_Output(other,self,"DIA_Cassia_AnotherJob_16_98");	//Dobrá.
	MIS_CASSIAGOLDCUP = LOG_Running;
	Log_CreateTopic(TOPIC_CASSIAGOLDCUP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CASSIAGOLDCUP,LOG_Running);
	B_LogEntry(TOPIC_CASSIAGOLDCUP,"Cassia chce, abych přinesl číši rudobarona. Je někde na hradě v Hornickém údolí.");
};

instance DIA_CASSIA_ANOTHERJOB2(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = dia_cassia_anotherjob2_condition;
	information = dia_cassia_anotherjob2_info;
	permanent = TRUE;
	description = "Našel jsem číši rudobarona...";
};

func int dia_cassia_anotherjob2_condition()
{
	if((MIS_CASSIAGOLDCUP == LOG_Running) && (Npc_HasItems(hero,ITMI_GOMEZGOLDCUP) >= 1))
	{
		return TRUE;
	};
};

func void dia_cassia_anotherjob2_info()
{
	AI_Output(other,self,"DIA_Cassia_AnotherJob2_15_00");	//Našel jsem číši rudobarona...

	if(B_GiveInvItems(other,self,ITMI_GOMEZGOLDCUP,1))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Cassia_AnotherJob2_15_01");	//Ale bylo to opravdu těžké.
		AI_Output(self,other,"DIA_Cassia_AnotherJob2_16_02");	//Přiznávám - ohromils mě.
		AI_Output(self,other,"DIA_Cassia_AnotherJob2_16_03");	//Můžeš si vybrat svou odměnu. Díky, žes to zmáknul.
		Npc_RemoveInvItems(self,ITMI_GOMEZGOLDCUP,1);
		THIEF_REPUTATION = THIEF_REPUTATION + 4;
		MIS_CASSIAGOLDCUP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIAGOLDCUP,LOG_SUCCESS);
		B_LogEntry(TOPIC_CASSIAGOLDCUP,"Našel jsem pro Cassii číši rudobarona.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_AnotherJob2_16_99");	//A kde je?!
	};
};

instance DIA_CASSIA_BELOHNUNG2(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = dia_cassia_belohnung2_condition;
	information = dia_cassia_belohnung2_info;
	permanent = FALSE;
	description = "Chci si vybrat svou odměnu za číši rudobarona.";
};

func int dia_cassia_belohnung2_condition()
{
	if(MIS_CASSIAGOLDCUP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_cassia_belohnung2_info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung2_15_00");	//Chci si vybrat svou odměnu za číši rudobarona.
	AI_Output(self,other,"DIA_Cassia_Belohnung2_15_97");	//Tady, vezmi si tyhle kamenné tabulky.
	B_GiveInvItems(self,other,ItWr_HitPointStonePlate1_Addon,2);
	AI_Output(self,other,"DIA_Cassia_Belohnung2_15_98");	//Já jsem nedokázala rozluštit co je na nich napsané, ale ty to určitě dokážeš.
};

instance DIA_CASSIA_GUILDKILL(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = dia_cassia_guildkill_condition;
	information = dia_cassia_guildkill_info;
	permanent = FALSE;
	description = "Víš něco o cechu vrahů?";
};

func int dia_cassia_guildkill_condition()
{
	if((MIS_GUILDKILL == LOG_Running) && (IS_LOVCACH == TRUE) && (CANCOMPLETEGUILDKILL == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_guildkill_info()
{
	AI_Output(other,self,"DIA_Cassia_GuildKill_01_00");	//Víš něco o cechu vrahů?
	AI_Output(self,other,"DIA_Cassia_GuildKill_01_01");	//Cechu vrahů?!... (vystrašeně) Proč se ptáš?!
	AI_Output(other,self,"DIA_Cassia_GuildKill_01_02");	//No, řekněme, že s nimi mám jakýsi malý obchod.
	AI_Output(self,other,"DIA_Cassia_GuildKill_01_03");	//Víš, raději se držím od takových lidí dál! Ale jestli to opravdu potřebuješ tak...
	AI_Output(self,other,"DIA_Cassia_GuildKill_01_04");	//... promluv si s Ramirezem. Myslím, že ti o nich poví víc.
	B_LogEntry(TOPIC_GUILDKILL,"Cassia neví nic o cechu vrahů. Poradila mi, abych si promluvil s Ramirezem. Vypadá to, že je ohledně toho cechu více informovaný.");
};


instance DIA_Cassia_Quest_Music(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 999;
	condition = DIA_Cassia_Quest_Music_condition;
	information = DIA_Cassia_Quest_Music_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Cassia_Quest_Music_condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_CASSIAGOLDCUP == LOG_SUCCESS) && (Npc_KnowsInfo(hero,dia_jesper_quest) == TRUE) && (Kapitel >= 2) && (hero.attribute[ATR_DEXTERITY] >= 125) && (MIS_FindKillPlace == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Quest_Music_info()
{
	AI_Output(self,other,"DIA_Cassia_Quest_Music_01_01");	//Počkej chvíli. Mám pro tebe práci.
	AI_Output(other,self,"DIA_Cassia_Quest_Music_01_02");	//O co jde?
	AI_Output(self,other,"DIA_Cassia_Quest_Music_01_03");	//Nedávno jsme dostali velmi dobře placenou zakázku a já jsem ochotná udělat cokoli abychom ji splnili.
	AI_Output(self,other,"DIA_Cassia_Quest_Music_01_04");	//Potřebuji hudebné nástroje - loutnu, dudy, harfu a trumšajt.
	AI_Output(self,other,"DIA_Cassia_Quest_Music_01_05");	//Nezajímá mě odkud je sebereš, jen mi je dones co nejdřív.
	AI_Output(other,self,"DIA_Cassia_Quest_Music_01_06");	//Dobrá.
	MIS_KASSIAMUSIC = LOG_Running;
	Log_CreateTopic(TOPIC_KASSIAMUSIC,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KASSIAMUSIC,LOG_Running);
	B_LogEntry(TOPIC_KASSIAMUSIC,"Cassia po mě chce štyři hudebné nástroje - loutnu, dudy, harfu a trumšajt.");
};

instance DIA_Cassia_Quest_Music_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_Quest_Music_Done_condition;
	information = DIA_Cassia_Quest_Music_Done_info;
	permanent = FALSE;
	description = "Mám všechny nástroje.";
};

func int DIA_Cassia_Quest_Music_Done_condition()
{
	if((Npc_HasItems(hero,ItMi_IEHarfe) >= 1) && (Npc_HasItems(hero,ItMi_IEDrumScheit) >= 1) && (Npc_HasItems(hero,ItMi_IEDudelBlau) >= 1) && (Npc_HasItems(hero,ItMi_IELaute) >= 1) && (MIS_KASSIAMUSIC == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Quest_Music_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Cassia_Quest_Music_Done_01_01");	//Mám všechny nástroje.
	AI_Output(self,other,"DIA_Cassia_Quest_Music_Done_01_02");	//Skvělé! Dej je sem.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMi_IEHarfe,1);
	Npc_RemoveInvItems(hero,ItMi_IEDudelBlau,1);
	Npc_RemoveInvItems(hero,ItMi_IELaute,1);
	Npc_RemoveInvItems(hero,ItMi_IEDrumScheit,1);
	AI_Output(self,other,"DIA_Cassia_Quest_Music_Done_01_03");	//Dotanu za ně pěknou hromádku zlata.
	AI_Output(other,self,"DIA_Cassia_Quest_Music_Done_01_04");	//A co já?
	AI_Output(self,other,"DIA_Cassia_Quest_Music_Done_01_05");	//Jsem ji jistá, že oceníš mou vděčnost...
	B_GiveInvItems(self,other,ItMi_Gold,500);
	THIEF_REPUTATION = THIEF_REPUTATION + 4;
	MIS_KASSIAMUSIC = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KASSIAMUSIC,LOG_SUCCESS);
	B_LogEntry(TOPIC_KASSIAMUSIC,"Cassia mi za hudebné nástroje dala hromádku zlata.");
};

instance DIA_Cassia_MagicBook(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_MagicBook_condition;
	information = DIA_Cassia_MagicBook_info;
	permanent = FALSE;
	description = "Nevíš náhodou kdo okradl Vatrase?";
};

func int DIA_Cassia_MagicBook_condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_VatrasMagicBook == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_MagicBook_info()
{
	AI_Output(other,self,"DIA_Cassia_MagicBook_01_01");	//Nevíš náhodou kdo okradl Vatrase?
	AI_Output(self,other,"DIA_Cassia_MagicBook_01_02");	//Ale samozřejmě, že vím. (usmívá se) Žádná krádež se nestane bez mého vědomí.
	AI_Output(other,self,"DIA_Cassia_MagicBook_01_03");	//Tak bys mi mohla říct, s kým bych si o tom měl pohovořit.
	AI_Output(self,other,"DIA_Cassia_MagicBook_01_04");	//A proč tě to tak zajímá?
	Info_ClearChoices(DIA_Cassia_MagicBook);
	Info_AddChoice(DIA_Cassia_MagicBook,"Jen tak.",DIA_Cassia_MagicBook_JustInt);
	Info_AddChoice(DIA_Cassia_MagicBook,"Ten bastard by měl být za mřížemi!",DIA_Cassia_MagicBook_Kill);
	Info_AddChoice(DIA_Cassia_MagicBook,"Mám zájem o jednu z věcí, co byla odcizena.",DIA_Cassia_MagicBook_Stolen);

	if(RhetorikSkillValue[1] >= 15)
	{
		Info_AddChoice(DIA_Cassia_MagicBook,"Slyšel jsem nějaké zvěsti...",DIA_Cassia_MagicBook_Rumors);
	};
};

func void DIA_Cassia_MagicBook_JustInt()
{
	AI_Output(other,self,"DIA_Cassia_MagicBook_JustInt_01_01");	//Jen tak.
	AI_Output(self,other,"DIA_Cassia_MagicBook_JustInt_01_02");	//Na tvém místě bych se od toho držela dál.
	AI_Output(self,other,"DIA_Cassia_MagicBook_JustInt_01_03");	//Za takové otázky se můžeš lehko dostat do problémů.
	MagicBookCantFind = TRUE;
	B_LogEntry(TOPIC_VatrasMagicBook,"Je nepravděpodobné, že bych teď zjistil, kdo má Vatrasův denník. Měl bych mu sdělit špatné zprávy.");	
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

func void DIA_Cassia_MagicBook_Kill()
{
	AI_Output(other,self,"DIA_Cassia_MagicBook_Kill_01_01");	//Ten bastard by měl být za mřížemi!
	AI_Output(self,other,"DIA_Cassia_MagicBook_Kill_01_02");	//Není zrovna moc moudré mi říkat takovéhle věci.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Kill_01_03");	//Za to, že to je poprvé ti odpouštím.
	MagicBookCantFind = TRUE;
	B_LogEntry(TOPIC_VatrasMagicBook,"Je nepravděpodobné, že bych teď zjistil, kdo má Vatrasův denník. Měl bych mu sdělit špatné zprávy.");	
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

func void DIA_Cassia_MagicBook_Stolen()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Cassia_MagicBook_Stolen_01_01");	//Mám zájem o jednu z věcí, co byla odcizena.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Stolen_01_02");	//Jakou?
	AI_Output(other,self,"DIA_Cassia_MagicBook_Stolen_01_03");	//Vatrasův denník, nevíš, kde by mohl být?
	AI_Output(self,other,"DIA_Cassia_MagicBook_Stolen_01_04");	//Ne, ale tady ho nenajdeš.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Stolen_01_05");	//Poptej se nejlepších obchodníků na tržišti. Možná má jeden z nich novou knihu na prodej.
	B_LogEntry(TOPIC_VatrasMagicBook,"Cassia mi doporučila se poptát obchodníků na tržišti.");	
	MagicBookFindTrade = TRUE;
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

func void DIA_Cassia_MagicBook_Rumors()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Cassia_MagicBook_Rumors_01_01");	//Slyšel jsem nějaké zvěsti...
	AI_Output(other,self,"DIA_Cassia_MagicBook_Rumors_01_02");	//Chtěli vědět jěstli to daný řemeslník zvládl úplně sám.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Rumors_01_03");	//No, není to tajemství... (usmívá se) Samozřejmě že to byl Ramirez! Jedině on by to zvládl.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Rumors_01_04");	//Takže mu můžeš jít pogratulovat i za mě.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	MagicBookFindTradeExt = TRUE;
	B_LogEntry(TOPIC_VatrasMagicBook,"Cassia mi řekla, že za krádeží stojí Ramirez. On určitě ví, kde se denník nachází.");
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

instance DIA_Cassia_RichStones(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_RichStones_Condition;
	information = DIA_Cassia_RichStones_Info;
	permanent = FALSE;
	description = "Něco nového?";
};

func int DIA_Cassia_RichStones_Condition()
{
	if((IS_LOVCACH == TRUE) && (Kapitel >= 3) && (hero.attribute[ATR_DEXTERITY] >= 150))
	{
		return TRUE;
	};
};

func void DIA_Cassia_RichStones_Info()
{
	AI_Output(other,self,"DIA_Cassia_RichStones_01_00");	//Něco nového?
	AI_Output(self,other,"DIA_Cassia_RichStones_01_01");	//Ano. Dobře že si přišel.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_02");	//Nedávno jsme uslyšeli zvěsti, že paladinové sebou přinesli kopu drahých kamenů.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_03");	//Ale nás zajímá jenom jeden - obrovský rubín, velký skoro jako pěst.
	AI_Output(other,self,"DIA_Cassia_RichStones_01_04");	//Jak o něm víš?
	AI_Output(self,other,"DIA_Cassia_RichStones_01_05");	//Máme své zdroje...
	AI_Output(self,other,"DIA_Cassia_RichStones_01_06");	//Takže chi aby se ten šutr stal ozdobou mých pokladů.
	AI_Output(other,self,"DIA_Cassia_RichStones_01_07");	//Takže ho mám pro tebe ukradnout?
	AI_Output(self,other,"DIA_Cassia_RichStones_01_08");	//Vidím, že jsi všechno pochopil dokonale.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_09");	//Pokud vím, tak by se truhla s těmito poklady měla nacházet na radnici města.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_10");	//A tam je perfektně chráněna.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_11");	//Je tady další problém - ta truhla je opatřena velmi komplikovaným zámkem.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_12");	//Dokonce i Ramirez by měl problém ho otevřít rychle a přesně.
	AI_Output(other,self,"DIA_Cassia_RichStones_01_13");	//A já si podle tebe povedu lépe?
	AI_Output(self,other,"DIA_Cassia_RichStones_01_14");	//Tebe na radnici už poznají, takže nebudeš mít problém se k truhle dostat.
	AI_Output(other,self,"DIA_Cassia_RichStones_01_15");	//Aha a co z toho všeho budu mít?
	AI_Output(self,other,"DIA_Cassia_RichStones_01_16");	//Všechno co najdeš v té truhle je tvoje, okrem rubínu. Dobrá?
	AI_Output(other,self,"DIA_Cassia_RichStones_01_17");	//Skusím to.
	MIS_RichStones = LOG_Running;
	Log_CreateTopic(Topic_RichStones,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichStones,LOG_Running);
	B_LogEntry(TOPIC_RichStones,"Cassia po mě chce abych ukradl rubín z měststké radnice.");
};

instance DIA_Cassia_RichStones_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_RichStones_Done_Condition;
	information = DIA_Cassia_RichStones_Done_Info;
	permanent = FALSE;
	description = "Mám ten šutr!";
};

func int DIA_Cassia_RichStones_Done_Condition()
{
	if((MIS_RichStones == LOG_Running) && (Npc_HasItems(hero,ItMi_BigRuby) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cassia_RichStones_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Cassia_RichStones_Done_01_00");	//Mám ten šutr!
	AI_Output(self,other,"DIA_Cassia_RichStones_Done_01_01");	//Výborně! (radostně) Tak na co čekáš, dej ho sem.
	AI_Output(other,self,"DIA_Cassia_RichStones_Done_01_02");	//Tady je.
	B_GiveInvItems(other,self,ItMi_BigRuby,1);
	Npc_RemoveInvItems(self,ItMi_BigRuby,1);
	AI_Output(other,self,"DIA_Cassia_RichStones_Done_01_03");	//Jen jsem ho chtěl obdivovat trochu déle.
	AI_Output(self,other,"DIA_Cassia_RichStones_Done_01_04");	//Chápu tě. Ne každý den máš šanci mít v rukou něco takového.
	AI_Output(self,other,"DIA_Cassia_RichStones_Done_01_05");	//A podařilo se ti nemyslitelné. Překonal jsi dokonce i Ramireze.
	AI_Output(self,other,"DIA_Cassia_RichStones_Done_01_06");	//Jen mu neříkej, že jsem ti tohle řekla, nepotěšilo by ho to.
	AI_Output(self,other,"DIA_Cassia_RichStones_Done_01_07");	//A skoro bych zapomněla... Tady je tvá odměna.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	THIEF_REPUTATION = THIEF_REPUTATION + 5;
	MIS_RichStones = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RichStones,LOG_SUCCESS);
	B_LogEntry(TOPIC_RichStones,"Cassia byla ráda za svůj nový rubín.");
};

instance DIA_Cassia_DragonTreasure(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_DragonTreasure_Condition;
	information = DIA_Cassia_DragonTreasure_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Cassia_DragonTreasure_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (IS_LOVCACH == TRUE) && (Kapitel >= 4) && (MIS_AllDragonsDead == FALSE) && (hero.attribute[ATR_DEXTERITY] >= 200))
	{
		return TRUE;
	};
};

func void DIA_Cassia_DragonTreasure_Info()
{
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_00");	//Vidím, že jsi zasa zpátky.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_01_01");	//Jen jsem chtěl vědět jak se vám tu daří.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_02");	//Všechno v pořádku... (usmívá se) Slyšela sem, že jdeš znovu do Hornického údolí.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_01_03");	//No... někdo mě požádal abych zabil pár draků.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_04");	//Draků? Tak v tom případě pro tebe mám neodolatelnou nabídku.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_01_05");	//Poslouchám.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_06");	//Podle legend jsou draci velmi nebezpeční tvorové, ale také velmi bohatí.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_07");	//Každý z nich má zvyčejně někde ukrytou hromadu zlata a jiných cenností.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_08");	//Bylo by skvělé získat alespoň jeden takový poklad.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_09");	//Já tě na oplátku odměním za tvé úsilí. Co ty na to?
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_01_10");	//Ano, tvůj návrh zní zajímavě. Dobrá, počítej se mnou. A co bys chtěla od draků získat?
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_11");	//To kdybych věděla... Dones mi všechny nezvyčejné věci co tam nalezneš.
	MIS_DragonTreasure = LOG_Running;
	Log_CreateTopic(Topic_DragonTreasure,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_Running);
	B_LogEntry(TOPIC_DragonTreasure,"Cassia má zájem o nějaké věci z dračích pokladů, ale neví ktreré. Teď to jednoduché - zabít draky.");
};

var int OreBaronCrownUp;
var int GoldHuntHornUp;
var int DiamondChokerUp;
var int GoldKnifeUp;

instance DIA_Cassia_DragonTreasure_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_DragonTreasure_Done_Condition;
	information = DIA_Cassia_DragonTreasure_Done_Info;
	permanent = TRUE;
	description = "Něco pro tebe mám.";
};

func int DIA_Cassia_DragonTreasure_Done_Condition()
{
	if((MIS_DragonTreasure == LOG_Running) && ((Npc_HasItems(hero,ItMi_DiamondChoker) >= 1) || (Npc_HasItems(hero,ItMi_HuntHornGold) >= 1) || (Npc_HasItems(hero,ItMi_KnifeGold) >= 1) || (Npc_HasItems(hero,ItMi_OreBaronCrown) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_DragonTreasure_Done_Info()
{
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_01_00");	//Něco pro tebe mám.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_01_01");	//Tak ukaž.
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
	Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"To je vše.",DIA_Cassia_DragonTreasure_Done_Back);

	if((Npc_HasItems(hero,ItMi_DiamondChoker) >= 1) && (DiamondChokerUp == FALSE))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Diamantový náhrdelník.",DIA_Cassia_DragonTreasure_Done_DiamondChoker);
	};
	if((Npc_HasItems(hero,ItMi_HuntHornGold) >= 1) && (GoldHuntHornUp == FALSE))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Zlatý lovecký roh.",DIA_Cassia_DragonTreasure_Done_GoldHuntHorn);
	};
	if((Npc_HasItems(hero,ItMi_KnifeGold) >= 1) && (GoldKnifeUp == FALSE))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Zlatá dýka.",DIA_Cassia_DragonTreasure_Done_GoldKnife);
	};
	if((Npc_HasItems(hero,ItMi_OreBaronCrown) >= 1) && (OreBaronCrownUp == FALSE))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Koruna rudobarona.",DIA_Cassia_DragonTreasure_Done_OreBaronCrown);
	};
};

func void DIA_Cassia_DragonTreasure_Done_Back()
{
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Back_01_00");	//To je vše.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Back_01_01");	//Dobře. Ale doufám, že mi co nevidět přineseš víc.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Back_01_02");	//O tom nepochybuj.
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
};

func void DIA_Cassia_DragonTreasure_Done_DiamondChoker()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_00");	//Tady, vezmi si tenhle diamantový náhrdelník.
	B_GiveInvItems(other,self,ItMi_DiamondChoker,1);
	Npc_RemoveInvItems(self,ItMi_DiamondChoker,1);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_01");	//Taková nádhera... Něco takového musí stát hodně peněz.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_02");	//Myslím, že si ho nechám pro sebe.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_03");	//To je tvoje věc. Co má odměna?
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_04");	//Tady máš své zlato.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_05");	//Až tolik?
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_06");	//Ano, 1000 zlatých. Dvounásobná částka, kterou bys dostal od kteréhokoli obchodníka.
	DiamondChokerUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure,"Myslím, že to už bude dost dárků pro Cassii.");
	};

};

func void DIA_Cassia_DragonTreasure_Done_GoldHuntHorn()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_00");	//Zlatý lovecký roh.
	B_GiveInvItems(other,self,ItMi_HuntHornGold,1);
	Npc_RemoveInvItems(self,ItMi_HuntHornGold,1);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_01");	//Taková malá věc...
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_02");	//Vypadá to, že jednou patřil jednomu z rudobaronů.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_03");	//Možná. Na tom teď nezáleží.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_04");	//Tady máš své zlato.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	GoldHuntHornUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure,"Myslím, že to už bude dost dárků pro Cassii.");
	};
};

func void DIA_Cassia_DragonTreasure_Done_GoldKnife()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_00");	//Tady, zlatá dýka.
	B_GiveInvItems(other,self,ItMi_KnifeGold,1);
	Npc_RemoveInvItems(self,ItMi_KnifeGold,1);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_01");	//Hmm. Pěkné řemeslné umění.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_02");	//Místní sběratele bude bude určitě zajímat.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_03");	//Mě spíš zajímá moje odměna.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_04");	//Tady, tenhle lektvar by se ti mohl hodit.
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_05");	//Spraví tě více obratným.
	GoldKnifeUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure,"Myslím, že to už bude dost dárků pro Cassii.");
	};
};

func void DIA_Cassia_DragonTreasure_Done_OreBaronCrown()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_00");	//V jednom z pokladů jsem našel tuhle korunu.
	B_GiveInvItems(other,self,ItMi_OreBaronCrown,1);
	Npc_RemoveInvItems(self,ItMi_OreBaronCrown,1);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_01");	//Neuvěřitelné! Koruna rudobaronů.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_02");	//Vážně?
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_03");	//Ano, to je. Dar od samotného krále Myrtany.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_04");	//Kdysi ji nosil ten nejmocnější rudobaron na ostrově.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_05");	//Nikdy bych nevěřila, že ji jednou budu mít v rucích,
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_06");	//Za ni dostaneš u každého obchodníka hromadu zlata.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_07");	//Její cena je nevyčíslitelná! Ale líbí se mi jak smýšlíš.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_08");	//Ale co teď s ní? To bude třeba pečlivě promyslet.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_09");	//Co se tebe týče, dobrá práce a tady je ta nejvyšší odměna.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_10");	//Naučím tě jak se nikdy neunavit při běhu a skákání.
	OreBaronCrownUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure,"Myslím, že to už bude dost dárků pro Cassii.");
	};

	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
	Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Dej mi raději zlato.",DIA_Cassia_DragonTreasure_Done_Gold);
	Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Dobrá!",DIA_Cassia_DragonTreasure_Done_Run);
};

func void DIA_Cassia_DragonTreasure_Done_Run()
{
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Run_01_01");	//Dobrá!
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Run_01_02");	//Tak poslouchej. Hlavní je naučit se jak rozložit zátěž na celé tělo.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Run_01_03");	//To ti pomůže aby ses tak lehko nevyčerpal. A dávej si pozor abys pravidelně dýchal.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Run_01_04");	//Využij tyhle vědomosti moudře.
	CassiaTeachRegen = TRUE;
	AI_Print("Naučeno: Neúnavný běžec");
	Snd_Play("LevelUP");
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
};

func void DIA_Cassia_DragonTreasure_Done_Gold()
{
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Gold_01_01");	//Dej mi raději zlato.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Gold_01_02");	//Jak myslíš... Tady je tvé zlato.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Gold_01_03");	//Mělo by to být dost.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Gold_01_04");	//Díky.
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
};

instance DIA_Cassia_OrcHide(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_OrcHide_condition;
	information = DIA_Cassia_OrcHide_info;
	permanent = FALSE;
	description = "Myslel jsem, že jste všichni mrtví.";
};

func int DIA_Cassia_OrcHide_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_OrcHide_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Cassia_OrcHide_01_01");	//Myslel jsem, že jste všichni mrtví.
	AI_Output(self,other,"DIA_Cassia_OrcHide_01_02");	//(nervózně) Jak vidíš, podařilo se nám přežít.
	AI_Output(self,other,"DIA_Cassia_OrcHide_01_03");	//Teď je tohle jediné bezpečné místo v Khorinisu.
	AI_Output(other,self,"DIA_Cassia_OrcHide_01_04");	//A co když vás najdou?
	AI_Output(self,other,"DIA_Cassia_OrcHide_01_05");	//Jak? (smích) O téhle stoce vědělo jen ár lidí.
	AI_Output(self,other,"DIA_Cassia_OrcHide_01_06");	//A skřeti je všechny zabili.
};

instance DIA_Cassia_OrcHideWhat(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_OrcHideWhat_condition;
	information = DIA_Cassia_OrcHideWhat_info;
	permanent = FALSE;
	description = "A co budete dělat teď?";
};

func int DIA_Cassia_OrcHideWhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_OrcHide) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_OrcHideWhat_info()
{
	AI_Output(other,self,"DIA_Cassia_OrcHideWhat_01_01");	//A co budete dělat teď?
	AI_Output(self,other,"DIA_Cassia_OrcHideWhat_01_02");	//Nic, budeme tady sedět a doufat v zázrak.
	AI_Output(other,self,"DIA_Cassia_OrcHideWhat_01_03");	//Ale vždyť tady nemůže te sedět dokonce života!
	AI_Output(self,other,"DIA_Cassia_OrcHideWhat_01_04");	//Na to hádam nedojde.
	AI_Output(self,other,"DIA_Cassia_OrcHideWhat_01_05");	//Paladinové se vrátí a osvobodí město.
	AI_Output(other,self,"DIA_Cassia_OrcHideWhat_01_06");	//No, možná máš pravdu.
};