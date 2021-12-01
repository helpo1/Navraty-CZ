/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

instance DIA_Lobart_LobartMeal - upraveny podmínky dialogu

*/




instance DIA_Lobart_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_EXIT_Condition;
	information = DIA_Lobart_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Lobart_Hallo(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_Hallo_Condition;
	information = DIA_Lobart_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lobart_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_Hallo_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_00");	//Co otravuješ na mým pozemku?
		AI_Output(self,other,"DIA_Lobart_Hallo_05_01");	//(zkoumavě) Na čí straně jsi? Vzbouřenců, nebo krále?
		Info_ClearChoices(DIA_Lobart_Hallo);
		Info_AddChoice(DIA_Lobart_Hallo,"Nerozumím...",DIA_Lobart_Hallo_What);
		Info_AddChoice(DIA_Lobart_Hallo,"Jsem na králově straně!",DIA_Lobart_Hallo_ForTheKing);
		Info_AddChoice(DIA_Lobart_Hallo,"Jsem s rolníky!",DIA_Lobart_Hallo_ForThePeasants);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_02");	//Co pro tebe můžu udělat?
	};
};

func void DIA_Lobart_Hallo_ForThePeasants()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForThePeasants_15_00");	//Jsem s rolníky!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_01");	//Ha! Ten zpropadenej štváč Onar nás dostane všechny do hrobu!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_02");	//Co myslíš, jak dlouho budou ještě paladinové jen tak stát a přihlížet?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_03");	//Po tom, co Onar provedl, je celý město vzhůru nohama.
	Lobart_AgainstKing = TRUE;
	Info_ClearChoices(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_ForTheKing()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForTheKing_15_00");	//Jsem na králově straně!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_01");	//(pohrdavě) 'Na králově straně!' To samý říkali vojáci z domobrany, když mi vzali půlku mých ovcí.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_02");	//Ale kde jsou ti bastardi, když si na nás došlápnou banditi? A kde asi tak budou, až nás napadnou skřeti?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_03");	//Já ti řeknu kde: ve městě, za širokými hradbami.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_04");	//Tak mě s tím svým králem neotravuj.
	Lobart_AgainstKing = FALSE;
	Info_ClearChoices(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_What()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_What_15_00");	//Nerozumím...
	AI_Output(self,other,"DIA_Lobart_Hallo_What_05_01");	//Co? Nezahrávej si se mnou, hochu! Chci vědět, na čí straně jsi! Tak pro koho jsi?
};


instance DIA_Lobart_KLEIDUNG(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_KLEIDUNG_Condition;
	information = DIA_Lobart_KLEIDUNG_Info;
	permanent = FALSE;
	description = "Potřebuji nějaké vhodné šaty!";
};


func int DIA_Lobart_KLEIDUNG_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KLEIDUNG_Info()
{
	AI_Output(other,self,"DIA_Lobart_KLEIDUNG_15_00");	//Potřebuji nějaké vhodné šaty!
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_01");	//Můžu ti dát čistý farmářský pracovní oděv.
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_02");	//Můžeš za něj zaplatit?
	Log_CreateTopic(TOPIC_Kleidung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Kleidung,LOG_Running);
	B_LogEntry(TOPIC_Kleidung,"Farmář Lobart mi prodá pracovní oděv.");

	if(!Npc_KnowsInfo(other,DIA_Lobart_WorkNOW))
	{
		AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_03");	//Můžeš si část ceny odpracovat. Pokud teda HLEDÁŠ práci.
		B_LogEntry(TOPIC_Kleidung,"Část ceny si mohu odpracovat na statku. Čím víc práce odvedu, tím méně mě ty šaty budou stát.");
	};
};


instance DIA_Lobart_BuyClothes(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_BuyClothes_Condition;
	information = DIA_Lobart_BuyClothes_Info;
	permanent = TRUE;
	description = "Kolik chceš za ty šaty?";
};

func int DIA_Lobart_BuyClothes_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG) && (Lobart_Kleidung_Verkauft == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_BuyClothes_Info()
{
	Wert_LobartsRuestung = 80;
	AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");	//Kolik chceš za ty šaty?
	AI_Output(self,other,"DIA_Lobart_BuyClothes_05_01");	//Dobře, takže...

	if(Lobart_AgainstKing == TRUE)
	{
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	if(MIS_Lobart_Rueben == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_02");	//Pracoval jsi pro mě na poli.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	if(MIS_Hilda_PfanneKaufen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_03");	//Pomohl jsi mé ženě.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	if(MIS_Vino_Wein == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_04");	//Vino mi říkal, že jsi mu opravdu pomohl - a to už něco znamená! On totiž málokdy drží s nádeníky.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	if(MIS_Maleth_Bandits == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_05");	//Maleth říkal, žes zahnal bandity. Ti bastardi nám způsobili hodně potíží. Díky, žes je odstranil z cesty!
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};

	B_Say_Gold(self,other,Wert_LobartsRuestung);

	if(Wert_LobartsRuestung == 30)
	{
		AI_Output(self,other,"DIA_Lobart_GOLD_05_06");	//Levnější už to nebude.
		B_LogEntry(TOPIC_Kleidung,"Neprodá mi je levněji, než za 30 zlatých.");
	};
	Info_ClearChoices(DIA_Lobart_BuyClothes);
	Info_AddChoice(DIA_Lobart_BuyClothes,"To je moc drahé.",DIA_Lobart_BuyClothes_NotYet);
	Info_AddChoice(DIA_Lobart_BuyClothes,"Tak mi tedy dej ten farmářský oděv.",DIA_Lobart_BuyClothes_BUY);
};

func void DIA_Lobart_BuyClothes_BUY()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_BUY_15_00");	//Dej mi tedy ty šaty.

	if(B_GiveInvItems(other,self,ItMi_Gold,Wert_LobartsRuestung))
	{
		if(Npc_HasItems(self,ITAR_Bau_L) > 0)
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");	//Fajn, chlapče, s poctivostí nejdál dojdeš! Tady je máš!
			B_GiveInvItems(self,other,ITAR_Bau_L,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");	//Fajn, chlapče, s poctivostí nejdál dojdeš! Tady je máš!
			CreateInvItems(self,ITAR_Bau_L,1);
			B_GiveInvItems(self,other,ITAR_Bau_L,1);
		};

		Lobart_Kleidung_Verkauft = TRUE;
		Wld_AssignRoomToGuild("farm03",GIL_NONE);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_04");	//Nemáš dost zlata!
	};

	Info_ClearChoices(DIA_Lobart_BuyClothes);
};

func void DIA_Lobart_BuyClothes_NotYet()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_NotYet_15_00");	//To je moc drahé.
	AI_Output(self,other,"DIA_Lobart_BuyClothes_NotYet_05_01");	//Nu, jak myslíš...
	Info_ClearChoices(DIA_Lobart_BuyClothes);
};


instance DIA_Lobart_AufstandInfo(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_AufstandInfo_Condition;
	information = DIA_Lobart_AufstandInfo_Info;
	permanent = FALSE;
	description = "A co jinak?";
};


func int DIA_Lobart_AufstandInfo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_Hallo) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_AufstandInfo_Info()
{
	AI_Output(other,self,"DIA_Lobart_AufstandInfo_15_00");	//A co jinak?
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_01");	//Jak, jinak? Hochu, ODKUD jsi? Jsme na pokraji občanské války!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_02");	//Až doteď pohlíželi všichni farmáři na odvody městu jako na spravedlivou formu zdanění.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_03");	//Ale od té doby, co jsou v Khorinisu paladinové, nás vojáci z domobrany navštěvují čím dál tím častějc a už si pomalu berou úplně všechno.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_04");	//Jestli to tak půjde dál, nic už nám nezbude.
	};
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_05");	//Někteří farmáři se začali bouřit. Onar byl první!
};


instance DIA_Lobart_OnarStory(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_OnarStory_Condition;
	information = DIA_Lobart_OnarStory_Info;
	permanent = FALSE;
	description = "Řekni mi víc o tom Onarovi.";
};


func int DIA_Lobart_OnarStory_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_AufstandInfo) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_OnarStory_Info()
{
	AI_Output(other,self,"DIA_Lobart_OnarStory_15_00");	//Řekni mi víc o tom Onarovi.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_01");	//Ty jsi žoldák, ne? Tak co bych ti měl dalšího říkat o tvém šéfovi?
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_02");	//Onar je největší farmář v okolí. Odtrhl se od města.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_03");	//Říká se, že si najal žoldáky, aby udržel domobranu na uzdě!
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_04");	//Není se čemu divit.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_05");	//V každém případě se na jeho farmu už žádný královský voják neodváží vstoupit.
	};
};


instance DIA_Lobart_SldInfo(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_SldInfo_Condition;
	information = DIA_Lobart_SldInfo_Info;
	permanent = FALSE;
	description = "Kdo jsou ti žoldáci, co si Onar najal?";
};


func int DIA_Lobart_SldInfo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_OnarStory) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_SldInfo_Info()
{
	AI_Output(other,self,"DIA_Lobart_SldInfo_15_00");	//Kdo jsou ti žoldáci, co si Onar najal?
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_01");	//O těch chlapech toho moc nevím. Údajně jsou to většinou bývalí vězni z trestanecké kolonie.
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_02");	//(opovržlivě) Všichni moc dobře vědí, co se od nich dá očekávat.
};


instance DIA_Lobart_WhichSide(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_WhichSide_Condition;
	information = DIA_Lobart_WhichSide_Info;
	permanent = FALSE;
	description = "A co ty? Na čí straně jsi? Rolníci, nebo král?";
};


func int DIA_Lobart_WhichSide_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_AufstandInfo) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_WhichSide_Info()
{
	AI_Output(other,self,"DIA_Lobart_WhichSide_15_00");	//A co ty? Na čí straně jsi? Rolníci, nebo král?
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_01");	//Jsem příliš blízko městu, než abych měl na výběr.
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_02");	//Ale já jsem vlastně rád. Nevěděl bych, jak se rozhodnout.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_03");	//Král nás vysává a Onar posílá svý žoldáky na každýho, kdo se k němu odmítl přidat.
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_04");	//To je taky důvod, proč se většina ostatních farmářů ještě nerozhodla. Ale dříve či později se budou muset k jedné straně přidat.
	};
};


instance DIA_Lobart_WorkNOW(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_WorkNOW_Condition;
	information = DIA_Lobart_WorkNOW_Info;
	permanent = FALSE;
	description = "Hledám práci.";
};


func int DIA_Lobart_WorkNOW_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_AufstandInfo) || Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG))
	{
		if(Kapitel < 3)
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_WorkNOW_Info()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_15_00");	//Hledám práci.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_01");	//Dalšího rolníka už nemůžu potřebovat. Ale můžu ti nabídnout práci nádeníka.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_02");	//Tím myslím, že můžeš přiložit ruku k dílu na poli. A taky se určitě najde pár dalších věcí, co se tu kolem musí udělat.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_03");	//Můžu ti zaplatit zlatem. Nebo ti dám nějaké slušné věci na sebe.
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_04");	//Ty věci docela stojí za to. Nemůžu ti je dát zadarmo, ale můžu ti je pak prodat se slevou.
		Log_CreateTopic(TOPIC_Kleidung,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Kleidung,LOG_Running);
		B_LogEntry(TOPIC_Kleidung,"Farmář Lobart mi může prodat pracovní oděv. Část ceny si mohu odpracovat na jeho statku - čím víc práce odvedu, tím méně mě ty šaty budou stát.");
		if((Npc_HasEquippedArmor(other) == FALSE) || (Lobart_Kleidung_Verkauft == TRUE))
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_05");	//Ale když na tebe tak koukám, musím říct: vezmi si ty šaty.
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_06");	//Ale ty už šaty máš, takže asi budeš chtít zlato.
		};
	};
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_07");	//Takže - ten tuřínový záhon za stodolou se musí sklidit.
	Info_ClearChoices(DIA_Lobart_WorkNOW);
	Info_AddChoice(DIA_Lobart_WorkNOW,"Já mám tahat ze země tuřín? To si musíš dělat srandu!",DIA_Lobart_WorkNOW_WannaFoolMe);
	Info_AddChoice(DIA_Lobart_WorkNOW,"Dobře.",DIA_Lobart_WorkNOW_Ok);
};

func void DIA_Lobart_WorkNOW_Ok()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");	//Dobře.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_Ok_05_01");	//Tak si s tím koukej pospíšit, než si to rozmyslím.
	};
	Log_CreateTopic(TOPIC_Rueben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rueben,LOG_Running);
	B_LogEntry(TOPIC_Rueben,"Farmář Lobart chce, abych mu z pole sklidil tuříny. Za odměnu dostanu pár zlatých nebo mi dá slevu na farmářské šaty.");
	MIS_Lobart_Rueben = LOG_Running;
	Info_ClearChoices(DIA_Lobart_WorkNOW);
};

func void DIA_Lobart_WorkNOW_WannaFoolMe()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_WannaFoolMe_15_00");	//Já mám ze země tahat tuřín? To si musíš dělat srandu!
	AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_01");	//Pořádná chlapská práce není pro takovýho nafrněnýho džentlmena dost dobrá, eh?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_02");	//Buď vytahej ty tuříny ze země, nebo táhni z mojí farmy!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_03");	//Právě teď pro tebe nemám žádnou další práci.
	};
	Log_CreateTopic(TOPIC_Rueben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rueben,LOG_Running);
	B_LogEntry(TOPIC_Rueben,"Farmář Lobart chce, abych mu z pole sklidil tuříny. Za odměnu dostanu pár zlatých nebo mi dá slevu na farmářské šaty.");
	MIS_Lobart_Rueben = LOG_Running;
	Info_ClearChoices(DIA_Lobart_WorkNOW);
};


instance DIA_Lobart_RuebenRunning(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_RuebenRunning_Condition;
	information = DIA_Lobart_RuebenRunning_Info;
	permanent = TRUE;
	description = "Tady jsou tvoje tuříny!";
};


func int DIA_Lobart_RuebenRunning_Condition()
{
	if((MIS_Lobart_Rueben == LOG_Running) && (Npc_HasItems(other,ItPl_Beet) >= 1) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_RuebenRunning_Info()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_00");	//Tady jsou tvoje tuříny!

	if(Npc_HasItems(other,ItPl_Beet) >= 20)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_01");	//Hej, ty přece jen nebudeš takovej darmožrout.
		};
		if(Npc_IsDead(Hilda) == FALSE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_02");	//Dej je mé ženě v kuchyni a řekni jí, ať je uvaří.
			MIS_Lobart_RuebenToHilda = LOG_Running;
			Log_CreateTopic(TOPIC_Ruebenbringen,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Ruebenbringen,LOG_Running);
			B_LogEntry(TOPIC_Ruebenbringen,"Musím ty tuříny doručit do domu a předat je Lobartově ženě, která z nich něco dobrého uvaří.");
		};

		MIS_Lobart_Rueben = LOG_SUCCESS;
		B_GivePlayerXP(XP_LobartHolRueben);
		AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_03");	//A co můj plat?
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_04");	//Můžu ti dát pět zlatých...

		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_05");	//... nebo ti mohu dát slevu na ty farmářské šaty. Tak co to bude?
		};
		Info_ClearChoices(DIA_Lobart_RuebenRunning);
		if(hero.guild == GIL_NONE)
		{
			Info_AddChoice(DIA_Lobart_RuebenRunning,"Udělej mi lepší cenu na ty šaty!",DIA_Lobart_RuebenRunning_Billiger);
		};
		Info_AddChoice(DIA_Lobart_RuebenRunning,"Dej mi těch pět zlaých!",DIA_Lobart_RuebenRunning_Gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_06");	//Ale to není všech dvacet!
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_07");	//Jsi tady na dovolené? Doufám, že ne, chlapče, jinak můžeš na svou mzdu zapomenout!
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_08");	//Vrať se tam a přines jich víc! Mazej do práce, nebo ti ukážu!
		};
		AI_StopProcessInfos(self);
	};
};

func void DIA_Lobart_RuebenRunning_Gold()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Gold_15_00");	//Dej mi těch pět zlaých!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_01");	//Tady.
	B_GiveInvItems(self,other,ItMi_Gold,5);
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_02");	//A hned to nepropij.
	};
	Info_ClearChoices(DIA_Lobart_RuebenRunning);
};

func void DIA_Lobart_RuebenRunning_Billiger()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Billiger_15_00");	//Udělej mi lepší cenu na ty šaty!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Billiger_05_01");	//Fajn, dostaneš je o deset zlatých levněji.
	Info_ClearChoices(DIA_Lobart_RuebenRunning);
};

var int LobartOut;

instance DIA_Lobart_MoreWork(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_MoreWork_Condition;
	information = DIA_Lobart_MoreWork_Info;
	permanent = TRUE;
	description = "Máš pro mě ještě nějakou další práci?";
};


func int DIA_Lobart_MoreWork_Condition()
{
	if(((MIS_Lobart_Rueben == LOG_Running) || (MIS_Lobart_Rueben == LOG_SUCCESS)) && (Kapitel < 3) && (LobartOut == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_MoreWork_Info()
{
	AI_Output(other,self,"DIA_Lobart_MoreWork_15_00");	//Máš pro mě ještě nějakou další práci?

	if(MIS_Lobart_Rueben == LOG_Running)
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_01");	//Nejdřív skliď ty tuříny a pak se uvidí.
	}
	else if(MIS_Lobart_Psicamp == FALSE)
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_03");	//(zamyšleně) Ano, je tu něco. I když je to spíš prosba, než práce.
		AI_Output(other,self,"DIA_Lobart_MoreWork_05_04");	//A co?
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_05");	//Podívej... Nedávno se za mojí farmou usídlili nějací podivní lidé.
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_06");	//(nejistě) Nevypadají jako banditi, ale stejně na mě působí nějak... nepříjemně.
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_07");	//Pokus se zjistit, kdo jsou a proč sem přišli.
		AI_Output(other,self,"DIA_Lobart_MoreWork_05_08");	//Kde jsi je viděl?
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_09");	//Na kopci za farmou, poblíž kamenného kruhu.
		AI_Output(other,self,"DIA_Lobart_MoreWork_05_10");	//Dobrá. Vrátím se brzy.
		MIS_Lobart_Psicamp = LOG_Running;
		Log_CreateTopic(TOPIC_Lobart_Psicamp,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Lobart_Psicamp,LOG_Running);
		B_LogEntry(TOPIC_Lobart_Psicamp,"Lobart je znepokojen neznámými lidmi, kteří se usadili za jeho farmou. Musím zjistit, co jsou zač.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_02");	//Já ne, ale můžeš se zeptat mé ženy nebo chlapů na polích. Třeba budou potřebovat s něčím pomoct.
		LobartOut = TRUE;
	};
};

instance DIA_Lobart_Psicamp(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_Psicamp_Condition;
	information = DIA_Lobart_Psicamp_Info;
	description = "Zjistil jsem, kdo jsou ti lidé.";
};

func int DIA_Lobart_Psicamp_Condition()
{
	if((MIS_Lobart_Psicamp == LOG_Running) && (MeetLobartPsiCamp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_Psicamp_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Lobart_Psicamp_01_00");	//Zjistil jsem, kdo jsou ti lidé.
	AI_Output(self,other,"DIA_Lobart_Psicamp_01_01");	//(vzrušeně) Vážně? Kdo je to?
	AI_Output(other,self,"DIA_Lobart_Psicamp_01_02");	//Nemusíš mít strach, jsou to jen obyčejní sběrači bažinné trávy.
	AI_Output(other,self,"DIA_Lobart_Psicamp_01_03");	//Nemyslím si, že budou dělat potíže.
	AI_Output(self,other,"DIA_Lobart_Psicamp_01_04");	//No, pokud máš pravdu, tak není důvod k obavám. Díky za pomoc.
	MIS_Lobart_Psicamp = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Lobart_Psicamp,LOG_SUCCESS);
	B_LogEntry(TOPIC_Lobart_Psicamp,"Řekl jsem Lobartovi o novicích Bratrstva.");
};

instance DIA_Lobart_ANDREHELPLOBART(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_ANDREHELPLOBART_Condition;
	information = DIA_Lobart_ANDREHELPLOBART_Info;
	description = "Poslal mě za tebou lord Andre.";
};

func int DIA_Lobart_ANDREHELPLOBART_Condition()
{
	if(MIS_AndreHelpLobart == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lobart_ANDREHELPLOBART_Info()
{
	AI_Output(other,self,"DIA_Lobart_ANDREHELPLOBART_15_00");	//Poslal mě za tebou lord Andre. Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_01");	//Jo, to teda mám. Z těch zatracenejch polních škůdců se mi už zvedá kufr.
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_02");	//Oddělej je všechny... Je mi jedno jak!
	Log_AddEntry(TOPIC_BecomeMIL,"Lobartova pole sužují polní škůdci - mám se o ně postarat.");
	MIS_LobartKillBugs = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_BUGDEAD(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_BUGDEAD_Condition;
	information = DIA_Lobart_BUGDEAD_Info;
	permanent = TRUE;
	description = "Oddělal jsem všechny polní škůdce!";
};


var int DIA_Lobart_BUGDEAD_noPerm;

func int DIA_Lobart_BUGDEAD_Condition()
{
	if((MIS_LobartKillBugs == LOG_Running) && (DIA_Lobart_BUGDEAD_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_BUGDEAD_Info()
{
	if(Npc_IsDead(Lobarts_Giant_Bug1) && Npc_IsDead(Lobarts_Giant_Bug2) && Npc_IsDead(Lobarts_Giant_Bug3) && Npc_IsDead(Lobarts_Giant_Bug4) && Npc_IsDead(Lobarts_Giant_Bug5) && Npc_IsDead(Lobarts_Giant_Bug6) && Npc_IsDead(Lobarts_Giant_Bug7))
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_00");	//Oddělal jsem všechny polní škůdce!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_01");	//Dobrá práce. Nejsi zas tak špatnej deratizátor. Doporučím tě sousedům. Na oplátku si vezmi tohle.
		B_StartOtherRoutine(Vino,"Start");
		B_StartOtherRoutine(LobartsBauer1,"Start");
		B_StartOtherRoutine(LobartsBauer2,"Start");
		if(SNIPSGETNUGGETS == FALSE)
		{
			B_StartOtherRoutine(snipes,"Start");
		};
		CreateInvItems(self,ItMi_Gold,20);
		B_GiveInvItems(self,other,ItMi_Gold,20);
		MIS_LobartKillBugs = LOG_SUCCESS;
		MIS_AndreHelpLobart = LOG_SUCCESS;
		Log_AddEntry(TOPIC_BecomeMIL,"Polní škůdci už nebudou Lobarta obtěžovat - všichni už jsou pryč.");
		DIA_Lobart_BUGDEAD_noPerm = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_02");	//Myslím, že už jsem je všechny pozabíjel!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_03");	//Hele, nedělej ze mě blázna. Vždyť jsou jich tu všude mraky. Buďto je oddělej, nebo na celou tuhle věc zapomeň!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lobart_KAP3_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP3_EXIT_Condition;
	information = DIA_Lobart_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_DMT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 30;
	condition = DIA_Lobart_DMT_Condition;
	information = DIA_Lobart_DMT_Info;
	description = "Jak to jde s tvou farmou?";
};


func int DIA_Lobart_DMT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_DMT_Info()
{
	AI_Output(other,self,"DIA_Lobart_DMT_15_00");	//Jak to jde s tvou farmou?
	AI_Output(self,other,"DIA_Lobart_DMT_05_01");	//Už se to nedá vydržet.
	AI_Output(self,other,"DIA_Lobart_DMT_05_02");	//Najednou se tu objevili ti chlápci v černých kápích a postávají u cesty a u mojí farmy.
	Info_ClearChoices(DIA_Lobart_DMT);
	Info_AddChoice(DIA_Lobart_DMT,Dialog_Ende,DIA_Lobart_DMT_BACK);

	if((hero.guild == GIL_KDF) && (Vino_isAlive_Kap3 == TRUE))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_03");	//Nejdřív hrozně dlouho mluvili s Vinem a pak zmizeli i s ním.
		if(NpcObsessedByDMT_Vino == FALSE)
		{
			Info_AddChoice(DIA_Lobart_DMT,"Kam odvlekli Vina?",DIA_Lobart_DMT_VinoWohin);
		};
		Info_AddChoice(DIA_Lobart_DMT,"Co od něj chtěli?",DIA_Lobart_DMT_VinoWas);
	};
	if(Npc_IsDead(Hilda) == FALSE)
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_04");	//Brzo nato má žena zase onemocněla. Nemůže ani vylézt z postele. Stává se jí to často.
	};
	AI_Output(self,other,"DIA_Lobart_DMT_05_05");	//Já už se z toho snad zblázním!

	if((MIS_HealHilda != LOG_SUCCESS) && (Npc_IsDead(Hilda) == FALSE))
	{
		Info_AddChoice(DIA_Lobart_DMT,"Proč ji nevezmeš k léčiteli?",DIA_Lobart_DMT_FrauHeilen);
	};

	Info_AddChoice(DIA_Lobart_DMT,"Proč s těmi černokabátníky něco neuděláš?",DIA_Lobart_DMT_hof);
	Info_AddChoice(DIA_Lobart_DMT,"Mluvil jsi s těmi muži v černém?",DIA_Lobart_DMT_spokeToThem);
};

func void DIA_Lobart_DMT_FrauHeilen()
{
	AI_Output(other,self,"DIA_Lobart_DMT_FrauHeilen_15_00");	//Proč ji nevezmeš k léčiteli?
	AI_Output(self,other,"DIA_Lobart_DMT_FrauHeilen_05_01");	//Měli bychom zajít do města za Vatrasem, ale dokud je farma v takovémhle stavu, nemůžu se odsud hnout.
	Log_CreateTopic(TOPIC_HealHilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda,LOG_Running);
	B_LogEntry(TOPIC_HealHilda,"Lobartově ženě Hildě je špatně, ale Vatras by pro ni měl mít nějaký lék.");
	MIS_HealHilda = LOG_Running;
};

func void DIA_Lobart_DMT_BACK()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Lobart_DMT_spokeToThem()
{
	AI_Output(other,self,"DIA_Lobart_DMT_spokeToThem_15_00");	//Mluvil jsi s těmi muži v černém?
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_01");	//No jistě, tomu se nejde vyhnout.
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_02");	//Přijde mi, že někoho hledají.
};

func void DIA_Lobart_DMT_hof()
{
	AI_Output(other,self,"DIA_Lobart_DMT_hof_15_00");	//Proč s těmi černokabátníky něco neuděláš?
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_01");	//Vážně bych rád. Ale viděl jsem, jak jednoho člověka z města upálili zaživa. Jenom tak.
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_02");	//Proč bych měl kvůli tomu riskovat život?
};

func void DIA_Lobart_DMT_VinoWas()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWas_15_00");	//Co s nimi měl Vino společného?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWas_05_01");	//To neříkal. Prostě ho vzali s sebou.
};

func void DIA_Lobart_DMT_VinoWohin()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWohin_15_00");	//Kam odvedli Vina?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWohin_05_01");	//Šli nahoru do hor.
};


instance DIA_Lobart_VINOTOT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 32;
	condition = DIA_Lobart_VINOTOT_Condition;
	information = DIA_Lobart_VINOTOT_Info;
	description = "Vino se už nevrátí.";
};


func int DIA_Lobart_VINOTOT_Condition()
{
	if((Npc_IsDead(Vino) || (NpcObsessedByDMT_Vino == TRUE)) && Npc_KnowsInfo(other,DIA_Lobart_DMT) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Lobart_VINOTOT_Info()
{
	AI_Output(other,self,"DIA_Lobart_VINOTOT_15_00");	//Vino se už nevrátí.
	if(Npc_IsDead(Vino))
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");	//Je mrtvý.
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_02");	//Přivedli ho k šílenství.
	};
	AI_Output(self,other,"DIA_Lobart_VINOTOT_05_03");	//U Innose. Doufejme, že ta noční můra už brzy skončí.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lobart_PERM(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 80;
	condition = DIA_Lobart_PERM_Condition;
	information = DIA_Lobart_PERM_Info;
	permanent = TRUE;
	description = "Dávej na svou farmu pozor!";
};


func int DIA_Lobart_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_DMT) && (Kapitel >= 3) && (Npc_IsDead(OrcWarrior_Lobart1) && Npc_IsDead(OrcWarrior_Lobart2) && Npc_IsDead(OrcWarrior_Lobart3) && Npc_IsDead(OrcWarrior_Lobart4) && Npc_IsDead(OrcWarrior_Lobart5) && Npc_IsDead(OrcWarrior_Lobart6)))
	{
		return TRUE;
	};
};

func void DIA_Lobart_PERM_Info()
{
	AI_Output(other,self,"DIA_Lobart_PERM_15_00");	//Dávej na svou farmu pozor!
	AI_Output(self,other,"DIA_Lobart_PERM_05_01");	//Pokusím se.
};


instance DIA_Lobart_KAP4_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP4_EXIT_Condition;
	information = DIA_Lobart_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_ORKPROBLEM(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 41;
	condition = DIA_Lobart_ORKPROBLEM_Condition;
	information = DIA_Lobart_ORKPROBLEM_Info;
	description = "Máš problém se skřety?";
};


func int DIA_Lobart_ORKPROBLEM_Condition()
{
	if(((Npc_IsDead(OrcWarrior_Lobart1) == FALSE) || (Npc_IsDead(OrcWarrior_Lobart2) == FALSE) || (Npc_IsDead(OrcWarrior_Lobart3) == FALSE) || (Npc_IsDead(OrcWarrior_Lobart4) == FALSE) || (Npc_IsDead(OrcWarrior_Lobart5) == FALSE) || (Npc_IsDead(OrcWarrior_Lobart6) == FALSE)) && (Kapitel >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)) && Npc_KnowsInfo(other,DIA_Lobart_DMT))
	{
		return TRUE;
	};
};

func void DIA_Lobart_ORKPROBLEM_Info()
{
	AI_Output(other,self,"DIA_Lobart_ORKPROBLEM_15_00");	//Máš problém se skřety?
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_01");	//(naštvaně) Zatraceně. Copak to nikdy neskončí?
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_02");	//Když to takhle půjde dál, nebude moje farma stát ani za zlámanou grešli.
	Log_CreateTopic(TOPIC_LobartsOrKProblem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartsOrKProblem,LOG_Running);
	B_LogEntry(TOPIC_LobartsOrKProblem,"Na Lobartově statku se usadili skřeti. Mám je nějak zahnat.");
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_ORKSWEG(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 42;
	condition = DIA_Lobart_ORKSWEG_Condition;
	information = DIA_Lobart_ORKSWEG_Info;
	description = "Vyhnal jsem skřety z tvého pozemku.";
};


func int DIA_Lobart_ORKSWEG_Condition()
{
	if((Npc_IsDead(OrcWarrior_Lobart1) == TRUE) && (Npc_IsDead(OrcWarrior_Lobart2) == TRUE) && (Npc_IsDead(OrcWarrior_Lobart3) == TRUE) && (Npc_IsDead(OrcWarrior_Lobart4) == TRUE) && (Npc_IsDead(OrcWarrior_Lobart5) == TRUE) && (Npc_IsDead(OrcWarrior_Lobart6) == TRUE) && (Kapitel >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lobart_ORKSWEG_Info()
{
	AI_Output(other,self,"DIA_Lobart_ORKSWEG_15_00");	//Vyhnal jsem skřety z tvého pozemku.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_01");	//Nikdo by neměl říkat, že paladinové pro nás malé farmáře nic nedělají.
	};
	AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_02");	//Díky Innosovi. Nemůžu ti toho dát zrovna moc, ale doufám, že oceníš malé vyjádření mé vděčnosti.
	B_StartOtherRoutine(Vino,"Start");
	B_StartOtherRoutine(LobartsBauer1,"Start");
	B_StartOtherRoutine(LobartsBauer2,"Start");

	if(SNIPSGETNUGGETS == FALSE)
	{
		B_StartOtherRoutine(BAU_987_SNIPES,"Start");
	};

	TOPIC_END_LobartsOrKProblem = TRUE;
	B_GivePlayerXP(XP_KilledLobartOrks);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
};


instance DIA_Lobart_KAP5_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP5_EXIT_Condition;
	information = DIA_Lobart_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_KAP6_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP6_EXIT_Condition;
	information = DIA_Lobart_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_PICKPOCKET(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 900;
	condition = DIA_Lobart_PICKPOCKET_Condition;
	information = DIA_Lobart_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lobart_PICKPOCKET_Condition()
{
	return C_Beklauen(65,80);
};

func void DIA_Lobart_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
	Info_AddChoice(DIA_Lobart_PICKPOCKET,Dialog_Back,DIA_Lobart_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lobart_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lobart_PICKPOCKET_DoIt);
};

func void DIA_Lobart_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
};

func void DIA_Lobart_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
};

instance DIA_Lobart_LobartMeal(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 41;
	condition = DIA_Lobart_LobartMeal_Condition;
	information = DIA_Lobart_LobartMeal_Info;
	description = "Vatras čeká na dodávku potravin.";
};

func int DIA_Lobart_LobartMeal_Condition()
{
	// if((MIS_LobartMeal == LOG_Running) && (Npc_HasItems(other,ItMi_VatrasPurse) >= 1))
	if((MIS_LobartMeal == LOG_Running) && ((Npc_HasItems(other,ItMi_VatrasPurse) >= 1) || (Npc_HasItems(other,ItMi_Gold) >= 300)))
	{
		return TRUE;
	};
};

func void DIA_Lobart_LobartMeal_Info()
{
	AI_Output(other,self,"DIA_Lobart_LobartMeal_01_00");	//Vatras čeká na dodávku potravin.
	AI_Output(self,other,"DIA_Lobart_LobartMeal_01_01");	//Samozřejmě. Připravil jsem všechno. Stačí jen vyřídit platbu.
	AI_Output(other,self,"DIA_Lobart_LobartMeal_01_02");	//Posílá ti 300 zlatých.
	if(Npc_HasItems(other,ItMi_VatrasPurse) >= 1)
	{
	B_GiveInvItems(other,self,ItMi_VatrasPurse,1);
	Npc_RemoveInvItems(self,ItMi_VatrasPurse,1);
    }
	else
	{	
	    B_GiveInvItems(other,self,ItMi_Gold,300);
		Npc_RemoveInvItems(self,ItMi_Gold,300);
    };
	AI_Output(self,other,"DIA_Lobart_LobartMeal_01_03");	//(spokojeně) To je od něj velice štědré. S takovými lidmi je radost obchodovat!
	AI_Output(self,other,"DIA_Lobart_LobartMeal_01_04");	//Vyřiď Vatrasovi moji vděčnost a tady je ten balíček.
	B_GiveInvItems(self,other,ItMi_VatrasPacket,1);
	B_LogEntry(TOPIC_LobartMeal,"Lobart mi dal dodávku potravin pro Vatrase.");
};
