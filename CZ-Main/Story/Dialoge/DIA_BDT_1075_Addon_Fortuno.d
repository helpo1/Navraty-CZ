
instance DIA_Addon_Fortuno_EXIT(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 999;
	condition = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FORTUNO_NO_TALK(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 1;
	condition = dia_fortuno_no_talk_condition;
	information = dia_fortuno_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_fortuno_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_fortuno_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fortuno_PICKPOCKET(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 900;
	condition = DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information = DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	return C_Beklauen(10,25);
};

func void DIA_Addon_Fortuno_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fortuno_PICKPOCKET,Dialog_Back,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fortuno_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
};

func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
};


instance DIA_Addon_Fortuno_Hi(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Fortuno_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Fortuno_Geheilt_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Hi_Info()
{
	if(Fortuno_Einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_00");	//(vystrašeně) Černý mrak nademnou... ON přichází...
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_01");	//S krví... přivolává ho... ON mě sleduje... on mě sleduje... ó, ne, ztrať se, vypadni...
		AI_Output(other,self,"DIA_Addon_Fortuno_Hi_15_02");	//Jsi v pořádku?
		Fortuno_Einmal = TRUE;
		Log_CreateTopic(Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_Running);
		B_LogEntry(Topic_Addon_Fortuno,"Fortuno je mimo. Potřebuje 'Zeleného Novice'.");
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_03");	//Zelený... zelený novic... nemůžu ho najít...
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Info_AddChoice(DIA_Addon_Fortuno_Hi,"Vrátím se později... (KONEC)",DIA_Addon_Fortuno_Hi_BACK);
	Info_AddChoice(DIA_Addon_Fortuno_Hi,"Můžu ti pomoci?",DIA_Addon_Fortuno_Hi_HILFE);
	if(Npc_HasItems(other,ItMi_Joint) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi,"Tady, vezmi si tohle stéblo.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if(Npc_HasItems(other,ItMi_Addon_Joint_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi,"Ok, zkus tohle - 'Zelený Novic'",DIA_Addon_Fortuno_Hi_GREEN);
	};
};

func void DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_HILFE_15_00");	//Můžu ti pomoci?
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_HILFE_13_01");	//Zelený... zelený novic pomáhá novicům...
};

func void DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_JOINT_15_00");	//Tady, vezmi si tohle stéblo.
	if(B_GiveInvItems(other,self,ItMi_Joint,1))
	{
		AI_UseItem(self,ItMi_Joint);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_JOINT_13_01");	//Není zelený, není silný, není zelený, není silný...
};

func void DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_GREEN_15_00");	//Ok, zkus tohle - 'Zelený Novic'.
	if(B_GiveInvItems(other,self,ItMi_Addon_Joint_01,1))
	{
		AI_UseItem(self,ItMi_Addon_Joint_01);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_01");	//(vyléčený) AAAHHH...
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_02");	//Moje hlava... kdo... jsem... Fortuno... co... co se děje?
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	B_GivePlayerXP(XP_Addon_Fortuno_01);
	B_LogEntry(Topic_Addon_Fortuno,"'Zelený Novic' obnovil Fortunovy smysly.");
};


instance DIA_Addon_Fortuno_wer(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent = FALSE;
	description = "Ok, teď mi řekni, co s tebou je.";
};


func int DIA_Addon_Fortuno_wer_Condition()
{
	if(Fortuno_Geheilt_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_00");	//Ok, teď mi řekni, co s tebou je.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_01");	//Jednou jsem byl členem Bratrstva Spáče. Tehdy bylo ještě vše v pořádku.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_02");	//Jistě, všichni jsme byli usvědčení kriminálníci, ale my novicové, jsme neměli žádné starosti...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_03");	//Hej, já jsem byl také v kolonii. Řekni mi něco, co ještě nevím.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_04");	//Já... nic si nepamatuju. Temnota zastřela moji mysl...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_05");	//No tak. Zkus se soustředit. Co se stalo? Jak můžeš znovu získat svou paměť?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_06");	//Raven... pamatuju si jenom na Ravena a... temné pokoje.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_07");	//Co je s Ravenem? Co ti udělal?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_08");	//(vzdychá) Omlouvám se. Vypadá to, jako by byla moje mysl uvězněna... Sám tomu nerozumím...
};


instance DIA_Addon_Fortuno_FREE(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 5;
	condition = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent = FALSE;
	description = "Musí existovat cesta jak ti vrátit vzpomínky.";
};


func int DIA_Addon_Fortuno_FREE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_00");	//Musí existovat cesta jak ti vrátit vzpomínky.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_01");	//Hmm... možná by to šlo.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_02");	//Guru znali všechno možné o manipulaci s myslí.

	if(hero.guild != GIL_GUR)
	{
		AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_03");	//A TY o tom něco víš?
		AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_04");	//Ne, bojím se, že tyto znalosti už jsou pryč...
	};

	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_05");	//Kruci. Jestli je tady cesta jak ti pomoci, najdu ji.
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	B_LogEntry(Topic_Addon_Fortuno,"Fortuno už je duševně v pořádku, ale stále si nic nepamatuje.");
};


instance DIA_Addon_Fortuno_Herb(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 99;
	condition = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent = FALSE;
	description = "Potřebuješ další stébla?";
};


func int DIA_Addon_Fortuno_Herb_Condition()
{
	if(Fortuno_Geheilt_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Herb_15_00");	//Potřebuješ další stébla?
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_01");	//No jooo. Vezmu si všechny, co máš.
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_02");	//Dokonce zaplatím více než Fisk.
};

func void B_Fortuno_InfoManager()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
	Info_AddChoice(DIA_Addon_Fortuno_Trade,Dialog_Back,DIA_Addon_Fortuno_Trade_BACK);
	if(Npc_HasItems(other,ItPl_SwampHerb) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Trade,"(dát všechny stébla)",DIA_Addon_Fortuno_Trade_all);
		if(Npc_HasItems(other,ItPl_SwampHerb) >= 10)
		{
			Info_AddChoice(DIA_Addon_Fortuno_Trade,"(dát deset stébel)",dia_addon_fortuno_trade_10);
		};
		Info_AddChoice(DIA_Addon_Fortuno_Trade,"(dát jedno stéblo)",DIA_Addon_Fortuno_Trade_1);
	};
};


instance DIA_Addon_Fortuno_Trade(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 100;
	condition = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent = TRUE;
	description = "Mám pro tebe nějaká stébla...";
};


func int DIA_Addon_Fortuno_Trade_Condition()
{
	if((Npc_HasItems(other,ItPl_SwampHerb) >= 1) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_Herb))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trade_15_00");	//Mám pro tebe nějaká stébla...
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
};

func void DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems(other,ItPl_SwampHerb);
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,amount))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,Npc_HasItems(self,ItPl_SwampHerb));
	};
	B_GiveInvItems(self,other,ItMi_Gold,amount * Value_SwampHerb);
	B_GivePlayerXP(amount * 10);
	B_Fortuno_InfoManager();
};

func void dia_addon_fortuno_trade_10()
{
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,10))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,Npc_HasItems(self,ItPl_SwampHerb));
	};
	B_GiveInvItems(self,other,ItMi_Gold,Value_SwampHerb * 10);
	B_GivePlayerXP(100);
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_1()
{
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,1))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,Npc_HasItems(self,ItPl_SwampHerb));
	};
	B_GiveInvItems(self,other,ItMi_Gold,Value_SwampHerb);
	B_GivePlayerXP(10);
	B_Fortuno_InfoManager();
};


instance DIA_Addon_Fortuno_Trank(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 3;
	condition = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent = FALSE;
	description = "Mám pro tebe lektvar, který ti pomůže vzpomenout si.";
};


func int DIA_Addon_Fortuno_Trank_Condition()
{
	if((Fortuno_Geheilt_01 == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE) && ((Npc_HasItems(other,ItPo_Addon_Geist_01) >= 1) || (Npc_HasItems(other,ItPo_Addon_Geist_02) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trank_15_00");	//Mám pro tebe lektvar, který ti pomůže vzpomenout si.
	AI_Output(self,other,"DIA_Addon_Fortuno_Trank_13_01");	//Věřím ti.
	if(Npc_HasItems(other,ItPo_Addon_Geist_02) >= 1)
	{
		if(B_GiveInvItems(other,self,ItPo_Addon_Geist_02,1))
		{
			AI_UseItem(self,ItPo_Addon_Geist_02);
		};
		B_GivePlayerXP(XP_Addon_Fortuno_02);
	}
	else if(B_GiveInvItems(other,self,ItPo_Addon_Geist_01,1))
	{
		Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_OBSOLETE);
		AI_StopProcessInfos(self);
		AI_UseItem(self,ItPo_Addon_Geist_01);
	};
};


instance DIA_Addon_Fortuno_more(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent = FALSE;
	description = "No...?";
};


func int DIA_Addon_Fortuno_more_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_more_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_00");	//No...?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_01");	//Aáá! Já... já si vzpomínám!... Adanos se mnou... co jsem to udělal?
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_02");	//Jo, co jsi udělal? A hlavně, co Raven udělal?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_03");	//Pomohl jsem mu... navázat kontakt. S NÍM. Chtěl hodně lektvarů... Vařil jsem mu je.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_04");	//Snažil se otevřít portál aby se dostal do chrámu.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_05");	//Proč? Co chtěl dělat v chrámu?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_06");	//Mocný artefakt... leží v chrámu společně s tím, kdo ho zakopal. Mocný válečník, který propadl JEHO moci...
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_07");	//A pak?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_08");	//Nemohli jsme otevřít portal...
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_09");	//Ale Raven si byl jistý, že se mu to povede, když se dostane do hrobky kněze.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_10");	//Proto sem přivedl otroky. Oběti, které přinutí kopat tam, kde prastará magie leží.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_11");	//Hrobka kněze?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_12");	//Místo odpočinku kněze Adana. To je v dole.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_13");	//Ještě si pamatuji kamenné tabulky. Věřil, že mu pomohou najít cestu.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_14");	//Jakmile je dokázal rozluštit, tak mě už nepotřeboval.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_15");	//Seslal na mě kouzlo zapomnění a... ty jsi mě osvobodil.
	SC_KnowsFortunoInfos = TRUE;
	B_LogEntry(TOPIC_Addon_RavenKDW,"Raven si přeje získat prastarý artefakt z Adanova chrámu.");
	Log_AddEntry(TOPIC_Addon_RavenKDW,"Přikázal otrokům, aby pro něj vykopali hrobku kněze prastaré víry hluboko ve zlatém dole.");
	Log_AddEntry(TOPIC_Addon_RavenKDW,"Věří, že mu v cestě pomohou kamenné tabulky.");
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Addon_Fortuno_03);
};


instance DIA_Addon_Fortuno_Attentat(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 9;
	condition = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fortuno_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fortuno_Attentat_13_00");	//Útok? Promiň byl jsem... mimo... na nějaký čas. Nic o tom nevím.
};


instance DIA_ADDON_FORTUNO_CANBACK(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 9;
	condition = dia_addon_fortuno_canback_condition;
	information = dia_addon_fortuno_canback_info;
	permanent = FALSE;
	description = "Můžeš se vrátit do Bratrstva.";
};


func int dia_addon_fortuno_canback_condition()
{
	if((SC_KnowsFortunoInfos == TRUE) && ((other.guild == GIL_GUR) || (other.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_canback_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_CanBack_01_00");	//Můžeš se vrátit do Bratrstva.
	AI_Output(self,other,"DIA_Addon_Fortuno_CanBack_01_01");	//(zmatený) Bratrstva? To je už dávno ztraceno.
	AI_Output(other,self,"DIA_Addon_Fortuno_CanBack_01_02");	//Ale ne. V Khorinisu, poblíž vstupu do Hornického údolí je nový tábor Bratrstva Spáče!
	AI_Output(other,self,"DIA_Addon_Fortuno_CanBack_01_03");	//Vede je Baal Orun. A je s ním spousta těch, co byli už v kolonii.
	AI_Output(self,other,"DIA_Addon_Fortuno_CanBack_01_04");	//Bratrstvo Spáče existuje?!... (překvapeně)
	AI_Output(other,self,"DIA_Addon_Fortuno_CanBack_01_05");	//Bratrstvo se již nemodlí ke Spáči. Ale jejich odhodlání je silné!
	AI_Output(self,other,"DIA_Addon_Fortuno_CanBack_01_07");	//Já nevím... Opravdu bych se tam rád vrátil, ale... (ztraceně) Jak se tam dostanu?
	AI_Output(other,self,"DIA_Addon_Fortuno_CanBack_01_13");	//Kousek odtud, v centru ostrova je portál, který tě vezme zpátky na Khorinis. Můžeš ho použít a vypadnout odtud!
	AI_Output(self,other,"DIA_Addon_Fortuno_CanBack_01_14");	//Pak... Tedy... Možná. Půjdu domů. (unaveně)
	AI_Output(self,other,"DIA_Addon_Fortuno_CanBack_01_16");	//Děkuji ti za všechno!
	FORTUNOBACK = TRUE;
	AI_StopProcessInfos(self);
};

