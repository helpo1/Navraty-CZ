
instance DIA_DMT1298_HELLO(C_Info)
{
	npc = dmt_1298_darkmage;
	nr = 5;
	condition = dia_dmt1298_hello_condition;
	information = dia_dmt1298_hello_info;
	important = TRUE;
};

func int dia_dmt1298_hello_condition()
{
	return TRUE;
};

func void dia_dmt1298_hello_info()
{
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_DMT1298_Hello_01_00");	//Takže... Kdo je to tu?
	AI_Output(self,other,"DIA_DMT1298_Hello_01_02");	//Ubohý následovníku Innose, jsi jen další žert. Můj pán tě sleduje každý den.
	AI_Output(other,self,"DIA_DMT1298_Hello_01_03");	//Co ode mě chceš?
	AI_Output(self,other,"DIA_DMT1298_Hello_01_04");	//Ubohý červe!... (s chrčením) Asi sis ještě neuvědomil s kým mluvíš, že?
	MeetDarkTempleMage = TRUE;
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello,"Počkej, nejdřív mám jeden dotaz.",dia_dmt1298_hello_one);
};

func void dia_dmt1298_hello_battle()
{
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	AI_Output(other,self,"DIA_DMT1298_Hello_Battle_01_90");	//Vyzkoušej mě!
	AI_Output(self,other,"DIA_DMT1298_Hello_Battle_01_00");	//JAK ŘÍKÁŠ! Budu s tebou hned hotov!
	AI_Output(self,other,"DIA_DMT1298_Hello_Battle_01_01");	//A po tvé smrti přidám tvé tělo do mé armády.

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_DMT1298_Hello_Battle_01_02");	//Hmmm... Bude z tebe dobrý kostlivý mág!
	}
	else
	{
		AI_Output(self,other,"DIA_DMT1298_Hello_Battle_01_03");	//Hmmm... Bude z tebe dobrý kostlivý voják!
	};

	if(SBMODE == 1)
	{
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_01,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_02,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_03,"FP_ROAM_NOVIZE_48");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_04,"FP_ROAM_MEDITATE_10");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_05,"FP_ROAM_NOVIZE_52");
	}
	else if(SBMODE == 2)
	{
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_48");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_MEDITATE_10");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_52");
	}
	else 	if(SBMODE == 4)
	{
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_NOVIZE_48");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_MEDITATE_10");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_NOVIZE_52");
	};

	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello,"... (KONEC)",dia_dmt1298_hello_End);
};

func void dia_dmt1298_hello_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
};

func void dia_dmt1298_hello_one()
{
	AI_Output(other,self,"DIA_DMT1298_Hello_One_01_00");	//Počkej, nejdřív mám jeden dotaz.
	AI_Output(other,self,"DIA_DMT1298_Hello_One_01_01");	//Řekni, nenašel jsi tu jeden meč? Velká zbraň s velkým modrým kamenem v čepeli?
	AI_Output(self,other,"DIA_DMT1298_Hello_One_01_03");	//(zamyšleně) Pokud mi kladeš tuto otázku... Tak to znamená, že musíš být ten, kdo porazil Spáče.
	AI_Output(self,other,"DIA_DMT1298_Hello_One_01_04");	//Můj pán mě varoval před naším možným setkáním.
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello,"Obávám se, že tohle setkání pro tebe skončí stejně špatně, jako tehdy pro Spáče.",dia_dmt1298_hello_video);
};

func void dia_dmt1298_hello_video()
{
	PlayVideo("RET2_Sleeper.bik");
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_DMT1298_Hello_Video_01_00");	//Myslíš-li tuto zbraň... Uriziel je vynikající čepel, zbraň hodna samotného Beliara! Tenhle meč je jedním z důvodů, proč mě sem můj pán posílal.
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_DMT1298_Hello_Video_01_01");	//A samozřejmě mi taky řekl, ať ho ochraňuji stejně odhodlaně, jako bych ochraňoval jeho posvátný mír!
	AI_Output(self,other,"DIA_DMT1298_Hello_Video_01_02");	//Můžeš být klidný - je v dobrých rukou, a takový ubožák, jako jsi ty, ho nikdy nedostane... (smích)
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello,"Proč ses zde ve skutečnosti objevil?",dia_dmt1298_hello_sleeper);
};

func void dia_dmt1298_hello_sleeper()
{
	AI_Output(other,self,"DIA_DMT1298_Hello_sleeper_01_00");	//Proč ses zde ve skutečnosti objevil?
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_01");	//A tobě to opravdu nedojde, že? (posměšně) Hlupáku!
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_02");	//Potom, co jsi zabránil jednomu z nejsilnějších démonů ve vesmíru, přijít na tento svět!
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_03");	//Ale díky mě, se vrátí zpátky do tohoto chrámu.
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_04");	//A pak budete litovat, že jste se vůbec narodili!
	AI_Output(other,self,"DIA_DMT1298_Hello_sleeper_01_05");	//Ty, co... znovu jsi vyvolal Spáče?!
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_06");	//No konečně sis to uvědomil hlupáku... (sarkasticky)
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_07");	//Už jsem dokončil rituál přivolání - nyní už nic nebrání v jeho návratu!
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_08");	//A teď to vyřídím s tebou, červe! Aby ses nepletl do cesty mému pánu.
	MIS_SleeperBack = LOG_Running;
	Log_CreateTopic(TOPIC_SleeperBack,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SleeperBack,LOG_Running);
	B_LogEntry(TOPIC_SleeperBack,"Ten zatracený nekromant řekl, že znovu přivolal na tento svět Spáče - je to možné? Počkáme a uvidíme...");
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello,"No, polib mi!",dia_dmt1298_hello_battle);
};

//-------------------Ituzel'd---------------------------------------------

instance DMT_12987_Ituseld_EXIT(C_Info)
{
	npc = DMT_12987_Ituseld;
	nr = 999;
	condition = DMT_12987_Ituseld_EXIT_Condition;
	information = DMT_12987_Ituseld_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DMT_12987_Ituseld_EXIT_Condition()
{
	return TRUE;
};

func void DMT_12987_Ituseld_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DMT_12987_Ituseld_HELLO(C_Info)
{
	npc = DMT_12987_Ituseld;
	nr = 5;
	condition = DMT_12987_Ituseld_HELLO_condition;
	information = DMT_12987_Ituseld_HELLO_info;
	important = TRUE;
};

func int DMT_12987_Ituseld_HELLO_condition()
{
	return TRUE;
};

func void DMT_12987_Ituseld_HELLO_info()
{
	AI_Output(self,other,"DMT_12987_Ituseld_HELLO_01_00");	//Kdo jsi?! A co děláš v mé věži?
	AI_Output(other,self,"DMT_12987_Ituseld_HELLO_01_01");	//Já jsem ten, kdo ti přišel sundat hlavu za zabití paladina Lothara.
	AI_Output(self,other,"DMT_12987_Ituseld_HELLO_01_02");	//Aaa... (vypočítavě) Další fanatik, který si představuje sám sebe jako hrdinu.
	AI_Output(self,other,"DMT_12987_Ituseld_HELLO_01_03");	//V tom případě si vytrpíš stejný osud jako ten hloupý paladin.
	AI_Output(self,other,"DMT_12987_Ituseld_HELLO_01_04");	//Rozdrtím tě jednou ranou, červe!
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
};