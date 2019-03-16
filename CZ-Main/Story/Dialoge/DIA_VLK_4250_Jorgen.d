
instance DIA_Jorgen_KAP3_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP3_EXIT_Condition;
	information = DIA_Jorgen_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_PICKPOCKET(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 900;
	condition = DIA_Jorgen_PICKPOCKET_Condition;
	information = DIA_Jorgen_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jorgen_PICKPOCKET_Condition()
{
	return C_Beklauen(59,70);
};

func void DIA_Jorgen_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
	Info_AddChoice(DIA_Jorgen_PICKPOCKET,Dialog_Back,DIA_Jorgen_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jorgen_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jorgen_PICKPOCKET_DoIt);
};

func void DIA_Jorgen_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
};

func void DIA_Jorgen_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
};


instance DIA_Jorgen_Hallo(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 4;
	condition = DIA_Jorgen_Hallo_Condition;
	information = DIA_Jorgen_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jorgen_Hallo_Condition()
{
	if((Kapitel == 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Hallo_Info()
{
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_00");	//Hej, ty!

	if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_01");	//Vidím, že patříš ke klášteru mágů
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_02");	//Ano, proč?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_03");	//Neuživili byste tam ještě jednoho dělníka?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_04");	//Hej, ty, už jsi byl někdy v klášteře?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_05");	//Možná, proč?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_06");	//A ještě pořád najímají nové lidi?
	};

	AI_Output(self,other,"DIA_Jorgen_Hallo_07_07");	//Nevěděl jsem, kam jinam se obrátit.
};


instance DIA_Jorgen_Novice(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 6;
	condition = DIA_Jorgen_Novice_Condition;
	information = DIA_Jorgen_Novice_Info;
	permanent = FALSE;
	description = "Neprošel tudy nějaký novic?";
};

func int DIA_Jorgen_Novice_Condition()
{
	if((MIS_NovizenChase == LOG_Running) && (Kapitel == 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Novice_Info()
{
	AI_Output(other,self,"DIA_Jorgen_Novice_15_00");	//Neprošel tudy nějaký novic?
	AI_Output(self,other,"DIA_Jorgen_Novice_07_01");	//No jasně, tamhletudy.
	AI_PointAt(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self,other,"DIA_Jorgen_Novice_07_02");	//Támhle z toho mostu skočil do vody a plaval, jako by měl v patách žraloka.
	AI_StopPointAt(self);
};

instance DIA_Jorgen_Milten(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 5;
	condition = DIA_Jorgen_Milten_Condition;
	information = DIA_Jorgen_Milten_Info;
	permanent = FALSE;
	description = "Jestli míříš do kláštera, měl by sis promluvit s Miltenem...";
};

func int DIA_Jorgen_Milten_Condition()
{
	if((Kapitel == 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE) && (MIS_OLDWORLD == LOG_SUCCESS) && (MiltenNW.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Milten_Info()
{
	AI_Output(other,self,"DIA_Jorgen_Milten_15_00");	//Jestli míříš do kláštera, měl by sis promluvit s Miltenem, ten ti určitě dokáže pomoci.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_01");	//Co myslíš, pustí mne vůbec dovnitř?
	AI_Output(other,self,"DIA_Jorgen_Milten_15_02");	//Snad. Ale jak se tak na tebe dívám, jen těžko si tě dovedu představit v rouše noviců.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_03");	//Dost těch nesmyslů - jasně, že roucho noviců. To je přesně to, po čem bažím, i když potom budu muset ohlodávat kůru ze stromů.
};


instance DIA_Jorgen_Home(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 7;
	condition = DIA_Jorgen_Home_Condition;
	information = DIA_Jorgen_Home_Info;
	description = "Odkud jsi přišel?";
};

func int DIA_Jorgen_Home_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Home_Info()
{
	AI_Output(other,self,"DIA_Jorgen_Home_15_00");	//Odkud jsi přišel?
	AI_Output(self,other,"DIA_Jorgen_Home_07_01");	//Býval jsem kapitánem velrybářské lodi, chlapče. Moře je mým domovem.
	AI_Output(self,other,"DIA_Jorgen_Home_07_02");	//Před pár měsíci ale moji loď, starou dobrou Magdalenu, potopili piráti. A tak jsem tu zkejsnul.
	AI_Output(self,other,"DIA_Jorgen_Home_07_03");	//Vždycky jsem se chtěl vrátit zpátky na moře, ale od té doby, co tu trčím, nevyplul z tohohle prokletého přístavu ani jeden škuner.
	AI_Output(self,other,"DIA_Jorgen_Home_07_04");	//Jediná loď, která v Khorinisu kotví, je ta zatracená válečná královská galéra - a tam nikoho dalšího nepřijmou.
	AI_Output(self,other,"DIA_Jorgen_Home_07_05");	//Tak co ještě můžu dělat? Už jsem zkoušel všechno - ve městě pro mě žádná práce není.
};


instance DIA_Jorgen_BeCarefull(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 8;
	condition = DIA_Jorgen_BeCarefull_Condition;
	information = DIA_Jorgen_BeCarefull_Info;
	permanent = TRUE;
	description = "Udělals dobře, že jsi nikam nešel.";
};


func int DIA_Jorgen_BeCarefull_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Jorgen_Home))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BeCarefull_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BeCarefull_15_00");	//Udělals dobře, že jsi nikam nešel.
	AI_Output(self,other,"DIA_Jorgen_BeCarefull_07_01");	//Žádné strachy. Už jsem si všimnul, že v posledních dvou dnech je okolní divočina zpropadeně nebezpečná.
};


instance DIA_Jorgen_KAP4_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP4_EXIT_Condition;
	information = DIA_Jorgen_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_NEUHIER(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 41;
	condition = DIA_Jorgen_NEUHIER_Condition;
	information = DIA_Jorgen_NEUHIER_Info;
	description = "Jak to v klášteře jde?";
};


func int DIA_Jorgen_NEUHIER_Condition()
{
	if((Kapitel >= 4) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_NEUHIER_Info()
{
	AI_Output(other,self,"DIA_Jorgen_NEUHIER_15_00");	//Jak to jde v klášteře?
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_01");	//Pomalu tu z toho všeho blázním!
	if(Npc_KnowsInfo(other,DIA_Jorgen_Milten))
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_02");	//Ale i tak ti děkuju za pomoc. S Miltenovým přispěním jsem tu opravdu získal místo.
		B_GivePlayerXP(XP_Ambient);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_03");	//Akorát se mezi těmi sebemrskačskými lidumily cítím jako blbec.
	};
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_04");	//No, ale tělu se nedá poroučet. Než umřít hlady ve městě, radši budu dělat, co mi novicové nakážou.
};


instance DIA_Jorgen_PERM4(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 400;
	condition = DIA_Jorgen_PERM4_Condition;
	information = DIA_Jorgen_PERM4_Info;
	permanent = TRUE;
	description = "Myslím, že se to poddá.";
};


func int DIA_Jorgen_PERM4_Condition()
{
	if((Kapitel >= 4) && (CAPITANORDERDIAWAY == FALSE) && Npc_KnowsInfo(other,DIA_Jorgen_Home) && Npc_KnowsInfo(other,DIA_Jorgen_NEUHIER) && (JorgenIsCaptain == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_PERM4_OneTime;

func void DIA_Jorgen_PERM4_Info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM4_15_00");	//Myslím, že se to poddá.
	if((DIA_Jorgen_PERM4_OneTime == FALSE) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_PERM4_07_01");	//Jenom si představ - mám jim vyplít zahradu. Když to takhle půjde dál, za chvíli se z toho zcvoknu.
		DIA_Jorgen_PERM4_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_PERM4_07_02");	//Jediné, co potřebuju, je zase stará dobrá paluba pod nohama.
};


instance DIA_Jorgen_KAP5_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP5_EXIT_Condition;
	information = DIA_Jorgen_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_BEMYCAPTAIN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 51;
	condition = DIA_Jorgen_BEMYCAPTAIN_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN_Info;
	permanent = TRUE;
	description = "Možná bych ti mohl nabídnout místo kapitána.";
};


func int DIA_Jorgen_BEMYCAPTAIN_Condition()
{
	if((Kapitel == 5) && (CAPITANORDERDIAWAY == FALSE) && (MIS_SCKnowsWayToIrdorath == TRUE) && (MIS_PyrokarClearDemonTower != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Jorgen_Home))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_BEMYCAPTAIN_OneTime;

func void DIA_Jorgen_BEMYCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN_15_00");	//Možná bych ti mohl nabídnout místo kapitána.
	if(DIA_Jorgen_BEMYCAPTAIN_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//Nehoupeš mě, kámo? Jestli mluvíš pravdu, tak do toho určitě jdu!
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_02");	//Ehm - je tu ale menší problém. Vyjedl jsem těm novicům půlku spižírny.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_03");	//Ti chlápkové jsou z toho celí nepříčetní. Nemyslím, že by mě hlavní mág nechal takhle odejít.
		DIA_Jorgen_BEMYCAPTAIN_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_04");	//Je mi líto, ale nejdřív si musím něco vyřídit s Pyrokarem.
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"Jorgen svolil, že se stane mým kapitánem, ale nejdřív za něj musím zaplatit všechny dluhy v klášteře.");
};


instance DIA_Jorgen_BEMYCAPTAIN2(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 52;
	condition = DIA_Jorgen_BEMYCAPTAIN2_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN2_Info;
	description = "Tvůj účet jsem už vyrovnal - jsi volný.";
};


func int DIA_Jorgen_BEMYCAPTAIN2_Condition()
{
	if((MIS_PyrokarClearDemonTower == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BEMYCAPTAIN2_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_00");	//Tvůj účet jsem už vyrovnal - jsi volný.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_01");	//Opravdu? Jak jsi to zařídil?
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_02");	//Do toho ti nic není.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_03");	//No, vlastně je mi to jedno. Ještě jednou ti teda milionkrát děkuju.

	if(SCGotCaptain == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_04");	//A co ta tvoje nabídka? Můžu s tím pořád počítat?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_05");	//Skvělé. A teď bychom odsud měli zmizet.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_Jorgen_BEMYCAPTAIN3(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 53;
	condition = DIA_Jorgen_BEMYCAPTAIN3_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN3_Info;
	description = "Buď mým kapitánem.";
};


func int DIA_Jorgen_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jorgen_BEMYCAPTAIN2) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_00");	//Buď mým kapitánem.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_01");	//Je to pro mě čest, ale máš vůbec nějakou loď a posádku?
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_02");	//řekl bych, že budeme potřebovat aspoň pět chlapů.
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_03");	//Dobře, uvidím, co se dá dělat. Zatím na mě počkej v přístavu.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_04");	//Rozkaz, pane.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	JorgenIsCaptain = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Jorgen_LOSFAHREN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 59;
	condition = DIA_Jorgen_LOSFAHREN_Condition;
	information = DIA_Jorgen_LOSFAHREN_Info;
	permanent = TRUE;
	description = "Jsi připraven mě převézt na ostrov?";
};


func int DIA_Jorgen_LOSFAHREN_Condition()
{
	if((JorgenIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_LOSFAHREN_Info()
{
	AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_15_00");	//Jsi připraven mě převézt na ostrov?
	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_01");	//Ale samozřejmě. Dej mi tu mapu.
		AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_07_07");	//Tady máš.
		B_GiveInvItems(other,self,ItWr_Seamap_Irdorath,1);
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_02");	//Skvělé, tak napněme plachty, ať už jsme odsud pryč!
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_03");	//Radši by sis měl nejdřív sbalit všechna fidlátka. Z moře se sem už nemůžeme vrátit.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_04");	//Až všechno vyřídíš, tak si trochu zdřímni - v kapitánské kajutě máš připravenou pryčnu. Dobrou noc.
		B_GiveInvItems(self,other,ItKe_Ship_Levelchange_MIS,1);
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_05");	//Potřebuješ loď, posádku aspoň pěti mužů a námořní mapu, podle které bych mohl plavbu navigovat.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_06");	//Nemůžeme odrazit, dokud neuvidím, že jsi sehnal všechno potřebné.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Jorgen_PERM5_NOTCAPTAIN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 59;
	condition = DIA_Jorgen_PERM5_NOTCAPTAIN_Condition;
	information = DIA_Jorgen_PERM5_NOTCAPTAIN_Info;
	permanent = TRUE;
	description = "Jak se máš?";
};


func int DIA_Jorgen_PERM5_NOTCAPTAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jorgen_BEMYCAPTAIN2) && (SCGotCaptain == TRUE) && (JorgenIsCaptain == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven;

func void DIA_Jorgen_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//Jak se máš?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_01");	//Fajn, tady to není až tak špatné.
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_02");	//Ještě pořád sice musím dělat takové pitomosti jako třeba pást ovce, ale pořád to nejsou ani z půlky takoví omezenci jako ti v klášteře.
		if(DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//Budu si muset najít nový příbytek. Uvidíme, kam mě vítr zavane příště.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_Jorgen_KAP6_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP6_EXIT_Condition;
	information = DIA_Jorgen_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NW_KAPITELORCATTACK(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 1;
	condition = dia_jorgen_nw_kapitelorcattack_condition;
	information = dia_jorgen_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Co říkáte, kapitáne?";
};


func int dia_jorgen_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (JORGENBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_01_00");	//Co říkáte, kapitáne?
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_01_01");	//Co mohu říci...(smutně) Slyšel jsem, že Khorinis je plně v područí skřetů.
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_01_02");	//Slyšel jsem, že se někteří chlapy chtějí probojovat skrz město.
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_01_04");	//Mnoho z nich jsou zkušení válečníci a jsou zdatnými zabijáky skřetů.
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_01_03");	//Eh... Co lze řící o mě...(strach) S mečem to neovládám a nevím jak se zachovat, kde bych byl proti těmto tvorům?
	Info_ClearChoices(dia_jorgen_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportTaverne) >= 1)
	{
		Info_AddChoice(dia_jorgen_nw_kapitelorcattack,"(nabídnout teleportační runy do hostince)",dia_jorgen_nw_kapitelorcattack_taverne);
	};
	Info_AddChoice(dia_jorgen_nw_kapitelorcattack,"Pokusím se.",dia_jorgen_nw_kapitelorcattack_nogiverune);
};

func void dia_jorgen_nw_kapitelorcattack_taverne()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_01");	//Počkej! Potřeboval bych teleportační runu do hostince 'U Mrtvé harpyje'.
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_02");	//Můžeš ji použít.
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_03");	//Noo...(zamyšleně) ja nevím, musím si to promyslet, zda mi to za to stojí.
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_05");	//Bojovat přes město, kde číhá plno skřetů - to se rovná jisté smrti!
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_06");	//Nadělají z Vás sekanou a Vy to víte!
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_08");	//Jo... přesvědčil jste mě. Dobře jdu do toho!
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_09");	//TAdy máte.
	B_GiveInvItems(other,self,ItMi_TeleportTaverne,1);
	Npc_RemoveInvItems(self,ItMi_TeleportTaverne,1);
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_10");	//Eh! Doufám, že po ní nebudu zlitej, jako po týden staré láhvy staré kořalky.
	JORGENNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Dal jsem Jorgenovi runu teleportace do hostince 'U Mrtvé harpyje'. Teď jsem klidný o jeho osudu.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_jorgen_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Další příležitost dostat se odsud!
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_02");	//Nemyslím si, že mám práci... (odsouzen), ale bude muset pokusit.
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_03");	//Hodně štěstí, budeš ho potřebovat!
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_04");	//Díky.
	B_LogEntry(TOPIC_HELPCREW,"Jorgen se pokouší prorazit skrz město. Myslím, že nemá žádnou naději na úspěch.");
	JORGENBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NW_AGAINCAPITAN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 1;
	condition = dia_jorgen_nw_againcapitan_condition;
	information = dia_jorgen_nw_againcapitan_info;
	permanent = FALSE;
	description = "Opět musím sehnat kapitána na loď.";
};


func int dia_jorgen_nw_againcapitan_condition()
{
	if(Npc_KnowsInfo(hero,dia_lord_hagen_needcapitan) && (WHOTRAVELONBIGLAND == FALSE) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_nw_againcapitan_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jorgen_NW_AgainCapitan_01_00");	//Opět musím sehnat kapitána na loď. 
	AI_Output(self,other,"DIA_Jorgen_NW_AgainCapitan_01_01");	//Hmm...(ironicky) Ty máš něco za lubem kámo, co?
	AI_Output(other,self,"DIA_Jorgen_NW_AgainCapitan_01_02");	//Jedu na pevninu. Mám velmi důležitou zprávu pro krále! Pomůžeš mi?
	AI_Output(self,other,"DIA_Jorgen_NW_AgainCapitan_01_03");	//No jestli jo - tak napněme plachty! Ale už nejsem asistent
	AI_Output(other,self,"DIA_Jorgen_NW_AgainCapitan_01_04");	//Proč?
	AI_Output(self,other,"DIA_Jorgen_NW_AgainCapitan_01_05");	//Měl jsem dost všeho toho svinstva! Skřeti, draci, démoni - Jsem prostý člověk a já chci žít v míru.
	AI_Output(self,other,"DIA_Jorgen_NW_AgainCapitan_01_06");	//Raději zůstanu tady a budu jednoduše žít v klášteře, než se plavit s vámi a neustále se strachovat v mém životě.
	AI_Output(self,other,"DIA_Jorgen_NW_AgainCapitan_01_07");	//Takže se omlouvám, nemohu si pomoci!
	AI_Output(other,self,"DIA_Jorgen_NW_AgainCapitan_01_08");	//Je to škoda. Spoléhám na vás.
	B_LogEntry(TOPIC_SALETOBIGLAND,"Jorgen odmítl být kapitánem mé lodi. Měl bych hledat někoho jiného, kdo mi může pomoci.");
};