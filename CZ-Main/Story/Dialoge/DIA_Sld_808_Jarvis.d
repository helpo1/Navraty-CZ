
instance DIA_Jarvis_EXIT(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 999;
	condition = DIA_Jarvis_EXIT_Condition;
	information = DIA_Jarvis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jarvis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jarvis_Hello(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 1;
	condition = DIA_Jarvis_Hello_Condition;
	information = DIA_Jarvis_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jarvis_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Hello_Info()
{
	AI_Output(self,other,"DIA_Jarvis_Hello_04_00");	//Hej! Neznám tě odněkud?
	AI_Output(other,self,"DIA_Jarvis_Hello_15_01");	//To je možný. Taky jsem byl v kolonii.
	AI_Output(self,other,"DIA_Jarvis_Hello_04_02");	//Správně... Co chceš?
};


instance DIA_Jarvis_DieLage(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 2;
	condition = DIA_Jarvis_DieLage_Condition;
	information = DIA_Jarvis_DieLage_Info;
	permanent = FALSE;
	description = "Jak to vypadá?";
};


func int DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};

func void DIA_Jarvis_DieLage_Info()
{
	AI_Output(other,self,"DIA_Jarvis_DieLage_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_01");	//Právě teď máme skutečný problém. Mezi námi žoldáky se vytváří dvě frakce.
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_02");	//Sylvio a jeho lidé pochybují, že Lee se drží správného záměru.
};


instance DIA_Jarvis_TwoFronts(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 3;
	condition = DIA_Jarvis_TwoFronts_Condition;
	information = DIA_Jarvis_TwoFronts_Info;
	permanent = FALSE;
	description = "Jak to, že jsou tu dvě frakce?";
};


func int DIA_Jarvis_TwoFronts_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_TwoFronts_Info()
{
	AI_Output(other,self,"DIA_Jarvis_TwoFronts_15_00");	//Jak to, že jsou tu dvě frakce?
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_01");	//Většina z nás se vrátila z kolonie s Leem.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_02");	//Ale někteří ze žoldáků se k nám připojili později.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_03");	//Nepřišli z kolonie, ale bojovali daleko na jihu se skřety.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_04");	//Nějak se dozvěděli, že Lee potřeboval lidi. Jejich vůdcem byl Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_05");	//On souhlasil s tím, že Lee zůstane velitelem, ale nyní se snaží poštvat ostatní žoldáky proti němu a jeho záměrům.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_06");	//Hodně Leeových lidí si nemyslí, že je to velkej problém. Ale já znám týpky jako je Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_07");	//Aby docílil svého, bude to klidně hnát na ostří nože.
};


instance DIA_Jarvis_LeesPlan(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 4;
	condition = DIA_Jarvis_LeesPlan_Condition;
	information = DIA_Jarvis_LeesPlan_Info;
	permanent = FALSE;
	description = "Víš, co chce Lee dělat?";
};


func int DIA_Jarvis_LeesPlan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_LeesPlan_Info()
{
	AI_Output(other,self,"DIA_Jarvis_LeesPlan_15_00");	//Víš, co chce Lee dělat?
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_01");	//Lee chce, abychom počkali a nechali paladiny ve městě vyhladovět.
	};
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_02");	//Chce nás všechny dostat z ostrova. A Innos ví, že nemám nic proti tomu odsud vypadnout.
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_03");	//Skutečně nevím, co přesně má za lubem, ale já mu věřím. Vedl nás doteďka dobře.
};


instance DIA_Jarvis_SylviosPlan(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 5;
	condition = DIA_Jarvis_SylviosPlan_Condition;
	information = DIA_Jarvis_SylviosPlan_Info;
	permanent = FALSE;
	description = "Víš, co má Sylvio v plánu?";
};


func int DIA_Jarvis_SylviosPlan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_SylviosPlan_Info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosPlan_15_00");	//Víš, co má Sylvio v plánu?
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_01");	//Sylvio zjistil, že někteří z paladinů se přesunuli do staré kolonie.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_02");	//Říká, že zbytek paladinů by si nás tady neodvážil napadnout, a chce z toho vytěžit co nejvíc.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_03");	//Drancování malých farem, přepadávání vojenských hlídek mimo města, olupování poutníků, prostě takovéhle věci.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_04");	//Ale Lee si myslí, že by to byla ta nejhorší věc, jakou bychom v naší situaci mohli udělat.
};


instance DIA_Jarvis_WannaJoin(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 6;
	condition = DIA_Jarvis_WannaJoin_Condition;
	information = DIA_Jarvis_WannaJoin_Info;
	permanent = FALSE;
	description = "Chtěl bych se stát žoldákem!";
};


func int DIA_Jarvis_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_00");	//Chtěl bych se stát žoldákem!
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_01");	//Nejsem si jistej, že je to dobrej nápad...
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_02");	//Kde je problém?
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_03");	//No, buď budu hlasovat pro, nebo proti.
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_04");	//A v situaci, ve které jsme, bych pro tebe určitě hlasoval, kdybych si byl jistej, že jsi na Leeho straně!
};


instance DIA_Jarvis_MissionKO(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_MissionKO_Condition;
	information = DIA_Jarvis_MissionKO_Info;
	permanent = FALSE;
	description = "Takže co bych měl dělat?";
};


func int DIA_Jarvis_MissionKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_WannaJoin) && Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_MissionKO_Info()
{
	AI_Output(other,self,"DIA_Jarvis_MissionKO_15_00");	//Takže co bych měl dělat?
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_01");	//Jednoduché. Zmlať pár Sylviových hochů! Tímhle způsobem budou obě strany přesně vědět, kde stojíš.
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_02");	//A pokud se budeš při souboji držet pravidel, dokonce získáš respekt ostatních.
	MIS_Jarvis_SldKO = LOG_Running;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic(TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JarvisSLDKo,LOG_Running);
	B_LogEntry(TOPIC_JarvisSLDKo,"Jarvis mi dá svůj hlas, pokud se mi podaří porazit Sylviovy hochy.");
};


instance DIA_Jarvis_DuellRegeln(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_DuellRegeln_Condition;
	information = DIA_Jarvis_DuellRegeln_Info;
	permanent = FALSE;
	description = "Jaká jsou pravidla pro souboj?";
};


func int DIA_Jarvis_DuellRegeln_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_DuellRegeln_Info()
{
	AI_Output(other,self,"DIA_Jarvis_DuellRegeln_15_00");	//Jaká jsou pravidla pro souboj?
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_01");	//Běž za Torlofem a nech si to vysvětlit, pokud tě to zajímá.
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_02");	//Takže už si rozumíme: Nezajímá mě, jestli dodržuješ pravidla nebo ne. Prostě ať ti chlapi leží držkou v bahně!
	B_LogEntry(TOPIC_JarvisSLDKo,"A já se žádnými soubojovými pravidly řídit nemusím...");
};


instance DIA_Jarvis_SylviosMen(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_SylviosMen_Condition;
	information = DIA_Jarvis_SylviosMen_Info;
	permanent = FALSE;
	description = "Kteří ze žoldáků jsou Sylviovi muži?";
};


func int DIA_Jarvis_SylviosMen_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_SylviosMen_Info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosMen_15_00");	//Kteří ze žoldáků jsou Sylviovi muži?
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_01");	//Je to šest chlapů. První je Sylvio sám a jeho pravá ruka Bullco.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_02");	//A pak jsou tu Rod, Sentenza, Fester a Raoul.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_03");	//Zbytek chlapů je buď neutrálních, nebo na Leeově straně.
	B_LogEntry(TOPIC_JarvisSLDKo,"K Sylviovým chlapům patří kromě Sylvia ještě jeho pravá ruka Bullco, Rod, Sentenza, Fester a Raoul.");
};


instance DIA_Jarvis_HowMany(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_HowMany_Condition;
	information = DIA_Jarvis_HowMany_Info;
	permanent = FALSE;
	description = "Kolik Sylviových chlapů mám porazit?";
};


func int DIA_Jarvis_HowMany_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_HowMany_Info()
{
	AI_Output(other,self,"DIA_Jarvis_HowMany_15_00");	//Kolik Sylviových chlapů mám porazit?
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_01");	//Pokud srazíš tři z nich k zemi, pak nám dokážeš, na které jsi straně.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_02");	//Koho z nich si vybereš, to je tvoje věc.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_03");	//Alespoň jedna malá rada: tohle není o tom dokázat si kuráž. Nechoď přímo proti Sylviovi samotnému - nadělal by z tebe sekanou.
	B_LogEntry(TOPIC_JarvisSLDKo,"Postačí, když porazím tři Sylviovy kumpány - se Sylviem samotným bych se do křížku radši pouštět neměl.");
};


instance DIA_Jarvis_HowManyLeft(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_HowManyLeft_Condition;
	information = DIA_Jarvis_HowManyLeft_Info;
	permanent = TRUE;
	description = "Kolik Sylviových mužů mám ještě na seznamu?";
};

func int DIA_Jarvis_HowManyLeft_Condition()
{
	if((MIS_Jarvis_SldKO == LOG_Running) && Npc_KnowsInfo(other,DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_HowManyLeft_Info()
{
	var int victories;

	AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_00");	//Kolik Sylviových mužů mám ještě na seznamu?
	victories = 0;

	if((Bullco.aivar[AIV_DefeatedByPlayer] == TRUE) || (Bullco.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_01");	//Porazil jsem Bullca.
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_02");	//Slyšel jsem. To nebylo zlý!
		victories = victories + 1;
	};
	if((Rod.aivar[AIV_DefeatedByPlayer] == TRUE) || (Rod.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_03");	//Rod vypadá trochu unaveně.
		victories = victories + 1;
	};
	if((Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE) || (Sentenza.aivar[AIV_KilledByPlayer] == TRUE))
	{
		if(Npc_KnowsInfo(other,DIA_Sentenza_Hello))
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_04");	//Sentenza se pokusil ze mne dostat nějakou zlatku - to nebylo chytrý.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_05");	//Sundal jsem Sentenzu.
		};

		victories = victories + 1;
	};
	if((Fester.aivar[AIV_DefeatedByPlayer] == TRUE) || (Fester.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_07");	//Fester dostal to, co si zasloužil.
		victories = victories + 1;
	};
	if((Raoul.aivar[AIV_DefeatedByPlayer] == TRUE) || (Raoul.aivar[AIV_KilledByPlayer] == TRUE))
	{
		if(victories == 0)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_08");	//A to samé Raoul...
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_09");	//Byl jsem se na Raoula podívat...
		};

		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");	//A?
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_11");	//Potřeboval pořádnou nakládačku.
		victories = victories + 1;
	};
	if(victories < 3)
	{
		if(victories == 0)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_12");	//Doteď jsi nesložil jedinýho Sylviova chlapa.
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_13");	//Dobrá, pokračuj v práci.
		};

		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_14");	//Chci abys zmlátil aspoň tři z nich.
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_15");	//To stačí, už toho bylo dost.

		if(victories == 6)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_16");	//Ty jsi skutečně napráskal každýmu z nich, jo?
		};

		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_17");	//Udělal jsi na mě dojem - až se mě Lee zeptá, budu bez váhání hlasovat pro tebe.
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		B_GivePlayerXP(XP_Ambient * victories);
		B_LogEntry(TOPIC_SLDRespekt,"Když se budu chtít připojit k žoldákům, Jarvis bude pro.");
	};
};

instance DIA_Jarvis_ShieldTeach(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_ShieldTeach_Condition;
	information = DIA_Jarvis_ShieldTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě něco naučit?";
};

func int DIA_Jarvis_ShieldTeach_Condition()
{
	if((JarvisShieldTeach == FALSE) && ((MIS_Jarvis_SldKO == LOG_SUCCESS) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_ShieldTeach_Info()
{
	AI_Output(other,self,"DIA_Jarvis_ShieldTeach_01_00");	//Můžeš mě něco naučit?

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_01");	//Vzhledem k tomu, že jsi teď jedním z nás, pak ti mohu ukázat, jak zacházet se štítem.
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_02");	//Není to zas tak jednoduchá záležitost, jak se může na první pohled zdát.
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_03");	//Ale když aspoň trochu pochopíš, základní principy, tak se to naučíš - a opravdu to stojí za to!
		AI_Output(other,self,"DIA_Jarvis_ShieldTeach_01_04");	//Zní to skvěle. Kdy začneme?
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_05");	//(zasměje se) Ne tak rychle, kamaráde! Za prvé, budeš mi muset zaplatit.
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_06");	//Nejsem charita, z dobroty srdce, se tvým učitelem nestanu.
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_07");	//A musíš mít nějaké zkušenosti, jinak bude můj výcvik zbytečný. 
		AI_Output(other,self,"DIA_Jarvis_ShieldTeach_01_08");	//Pochopil jsem, tak už nezdržuj.
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_09");	//Řekni mě, až budeš připraven a můžem začít.
		JarvisShieldTeach = TRUE;
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,"Jarvis mě může naučit, jak zacházet se štítem.");
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_10");	//Ne! pokud nejsi jeden z nás, nic tě učit nebudu.
	};
};

instance DIA_Jarvis_Shield_Teach(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_Shield_Teach_Condition;
	information = DIA_Jarvis_Shield_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě zacházet se štítem. (VB: 10, cena: 1000 zlatých)";
};

func int DIA_Jarvis_Shield_Teach_Condition()
{
	if((JarvisShieldTeach == TRUE) && (hero.attribute[ATR_REGENERATEMANA] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Shield_Teach_Info()
{
	AI_Output(other,self,"DIA_Jarvis_Shield_Teach_15_00");	//Nauč mě zacházet se štítem.

	if((hero.lp >= 10) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		B_GiveInvItems(other,self,ItMi_Gold,1000);
		Npc_RemoveInvItems(self,ItMi_Gold,1000);
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_01");	//Dobře! Pozorně poslouchej.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_02");	//Štít - je něco, co ti může v těžkých chvílích zachránit prdel, před smrtelnou ranou.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_03");	//Zacházet se štítem neumí každý! Ale když se to naučíš, tak to stojí za to.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_04");	//Za prvé snaž se udržet štít v úrovni očí, ne níž ani výš.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_05");	//To ti umožní, dobře sledovat protivníka a včas štítem vykrýt úder.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_06");	//Úder mečem musí být rychlý bez velkého nápřahu. Odkrýt se, udeřit a znova se schovat za štít!
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_07");	//Nepřítel si bude marně lámat hlavu nad tím, jak překonat tvoji obranu.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_08");	//A dřív nebo později udělá chybu kterou můžeš využít.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_09");	//Když budeš dělat vše jak jsem tě učil, jednoho dne se staneš mistrem štítu!
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_10");	//A ještě něco... Přijmi tento dřevěný štít jako malý dárek.
		B_GiveInvItems(self,other,ItAr_Shield_01,1);
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_11");	//To je vše k první lekci. Teď to můžeš jít vyzkoušet.
		AI_Print("Naučeno: Boj se štítem");
		Snd_Play("LevelUP");
		hero.attribute[ATR_REGENERATEMANA] = TRUE;
		Npc_SetTalentSkill(hero,NPC_TALENT_RHETORIKA,1);
		Npc_SetTalentValue(hero,NPC_TALENT_RHETORIKA,hero.attribute[ATR_REGENERATEMANA]);
	}
	else
	{
		if(hero.lp < 10)
		{
			AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_16");	//Nemáš dostatek zkušeností, promiň kamaráde.
		}
		else if(Npc_HasItems(other,ItMi_Gold) < 1000)
		{
			AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_17");	//Nemáš dostatek zlata, smůla.
		};
	};
};

instance DIA_Jarvis_Shield_Teach_More(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_Shield_Teach_More_Condition;
	information = DIA_Jarvis_Shield_Teach_More_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak bojovat se štítem.";
};

func int DIA_Jarvis_Shield_Teach_More_Condition()
{
	if((JarvisShieldTeach == TRUE) && (hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] <= 100))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Shield_Teach_More_Info()
{
	AI_Output(other,self,"DIA_Jarvis_Shield_Teach_More_15_00");	//Ukaž mi, jak bojovat se štítem.
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,Dialog_Back,DIA_Jarvis_Shield_Teach_More_Back);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield1,DIA_Jarvis_Shield_Teach_More_1);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield5,DIA_Jarvis_Shield_Teach_More_5);
};

func void DIA_Jarvis_Shield_Teach_More_Back()
{
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
};

func void DIA_Jarvis_Shield_Teach_More_1()
{
	B_TeachShield(self,other,1,100);
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,Dialog_Back,DIA_Jarvis_Shield_Teach_More_Back);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield1,DIA_Jarvis_Shield_Teach_More_1);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield5,DIA_Jarvis_Shield_Teach_More_5);
};

func void DIA_Jarvis_Shield_Teach_More_5()
{
	B_TeachShield(self,other,5,100);
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,Dialog_Back,DIA_Jarvis_Shield_Teach_More_Back);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield1,DIA_Jarvis_Shield_Teach_More_1);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield5,DIA_Jarvis_Shield_Teach_More_5);
};

var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_PERM_Condition;
	information = DIA_Jarvis_PERM_Info;
	permanent = TRUE;
	description = "Co je nového?";
};

func int DIA_Jarvis_PERM_Condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_PERM_Info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//Co je nového?

	if(Kapitel <= 3)
	{
		if(Jarvis_GuildComment == FALSE)
		{
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_01");	//Teď jsi jeden z nás. To je dobře.
			}
			else
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_02");	//Vybral sis špatně, mohl ses stát jedním z nás.
			};
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_03");	//Poslední dobou se Sylviovi lidé dost zkrotli.
		};
	};
	if(Kapitel >= 4)
	{
		if(Jarvis_SylvioComment == FALSE)
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_04");	//Sylvio je konečně pryč. Po tom, co slyšel o dracích, on a jeho pár chlapů směřovali do trestanecké kolonie.
			AI_Output(self,other,"DIA_Jarvis_PERM_04_05");	//Pravděpodobně si myslel, že by tam mohlo být něco víc.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_06");	//Nic, teď už je všechno v klidu. Nemohu se dočkat toho, až uvidím, jak tohle všechno dopadne.
		};
	};
};


instance DIA_Jarvis_PICKPOCKET(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 900;
	condition = DIA_Jarvis_PICKPOCKET_Condition;
	information = DIA_Jarvis_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jarvis_PICKPOCKET_Condition()
{
	return C_Beklauen(41,55);
};

func void DIA_Jarvis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice(DIA_Jarvis_PICKPOCKET,Dialog_Back,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jarvis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
};

func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
};
