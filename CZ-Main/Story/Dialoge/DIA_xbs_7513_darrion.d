
instance XBS_7513_DARRION_EXIT(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 999;
	condition = xbs_7513_darrion_exit_condition;
	information = xbs_7513_darrion_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int xbs_7513_darrion_exit_condition()
{
	return TRUE;
};

func void xbs_7513_darrion_exit_info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance XBS_7513_DARRION_NO_TALK(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_no_talk_condition;
	information = xbs_7513_darrion_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int xbs_7513_darrion_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance XBS_7513_DARRION_PICKPOCKET(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 900;
	condition = xbs_7513_darrion_pickpocket_condition;
	information = xbs_7513_darrion_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int xbs_7513_darrion_pickpocket_condition()
{
	return C_Beklauen(85,102);
};

func void xbs_7513_darrion_pickpocket_info()
{
	Info_ClearChoices(xbs_7513_darrion_pickpocket);
	Info_AddChoice(xbs_7513_darrion_pickpocket,Dialog_Back,xbs_7513_darrion_pickpocket_back);
	Info_AddChoice(xbs_7513_darrion_pickpocket,DIALOG_PICKPOCKET,xbs_7513_darrion_pickpocket_doit);
};

func void xbs_7513_darrion_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(xbs_7513_darrion_pickpocket);
};

func void xbs_7513_darrion_pickpocket_back()
{
	Info_ClearChoices(xbs_7513_darrion_pickpocket);
};


instance XBS_7513_DARRION_HI(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_hi_condition;
	information = xbs_7513_darrion_hi_info;
	permanent = FALSE;
	description = "Jak to jde?";
};

func int xbs_7513_darrion_hi_condition()
{
	return TRUE;
};

func void xbs_7513_darrion_hi_info()
{
	AI_Output(other,self,"XBS_7513_Darrion_Hi_15_00");	//Jak to jde?
	AI_Output(self,other,"XBS_7513_Darrion_Hi_06_01");	//Pořád to samé dokola.
	AI_Output(other,self,"XBS_7513_Darrion_Hi_15_02");	//Nepamatuješ se na mě?
	AI_Output(self,other,"XBS_7513_Darrion_Hi_06_03");	//Cosi si vzpomínám... (zamyšleně) Ale nic zajímavého - takže asi tak.
	AI_Output(other,self,"XBS_7513_Darrion_Hi_15_04");	//A můžu si u tebe mistře koupit nějaké zbraně nebo kovářské zásoby?
	AI_Output(self,other,"XBS_7513_Darrion_Hi_06_06");	//No jasně. Ale jen tehdy když jsem v kovárně.
	AI_Output(self,other,"XBS_7513_Darrion_Hi_06_07");	//Večer odpočívám - nechceme to přece s prací přehnat.
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry(TOPIC_XBS,"Darrion prodává kovářské zásoby a paklíče. Musím ho však zastihnout, když je zrovna v kovárně.");
};


instance XBS_7513_DARRION_BLITZ(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 2;
	condition = xbs_7513_darrion_blitz_condition;
	information = xbs_7513_darrion_blitz_info;
	permanent = FALSE;
	description = "Řekni mi, jak si se dostal do těchto hor?";
};


func int xbs_7513_darrion_blitz_condition()
{
	if(Npc_KnowsInfo(other,xbs_7513_darrion_hi))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_blitz_info()
{
	AI_Output(other,self,"XBS_7513_Darrion_Blitz_15_00");	//Řekni mi, jak si se dostal do těchto hor?
	AI_Output(self,other,"XBS_7513_Darrion_Blitz_06_01");	//Ten den, když bariéra padla, v táboře nastal chaos.
	AI_Output(self,other,"XBS_7513_Darrion_Blitz_06_02");	//Jen pár lidem se podařilo si udržet rozumnou hlavu. Těm co se to podařilo, jsou převážně tady.
	AI_Output(other,self,"XBS_7513_Darrion_Blitz_15_03");	//A co si dělal ty?
	AI_Output(self,other,"XBS_7513_Darrion_Blitz_06_04");	//Já ostatně jako skoro všichni, jsem se tak motal kolem, ztrácel rozum. Dokud jsem nepotkal Netbeka.
	AI_Output(self,other,"XBS_7513_Darrion_Blitz_06_05");	//Pravděpodobně to byl jediný rozumný člověk v údolí. Tak jsem ho následoval.
	AI_Output(self,other,"XBS_7513_Darrion_Blitz_06_06");	//No ale jsem kovář a to je něco jiného než jeho stromy. Proto jsem tu a zajímám se o svoje.
};


instance XBS_7513_DARRION_TRADE(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 888;
	condition = xbs_7513_darrion_trade_condition;
	information = xbs_7513_darrion_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};

func int xbs_7513_darrion_trade_condition()
{
	if(Npc_KnowsInfo(other,xbs_7513_darrion_hi) && (Npc_GetDistToWP(self,"WP_COAST_FOREST_118") < 1000))
	{
		return TRUE;
	};
};

var int darionday;

func void xbs_7513_darrion_trade_info()
{
	var int daynow;

	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_3");
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
};


instance DIA_DARRION_ARMORCANTEACH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 5;
	condition = dia_darrion_armorcanteach_condition;
	information = dia_darrion_armorcanteach_info;
	permanent = TRUE;
	description = "Slyšel jsem, že si jediný, kdo umí ukovat zbroj templáře.";
};


func int dia_darrion_armorcanteach_condition()
{
	if((DARRION_TEACHARMOR == FALSE) && (hero.guild == GIL_TPL))
	{
		return TRUE;
	};
};

func void dia_darrion_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Darrion_ArmorCanTeach_01_00");	//Slyšel jsem, že si jediný, kdo umí ukovat zbroj templáře.
	AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_01");	//To je pravda, protože jsem byl jediný kovář v bažinách. Musel jsem kovat zbroje pro všechny bratry z Bratrstva, dokonce i pro samotného Cor Angara.
	AI_Output(other,self,"DIA_Darrion_ArmorCanTeach_01_02");	//Mohl bys mě naučit ukovat tuto zbroj?
	AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_03");	//No proč ne. Mohl bych ti ukázat pár způsobů jak vylepšit svou zbroj.
	AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_04");	//Ale aby sis mohl svou zbroj vylepšit, budeš už muset být trochu zkušený v kovaříně.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Darrion_ArmorCanTeach_01_05");	//V kovařině jsem docela sběhlý.
		AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_06");	//Nu dobře, v tom případě můžeme začít hned.
		AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_07");	//Ale řeknu ti to radši zavčasu: nebude to zadarmo.
	}
	else
	{
		AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_09");	//Jak se tak na tebe dívám, v kovařině si teda pěkný amatér!
		AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_10");	//Je to tak chlape. Nejdřív se nauč základy kovařiny. Pak si teprve můžeme promluvit o dalším učení.
		AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_11");	//Ale řeknu ti to radši zavčasu: nebude to zadarmo.
	};
	DARRION_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Darrion mě může naučit, jak vylepšit templářské zbroje.");
};

func void b_darrion_teacharmor_4()
{
	AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_01");	//Tak tedy pojďme začít. Nejprve se musíš ujistit, že máš všechny suroviny při sobě. Vezmeš rozžhavenou ocel...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"WP_COAST_FOREST_117");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_02");	//... na kovadlinu nachystáš plát a vkoveš do něj kus magické rudy...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_03");	//... potom uděláš úchyty a připojíš je k plátu, a opratrně je budeš přikovávat v místě spoje...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_04");	//... poté opratrně připojíš vzniklou část na pancíř zbroje - asi nějak takto... podívej...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_05");	//... hotovo!
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_06");	//To je vše, co potřebuješ vědět, abys vylepšil tuto zbroj.
	};
};

func void b_darrion_teacharmor_5()
{
	AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_01");	//Na vytvoření této zbroje bude třeba mnoho času a úsilí, ale bude stát za to...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"WP_COAST_FOREST_117");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_02");	//... vezmi jednu rozžhavenou ocel a rozděl ji na dvě stejné části...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_03");	//... opracuj každou z nich za pomoci drti z magické rudy, a poté spoj obě části a skuj je dohromady...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_04");	//... výsledek připevníš k zbroji po obou stranách za použiti kovového plátu... podívej se jak na to...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_05");	//... vidíš jak pěkně sedí, jak tvaruje linie zbroje. Upěvněných za pomocí ocelových šroubů a...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_06");	//... zbroj je připravená.
	};
};

func void b_darrion_teacharmor_6()
{
	AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_01");	//Po tom, co se naučíš těchto znalostí, můžeš vyrobit neuvěřitelně silnou a spolehlivou zbroj.
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"WP_COAST_FOREST_117");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_02");	//Dívej se pořádně a zkus si zapamatovat. Vezmeš rozžhavenou ocel a na kovadlině jí vykoveš do formy plátu...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_03");	//... pokryješ výsledek drtí z magické rudy a na povrch naneseš vrstvu roztoku z pryskyřice...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_04");	//... spoj takovéto dva pláty ocelovými šrouby a upevni je na kostru zbroje... no, a takto se to dělá...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_05");	//... tento krok dodá odolnost spojům všech částí zbroje. Ještě trochu upravíme obrys zboje a...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_06");	//... a to je vše, zbroj je hotova!
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_07");	//Teď už znaš všechno, co jsem tě mohl naučit. Nyní se pokus použít nabité znalosti v praxi.
	};
};

func void b_darrionarmorchoices()
{
	Info_ClearChoices(dia_darrion_armorteach);
	Info_AddChoice(dia_darrion_armorteach,Dialog_Back,dia_darrion_armorteach_back);

	if((PLAYER_TALENT_SMITH[29] == FALSE) && (BuyTemplerLight == TRUE))
	{
		Info_AddChoice(dia_darrion_armorteach,B_BuildLearnStringEx("Lehká zbroj templáře (cena: 3000 zlatých",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_TPL_L_V1)),dia_darrion_armorteach_itar_tpl_l_v1);
	};
	if((PLAYER_TALENT_SMITH[30] == FALSE) && (BuyTemplerMed == TRUE))
	{
		Info_AddChoice(dia_darrion_armorteach,B_BuildLearnStringEx("Zbroj templáře (cena: 5000 zlatých",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_TPL_M_V1)),dia_darrion_armorteach_itar_tpl_m_v1);
	};
	if((PLAYER_TALENT_SMITH[31] == FALSE) && (BuyTemplerHeavy == TRUE))
	{
		Info_AddChoice(dia_darrion_armorteach,B_BuildLearnStringEx("Těžká zbroj templáře (cena: 7000 zlatých",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_TPL_S_V1)),dia_darrion_armorteach_itar_tpl_s_v1);
	};
};


instance DIA_DARRION_ARMORTEACH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 5;
	condition = dia_darrion_armorteach_condition;
	information = dia_darrion_armorteach_info;
	permanent = TRUE;
	description = "Nauč mě, jak vylepšit zbroj.";
};


func int dia_darrion_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (DARRION_TEACHARMOR == TRUE) && (other.guild == GIL_TPL))
	{
		if((PLAYER_TALENT_SMITH[29] == FALSE) || (PLAYER_TALENT_SMITH[30] == FALSE) || (PLAYER_TALENT_SMITH[31] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_darrion_armorteach_info()
{
	AI_Output(other,self,"DIA_Darrion_ArmorTeach_01_00");	//Nauč mě, jak vylepšit zbroj.
	if(Wld_IsTime(8,0,20,0))
	{
		AI_Output(self,other,"DIA_Darrion_ArmorTeach_01_01");	//Co bys chtěl vědět?
		b_darrionarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Darrion_ArmorTeach_01_02");	//Pro dnešek už jsem ukončil práci v kovárně...
		AI_Output(self,other,"DIA_Darrion_ArmorTeach_01_03");	//Přijď zítra ráno, pak si o tom promluvíme.
	};
};

func void dia_darrion_armorteach_back()
{
	Info_ClearChoices(dia_darrion_armorteach);
};

func void dia_darrion_armorteach_itar_tpl_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3000);
			b_darrion_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Darrion_TeachArmor_04_00");	//A nemáš u sebe dost zlatých. Tak na to prozatím zapomeň.
	};
	b_darrionarmorchoices();
};

func void dia_darrion_armorteach_itar_tpl_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 5000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,5000);
			b_darrion_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Darrion_TeachArmor_05_00");	//A co zlato, to je kde kamaráde? 
	};
	b_darrionarmorchoices();
};

func void dia_darrion_armorteach_itar_tpl_s_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 7000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_S_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,7000);
			b_darrion_teacharmor_6();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Darrion_TeachArmor_06_00");	//Nemáš u sebe dostatek zlata. A za míň se s tebou o moje tajemství nepodělím.
	};
	b_darrionarmorchoices();
};


instance XBS_7513_DARRION_ORESMITH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_oresmith_condition;
	information = xbs_7513_darrion_oresmith_info;
	permanent = FALSE;
	description = "Netbek mi řekl, že bys mě mohl naučit, jak kovat zbraně z rudy.";
};


func int xbs_7513_darrion_oresmith_condition()
{
	if((HOWCANMAKEBLACKSWORD == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (KNOWNORESWORD == FALSE) && Npc_KnowsInfo(hero,dia_netbek_makeblacksword))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_oresmith_info()
{
	AI_Output(other,self,"XBS_7513_Darrion_OreSmith_01_00");	//Netbek mi řekl, že bys mě mohl naučit, jak kovat zbraně z rudy.
	AI_Output(self,other,"XBS_7513_Darrion_OreSmith_01_01");	//No, jestli ti to řekl, tak to asi bude pravda.
	AI_Output(self,other,"XBS_7513_Darrion_OreSmith_01_02");	//Ale budeš potřebovat nabýt nějaké zkušenosti, abys ovládl umění kování zbraní z rudy.
};


instance XBS_7513_DARRION_ORESMITHTEACH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_oresmithteach_condition;
	information = xbs_7513_darrion_oresmithteach_info;
	permanent = TRUE;
	description = "Nauč mě kovat zbraně z rudy. (VB: 20)";
};


func int xbs_7513_darrion_oresmithteach_condition()
{
	if((HOWCANMAKEBLACKSWORD == TRUE) && (KNOWNORESWORD == FALSE) && Npc_KnowsInfo(hero,xbs_7513_darrion_oresmith))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_oresmithteach_info()
{
	AI_Output(other,self,"XBS_7513_Darrion_OreSmithTeach_01_00");	//Nauč mě kovat zbraně z rudy.

	if(other.lp >= 20)
	{
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_01");	//Dobře, pozorně poslouchej. Postup výroby čepele z rudy je poměrně jednoduchý.
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_02");	//Vezmi potřebné množství magické rudy a zahřej ho na požadovanou teplotu.
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_03");	//Potom ty kousky musíš spojit v jedno, následně ze směsi vytvarovat čepel a pak prudce zchladit.
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_04");	//Výsledkem ti bude zbraň, jež bude pevná jako žádná jiná.
		AI_Output(other,self,"XBS_7513_Darrion_OreSmithTeach_01_05");	//Chápu vše, díky.
		other.lp = other.lp - 20;
		RankPoints = RankPoints + 20;
		KNOWNORESWORD = TRUE;
		AI_Print("Naučeno: Kovářství - 'Prostý rudný meč'");
		Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	}
	else
	{
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_06");	//Ještě na to nejsi dostatečně zkušený.
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_07");	//Vrať se zpět až budeš vědět více, a já tě naučím vše, co vím.
		AI_Output(other,self,"XBS_7513_Darrion_OreSmithTeach_01_08");	//Dobře tedy.
	};
};


instance XBS_7513_DARRION_BLACKORE(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_blackore_condition;
	information = xbs_7513_darrion_blackore_info;
	permanent = FALSE;
	description = "Náhodou bys nevěděl, kde bych našel černou rudu?";
};


func int xbs_7513_darrion_blackore_condition()
{
	if((HOWCANMAKEBLACKSWORD == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (FINDOREALREADY == FALSE) && (KNOWNORESWORD == TRUE) && Npc_KnowsInfo(hero,dia_netbek_makeblacksword))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_blackore_info()
{
	AI_Output(other,self,"XBS_7513_Darrion_BlackOre_01_00");	//Náhodou bys nevěděl, kde bych našel černou rudu?
	AI_Output(self,other,"XBS_7513_Darrion_BlackOre_01_01");	//Černou rudu? Obávám se, že ne. Za celý můj život se mi tento poklad dostal do rukou jen jednou.
	AI_Output(self,other,"XBS_7513_Darrion_BlackOre_01_02");	//Kdysi jsem však slyšel nějaké zvěsti, že skřeti ví, kde jí hledat. Jestli je to však pravda nebo ne - to ti nemůžu s jistotou říct.
	AI_Output(other,self,"XBS_7513_Darrion_BlackOre_01_03");	//Chápu.
	B_LogEntry(TOPIC_GUARDIANS,"Kovář Darrion kdysi slyšel, že skřeti by mohli vědět, kde najít černou rudu.");
};

instance XBS_7513_DARRION_PrioratBlade(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = XBS_7513_DARRION_PrioratBlade_condition;
	information = XBS_7513_DARRION_PrioratBlade_info;
	permanent = FALSE;
	description = "Potřebuji tvou radu.";
};

func int XBS_7513_DARRION_PrioratBlade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void XBS_7513_DARRION_PrioratBlade_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_01");	//Potřebuji tvou radu.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_02");	//S čím ti pomohu?
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_03");	//Dostal se mi do rukou jeden vzácný meč. Hledám kováře, který by mi o něm mohl něco říct.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_06");	//Nu, ukaž mi tedy co u sebe máš.
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_07");	//Tady.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_08");	//Tohle je ale velmi vzácná čepel v těchto končinách.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_11");	//No, ale jestli si někdy byl ve Varantu... (záludně) 
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_12");	//Co je to?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_13");	//Ale pro místní obyvatelé nemá tahle zbraň absolutně žádnou hodnotu!
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_14");	//Takže pochází z Varantu? A co je to ten Varant?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_15");	//Varant - je ohromná poušt, která se nacházi na jihu Myrtany. A lide, co jí obývají - asasíni, velmi často používají podobné čepele.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_16");	//Ačkoliv tato zbraň se trochu liší od toho, co jsem měl možnost vidět předtím.
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_17");	//Jak to myslíš?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_18");	//Velmi mě zaujala rytina na hlavní části čepele. Znaky, jež jsou na ní zobrazeny, mi nejsou vůbec povědomé.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_19");	//Ale kdybych věděl co znamenají, dokázal bych ti přesně říct - kdo je opravdovým majitelem této zbraně.
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_20");	//A kdo by to mohl vědět?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_21");	//Vůbec nemám ponětí. (zaraženě) Možná sami asasíni by poznali komu patři.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_22");	//No a kde bych mohl najít alespoň jednoho z nich?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_23");	//Vyhovuje jim teplé slunce Varantu spíše než počasí co je zde.
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_24");	//Dobrá, rozumím. Díky za pomoc!
	B_LogEntry(TOPIC_PrioratStart,"Darrion mi řekl, že ten meč, který jsem našel, většinou použivali asasíni žijící v poušti Varant, která se nachází na jihu Myrtany. Co ho však zajímalo nejvíce, byla rytina na čepeli meče. Symboly na ní vyryté by mi mohly dát přesnější odpověď na mou otázku. Avšak k mé smůle, jí Darrion nedokázal rozšifrovat. Podle Darriona, to můžou mít na svědomí asasíni.");
	BladePrioratKnowsAssasins = TRUE;
};

instance DIA_Darrion_DoCrossBow(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = DIA_Darrion_DoCrossBow_condition;
	information = DIA_Darrion_DoCrossBow_info;
	permanent = FALSE;
	description = "Věděl bys jak vyrábět kuše?";
};

func int DIA_Darrion_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Darrion_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Darrion_DoCrossBow_01_01");	//Věděl bys jak vyrábět kuše?
	AI_Output(self,other,"DIA_Darrion_DoCrossBow_01_02");	//Kuše? To jsi na špatné adrese chlapče.
	AI_Output(self,other,"DIA_Darrion_DoCrossBow_01_03");	//Na to potřebuješ dobrého tesaře nebo truhláře.
	AI_Output(self,other,"DIA_Darrion_DoCrossBow_01_04");	//Jen ten ti může pomoct s výrobou kuší.
	AI_Output(other,self,"DIA_Darrion_DoCrossBow_01_05");	//Chápu.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Jen tesař nebo truhlář mě může naučit jak vyrábět kuše.");
};

instance XBS_7513_DARRION_CanSellArmor(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = XBS_7513_DARRION_CanSellArmor_condition;
	information = XBS_7513_DARRION_CanSellArmor_info;
	permanent = FALSE;
	description = "Nezajímali by tě náhodou staré zbroje?";
};

func int XBS_7513_DARRION_CanSellArmor_condition()
{
	if(Npc_KnowsInfo(hero,xbs_7513_darrion_hi) == TRUE)
	{
		return TRUE;
	};
};

func void XBS_7513_DARRION_CanSellArmor_info()
{
	AI_Output(other,self,"XBS_7513_DARRION_CanSellArmor_01_00");	//Nezajímali by tě náhodou staré zbroje?
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_01_01");	//Možná. Proč se ptáš?
	AI_Output(other,self,"XBS_7513_DARRION_CanSellArmor_01_02");	//Mám u sebe několik starých zbrojí a absolutně nevím, co s nima mám dělat.
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_01_03");	//No jestli je to tak, můžeš mi je přinést.
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_01_04");	//Některé z nich dostanou na vyzkoušení chlapi v táboře jestli jim nebudou sedět.
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_01_05");	//Zbytek se použije jako materiál na výrobu nových. Ocel, kůže, látka, nitě - vše se bude hodit!
	AI_Output(other,self,"XBS_7513_DARRION_CanSellArmor_01_06");	//A co z toho budu mít já?
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_01_07");	//Zlata mám velice málo. Ale můžu ti je vyměnit za rudu - žádný problém.
	AI_Output(other,self,"XBS_7513_DARRION_CanSellArmor_01_09");	//Dobře, popřemýšlím nad tvou nabídkou.
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry(TOPIC_XBS,"Darrion přijme obnošené zbroje výměnou za rudu.");
	DarrionCanSellArmor = TRUE;
};

instance XBS_7513_DARRION_CanSellArmor_Do(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = XBS_7513_DARRION_CanSellArmor_Do_condition;
	information = XBS_7513_DARRION_CanSellArmor_Do_info;
	permanent = TRUE;
	description = "Přinesl jsem ti zbroj.";
};

func int XBS_7513_DARRION_CanSellArmor_Do_condition()
{
	if(DarrionCanSellArmor == TRUE)
	{
		return TRUE;
	};
};

func void XBS_7513_DARRION_CanSellArmor_Do_info()
{
	var C_Item EquipWeap;
	EquipWeap = Npc_GetEquippedArmor(other);

	AI_Output(other,self,"XBS_7513_DARRION_CanSellArmor_Do_01_00");	//Přinesl jsem ti zbroj.
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_Do_01_01");	//Výborně. Pojďme se na to podívat.
	Info_ClearChoices(XBS_7513_DARRION_CanSellArmor_Do);
	Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,Dialog_Back,XBS_7513_DARRION_CanSellArmor_Do_back);

	if((Hlp_IsItem(EquipWeap,ITAR_PRISONEL) == FALSE) && (Npc_HasItems(other,ITAR_PRISONEL) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehké kalhoty kopáče' - 5 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PRISONEL);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Prisoner) == FALSE) && (Npc_HasItems(other,ITAR_Prisoner) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kalhoty kopáče' - 5 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Prisoner);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Bau_L) == FALSE) && (Npc_HasItems(other,ITAR_Bau_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehký oděv farmáře' - 5 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Vlk_L) == FALSE) && (Npc_HasItems(other,ITAR_Vlk_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehký oděv měšťana' - 5 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Bau_M) == FALSE) && (Npc_HasItems(other,ITAR_Bau_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Oděv farmáře' - 5 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Vlk_M) == FALSE) && (Npc_HasItems(other,ITAR_Vlk_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Oděv měšťana' - 5 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Vlk_H) == FALSE) && (Npc_HasItems(other,ITAR_Vlk_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Honosný oděv měšťana' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SEKBED) == FALSE) && (Npc_HasItems(other,ITAR_SEKBED) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Bederní rouška Bratrstva' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SEKBED_V1) == FALSE) && (Npc_HasItems(other,ITAR_SEKBED_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Vyztužená bederní rouška Bratrstva' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Oděv kovářského učně' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_01) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Oděv kovářského učně' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_01);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_02) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_02) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Oděv kovářského učně' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_02);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_03) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_03) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Oděv kovářského učně' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_03);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_04) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_04) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Oděv kovářského učně' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_04);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_05) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_05) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Oděv kovářského učně' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_05);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Leather_L) == FALSE) && (Npc_HasItems(other,ITAR_Leather_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kožená zbroj' - 15 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Leather_M) == FALSE) && (Npc_HasItems(other,ITAR_Leather_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kožená zbroj' - 15 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ALCHEMY_NOV) == FALSE) && (Npc_HasItems(other,ITAR_ALCHEMY_NOV) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Oděv učně alchymisty' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ALCHEMY_NOV);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KIL_SL) == FALSE) && (Npc_HasItems(other,ITAR_KIL_SL) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj vraha' - 15 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SL);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KIL_SLS) == FALSE) && (Npc_HasItems(other,ITAR_KIL_SLS) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj mistra vraha' - 20 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SLS);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TOWNGUARD) == FALSE) && (Npc_HasItems(other,ITAR_TOWNGUARD) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká zbroj domobránce' - 15 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOWNGUARD);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Mil_L) == FALSE) && (Npc_HasItems(other,ITAR_Mil_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj domobránce' - 20 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Mil_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj domobránce' - 25 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V12) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj domobránce' - 25 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V13) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj domobránce' - 25 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V14) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj domobránce' - 25 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V15) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj domobránce' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V15);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_Sld_L) == FALSE) && (Npc_HasItems(other,ItAr_Sld_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká zbroj žoldáka' - 25 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj žoldáka' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V2) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj žoldáka' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V3) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj žoldáka' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V4) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj žoldáka' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V5) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj žoldáka' - 35 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj žoldáka' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj žoldáka' - 45 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj žoldáka' - 45 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V3) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj žoldáka' - 45 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V4) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj žoldáka' - 45 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V5) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj žoldáka' - 50 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLP_UL) == FALSE) && (Npc_HasItems(other,ITAR_SLP_UL) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj novice Bratrstva' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_UL);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLP_L) == FALSE) && (Npc_HasItems(other,ITAR_SLP_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká zbroj novice Bratrstva' - 35 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_L);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_NOV_L) == FALSE) && (Npc_HasItems(other,ItAr_NOV_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho novice Ohně' - 25 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_NOV_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_NDW_L) == FALSE) && (Npc_HasItems(other,ITAR_NDW_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho novice Vody' - 25 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDW_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_NDM_L) == FALSE) && (Npc_HasItems(other,ITAR_NDM_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho novice Temnoty' - 25 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDM_L);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDF_L) == FALSE) && (Npc_HasItems(other,ItAr_KDF_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho mladšího mága Ohně' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDF_M) == FALSE) && (Npc_HasItems(other,ITAR_KDF_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho mága Ohně' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDF_M_NEW) == FALSE) && (Npc_HasItems(other,ITAR_KDF_M_NEW) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho mága Ohně' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M_NEW);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDW_L_Addon) == FALSE) && (Npc_HasItems(other,ITAR_KDW_L_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho mága Vody' - 35 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_L_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_L) == FALSE) && (Npc_HasItems(other,ITAR_DMT_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho mága Temnoty' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GUR_L) == FALSE) && (Npc_HasItems(other,ITAR_GUR_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho Guru Bratrstva' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MAYA_PRIEST) == FALSE) && (Npc_HasItems(other,ITAR_MAYA_PRIEST) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho kněží Prastarých' - 45 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MAYA_PRIEST);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_Addon) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Zbroj 'Kruhu Vody' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V1) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Kovaná zbroj 'Kruhu Vody' - 45 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V2) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Kovaná zbroj 'Kruhu Vody' - 45 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V3) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Kovaná zbroj 'Kruhu Vody' - 45 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V4) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Kovaná zbroj 'Kruhu Vody' - 45 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V5) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Kovaná zbroj 'Kruhu Vody' - 50 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PIR_L_Addon) == FALSE) && (Npc_HasItems(other,ITAR_PIR_L_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká zbroj piráta' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_L_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PIR_M_Addon) == FALSE) && (Npc_HasItems(other,ITAR_PIR_M_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj piráta' - 50 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_M_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PIR_H_Addon) == FALSE) && (Npc_HasItems(other,ITAR_PIR_H_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká zbroj piráta' - 60 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_H_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_BDT_M) == FALSE) && (Npc_HasItems(other,ItAr_BDT_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká zbroj bandity' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_M);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_BDT_H) == FALSE) && (Npc_HasItems(other,ItAr_BDT_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj bandity' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_BDT_F) == FALSE) && (Npc_HasItems(other,ITAR_BDT_F) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká zbroj bandity' - 50 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_BDT_F);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GRD_L) == FALSE) && (Npc_HasItems(other,ITAR_GRD_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká zbroj stráže' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GRD_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_GRD_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj stráže' - 45 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Bloodwyn_Addon) == FALSE) && (Npc_HasItems(other,ITAR_Bloodwyn_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj stráže' - 50 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bloodwyn_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_BLOODWYN_ADDON_V1) == FALSE) && (Npc_HasItems(other,ITAR_BLOODWYN_ADDON_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj stráže' - 55 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_BLOODWYN_ADDON_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Thorus_Addon) == FALSE) && (Npc_HasItems(other,ITAR_Thorus_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká zbroj stráže' - 60 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Thorus_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_THORUS_ADDON_V1) == FALSE) && (Npc_HasItems(other,ITAR_THORUS_ADDON_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj stráže' - 65 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_THORUS_ADDON_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_OreBaron_Addon) == FALSE) && (Npc_HasItems(other,ITAR_OreBaron_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj rudobarona' - 80 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_OreBaron_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_Crawler) == FALSE) && (Npc_HasItems(other,ITAR_DJG_Crawler) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj z krunýřů důlního červa' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_Crawler);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_MIL_M) == FALSE) && (Npc_HasItems(other,ItAr_MIL_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká zbroj domobránce' - 60 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_MIL_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj domobránce' - 65 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V12) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj domobránce' - 65 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V13) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj domobránce' - 65 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V14) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj domobránce' - 65 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V15) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj domobránce' - 70 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V15);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_L) == FALSE) && (Npc_HasItems(other,ITAR_PAL_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj zbrojnoše' - 80 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_L);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_Sld_H) == FALSE) && (Npc_HasItems(other,ItAr_Sld_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká zbroj žoldáka' - 70 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V1) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj žoldáka' - 75 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V2) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj žoldáka' - 75 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V3) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj žoldáka' - 75 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V4) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj žoldáka' - 75 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V5) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj žoldáka' - 80 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V5);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_PAL_M) == FALSE) && (Npc_HasItems(other,ItAr_PAL_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj rytíře' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAL_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj rytíře' - 95 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V12) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj rytíře' - 95 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V13) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj rytíře' - 95 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V14) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj rytíře' - 95 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V15) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Rudná zbroj rytíře' - 100 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V15);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Posvěcená rudná zbroj rytíře' - 105 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_PAl_H) == FALSE) && (Npc_HasItems(other,ItAr_PAl_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj paladina' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAl_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V1) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj paladina' - 130 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V12) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj paladina' - 130 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V13) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj paladina' - 130 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V14) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj paladina' - 130 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V15) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Rudná zbroj paladina' - 140 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V15);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V2) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Posvěcená rudná zbroj paladina' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká zbroj drakobijce' - 80 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj drakobijce' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V2) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj drakobijce' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V3) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj drakobijce' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V4) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj drakobijce' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V5) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj drakobijce' - 100 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj drakobijce' - 110 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj drakobijce' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj drakobijce' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V3) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj drakobijce' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V4) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj drakobijce' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V5) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj drakobijce' - 130 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Dargonscale) == FALSE) && (Npc_HasItems(other,ITAR_Dargonscale) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj z dračích šupin' - 140 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Dargonscale);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká zbroj drakobijce' - 140 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V1) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj drakobijce' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V2) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj drakobijce' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V3) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj drakobijce' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V4) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj drakobijce' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V5) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj drakobijce' - 160 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V5);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_DragonKiller) == FALSE) && (Npc_HasItems(other,ItAr_DragonKiller) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj přemožitele draků' - 200 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_DragonKiller);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_SHVWarrior) == FALSE) && (Npc_HasItems(other,ItAr_SHVWarrior) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj Exekutora' - 130 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_SHVWarrior);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_LST) == FALSE) && (Npc_HasItems(other,ITAR_TPL_LST) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Bojová suknice templáře' - 70 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_LST);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká zbroj templáře' - 80 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj templáře' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V2) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj templáře' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V3) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj templáře' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V4) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj templáře' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V5) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Lehká kovaná zbroj templáře' - 100 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj templáře' - 110 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj templáře' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj templáře' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V3) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj templáře' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V4) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj templáře' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V5) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Kovaná zbroj templáře' - 130 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká zbroj templáře' - 140 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V1) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj templáře' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V2) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj templáře' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V3) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj templáře' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V4) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj templáře' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V5) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kovaná zbroj templáře' - 160 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V5);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDF_H) == FALSE) && (Npc_HasItems(other,ItAr_KDF_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho vysokého mága Ohně' - 80 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDF_H_BLESSED) == FALSE) && (Npc_HasItems(other,ITAR_KDF_H_BLESSED) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Posvěcené roucho vysokého mága Ohně' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_H_BLESSED);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDF_SH) == FALSE) && (Npc_HasItems(other,ItAr_KDF_SH) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho arcimága Ohně' - 100 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_SH);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDW_H) == FALSE) && (Npc_HasItems(other,ITAR_KDW_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho vysokého mága Vody' - 80 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_H);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDW_SH) == FALSE) && (Npc_HasItems(other,ItAr_KDW_SH) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho arcimága Vody' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDW_SH);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDW_ADANOS) == FALSE) && (Npc_HasItems(other,ITAR_KDW_ADANOS) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho Adanova kněze' - 100 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_ADANOS);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_H) == FALSE) && (Npc_HasItems(other,ITAR_DMT_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho vysokého mága Temnoty' - 100 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_H_BELIAR_1) == FALSE) && (Npc_HasItems(other,ITAR_DMT_H_BELIAR_1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Znesvěcené roucho vysokého mága Temnoty' - 110 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_H_BELIAR_3) == FALSE) && (Npc_HasItems(other,ITAR_DMT_H_BELIAR_3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho vyslance Temnoty' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_3);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDM_SH) == FALSE) && (Npc_HasItems(other,ItAr_KDM_SH) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho arcimága Temnoty' - 130 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDM_SH);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GUR_H) == FALSE) && (Npc_HasItems(other,ITAR_GUR_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho vysokého Guru Bratrstva' - 110 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_HARADRIMMAGE) == FALSE) && (Npc_HasItems(other,ITAR_HARADRIMMAGE) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Roucho učedníka Strážců' - 50 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_HARADRIMMAGE);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_BloodArmor) == FALSE) && (Npc_HasItems(other,ItAr_BloodArmor) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj krve' - 170 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_BloodArmor);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_01) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká zbroj stína Masyafu' - 100 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_01);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_02) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_02) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj převora Masyafu' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_02);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_03) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_03) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj novice Masyafu' - 80 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_03);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_04) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_04) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj stína Masyafu' - 90 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_04);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_DEMONMAGE) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_DEMONMAGE) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj démonického Guru' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_DEMONMAGE);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_Hun_H) == FALSE) && (Npc_HasItems(other,ItAr_Hun_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká zbroj lovce' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hun_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj šejdíře' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_01) == FALSE) && (Npc_HasItems(other,ItAr_HuntArmor_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj lovce-stopaře' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_01);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_02) == FALSE) && (Npc_HasItems(other,ItAr_HuntArmor_02) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj lovce-zvěrobijce' - 60 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_02);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_03) == FALSE) && (Npc_HasItems(other,ItAr_HuntArmor_03) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj lovce-trolobijce' - 80 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_03);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_04) == FALSE) && (Npc_HasItems(other,ItAr_HuntArmor_04) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj mistra lovce' - 100 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_04);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_1) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj zloděje' - 20 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_2) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj ducha' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_3) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj nočního stínu' - 50 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_4) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj mistra zloděje' - 60 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_5) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj vůdce zlodějů' - 80 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_6) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_6) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj krále zlodějů' - 100 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_6);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASS) == FALSE) && (Npc_HasItems(other,ITAR_ASS) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj asasína' - 120 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASS);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TOPTHIEF) == FALSE) && (Npc_HasItems(other,ITAR_TOPTHIEF) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Er'Khazirova zbroj' - 150 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOPTHIEF);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASGARD) == FALSE) && (Npc_HasItems(other,ITAR_ASGARD) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj přízračného stínu' - 180 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASGARD);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ADVENTURE_HERO) == FALSE) && (Npc_HasItems(other,ITAR_ADVENTURE_HERO) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Zbroj dobrodruha' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ADVENTURE_HERO);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_OldSteelArmor) == FALSE) && (Npc_HasItems(other,ItAr_OldSteelArmor) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Ocelová zbroj vlastní výroby' - 60 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_OldSteelArmor);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_STTP_01) == FALSE) && (Npc_HasItems(other,ITAR_STTP_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Těžká kroužková zbroj Stína' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_STTP_01);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_OREARMOR) == FALSE) && (Npc_HasItems(other,ITAR_OREARMOR) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Rudná zbroj Světla' - 250 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_OREARMOR);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Raven_Addon) == FALSE) && (Npc_HasItems(other,ITAR_Raven_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Rudná zbroj Temnoty' - 250 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Raven_Addon);
	};
	if(Npc_HasItems(other,ItAr_Hut) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Plátěná čapka' - 1 kus rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hut);
	};
	if(Npc_HasItems(other,ItAr_HoodHelm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Plátěná kápě' - 2 kusy rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_HoodHelm);
	};
	if(Npc_HasItems(other,ItAr_ThiefHut) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Čapka zloděje' - 2 kusy rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_ThiefHut);
	};
	if(Npc_HasItems(other,ItAr_PirateHat) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Klobouk kapitána' - 3 kusy rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_PirateHat);
	};
	if(Npc_HasItems(other,ItAr_Helm_01) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Železná helma' - 5 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_01);
	};
	if(Npc_HasItems(other,ItAr_Helm_New_01) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Helma lukostřelce' - 5 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_01);
	};
	if(Npc_HasItems(other,ItAr_Helm_New_02) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Er'Khazirova helma' - 30 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_02);
	};
	if(Npc_HasItems(other,ItAr_Helm_02) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Nordmarská helma' - 8 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_02);
	};
	if(Npc_HasItems(other,ItAr_Helm_Hunt) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Přilbice berserkera' - 15 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Hunt);
	};
	if(Npc_HasItems(other,ItAr_Helm_03) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Helma rytíře' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_03);
	};
	if(Npc_HasItems(other,ItAr_Pal_Helm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Helma paladina' - 15 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm);
	};
	if(Npc_HasItems(other,ItAr_Pal_Helm_Open) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Helma paladina' - 15 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm_Open);
	};
	if(Npc_HasItems(other,ItAr_DJG_Helm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Helma drakobijce' - 20 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_DJG_Helm);
	};
	if(Npc_HasItems(other,ItAr_Helm_Demon) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Dračí helma' - 40 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Demon);
	};
	if(Npc_HasItems(other,ItAr_God_Helm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Prastará helma' - 50 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_God_Helm);
	};
	if(Npc_HasItems(other,ItAr_Helm_G3_01) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Ocelová helma' - 10 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_01);
	};
	if(Npc_HasItems(other,ItAr_Helm_G3_02) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Helma žoldáka' - 12 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_02);
	};
	if(Npc_HasItems(other,ItAr_Helm_G3_04) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Rohatá helma' - 12 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_04);
	};
	if(Npc_HasItems(other,ItAr_ShrecHelm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Helma kněze Stavitelů' - 8 kusů rudy",XBS_7513_DARRION_CanSellArmor_Do_ItAr_ShrecHelm);
	};
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hut()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Hut,1);
	B_GiveInvItems(self,other,ItMi_Nugget,1);
	Npc_RemoveInvItems(self,ItAr_Hut,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HoodHelm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_HoodHelm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Npc_RemoveInvItems(self,ItAr_HoodHelm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_ThiefHut()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_ThiefHut,1);
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Npc_RemoveInvItems(self,ItAr_ThiefHut,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_PirateHat()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_PirateHat,1);
	B_GiveInvItems(self,other,ItMi_Nugget,3);
	Npc_RemoveInvItems(self,ItAr_PirateHat,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_01()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ItAr_Helm_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_01()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_New_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ItAr_Helm_New_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_02()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_New_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ItAr_Helm_New_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_02()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,8);
	Npc_RemoveInvItems(self,ItAr_Helm_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Hunt()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_Hunt,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ItAr_Helm_Hunt,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_03()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ItAr_Helm_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm_Open()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Pal_Helm_Open,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ItAr_Pal_Helm_Open,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Pal_Helm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ItAr_Pal_Helm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_DJG_Helm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_DJG_Helm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ItAr_DJG_Helm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Demon()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_Demon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_Helm_Demon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_God_Helm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_God_Helm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ItAr_God_Helm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_01()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_G3_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ItAr_Helm_G3_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_02()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_G3_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,12);
	Npc_RemoveInvItems(self,ItAr_Helm_G3_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_04()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_G3_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,12);
	Npc_RemoveInvItems(self,ItAr_Helm_G3_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_ShrecHelm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_ShrecHelm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,8);
	Npc_RemoveInvItems(self,ItAr_ShrecHelm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_STTP_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_STTP_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_STTP_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_back()
{
	Info_ClearChoices(XBS_7513_DARRION_CanSellArmor_Do);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PRISONEL()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PRISONEL,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_PRISONEL,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Prisoner()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Prisoner,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Prisoner,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bau_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Bau_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Vlk_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bau_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Bau_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Vlk_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_Vlk_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SEKBED,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SEKBED,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SEKBED_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SEKBED_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_02()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_03()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_04()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_05()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_05,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_05,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Leather_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_Leather_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Leather_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_Leather_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ALCHEMY_NOV()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ALCHEMY_NOV,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_ALCHEMY_NOV,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SL()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KIL_SL,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_KIL_SL,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SLS()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KIL_SLS,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ITAR_KIL_SLS,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOWNGUARD()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TOWNGUARD,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_TOWNGUARD,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Mil_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Mil_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ITAR_Mil_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V12,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V13,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V14,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V15,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_Sld_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ItAr_Sld_L,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V3,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V4,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,35);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V5,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_SLD_M,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_UL()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLP_UL,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLP_UL,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLP_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,35);
	Npc_RemoveInvItems(self,ITAR_SLP_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_NOV_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_NOV_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ItAr_NOV_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDW_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_NDW_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_NDW_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDM_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_NDM_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_NDM_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDF_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ItAr_KDF_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDF_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_KDF_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M_NEW()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDF_M_NEW,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_KDF_M_NEW,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_L_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDW_L_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,35);
	Npc_RemoveInvItems(self,ITAR_KDW_L_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_DMT_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GUR_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_GUR_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MAYA_PRIEST()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MAYA_PRIEST,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_MAYA_PRIEST,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_L_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PIR_L_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_PIR_L_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_M_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PIR_M_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_PIR_M_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_H_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PIR_H_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ITAR_PIR_H_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_BDT_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ItAr_BDT_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_BDT_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_BDT_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_BDT_F()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_BDT_F,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_BDT_F,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GRD_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_GRD_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GRD_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_GRD_L_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bloodwyn_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bloodwyn_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_Bloodwyn_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_BLOODWYN_ADDON_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_BLOODWYN_ADDON_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,55);
	Npc_RemoveInvItems(self,ITAR_BLOODWYN_ADDON_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Thorus_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Thorus_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ITAR_Thorus_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_THORUS_ADDON_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_THORUS_ADDON_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_THORUS_ADDON_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_OreBaron_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_OreBaron_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ITAR_OreBaron_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_Crawler()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_DJG_Crawler,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_MIL_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_MIL_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ItAr_MIL_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V12,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V13,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V14,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V15,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_PAL_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_Sld_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ItAr_Sld_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAL_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_PAL_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ItAr_PAL_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V12,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V13,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V14,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V15,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,105);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAl_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_PAl_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ItAr_PAl_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V12,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V13,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V14,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V15,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_DJG_L,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V3,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V4,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V5,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_DJG_M,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V3,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V4,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Dargonscale()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Dargonscale,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_Dargonscale,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_DJG_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,160);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_DragonKiller()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_DragonKiller,1);
	B_GiveInvItems(self,other,ItMi_Nugget,200);
	Npc_RemoveInvItems(self,ItAr_DragonKiller,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_SHVWarrior()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_SHVWarrior,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ItAr_SHVWarrior,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_LST()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_LST,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ITAR_TPL_LST,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_TPL_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_TPL_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_TPL_S,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,160);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDF_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ItAr_KDF_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_H_BLESSED()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDF_H_BLESSED,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_KDF_H_BLESSED,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_SH()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDF_SH,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItAr_KDF_SH,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDW_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_KDW_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDW_SH()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDW_SH,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ItAr_KDW_SH,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_ADANOS()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDW_ADANOS,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_KDW_ADANOS,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_DMT_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_OREARMOR()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_OREARMOR,1);
	B_GiveInvItems(self,other,ItMi_Nugget,250);
	Npc_RemoveInvItems(self,ITAR_OREARMOR,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Raven_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Raven_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,250);
	Npc_RemoveInvItems(self,ITAR_Raven_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_H_BELIAR_1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_DMT_H_BELIAR_1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_H_BELIAR_3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DMT_H_BELIAR_3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDM_SH()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDM_SH,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ItAr_KDM_SH,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GUR_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_GUR_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_HARADRIMMAGE()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_HARADRIMMAGE,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_HARADRIMMAGE,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_BloodArmor()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_BloodArmor,1);
	B_GiveInvItems(self,other,ItMi_Nugget,170);
	Npc_RemoveInvItems(self,ItAr_BloodArmor,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_02()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_03()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_04()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_DEMONMAGE()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_DEMONMAGE,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_DEMONMAGE,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hun_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_Hun_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_Hun_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_DHT_END,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_02()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_03()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_04()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ITAR_DHT_END_1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_DHT_END_2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_DHT_END_3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ITAR_DHT_END_4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_DHT_END_5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_6()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_6,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_DHT_END_6,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASS()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASS,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_ASS,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOPTHIEF()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TOPTHIEF,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TOPTHIEF,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASGARD()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASGARD,1);
	B_GiveInvItems(self,other,ItMi_Nugget,180);
	Npc_RemoveInvItems(self,ITAR_ASGARD,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ADVENTURE_HERO()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ADVENTURE_HERO,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_ADVENTURE_HERO,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_OldSteelArmor()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_OldSteelArmor,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ItAr_OldSteelArmor,1);
};