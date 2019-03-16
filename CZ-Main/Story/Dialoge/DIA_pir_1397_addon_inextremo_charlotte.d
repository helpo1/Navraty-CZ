/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void dia_addon_inextremo_charlotte_permjobpay_info - Charlotte (cyrilice -> latinka)

*/




instance DIA_ADDON_INEXTREMO_CHARLOTTE_EXIT(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 999;
	condition = dia_addon_inextremo_charlotte_exit_condition;
	information = dia_addon_inextremo_charlotte_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_charlotte_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_charlotte_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_CHARLOTTE_PICKPOCKET(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 900;
	condition = dia_addon_inextremo_charlotte_pickpocket_condition;
	information = dia_addon_inextremo_charlotte_pickpocket_info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int dia_addon_inextremo_charlotte_pickpocket_condition()
{
	return C_Beklauen(118,300);
};

func void dia_addon_inextremo_charlotte_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_charlotte_pickpocket);
	Info_AddChoice(dia_addon_inextremo_charlotte_pickpocket,Dialog_Back,dia_addon_inextremo_charlotte_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_charlotte_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_charlotte_pickpocket_doit);
};

func void dia_addon_inextremo_charlotte_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 2;
		};
		B_GiveInvItems(self,other,ItMi_Gold,100);
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

func void dia_addon_inextremo_charlotte_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_charlotte_pickpocket);
};


instance DIA_ADDON_INEXTREMO_CHARLOTTE_HI(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_hi_condition;
	information = dia_addon_inextremo_charlotte_hi_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_addon_inextremo_charlotte_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_hi_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER5 == FALSE)
		{
			Snd_Play("LevelUp");
			hero.exp = hero.exp + 500;
			AI_NoticePrint(3000,4098,NAME_Addon_KillerBonus);
			KillerBonus = TRUE;
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_00");	//Takže, kohopak to tu máme?
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_01");	//Upřímně řečeno, jsem ráda, že ses utkal s Asmalem, nikdo ho neměl moc rád.
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_02");	//No, možná jen Lutter. I když jemu je celkem jedno, kdo to tu vede. (smích)
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_03");	//Takže blahopřeji! Myslím si, že budeš dobrým vůdcem cechu.
			AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Hi_01_04");	//Díky!
			KILLMEMBER5 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_05");	//Co to bude tentokrát?
		};
	}
	else if(Wld_IsTime(8,30,19,30))
	{
		if(IS_INEXTREMO_PLAYING_DONE == FALSE)
		{
			if((MIS_JESPERMUSIC == LOG_Running) && (MSINEXTREMO == FALSE))
			{
				Info_ClearChoices(dia_addon_inextremo_charlotte_hi);
				Info_AddChoice(dia_addon_inextremo_charlotte_hi,"Zahraj mi něco veselého! (cena: 100 zlatých)",dia_addon_inextremo_charlotte_hi_doit);
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_07");	//Nech mě na pokoji!
				AI_StopProcessInfos(self);
				Npc_SetRefuseTalk(self,300);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_07");	//Neobtěžuj!
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,300);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_08");	//Nech mě na pokoji!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	};
};

func void dia_addon_inextremo_charlotte_hi_back()
{
	AI_StopProcessInfos(self);
};

func void dia_addon_inextremo_charlotte_hi_doit()
{
	var C_Npc MusHer;

	MusHer = Hlp_GetNpc(pir_1398_addon_inextremo_announcer);

	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		B_TurnToNpc(self,MusHer);
		AI_Output(self,other,"dia_addon_inextremo_charlotte_hi_doit_01_00");	//(úsměv) Samozřejmě. Hej chlapi! Zahrajte něco veselého!
		B_TurnToNpc(self,hero);
		AI_Output(self,other,"dia_addon_inextremo_charlotte_hi_doit_01_01");	//Už to bude...
		Npc_RemoveInvItems(other,ItMi_Gold,100);
		IS_INEXTREMO_PLAYING = TRUE;
		IS_INEXTREMO_PLAYING_DONE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"dia_addon_inextremo_charlotte_hi_doit_01_02");	//Kde je zlato? Nebude zlato - nebude muzika.
		AI_StopProcessInfos(self);
	};
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_WhatNext(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_WhatNext_condition;
	information = dia_addon_inextremo_charlotte_WhatNext_info;
	permanent = FALSE;
	description = "Co budeme dělat dál?";
};

func int dia_addon_inextremo_charlotte_WhatNext_condition()
{
	if((BEKILLMASTER == TRUE) && (KILLMEMBER5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_WhatNext_info()
{
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_01");	//Co budeme dělat dál?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_02");	//Nevím. Ty jsi tu šéf.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_03");	//Ale být na tvém místě, našla bych nám nějaký nový úkryt.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_04");	//Tady zůstat nemůžeme, je to tu nebezpečné. Všude kolem je spoustu divokých zvířat a my jsme tu jak na dlani.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_05");	//Nikdy nevíš, někdo si nás všimne a pak už bude pozdě.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_06");	//Jaké místo by to mělo být?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_07");	//Jakákoliv útulná jeskyně, nebo dům.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_08");	//Někde, kde bychom se nemuseli bát o svoje životy.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_09");	//Dobrá, pokusím se pro nás sehnat nějaké teplé hnízdečko.
	MIS_FindKillPlace = LOG_Running;
	Log_CreateTopic(TOPIC_FindKillPlace,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FindKillPlace,LOG_Running);
	B_LogEntry(TOPIC_FindKillPlace,"Musím pro náš cech vrahů najít nějaké klidné a tiché místo. Zůstat tady je příliš nebezpečné.");
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_WhatNextTwo(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_WhatNextTwo_condition;
	information = dia_addon_inextremo_charlotte_WhatNextTwo_info;
	permanent = FALSE;
	description = "Co bych měl ještě vědět?";
};

func int dia_addon_inextremo_charlotte_WhatNextTwo_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_InExtremo_Charlotte_WhatNext) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_WhatNextTwo_info()
{
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_01");	//Co bych měl ještě vědět?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_02");	//Myslím, že bys měl zajistit, aby všichni měli co na práci.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_03");	//Jinak otupí a začnou být neklidní.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_04");	//A to pro nás není moc dobré.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_05");	//Ale já nemám čas se tím vším zabývat. Možná bys mi s tím mohla pomoct?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_06");	//No, jestli mi důvěřuješ...
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_07");	//Vypadáš ze všech nejrozumnější.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_08");	//Tak to se na mě můžeš spolehnout. Já už vím, jak si s těma tupýma hlavama poradit.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_09");	//Domluveno. Jen mě informuj o tom, co se děje.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_10");	//Samozřejmě, nemusíš mít obavy.
	CharlotteMyAss = TRUE;
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_FindPlace(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_FindPlace_condition;
	information = dia_addon_inextremo_charlotte_FindPlace_info;
	permanent = FALSE;
	description = "Vypadá to, že jsem pro vás našel nové místo.";
};

func int dia_addon_inextremo_charlotte_FindPlace_condition()
{
	if((MIS_FindKillPlace == LOG_Running) && (FoundVinosKellerei == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_FindPlace_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_01");	//Vypadá to, že jsem pro vás našel nové místo.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_02");	//Kde přesně?
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_03");	//Nedaleko kamenného kruhu, když půjdeš hlouběji do lesa, je tam útulná jeskyně.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_04");	//Hmmm... (zamyšleně) Ano, to by se mohlo hodit.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_05");	//Dobře, promluvím si o ní s klukama.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_06");	//Když nás tady příště nenajdeš, pak nás najdeš v té jeskyni.
	MIS_FindKillPlace = LOG_Success;
	KillersMoveInCave = TRUE;
	Log_SetTopicStatus(TOPIC_FindKillPlace,LOG_Success);
	B_LogEntry(TOPIC_FindKillPlace,"Charlotte byla potěšena vyhlídkou na novou jeskyni. Myslím, že se tam brzy vypraví.");
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Cave(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Cave_condition;
	information = dia_addon_inextremo_charlotte_Cave_info;
	permanent = FALSE;
	description = "Jak to jde?";
};

func int dia_addon_inextremo_charlotte_Cave_condition()
{
	if(MoveKillNewPlace == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Cave_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_01");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_02");	//Všechno v pohodě. Vypadá to, že je tady lépe, než ve městě.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_03");	//Opravdu?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_04");	//Nevím, co v této jeskyni bylo dřív, ale našli jsme tu velké zásoby rýžového sladu. 
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_05");	//Flail z nich teď celé dny vyrábí kořalku. A já ji prodávám obchodníkům ve městě.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_06");	//Kromě toho jsem se dohodla s jedním farmářem, že mu budeme dohlížet na farmu.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_07");	//Jak?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_08");	//Vždyť to znáš, všude se potuluje různá lůza a je potřeba být na pozoru.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_09");	//Městská stráž se zrovna nepřetrhne a co pak, když nastanou problémy.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_10");	//S našimi chlapci si není radno zahrávat! Dokonce nám za to platí.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_11");	//On vám platí za ochranu?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_12");	//(šibalsky) Něco takového.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_13");	//Dobře jste si to tu zařídili.
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Perm(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Perm_condition;
	information = dia_addon_inextremo_charlotte_Perm_info;
	permanent = TRUE;
	description = "Je všude klid?";
};

func int dia_addon_inextremo_charlotte_Perm_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_InExtremo_Charlotte_Cave) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Perm_info()
{
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Perm_01_01");	//Je všude klid?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Perm_01_02");	//Ano, větší, než bys doufal.
};

var int MyGuildMoney;
var int FirstKillPay;

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Navar(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Navar_condition;
	information = dia_addon_inextremo_charlotte_Navar_info;
	permanent = FALSE;
	description = "A co z toho budu mít?";
};

func int dia_addon_inextremo_charlotte_Navar_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_InExtremo_Charlotte_Cave) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Navar_info()
{
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Navar_01_01");	//Budu taky z toho něco mít?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Navar_01_02");	//Samozřejmě, jsi náš šéf! A to ty jsi objevil tuhle jeskyni.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Navar_01_03");	//Můžeš přijít jednou týdně. Tvůj podíl tady na tebe bude čekat.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Navar_01_04");	//Tak se mi to líbí!
	MyGuildMoney = TRUE;
};

instance dia_addon_inextremo_charlotte_PERMJOBPAY(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 51;
	condition = dia_addon_inextremo_charlotte_permjobpay_condition;
	information = dia_addon_inextremo_charlotte_permjobpay_info;
	permanent = TRUE;
	description = "Co můj podíl?";
};

func int dia_addon_inextremo_charlotte_permjobpay_condition()
{
	if(MyGuildMoney == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_permjobpay_info()
{
	var int daynow;
	var int sumpay;

	daynow = Wld_GetDay();

	AI_Output(other,self,"DIA_Charlotte_PermJobPay_01_00");	//Co můj podíl?

	if((KILLPAYDAY <= (daynow - 7)) || (FirstKillPay == FALSE))
	{
		AI_Output(self,other,"DIA_Charlotte_PermJobPay_01_01");	//Samozřejmě, vem si ho.
		sumpay = Hlp_Random(300) + 200;
		B_GiveInvItems(self,other,ItMi_Gold,sumpay);
		KILLPAYDAY = Wld_GetDay();
		FirstKillPay = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Charlotte_PermJobPay_01_03");	//Už jsi svůj podíl dostal! Teď budeš muset chvíli počkat.
		AI_Output(other,self,"DIA_Charlotte_PermJobPay_01_04");	//Jistě, zapomněl jsem.
	};
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Siege(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Siege_condition;
	information = dia_addon_inextremo_charlotte_Siege_info;
	permanent = FALSE;
	description = "Skřeti obsadili Khorinis.";
};

func int dia_addon_inextremo_charlotte_Siege_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Siege_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Siege_01_01");	//Skřeti obsadili Khorinis.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Siege_01_02");	//Už víme, proto raději zůstáváme tady v jeskyni.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Siege_01_03");	//Je nepravděpodobné, že nás tu najdou.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Siege_01_04");	//Ale buďte připraveni, můžu každou chvíli potřebovat vaši pomoc.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Siege_01_05");	//Samozřejmě.
};