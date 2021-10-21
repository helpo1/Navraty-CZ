/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

instance DIA_NICLAS_HIREDASSIST - úpravy dialogů (kvůli úpravám úkolů Noví lovci (TOPIC_NewHunters) a Lidé pro tábor (TOPIC_PPL_FOR_TOWER))
instance DIA_NICLAS_HIREDASSIST_BILGOT - úpravy dialogů (kvůli úpravám úkolů Noví lovci (TOPIC_NewHunters) a Lidé pro tábor (TOPIC_PPL_FOR_TOWER))

*/




instance DIA_Niclas_EXIT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 999;
	condition = DIA_Niclas_EXIT_Condition;
	information = DIA_Niclas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Niclas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Niclas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Niclas_Hello(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_Hello_Condition;
	information = DIA_Niclas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Niclas_Hello_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Niclas_Hello_Info()
{
	AI_Output(self,other,"DIA_Niclas_Hello_03_03");	//Hej chlape! Ztratil ses?
	AI_Output(other,self,"DIA_Niclas_Hello_15_01");	//Co?
	AI_Output(self,other,"DIA_Niclas_Hello_03_02");	//Jak co? Tady nic zajímavého není.
};


instance DIA_Niclas_HaveALook(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_HaveALook_Condition;
	information = DIA_Niclas_HaveALook_Info;
	permanent = FALSE;
	description = "Jen tak koukám.";
};


func int DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};

func void DIA_Niclas_HaveALook_Info()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_15_00");	//Jen tak koukám.
	AI_Output(self,other,"DIA_Niclas_HaveALook_03_01");	//Aha. Chceš kus masa?
	CreateInvItems(self,ItFoMutton,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
	Info_AddChoice(DIA_Niclas_HaveALook,"Ne, díky.",DIA_Niclas_HaveALook_No);
	Info_AddChoice(DIA_Niclas_HaveALook,"Jasně.",DIA_Niclas_HaveALook_Yes);
};

func void DIA_Niclas_HaveALook_No()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_No_15_00");	//Ne, díky.
	AI_Output(self,other,"DIA_Niclas_HaveALook_No_03_01");	//Jak chceš. Nebudu tě přemlouvat.
	B_UseItem(self,ItFoMutton);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};

func void DIA_Niclas_HaveALook_Yes()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_Yes_15_00");	//Jasně.
	AI_Output(self,other,"DIA_Niclas_HaveALook_Yes_03_01");	//Tady. Můj recept.
	B_GiveInvItems(self,other,itfomutton_niclas,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};


instance DIA_Niclas_WhyHere(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_WhyHere_Condition;
	information = DIA_Niclas_WhyHere_Info;
	permanent = FALSE;
	description = "Co tady pohledáváš?";
};


func int DIA_Niclas_WhyHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_HaveALook))
	{
		return TRUE;
	};
};

func void DIA_Niclas_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Niclas_WhyHere_15_00");	//Co tady pohledáváš?
	AI_Output(self,other,"DIA_Niclas_WhyHere_01_01");	//Lovím. Tady je nejlepší místo pro lov.
	if(HEROISHUNTER == FALSE)
	{
		AI_Output(self,other,"DIA_Niclas_WhyHere_01_02");	//Mimochodem byl jsi už v našem táboře?
		AI_Output(other,self,"DIA_Niclas_WhyHere_01_03");	//Kde se ten tábor nachází?
		AI_Output(self,other,"DIA_Niclas_WhyHere_01_04");	//V malé roklině mezi Onarovou a Bengarovou farmou. Určitě to nepřehlédneš.
		AI_Output(self,other,"DIA_Niclas_WhyHere_01_05");	//Pokud tam půjdeš, tak si promluv s Falkem, je to nejstarší lovec.
	};
};


instance DIA_Niclas_ShouldntWork(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_ShouldntWork_Condition;
	information = DIA_Niclas_ShouldntWork_Info;
	permanent = FALSE;
	description = "Jak jde lov?";
};

func int DIA_Niclas_ShouldntWork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_WhyHere))
	{
		return TRUE;
	};
};

func void DIA_Niclas_ShouldntWork_Info()
{
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_01_00");	//Jak jde lov?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_01_01");	//Dobře, tady je nejlepší loviště.
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_01_02");	//Co jsi už ulovil?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_01_03");	//Hlavně mrchožrouty. Je to bezpečné a mají v sobě hodně masa.
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_01_04");	//A kromě toho, jsem dobrý lukostřelec.
};

instance DIA_Niclas_CanTeachMe(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_CanTeachMe_Condition;
	information = DIA_Niclas_CanTeachMe_Info;
	permanent = FALSE;
	description = "Můžeš mě něčemu naučit?";
};


func int DIA_Niclas_CanTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};
};

func void DIA_Niclas_CanTeachMe_Info()
{
	AI_Output(other,self,"DIA_Niclas_CanTeachMe_15_00");	//Můžeš mě něčemu naučit?
	AI_Output(self,other,"DIA_Niclas_CanTeachMe_03_01");	//Proč ne? Mohu zlepšit tvé zacházení s lukem.
	if(HEROISHUNTER == FALSE)
	{
		Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher,"Niclas mi ukáže jak se dá lépe střílet z luku.");
	}
	else
	{
		Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
		B_LogEntry(TOPIC_HUNTERTEACHERS,"Niclas mi ukáže jak se dá lépe střílet z luku.");
	};
};


instance DIA_Niclas_Teach(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_Teach_Condition;
	information = DIA_Niclas_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě zacházet s lukem.";
};


func int DIA_Niclas_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_CanTeachMe))
	{
		return TRUE;
	};
};

func void DIA_Niclas_Teach_Info()
{
	AI_Output(other,self,"DIA_Niclas_Teach_15_00");	//Nauč mě zacházet s lukem.

	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01");	//Naučil jsem tě všemu, co jsem znal. Budeš si muset najít nového učitele.
	}
	else
	{
		Info_ClearChoices(DIA_Niclas_Teach);
		Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
		Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
		Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
	};
};

func void DIA_Niclas_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_00");	//Už tě dál nemohu učit.
	};
	Info_ClearChoices(DIA_Niclas_Teach);
};

func void DIA_Niclas_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
};

func void DIA_Niclas_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
};


instance DIA_NICLAS_MAKEARROWS(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = dia_niclas_makearrows_condition;
	information = dia_niclas_makearrows_info;
	permanent = FALSE;
	description = "Kde seženu nějaké šípy?";
};


func int dia_niclas_makearrows_condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};
};

func void dia_niclas_makearrows_info()
{
	AI_Output(other,self,"DIA_Niclas_MakeArrows_01_00");	//Kde seženu nějaké šípy?
	AI_Output(self,other,"DIA_Niclas_MakeArrows_01_01");	//Nikde. Každý si je dělá sám. Není to tak těžké...
	AI_Output(other,self,"DIA_Niclas_MakeArrows_01_02");	//A kdo mě to naučí?
	AI_Output(self,other,"DIA_Niclas_MakeArrows_01_03");	//Máš-li zájem, podělím se o své znalosti.
};


instance DIA_NICLAS_MAKEARROWSDO(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = dia_niclas_makearrowsdo_condition;
	information = dia_niclas_makearrowsdo_info;
	permanent = TRUE;
	description = "Nauč mě, jak vyrábět šípy.";
};


func int dia_niclas_makearrowsdo_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_makearrows) && (KNOWHOWTOMAKEARROWS == FALSE))
	{
		return TRUE;
	};
};

func void dia_niclas_makearrowsdo_info()
{
	AI_Output(other,self,"Dia_Niclas_MakeArrowsDo_01_00");	//Nauč mě vyrábět šípy.
	Info_ClearChoices(dia_niclas_makearrowsdo);
	Info_AddChoice(dia_niclas_makearrowsdo,Dialog_Back,dia_niclas_makearrowsdo_Back);
	Info_AddChoice(dia_niclas_makearrowsdo,b_buildlearnstringformakearrows("Výroba šípů a šipek",B_GetLearnCostTalent(other,NPC_TALENT_MAKEARROWS,1)),dia_niclas_makearrowsdo_MAKEARROWS);
};

func void dia_niclas_makearrowsdo_Back()
{
	Info_ClearChoices(dia_niclas_makearrowsdo);
};

func void dia_niclas_makearrowsdo_MAKEARROWS()
{
	if(b_teachplayertalentmakearrows(self,other,NPC_TALENT_MAKEARROWS))
	{
		AI_Output(self,other,"Dia_Niclas_MakeArrowsDo_01_01");	//Jak si přeješ. Pro začátek budeš potřebovat dobrou pilu.
		AI_Output(self,other,"Dia_Niclas_MakeArrowsDo_01_02");	//Vypílíš vhodné dřevo na polotovar pro požadovanou velikost.
		AI_Output(self,other,"Dia_Niclas_MakeArrowsDo_01_03");	//Z dřevěných polen vypracuješ tyčky. Poté je třeba připojit ocelové hroty.
		AI_Output(self,other,"Dia_Niclas_MakeArrowsDo_01_04");	//Stejný princip funguje i u šipek do kuše. Abys je vytvořil, musíš mít více oceli.
	};

	Info_ClearChoices(dia_niclas_makearrowsdo);
};

instance DIA_Niclas_PICKPOCKET(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 900;
	condition = DIA_Niclas_PICKPOCKET_Condition;
	information = DIA_Niclas_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Niclas_PICKPOCKET_Condition()
{
	return C_Beklauen(27,20);
};

func void DIA_Niclas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
	Info_AddChoice(DIA_Niclas_PICKPOCKET,Dialog_Back,DIA_Niclas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Niclas_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Niclas_PICKPOCKET_DoIt);
};

func void DIA_Niclas_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};

func void DIA_Niclas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};


instance DIA_NICLAS_RESPECT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = dia_niclas_respect_condition;
	information = dia_niclas_respect_info;
	permanent = FALSE;
	description = "Potřebuji tvou pomoc.";
};


func int dia_niclas_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (NICLAS_RESPECT == FALSE) && Npc_KnowsInfo(other,DIA_Niclas_WhyHere))
	{
		return TRUE;
	};
};

func void dia_niclas_respect_info()
{
	AI_Output(other,self,"DIA_Niclas_Respect_01_00");	//Potřebuji tvou pomoc.
	AI_Output(self,other,"DIA_Niclas_Respect_01_01");	//Proč?
	AI_Output(other,self,"DIA_Niclas_Respect_01_02");	//Chci se dohadovat s Falkem o titul nejlepšího lovce v táboře.
	AI_Output(self,other,"DIA_Niclas_Respect_01_03");	//Hmmm... (zamyšleně) Proč zrovna ty?
	AI_Output(self,other,"DIA_Niclas_Respect_01_04");	//Falk je zkušený lovec a je velmi nepravděpodobné, že ho porazíš.
	AI_Output(other,self,"DIA_Niclas_Respect_01_05");	//Chci to zkusit.
	AI_Output(self,other,"DIA_Niclas_Respect_01_06");	//Dobrá, prvně mi udělej jednu malou laskavost.
	AI_Output(self,other,"DIA_Niclas_Respect_01_08");	//Můj poslední lov nebyl příliš úspěšný...
	AI_Output(self,other,"DIA_Niclas_Respect_01_09");	//Nebyl jsem schopen dostat většinu potřebného množství masa pro chlapy v táboře.
	AI_Output(self,other,"DIA_Niclas_Respect_01_10");	//Takže pokud získáš aspoň tucet čerstvých kousků, máš můj souhlas v kapse.
	AI_Output(self,other,"DIA_Niclas_Respect_01_11");	//Kromě toho, tím také dokážeš, že jsi dobrý lovec. Tak co, souhlasíš?
	B_LogEntry(TOPIC_HUNTERSWORK,"Niclas a já jsme se dohodli, že mě podpoří ve sporu s Falkem, když mu přinesu tucet kousků masa.");
};


instance DIA_NICLAS_RESPECTDONE(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = dia_niclas_respectdone_condition;
	information = dia_niclas_respectdone_info;
	permanent = FALSE;
	description = "Tady je to maso.";
};


func int dia_niclas_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_respect) && (CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (NICLAS_RESPECT == FALSE) && (Npc_HasItems(other,ItFoMuttonRaw) >= 12))
	{
		return TRUE;
	};
};

func void dia_niclas_respectdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Niclas_RespectDone_01_00");	//Tady je to maso.
	B_GiveInvItems(other,self,ItFoMuttonRaw,12);
	AI_Output(self,other,"DIA_Niclas_RespectDone_01_01");	//Páni. Díky, jsi opravdu dobrý lovec.
	AI_Output(other,self,"DIA_Niclas_RespectDone_01_02");	//Podpoříš mě tedy?
	AI_Output(self,other,"DIA_Niclas_RespectDone_01_03");	//Dobře. Podpořím tě ve sporu s Falkem.
	NICLAS_RESPECT = TRUE;
	B_LogEntry(TOPIC_HUNTERSWORK,"Přinesl jsem Niclasovi jeho maso a on mě podpoří v záležitosti s Falkem.");
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
};

instance DIA_NICLAS_RECRUITDT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 21;
	condition = dia_niclas_recruitdt_condition;
	information = dia_niclas_recruitdt_info;
	permanent = FALSE;
	description = "Jak se máš?";
};

func int dia_niclas_recruitdt_condition()
{
	if(HURRAYICANHIRE == TRUE)
	{
		return TRUE;
	};
};

func void dia_niclas_recruitdt_info()
{
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_00");	//Jak se máš?
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_01");	//Jde to. Už jsem se zmínil že se tu dá skvěle lovit?
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_02");	//Ovšem v poslední době to tu začíná být o hubu.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_03");	//Nedávno jsem slyšel z lesa řev skřetů.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_04");	//Nechápu jak se sem dostali. Paladinové hlídají průsmyk.
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_05");	//Ti už nejsou mezi námi. 
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_06");	//Ale ne! No, možná bych se měl vrátit do tábora.
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_07");	//Počkej s tím. Co kdybys pracoval pro mne?
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_08");	//Pro tebe? Co tím myslíš?
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_09");	//Nedaleko Onarovy farmy u staré věže, si zařizuji menší tábor.
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_10");	//A tábor potřebuje jídlo. Potřebuje lovce.
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_11");	//Budeš žít ve věži, lovit v nedalekém lese. Všechny trofeje si můžeš nechat, potřebuji jen maso.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_12");	//Hmmm... A kolik mi to vynese?
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_13");	//Třicet zlatých denně.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_14");	//Zní to dobře. Souhlasím. Ale mám podmínku. Nechci pracovat sám.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_15");	//Les u Onarovy farmy je ještě horší než tady. 
	Info_ClearChoices(dia_niclas_recruitdt);
	Info_AddChoice(dia_niclas_recruitdt,"Není problém.",dia_niclas_recruitdt_yes);
	Info_AddChoice(dia_niclas_recruitdt,"Rozmyslím si to.",dia_niclas_recruitdt_no);
};

func void dia_niclas_recruitdt_yes()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"Dia_Niclas_RecruitDT_yes_15_00");	//Není problém. Až tam přijdeš, heslo je 'dračí poklad'.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_yes_01_00");	//Výborně. Od tohoto dne jsem tvůj lovec.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_yes_01_01");	//Už půjdu.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Niclas přijal můj návrh. Bude v mém táboře obstarávat jídlo. Přeje si ovšem partnera.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	NICLASRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(BAU_984_Niclas,"InCastle");
};

func void dia_niclas_recruitdt_no()
{
	AI_Output(other,self,"Dia_Niclas_RecruitDT_no_15_00");	//Rozmyslím si to.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_no_01_01");	//Dobře. Víš kde mne najdeš.
	AI_StopProcessInfos(self);
};

instance DIA_NICLAS_RECRUITDT_AGREE(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 21;
	condition = dia_niclas_recruitdt_agree_condition;
	information = dia_niclas_recruitdt_agree_info;
	permanent = FALSE;
	description = "Souhlasím.";
};

func int dia_niclas_recruitdt_agree_condition()
{
	if(Npc_KnowsInfo(hero,dia_niclas_recruitdt) && (NICLASRECRUITEDDT == FALSE) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_niclas_recruitdt_agree_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"Dia_Niclas_RecruitDT_Agree_15_00");	//Souhlasím.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_Agree_01_00");	//Výborně. Od tohoto dne jsem tvůj lovec.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_Agree_01_01");	//Už půjdu.
	AI_Output(other,self,"Dia_Niclas_RecruitDT_Agree_15_02");	//Až tam přijdeš, heslo je 'dračí poklad'.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_Agree_01_03");	//Rozumím.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Niclas přijal můj návrh. Bude v mém táboře obstarávat jídlo. Přeje si ovšem partnera.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	NICLASRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(BAU_984_Niclas,"InCastle");
};

/* instance DIA_NICLAS_HIREDASSIST(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 21;
	condition = dia_niclas_hiredassist_condition;
	information = dia_niclas_hiredassist_info;
	permanent = FALSE;
	description = "Našel jsem ti parťáka.";
};

func int dia_niclas_hiredassist_condition()
{
	if(TALBINRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_niclas_hiredassist_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"Dia_Niclas_HiredAssist_15_00");	//Našel jsem ti parťáka. Jmenuje se Talbin.
	AI_Output(self,other,"Dia_Niclas_HiredAssist_01_01");	//Znám ho. Není sice nejodvážnější, ale střílí opravdu přesně.
}; */

instance DIA_NICLAS_HIREDASSIST_BILGOT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 21;
	condition = dia_niclas_hiredassist_bilgot_condition;
	information = dia_niclas_hiredassist_bilgot_info;
	permanent = FALSE;
	description = "Našel jsem ti parťáka.";
};

func int dia_niclas_hiredassist_bilgot_condition()
{
	if(BILGOTRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_niclas_hiredassist_bilgot_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"Dia_Niclas_HiredAssist_Bilgot_15_00");	//Našel jsem ti parťáka. Jmenuje se Bilgot.
	AI_Output(self,other,"Dia_Niclas_HiredAssist_Bilgot_01_01");	//Kdo? Nikdy jsem o něm neslyšel, a to znám většinu zdejších lovců.
	AI_Output(other,self,"Dia_Niclas_HiredAssist_Bilgot_15_01");	//Je to bývalý domobránce, který se nedávno vrátil z Hornického údolí.
	AI_Output(other,self,"Dia_Niclas_HiredAssist_Bilgot_15_02");	//Není sice kovaný lovec, ale je ochoten se zaučit.
	AI_Output(self,other,"Dia_Niclas_HiredAssist_Bilgot_01_02");	//Hm, povedlo se mu projít kolem všech těch skřetů? Uvidíme, snad k něčemu bude.
};

instance DIA_NICLAS_INTOWER(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 22;
	condition = dia_niclas_intower_condition;
	information = dia_niclas_intower_info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int dia_niclas_intower_condition()
{
	if((NICLASRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 12000))
	{
		return TRUE;
	};
};

func void dia_niclas_intower_info()
{
	AI_Output(other,self,"DIA_Niclas_InTower_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Niclas_InTower_01_01");	//Není špatné zase spát pod střechou.
};

instance DIA_NICLAS_INTOWER_ORCKAP(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 22;
	condition = dia_niclas_intower_orckap_condition;
	information = dia_niclas_intower_orckap_info;
	permanent = TRUE;
	description = "Jak se máte?";
};

func int dia_niclas_intower_orckap_condition()
{
	if((NICLASRECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE))
	{
		return TRUE;
	};
};

func void dia_niclas_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Niclas_InTower_OrcKap_15_00");	//Jak se máš?
	AI_Output(self,other,"DIA_Niclas_InTower_OrcKap_01_01");	//Dobře, že jsme udělali zásoby. Nyní je lov nebezpečný.
};
