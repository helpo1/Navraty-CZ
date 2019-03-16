/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func int DIA_Wulfgar_Bandits_Condition - upraveny podmínky dialogu

*/




instance DIA_Wulfgar_EXIT(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 999;
	condition = DIA_Wulfgar_EXIT_Condition;
	information = DIA_Wulfgar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wulfgar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Wulfgar_Hallo(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Hallo_Condition;
	information = DIA_Wulfgar_Hallo_Info;
	permanent = FALSE;
	description = "Jak jde služba?";
};

func int DIA_Wulfgar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Hallo_15_00");	//Jak jde služba?
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_01");	//(pohrdavě) Tihle hoši máchají meči jako nějací rolníci.
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_02");	//(odhodlaně) Ale až s nimi skončím, každý z nich bude tvrdý, houževnatý bastard.
};

instance DIA_Wulfgar_WannaJoin(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 2;
	condition = DIA_Wulfgar_WannaJoin_Condition;
	information = DIA_Wulfgar_WannaJoin_Info;
	permanent = FALSE;
	description = "Chci se přidat k domobraně!";
};


func int DIA_Wulfgar_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_00");	//Chci se přidat k domobraně!
	AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//No a? Jsi občanem města?
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_02");	//Ne.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_03");	//V tom případě tě lord Andre nepřijme.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_04");	//Samozřejmě, že si s ním můžeš promluvit - ale neřekl bych, že u tebe učiní výjimku.
	}
	else
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//Ano.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_06");	//V tom případě si promluv s lordem Andrem. On rozhoduje, koho přijmout a koho ne.
	};
};


instance DIA_Wulfgar_AboutMiliz(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 3;
	condition = DIA_Wulfgar_AboutMiliz_Condition;
	information = DIA_Wulfgar_AboutMiliz_Info;
	permanent = FALSE;
	description = "Jaké to je, sloužit v domobraně?";
};


func int DIA_Wulfgar_AboutMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AboutMiliz_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_AboutMiliz_15_00");	//Jaké to je, sloužit v domobraně?
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_01");	//Naším velitelem je teď lord Andre.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_02");	//Domobrana se dřív zodpovídala místodržícímu. (směje se) Ten neměl ani ponětí, co tady vlastně děláme.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_03");	//Ale lord Andre dobře ví, co dělá. O chlapy se stará vážně dobře.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_04");	//Každý, kdo tady začíná, dostane slušnou zbroj a dobrou zbraň.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_05");	//A když odvádíš dobrou práci, dostaneš něco navíc. Za každého lapeného kriminálníka dostaneš odměnu.
};


instance DIA_Wulfgar_CanYouTrain(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 4;
	condition = DIA_Wulfgar_CanYouTrain_Condition;
	information = DIA_Wulfgar_CanYouTrain_Info;
	permanent = FALSE;
	description = "Můžeš učit v boji s mečem i mě?";
};


func int DIA_Wulfgar_CanYouTrain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_CanYouTrain_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_00");	//Můžeš učit v boji s mečem i mě?
	AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_01");	//Z rozkazu lorda Andreho cvičíme každého, kdo by mohl být schopen bránit město.

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_02");	//To ovšem neplatí pro žoldáky. Zmiz.
	}
	else
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_03");	//To ovšem platí jen pro bojový výcvik. Všechny ostatní druhy výcviku jsou vyhrazeny domobraně.
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_04");	//Umíš aspoň trochu ovládat zbraň?
		AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_05");	//Řekl bych, že ano.
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_06");	//(povzdechne si) Dobrá - až se na to budeš cítit, můžeme začít.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Wulfgar, člen městské stráže, mě může cvičit v umění boje s jednoručními i obouručními zbraněmi.");
		Wulfgar_Teach1H = TRUE;
	};
};


instance DIA_Wulfgar_Advantage(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 5;
	condition = DIA_Wulfgar_Advantage_Condition;
	information = DIA_Wulfgar_Advantage_Info;
	permanent = FALSE;
	description = "Jaké jsou výhody jednoručních a obouručních zbraní?";
};


func int DIA_Wulfgar_Advantage_Condition()
{
	if((Wulfgar_Teach1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Advantage_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Advantage_15_00");	//Jaké jsou výhody jednoručních a obouručních zbraní?
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_01");	//Je to prosté. S jednoruční zbraní jsi rychlejší. To může být v bitvě poměrně značná výhoda.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_02");	//Obouruční zbraně jsou těžkopádnější. Musíš bojovat obezřetně a myslet dopředu - při zásahu však způsobíš mnohem větší zranění.
};

instance DIA_Wulfgar_Teach(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 7;
	condition = DIA_Wulfgar_Teach_Condition;
	information = DIA_Wulfgar_Teach_Info;
	permanent = TRUE;
	description = "Začněme s výcvikem.";
};

func int DIA_Wulfgar_Teach_Condition()
{
	if((Wulfgar_Teach1H == TRUE) || (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Teach_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Začněme s výcvikem.

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_Add_04_00");	//Žoldáky necvičím!
	}
	else
	{
		if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM))
		{
			AI_Output(self,other,"DIA_Wulfgar_Add_04_01");	//Jistě, ctihodnosti.
		};

		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

		if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
		{
			Info_AddChoice(DIA_Wulfgar_Teach,"Regenerace výdrže (VB: 10, cena: 5000 zlatých)",DIA_Wulfgar_Teach_RegenStam);
		};
	};
};

func void DIA_Wulfgar_Teach_Back()
{
	Info_ClearChoices(DIA_Wulfgar_Teach);
};

func void DIA_Wulfgar_Teach_RegenStam()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_03");	//Nauč mě jak rychleji obnovovat svoji výdrž.

	kosten = 10;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Regenerace výdrže");
		VATRAS_TEACHREGENSTAM = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Wulfgar_Teach);
	Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
};

func void DIA_Wulfgar_Teach_1H_1()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Regenerace výdrže (VB: 10, cena: 5000 zlatých)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Regenerace výdrže (VB: 10, cena: 5000 zlatých)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	};
};

func void DIA_Wulfgar_Teach_1H_5()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Regenerace výdrže (VB: 10, cena: 5000 zlatých)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Regenerace výdrže (VB: 10, cena: 5000 zlatých)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	};
};

func void DIA_Wulfgar_Teach_2H_1()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Regenerace výdrže (VB: 10, cena: 5000 zlatých)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Regenerace výdrže (VB: 10, cena: 5000 zlatých)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	};
};

func void DIA_Wulfgar_Teach_2H_5()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
		};
	};
};

func void dia_wulfgar_teach_stamina_1()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,1))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void dia_wulfgar_teach_stamina_5()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,5))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void dia_wulfgar_teach_hp_1()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void dia_wulfgar_teach_hp_5()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};


instance DIA_Wulfgar_AlsMil(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_AlsMil_Condition;
	information = DIA_Wulfgar_AlsMil_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wulfgar_AlsMil_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AlsMil_Info()
{
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_00");	//Takže tě lord Andre přijal!
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_01");	//Předpokládám, že sem budeš chodit cvičit pravidelně.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_02");	//Ruga tě bude učit v umění střelby z kuše a Mortis ti pomůže zvýšit sílu.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_03");	//Ale nejdůležitější pro tebe je pořádně se naučit zacházet s mečem.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_04");	//Ještě z tebe udělám dobrého bijce!
};


instance DIA_Wulfgar_Bonus(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 2;
	condition = DIA_Wulfgar_Bonus_Condition;
	information = DIA_Wulfgar_Bonus_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wulfgar_Bonus_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,2,6,54))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bonus_Info()
{
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_00");	//Tak brzy a již na nohou? V tuhle denní dobu tady bývám většinou sám. Ale když už jsi tady, můžeš se něčemu přiučit.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_01");	//Tak dávej pozor. Některé protivníky můžeš zmást, když se jejich úderům vyhneš a pak v pravou chvíli udeříš.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_02");	//Pamatuj na to ve svém příštím boji!

	if(other.HitChance[NPC_TALENT_1H] >= other.HitChance[NPC_TALENT_2H])
	{
		B_RaiseFightTalent_Bonus(other,NPC_TALENT_1H,1);
	}
	else
	{
		B_RaiseFightTalent_Bonus(other,NPC_TALENT_2H,1);
	};
};


instance DIA_Wulfgar_PICKPOCKET(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 900;
	condition = DIA_Wulfgar_PICKPOCKET_Condition;
	information = DIA_Wulfgar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wulfgar_PICKPOCKET_Condition()
{
	return C_Beklauen(58,80);
};

func void DIA_Wulfgar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
	Info_AddChoice(DIA_Wulfgar_PICKPOCKET,Dialog_Back,DIA_Wulfgar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wulfgar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wulfgar_PICKPOCKET_DoIt);
};

func void DIA_Wulfgar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
};

func void DIA_Wulfgar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
};

instance DIA_Wulfgar_Bandits(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Bandits_Condition;
	information = DIA_Wulfgar_Bandits_Info;
	permanent = FALSE;
	description = "Máš pro mě nějaké rozkazy?";
};

func int DIA_Wulfgar_Bandits_Condition()
{
	// if((hero.guild == GIl_MIL) && (MIS_Andre_REDLIGHT == LOG_SUCCESS) && (MIS_Andre_Peck == LOG_SUCCESS) && (DexterIsDead == FALSE))
	if((hero.guild == GIl_MIL) && (MIS_Andre_REDLIGHT == LOG_SUCCESS) && (MIS_Andre_Peck == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bandits_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Bandits_01_00");	//Máš pro mě nějaké rozkazy?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_01");	//No, když už jsi teď jeden z nás, něco by tady pro tebe bylo.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_01_02");	//Co mám udělat?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_03");	//Dávej pozor a poslouchej. (vážně) Přednedávnem banditi podnikli několik útoků na přilehlé farmy.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_04");	//Povedlo se nám přijít včas a útoky odrazit, ale to mě netrápí.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_01_05");	//Co tě tedy trápí?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_06");	//Na obyčejnou tlupu banditů byli příliš dobře organizovaní.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_07");	//Jednoho se nám povedlo vyslechnout.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_08");	//Podle něj je teď kolem Khorinisu aktivních několik větších band.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_09");	//Neřekl nám však, kde přesně mají svoji skrýš.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_10");	//Proto tenhle úkol svěřuji tobě!
	AI_Output(other,self,"DIA_Wulfgar_Bandits_01_11");	//Sám asi celou bandu nevyřídím.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_12");	//Proto tě o to ani nežádám. Stačí, abys je vystopoval.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_13");	//Pak se už kluci postarají, aby skončili na šibenici!
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_14");	//Nejdůležitější ale je, abychom přesně věděli, kdo jejich útoky koordinuje.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_15");	//Dokud se nedovíme tohle, všechno naše úsilí bude zbytečné.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_01_16");	//Dobrá. Udělám vše, co bude v mých silách. Které farmy byly napadeny?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_17");	//Akilova a Lobartova. Proto bys měl nejdřív začít hledat tam.
	MIS_WulfgarBandits = LOG_Running;
	Log_CreateTopic(TOPIC_WulfgarBandits,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WulfgarBandits,LOG_Running);
	B_LogEntry(TOPIC_WulfgarBandits,"Wulfgar mi přikázal najít bandity, kteří zaútočili na Akilovu a Lobartovu farmu. Nejvíc ze všeho ale chce vědět, kdo jejich útoky koordinuje.");
};

instance DIA_Wulfgar_Bandits_Letter(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Bandits_Letter_Condition;
	information = DIA_Wulfgar_Bandits_Letter_Info;
	permanent = FALSE;
	description = "Mám dopis vůdce banditů.";
};

func int DIA_Wulfgar_Bandits_Letter_Condition()
{
	if((MIS_WulfgarBandits == LOG_Running) && (Npc_HasItems(other,ItWr_DexterOrder) >= 1) && (Npc_HasItems(other,ItWr_DexTrait) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bandits_Letter_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_00");	//Mám dopis vůdce banditů.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_01");	//Nech mě se podívat. Rychle!
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_02");	//Vezmi si ho.
	B_GiveInvItems(other,self,ItWr_DexterOrder,1);
	Npc_RemoveInvItems(self,ItWr_DexterOrder,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_03");	//To nám tedy ještě chybělo! Zrádce v našich vlastních řadách.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_04");	//Dobré zprávy! Teď už rozumím, jak mohli být tak rychlí a přesní.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_05");	//Vždyť věděli o všech našich plánech a opatřeních.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_06");	//Co teď budeme dělat?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_07");	//(přísně) Za každou cenu to musíme tomu parchantovi spočítat!
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_08");	//Jinak pro nás dříve nebo později nastanou těžké časy.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_09");	//A jak to uděláme?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_10");	//Jsem si jistý, že ten, co napsal tenhle dopis, bude potřebné informace mít.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_11");	//Najdi ho a vyslechni! Ale nezabíjej ho, dokud nebudeš znát jméno toho zrádce.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_12");	//Rozumíš?
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_13");	//Ano, je mi to jasný.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_14");	//Tak si pospěš - každá minuta je teď drahá.
	WulfgarSendDexter = TRUE;
	B_LogEntry(TOPIC_WulfgarBandits,"Wulfgar byl hněvem bez sebe, když se dověděl, že mezi domobránci je zrádce. Přikázal mi, abych zjistil, kdo ten dopis napsal a vypáčil z něj jméno toho darebáka.");
};

instance DIA_Wulfgar_Bandits_Done(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Bandits_Done_Condition;
	information = DIA_Wulfgar_Bandits_Done_Info;
	permanent = FALSE;
	description = "Přečti si tohle.";
};

func int DIA_Wulfgar_Bandits_Done_Condition()
{
	if((MIS_WulfgarBandits == LOG_Running) && (Npc_HasItems(other,ItWr_DexTrait) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bandits_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Done_01_00");	//Přečti si tohle.
	B_GiveInvItems(other,self,ItWr_DexTrait,1);
	Npc_RemoveInvItems(self,ItWr_DexTrait,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_01");	//Tak on je ta krysa! Tušil jsem to.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_02");	//Teď je už jasné, odkud měl tolik zlata na rozhazování v hospodách a nevěstincích.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_03");	//Ale ten sladký život se již naplnil. Okamžitě vydám rozkazy na jeho zatčení!
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_04");	//Děkuji ti ve jménu celé domobrany!
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_05");	//A jako důkaz naší vděčnosti přijmi tuhle zbroj.
	B_GiveInvItems(self,other,ItAr_MIL_M,1);
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_06");	//Zasloužil sis ji, vojáku!
	MIS_WulfgarBandits = LOG_Success;
	SHOW_ITAR_MIL_M = TRUE;
	Log_SetTopicStatus(TOPIC_WulfgarBandits,LOG_Success);
	B_LogEntry(TOPIC_WulfgarBandits,"Odevzdal jsem Wulfgarovi Dexterův dopis, který napsal domobránce Peck. Teď ho čekají krušné časy. Nu, zrádce nikde moc soucitu čekat nemůže.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(MIL_324_Peck,"Jail");
	AI_Teleport(MIL_324_Peck,"NW_CITY_HABOUR_KASERN_HALVOR");
};