
instance DIA_Buster_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_EXIT_Condition;
	information = DIA_Buster_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_Hello(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_Hello_Condition;
	information = DIA_Buster_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_Hello_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_Hello_Info()
{
	AI_Output(self,other,"DIA_Buster_Hello_13_00");	//Kohopak to tady máme? Neznám tě odněkud?
	Info_ClearChoices(DIA_Buster_Hello);

	if(OnarFM == FALSE)
	{
		Info_AddChoice(DIA_Buster_Hello,"Když myslíš. Jsem na cestě za statkářem Onarem.",DIA_Buster_Hello_GoingToFarm);
	};

	Info_AddChoice(DIA_Buster_Hello,"Kdo se ptá?",DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output(other,self,"DIA_Buster_Hello_WhoAreYou_15_00");	//Kdo se ptá?
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_01");	//Jsem Buster, jeden z Leeových žoldáků!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_02");	//A TY bys ke mně měl být trošku zdvořilejší, nebo toho budeš litovat!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_03");	//Dobrá, co tady chceš?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Do toho ti nic není.",DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Buster_Hello,"Leeho znám!",DIA_Buster_Hello_IKnowLee);

	if(OnarFM == FALSE)
	{
		Info_AddChoice(DIA_Buster_Hello,"Jdu za statkářem Onarem.",DIA_Buster_Hello_GoingToFarm);
	};
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output(other,self,"DIA_Buster_Hello_IKnowLee_15_00");	//Leeho znám!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_01");	//Leeho zná každý! To nic neznamená, kámo. Zrovna teď mluvíš SE MNOU!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_02");	//Takže, kam máš namířeno?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Do toho ti nic není.",DIA_Buster_Hello_NotYourBusiness);

	if(OnarFM == FALSE)
	{
		Info_AddChoice(DIA_Buster_Hello,"Jdu za statkářem Onarem.",DIA_Buster_Hello_GoingToFarm);
	};
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output(other,self,"DIA_Buster_Hello_NotYourBusiness_15_00");	//Do toho ti nic není.
	AI_Output(self,other,"DIA_Buster_Hello_NotYourBusiness_13_01");	//Takhle se mnou nikdo mluvit nebude, ty červe! Řekl bych, že je čas na pořádnou nakládačku.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output(other,self,"DIA_Buster_Hello_GoingToFarm_15_00");	//Jdu za statkářem Onarem.
	AI_Output(self,other,"DIA_Buster_Hello_GoingToFarm_13_01");	//Vážně?... Hm - nepřijdeš mi nějak zvlášť nebezpečný.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Chceš se přesvědčit?",DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice(DIA_Buster_Hello,"Jednou nebo dvakrát jsem zabil nějakou příšeru.",DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice(DIA_Buster_Hello,"To máš pravdu.",DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output(other,self,"DIA_Buster_Hello_ImNoDanger_15_00");	//To máš pravdu
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_01");	//(samolibě) Jo, za ty roky se naučíš si takových věcí všímat, kámo.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_02");	//V jednom kuse tady bojujeme se skřety. Nebo strážemi z města. Teda, jsou to pěkně neodbytní prevíti!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Myslíš SKUTEČNÉ skřety? Ty velké potvory?",DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello,"Takže?",DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello,"Působivé.",DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output(other,self,"DIA_Buster_Hello_SlewBeasts_15_00");	//Jednou nebo dvakrát jsem zabil nějakou příšeru
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_01");	//Ha! (zasměje se) Nejspíš jsi v poli rozšlápnul pár brouků a vyhnal několik krys z jejich nor.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_02");	//Tady nám jdou po krku skřeti! Jo, a ta mizerná městská stráž.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Myslíš SKUTEČNÉ skřety? Ty velké potvory?",DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello,"Takže?",DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello,"Působivé.",DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_00");	//Chceš se přesvědčit
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_01");	//Božíčku! Vybral jsem si špatného otloukánka, co?
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_02");	//Dalo by se to tak říct.
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_03");	//Tak pojď, ukaž mi, co v tobě je.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output(other,self,"DIA_Buster_Hello_Impressive_15_00");	//Působivé.
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_01");	//To je naše živnost, chlapče! Dokonce si děláme vlastní zbraně a zbroje!
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_02");	//Vysmíváme se smrti den co den. Ale o něčem takovém nemá vesnický balík jako ty ani zdání.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Budu ti budu muset ukázat, jak velké ponětí o tom mám!",DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice(DIA_Buster_Hello,"Když to říkáš.",DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output(other,self,"DIA_Buster_Hello_IfYouSaySo_15_00");	//Když to říkáš.
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//Mazej, strašpytle!
	AI_StopProcessInfos(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output(other,self,"DIA_Buster_Hello_LetMeShowYou_15_00");	//Budu ti budu muset ukázat, jak velké ponětí o tom mám!
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_01");	//To má být jednomužné rolnické povstání, nebo co?
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_02");	//Tak dobrá, ukaž mi, co v tobě je.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//Takže?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_01");	//(odfrkne si) Jako bys věděl, o čem to tady mluvím. Myslíš si, bůhvíjak nejsi silný, co?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_02");	//(rozzlobeně) Možná je na čase, aby ti někdo uštědřil lekci!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Kdykoliv!",DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello,"Dělám si srandu...",DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_00");	//Myslíš SKUTEČNÉ skřety? Ty velké potvory?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_01");	//(povzdechne si) Já jenom... Počkat! Chceš si ze mě utahovat?
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_02");	//(s úsměvem) To vůbec ne.
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_03");	//Ty červe! (nečekaně agresivně) Nedáš jinak, co?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_04");	//Tak pojď a ukaž, co v tobě je, ty hrdino!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Kdykoliv!",DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello,"Dělám si srandu...",DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output(other,self,"DIA_Buster_Hello_Whenever_15_00");	//Kdykoliv!
	AI_Output(self,other,"DIA_Buster_Hello_Whenever_13_01");	//Tak pojď blíž, kámo!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output(other,self,"DIA_Buster_Hello_JustJoking_15_00");	//Dělám si srandu...
	AI_Output(self,other,"DIA_Buster_Hello_JustJoking_13_01");	//No jo, jasně, zastrč drápky! Jdi mi z očí!
	AI_StopProcessInfos(self);
};


instance DIA_Buster_FightNone(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_FightNone_Condition;
	information = DIA_Buster_FightNone_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_FightNone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Buster_Hello) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output(self,other,"DIA_Buster_FightNone_13_00");	//Co chceš, strašpytle?
};

instance DIA_Buster_Duell(C_Info)
{
	npc = SLD_802_Buster;
	nr = 3;
	condition = DIA_Buster_Duell_Condition;
	information = DIA_Buster_Duell_Info;
	permanent = TRUE;
	description = "Vyzývám tě k souboji!";
};

func int DIA_Buster_Duell_Condition()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void DIA_Buster_Duell_Info()
{
	AI_Output(other,self,"DIA_Buster_Duell_15_00");	//Vyzývám tě k souboji!

	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_01");	//Ha ha! Nechceš to nechat jen tak, co? Tak dobrá - pojď sem!
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_02");	//Chceš to zkusit znovu? Otravo mizernej - dobrá, pojď sem!

		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_Duell_13_03");	//Ale už podruhé neutíkej!
		};
	};

	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Buster_WannaJoin(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_WannaJoin_Condition;
	information = DIA_Buster_WannaJoin_Info;
	permanent = TRUE;
	description = "Chci se přidat k žoldákům!";
};


func int DIA_Buster_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && (Buster_Duell == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Buster_WannaJoin_15_00");	//Chci se přidat k žoldákům!

	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_01");	//Každý, kdo má ránu tvrdou jako ty, by tady neměl mít žádné problémy.
		}
		else
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_02");	//Nejsi zrovna nejlepší bojovník, ale odvaha ti rozhodně nechybí.
		};

		Buster_Duell = TRUE;
		BUSTERDUELOK = TRUE;
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_03");	//Můj hlas tady moc neznamená, protože jsem tady dlouho nebyl, ale až se mě Lee zeptá, budu hlasovat pro tebe.
		Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		B_LogEntry(TOPIC_SLDRespekt,"Když jsem Bustera porazil, nebude mi už bránit v cestě do řad žoldáků.");
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_04");	//Ty? Nevzpomínám si, že by k žoldákům kdy přijali nějakého sraba...

		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_05");	//Utíkat ze souboje - s tím se tady moc daleko nedostaneš!
		};
	};
};


var int Buster_SentenzaTip;

instance DIA_Buster_OtherSld(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_OtherSld_Condition;
	information = DIA_Buster_OtherSld_Info;
	permanent = FALSE;
	description = "Rád bych se dozvěděl něco o žoldácích a zdejším okolí.";
};


func int DIA_Buster_OtherSld_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Buster_OtherSld_Info()
{
	AI_Output(other,self,"DIA_Buster_OtherSld_15_00");	//Rád bych se dozvěděl něco o žoldácích a zdejším okolí.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_01");	//O okolí ti toho moc nepovím. Na to by ses měl raději zeptat rolníků.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_02");	//A co se týče nás žoldáků - máme jedno velice jednoduché pravidlo: jestli dokážeš neustoupit, můžeš mezi nás.
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_03");	//Myslím, že jsi přesně z toho materiálu, který potřebujeme.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_04");	//Ale ne, aby ti to stouplo do hlavy, že jsi měl v našem posledním souboji štěstí.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_05");	//Na farmě je spousta hochů, kteří jsou o chloupek lepší než já...
		AI_Output(self,other,"DIA_Buster_OtherSld_13_06");	//Sentenza, například. Hlídá vstup na farmu. Ať se děje co se děje, s ním se do křížku nepouštěj.
		Buster_SentenzaTip = TRUE;
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_07");	//Ale proč to vlastně říkám takovému zbabělci?!
		AI_StopProcessInfos(self);
	};
};


var int Buster_GoldZumBrennen;
var int Buster_Bonus;

instance DIA_Buster_AboutSentenza(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_AboutSentenza_Condition;
	information = DIA_Buster_AboutSentenza_Info;
	permanent = FALSE;
	description = "Co s tím Sentenzou?";
};


func int DIA_Buster_AboutSentenza_Condition()
{
	if(Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_AboutSentenza_Info()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_00");	//Co s tím Sentenzou?
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_01");	//Přijdeš na farmu, pokusí se z tebe vymáčknout nějaké peníze - to dělá všem nováčkům.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_02");	//A být na tvém místě, tak bych zaplatil. Sám jsem to svého času udělal. Dobré bylo, že mi pak dal svůj hlas.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_03");	//Říká, že jedna laskavost vyžaduje druhou. Tenkrát jsem tak přišel o všechny své peníze, ale nebylo to vlastně až tak moc. A nakonec jsem byl rád, že to tak dopadlo.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_04");	//Ve chvíli, když jsem viděl, jak zmlátil maníka, který se rozhodl NEZAPLATIT.
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_05");	//Díky za radu.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_06");	//Rádo se stalo. Má pro tebe nějakou cenu?
	Info_ClearChoices(DIA_Buster_AboutSentenza);
	Info_AddChoice(DIA_Buster_AboutSentenza,"Ne.",DIA_Buster_AboutSentenza_No);
	if(Npc_HasItems(other,ItMi_Gold) >= 5)
	{
		Info_AddChoice(DIA_Buster_AboutSentenza,"Tady máš - 5 zlatých.",DIA_Buster_AboutSentenza_Give);
	};
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_Give_15_00");	//Tady máš - 5 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,5);
	AI_Output(self,other,"DIA_Buster_AboutSentenza_Give_13_01");	//Díky, chlape. Zdá se, že si večer budu moc dát pár korbelů. Na to nezapomenu.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_No_13_01");	//Myslel jsem si to.
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};


instance DIA_Buster_LeeLeader(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_LeeLeader_Condition;
	information = DIA_Buster_LeeLeader_Info;
	permanent = FALSE;
	description = "Lee je šéf žoldáků, ne?";
};


func int DIA_Buster_LeeLeader_Condition()
{
	if(Buster_Duell == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_LeeLeader_Info()
{
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_00");	//Lee je šéf žoldáků, ne?
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_01");	//Přesně tak - hej, už jsem si vzpomněl, odkud tě znám! Tys byl také v kolonii.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_02");	//No... (s povzdechem) To jsem byl.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_03");	//Neviděl jsem tě, když došlo k tomu velkému třesku. Ani hodnou chvíli předtím.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_04");	//Měl jsem jiné starosti.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_05");	//Tos o hodně přišel - co jsme byli v lochu, tak se dost věcí změnilo.
};


instance DIA_Buster_WhatHappened(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_WhatHappened_Condition;
	information = DIA_Buster_WhatHappened_Info;
	permanent = FALSE;
	description = "Co se stalo se žoldáky v kolonii?";
};


func int DIA_Buster_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Buster_LeeLeader) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Buster_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Buster_WhatHappened_15_00");	//Co se stalo se žoldáky v kolonii?
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_01");	//Jakmile bariéra padla, vyvedl nás Lee z kolonie. Říkal, že když budeme držet pohromadě, tak se nám nic nestane. A měl pravdu.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_02");	//Netrvalo dlouho a našli jsme si tady hezké místečko. Statkář nám platí, abychom zametali s domobranou z města.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_03");	//A většina z nás by do toho šla dobrovolně i zadarmo.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_04");	//Ale Onar nám dává jídlo a aspoň tak můžeme nějak zabít čas, než se naskytne nějaká příležitost pláchnout z tohohle mizerného ostrova.
};

instance DIA_Buster_KAP3_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP3_EXIT_Condition;
	information = DIA_Buster_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_SHADOWBEASTS(C_Info)
{
	npc = SLD_802_Buster;
	nr = 30;
	condition = DIA_Buster_SHADOWBEASTS_Condition;
	information = DIA_Buster_SHADOWBEASTS_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_SHADOWBEASTS_Condition()
{
	if((Kapitel >= 3) && (BUSTERDUELOK == TRUE))
	{
		return TRUE;
	};
};

func void B_DIA_Buster_SHADOWBEASTS_OK()
{
	AI_StopProcessInfos(self);
};

func void DIA_Buster_SHADOWBEASTS_Info()
{
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_00");	//Hej, ty, chlape!
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_01");	//Co chceš?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_02");	//Posledních pár dní jsem přemýšlel, jak v téhle díře přijít k nějakým snadným penězům.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//A?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_04");	//Myslím, že jsem přišel na to, jak nějaké prachy získat.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_05");	//Jeden kupec z města vyklopí za jistou věc pěknej balík.
	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"Co je to za kupce, o kterém mluvíš?",DIA_Buster_SHADOWBEASTS_wer);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"O co jde?",DIA_Buster_SHADOWBEASTS_was);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"Proč mi to říkáš?",DIA_Buster_SHADOWBEASTS_ich);
};

func void DIA_Buster_SHADOWBEASTS_ich()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_00");	//Proč mi to říkáš?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_01");	//Nemůžu do toho jít sám. Musím zůstat tady a dávat pozor na ty pitomé ovce.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_02");	//Myslíš rolníky.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_03");	//Jak říkám.
};

func void DIA_Buster_SHADOWBEASTS_was()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_15_00");	//O co jde?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_01");	//Ten kupec tvrdí, že by mohl na tržišti velice dobře zpeněžit rohy stínové šelmy.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_02");	//Někdo bude muset jít do lesa a ty stvůry pokosit. A to je právě práce pro tebe.
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"Kolik z toho kouká?",DIA_Buster_SHADOWBEASTS_was_wieviel);
};

func void DIA_Buster_SHADOWBEASTS_was_wieviel()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_00");	//Kolik z toho kouká?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_01");	//Balík peněz, to ti povídám. Bude dost pro nás pro oba.
	if(Buster_GoldZumBrennen == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_02");	//A protože jsi mi tenkrát přinesl to zlato, udělám ti zvláštní cenu.
	};
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_03");	//To zní dobře! Dám ti vědět, až budu mít nějaké ty rohy.
	MIS_Buster_KillShadowbeasts_DJG = LOG_Running;
	Log_CreateTopic(TOPIC_Buster_KillShadowbeasts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts,LOG_Running);
	B_LogEntry(TOPIC_Buster_KillShadowbeasts,"Buster mi nabídl dobrou cenu za každý roh stínové šelmy, který mu přinesu.");
	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
};

func void DIA_Buster_SHADOWBEASTS_wer()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_wer_15_00");	//Co je to za kupce, o kterém mluvíš?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_01");	//Tak to ne, kámo. Byl bych vážně pitomec, kdybych ti prozradil svůj zdroj. Chceš mě snad podfouknout?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_02");	//Buď se dohodneš SE MNOU, nebo vůbec. Kapišto?
};

instance DIA_Buster_TeachTrophyShadowbeast(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_TeachTrophyShadowbeast_Condition;
	information = DIA_Buster_TeachTrophyShadowbeast_Info;
	permanent = TRUE;
	description = "Jak mám vykuchat stínovou šelmu?";
};

func int DIA_Buster_TeachTrophyShadowbeast_Condition()
{
	if((MIS_Buster_KillShadowbeasts_DJG == LOG_Running) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_TeachTrophyShadowbeast_Info()
{
	AI_Output(other,self,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03");	//Jak mám vykuchat stínovou šelmu?
	AI_Output(self,other,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04");	//Ty to nevíš? Teda chlape, čekal jsem od tebe víc!
	Info_ClearChoices(DIA_Buster_TeachTrophyShadowbeast);
	Info_AddChoice(DIA_Buster_TeachTrophyShadowbeast,Dialog_Back,DIA_Buster_TeachTrophyShadowbeast_back);
	Info_AddChoice(DIA_Buster_TeachTrophyShadowbeast,b_buildlearnstringforsmithhunt("Vyjímání rohů stínových šelem",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Buster_TeachTrophyShadowbeast_teach);
};

func void DIA_Buster_TeachTrophyShadowbeast_teach()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_teach_15_00");	//Nauč mě vyjmout roh stínové šelmy.

	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_01");	//Tak poslouchej. Zabiješ stínovou šelmu a pak ji pravou rukou chytíš co nejpevněji za roh.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_02");	//Potom zarazíš nůž do jejího čela a kolem rohu vyřízneš žlábek.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_03");	//Nůž potom použiješ jako páku, roh odlomíš a dáš si ho do kapsy.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_04");	//No. A pak mi ho přineseš. To by pro tebe nemělo být až tak těžké.
	};

	Info_ClearChoices(DIA_Buster_TeachTrophyShadowbeast);
};

func void DIA_Buster_TeachTrophyShadowbeast_back()
{
	Info_ClearChoices(DIA_Buster_TeachTrophyShadowbeast);
};

instance DIA_Buster_BringTrophyShadowbeast(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_BringTrophyShadowbeast_Condition;
	information = DIA_Buster_BringTrophyShadowbeast_Info;
	permanent = TRUE;
	description = "K těm rohům stínové šelmy...";
};

func int DIA_Buster_BringTrophyShadowbeast_Condition()
{
	if((MIS_Buster_KillShadowbeasts_DJG == LOG_Running) && (Npc_HasItems(other,ItAt_ShadowHorn) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Buster_BringTrophyShadowbeast_Info()
{
	var int BusterTrophyShadowbeastCount;
	var int XP_BringBusterTrophyShadowbeast;
	var int XP_BringBusterTrophyShadowbeasts;
	var int BustersBusterTrophyShadowbeastOffer;
	var int BusterTrophyShadowbeastGeld;

	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_00");	//Můj kupec nám dal sbohem.
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_01");	//Co to má znamenat?
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_02");	//Je mrtvý. Klidně si ty rohy nech. Stejně nevím, co bych s nimi teď dělal!
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		BusterTrophyShadowbeastCount = Npc_HasItems(other,ItAt_ShadowHorn);

		if(BusterTrophyShadowbeastCount == 1)
		{
			XP_BringBusterTrophyShadowbeast = Shadowbeast.level * XP_PER_VICTORY;
			BustersBusterTrophyShadowbeastOffer = Buster_Bonus + 100;
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_05");	//Přinesl jsem si roh stínové šelmy.
			B_GivePlayerXP(XP_BringBusterTrophyShadowbeast);
			B_GiveInvItems(other,self,ItAt_ShadowHorn,1);
			Npc_RemoveInvItems(self,ItAt_ShadowHorn,Npc_HasItems(self,ItAt_ShadowHorn));
			AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//Skvělé. Ukaž. A přines jich víc. Kdo ví, jak dlouho bude ten kupec tyhle věci ještě chtít.
			AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//Tady je tvůj podíl.
			BusterTrophyShadowbeastGeld = BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer;
			CreateInvItems(self,ItMi_Gold,BusterTrophyShadowbeastGeld);
			B_GiveInvItems(self,other,ItMi_Gold,BusterTrophyShadowbeastGeld);
		}
		else if(BusterTrophyShadowbeastCount > 1)
		{
			XP_BringBusterTrophyShadowbeast = Shadowbeast.level * XP_PER_VICTORY;
			BustersBusterTrophyShadowbeastOffer = Buster_Bonus + 100;
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_06");	//Přinesl jsem ti rohy stinové šelmy.
			B_GiveInvItems(other,self,ItAt_ShadowHorn,BusterTrophyShadowbeastCount);
			Npc_RemoveInvItems(self,ItAt_ShadowHorn,Npc_HasItems(self,ItAt_ShadowHorn));
			XP_BringBusterTrophyShadowbeasts = BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast;
			B_GivePlayerXP(XP_BringBusterTrophyShadowbeasts);
			AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//Skvělé. Ukaž. A přines jich víc. Kdo ví, jak dlouho bude ten kupec tyhle věci ještě chtít.
			AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//Tady je tvůj podíl.
			BusterTrophyShadowbeastGeld = BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer;
			CreateInvItems(self,ItMi_Gold,BusterTrophyShadowbeastGeld);
			B_GiveInvItems(self,other,ItMi_Gold,BusterTrophyShadowbeastGeld);
		}
		else
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_back_15_00");	//Přinesu více.
			AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//Doufám.
		};
	};
};

instance DIA_Buster_KAP4_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP4_EXIT_Condition;
	information = DIA_Buster_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_Perm4(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_Perm4_Condition;
	information = DIA_Buster_Perm4_Info;
	permanent = TRUE;
	description = "Co si myslíš o celé té drakobijecké záležitosti?";
};


func int DIA_Buster_Perm4_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Buster_Perm4_Info()
{
	AI_Output(other,self,"DIA_Buster_Perm4_15_00");	//Co si myslíš o celé té drakobijecké záležitosti?
	AI_Output(self,other,"DIA_Buster_Perm4_13_01");	//Hoši by z toho mohli vytřískat docela dost zlata - pokud dřív nezaklepou bačkorama.
	AI_Output(self,other,"DIA_Buster_Perm4_13_02");	//Já osobně se radši držím Leeho.
};


instance DIA_Buster_KAP5_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP5_EXIT_Condition;
	information = DIA_Buster_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_KAP6_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP6_EXIT_Condition;
	information = DIA_Buster_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_PICKPOCKET(C_Info)
{
	npc = SLD_802_Buster;
	nr = 900;
	condition = DIA_Buster_PICKPOCKET_Condition;
	information = DIA_Buster_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Buster_PICKPOCKET_Condition()
{
	return C_Beklauen(34,60);
};

func void DIA_Buster_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
	Info_AddChoice(DIA_Buster_PICKPOCKET,Dialog_Back,DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Buster_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
};

func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
};

