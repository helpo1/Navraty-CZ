/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

DIA_Orc_8524_Bumshak_Hello_2_Info_18_04A - 04A (cyrilice -> latinka)

*/




instance DIA_ORC_8524_BUMSHAK_EXIT(C_Info)
{
	npc = orc_8524_bumshak;
	condition = dia_orc_8524_bumshak_exit_condition;
	information = dia_orc_8524_bumshak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8524_bumshak_exit_condition()
{
	return TRUE;
};

func void dia_orc_8524_bumshak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8524_BUMSHAK_HELLO(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_hello_condition;
	information = dia_orc_8524_bumshak_hello_info;
	important = FALSE;
	permanent = TRUE;
	description = "Kdo jsi?";
};


func int dia_orc_8524_bumshak_hello_condition()
{
	if(FIRSTTARROK == FALSE)
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_hello_info()
{
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_Info_18_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_Info_18_03");	//Pomoc, pomoc!
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_Info_18_04");	//Co se stalo?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_Info_18_05");	//Tarrok potřebovat pomoc! Tarrok být raněn.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_Info_18_07");	//Tarrok potřebovat silný lék. Tarrok jinak brzy zemřít!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_Info_18_08");	//Tarrok mít lék, ale Tarrok ztratit. Tarrok ho nenajít!
	FIRSTTARROK = TRUE;
	self.flags = 0;
};


instance DIA_ORC_8524_BUMSHAK_HELLO_2(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_hello_2_condition;
	information = dia_orc_8524_bumshak_hello_2_info;
	important = FALSE;
	permanent = TRUE;
	description = "Jsi přítel šamana Ur-Shaka?";
};


func int dia_orc_8524_bumshak_hello_2_condition()
{
	if((FIRSTTARROK == TRUE) && (MEETTARROK == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_hello_2_info()
{
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_01");	//Jsi přítel šamana Ur-Shaka?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_02");	//Tarrok ano. Tarrok zná Ur-Shak, to někdy velký šaman... Tarrok respektuje Ur-Shak!
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_03");	//Tvůj přítel mi řekl, že pro mne můžeš udělat Ulu-Mulu...
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_04");	//Cizinec pomoct Tarrok, Tarrok pomoct cizinec.
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_04A");	//Jak ti mohu pomoci?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_05");	//Tarrok být velmi slabý. Když nebýt lék, Tarrok zemřít.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_06");	//Cizinec přinést lék, pak Tarrok pomoct!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_07");	//Tarrok udělat Ulu-Mulu.
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_08");	//Najdu tvůj lék!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_09");	//Tarrok slabý velmi. Cizinec rychlý, Tarrok jinak zemřít.
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	Log_CreateTopic(TOPIC_TARROKWOUND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TARROKWOUND,LOG_Running);
	MEETTARROK = TRUE;
	TARROKHEALTHY = FALSE;
	if(URSHAK_SUCKED == FALSE)
	{
		B_LogEntry(TOPIC_TARROKWOUND,"Pomohl jsem skřetovi, kterého napadli kostlivci. Když jsem s ním promluvil, zjistil jsem, že je to Ur-Shakův přítel. Musím mu najít jeho lék - je těžce raněn a umírá. Výměnou mi slíbil Ulu-Mulu. Jediná otázka je kde hledat ten lektvar. Snad bude něco vědět Ur-Shak.");
	}
	else
	{
		B_LogEntry(TOPIC_TARROKWOUND,"Pomohl jsem skřetovi, kterého napadli kostlivci. Když jsem s ním promluvil, zjistil jsem, že je to Ur-Shakův přítel. Musím mu najít jeho lék - je těžce raněn a umírá. Výměnou mi slíbil Ulu-Mulu. Jediná otázka je kde hledat ten lektvar. Snad bude něco vědět Ur-Shak.");
	};
};


instance DIA_ORC_8524_BUMSHAK_POTION(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_potion_condition;
	information = dia_orc_8524_bumshak_potion_info;
	important = FALSE;
	permanent = TRUE;
	description = "Tady, našel jsem tvůj lék.";
};


func int dia_orc_8524_bumshak_potion_condition()
{
	if((Npc_HasItems(other,itpo_xorcpotion) >= 1) && (TARROKHEALTHY == FALSE) && (MEETTARROK == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_potion_info()
{
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Potion_Info_18_01");	//Tady, našel jsem tvůj lék.
	B_GiveInvItems(other,self,itpo_xorcpotion,1);
	Npc_RemoveInvItems(self,itpo_xorcpotion,1);
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Potion_Info_18_02");	//Cizinec nebýt špatný jako vojáci! Cizinec být dobrý!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Potion_Info_18_03");	//Tarrok dlužit díky!
	TARROKHEALTHY = TRUE;
	SEARCHULUMULU = FALSE;
	B_GivePlayerXP(200);
	Log_SetTopicStatus(TOPIC_TARROKWOUND,LOG_SUCCESS);
	B_LogEntry(TOPIC_TARROKWOUND,"Přinesl jsem Tarrokovi lektvar. Teď se uzdraví.");
};


instance DIA_ORC_8524_BUMSHAK_ULUMULU(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_ulumulu_condition;
	information = dia_orc_8524_bumshak_ulumulu_info;
	important = FALSE;
	permanent = TRUE;
	description = "Můžeš mi teď dát to Ulu-Mulu?";
};


func int dia_orc_8524_bumshak_ulumulu_condition()
{
	if((TARROKHEALTHY == TRUE) && (SEARCHULUMULU == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_ulumulu_info()
{
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_04");	//Můžeš mi teď dát to Ulu-Mulu?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_05");	//Cizinec pomoct Tarrok, Tarrok pomoct cizinec také.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_06");	//Cizinec potřebovat KROTAHK, KHAZ-TAK, DWACHKARR a ORTH-ANTAK.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_07");	//Cizinec to přinést, Tarrok pak udělat Ulu-Mulu!
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_08");	//Co je to KROTAHK?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_09");	//Být ohnivý jazyk. Být jazyk ohnivého ještěra!
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_10");	//Co znamená KHAZ-TAK?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_11");	//Být roh stínové obludy. Roh ostrý jako nůž a tvrdý jako kámen.
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_12");	//DWACHKARR? Co to je?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_13");	//Být zub močálového žraloka. Když zub zakousnout, oběť už nikdy ne utéct.
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_14");	//A co je ORTH-ANTAK?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_15");	//Být zub velkého trola! Udělat velká díra do kořist!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_16");	//Cizinec najít vše. Tarrok čekat.
	SEARCHULUMULU = TRUE;
	FINDULUMULU = FALSE;
	Log_CreateTopic(TOPIC_ULUMULUFIND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ULUMULUFIND,LOG_Running);
	B_LogEntry(TOPIC_ULUMULUFIND,"Tarrok udělá Ulu-Mulu, když přinesu KROTAHK, KHAZ-TAK, DWACHKARR a ORTH-ANTAK.");
	B_LogEntry_Quiet(TOPIC_ULUMULUFIND,"Potřebuji tedy jazyk ohnivého ještěra, roh stínové šelmy, zub močálového žraloka a trolí tesák.");
	B_LogEntry_Quiet(TOPIC_ULUMULUFIND,"Až to sesbírám, musím to donést Tarrokovi.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};


instance DIA_ORC_8524_BUMSHAK_FINDULUMULU(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_findulumulu_condition;
	information = dia_orc_8524_bumshak_findulumulu_info;
	important = FALSE;
	permanent = TRUE;
	description = "Mám vše, co potřebujeme na Ulu-Mulu.";
};


func int dia_orc_8524_bumshak_findulumulu_condition()
{
	if((Npc_HasItems(other,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(other,ItAt_ShadowHorn) >= 1) && (Npc_HasItems(other,ItAt_SharkTeeth) >= 1) && (Npc_HasItems(other,ItAt_TrollTooth) >= 1) && (FINDULUMULU == FALSE) && (SEARCHULUMULU == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_findulumulu_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_01");	//Mám vše, co potřebujeme na Ulu-Mulu.
	b_giveinvitemsmanythings(other,self);
	Npc_RemoveInvItems(other,ItAt_WaranFiretongue,1);
	Npc_RemoveInvItems(other,ItAt_ShadowHorn,1);
	Npc_RemoveInvItems(other,ItAt_SharkTeeth,1);
	Npc_RemoveInvItems(other,ItAt_TrollTooth,1);
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_02");	//Cizinec být silný válečník! Dát ty věci, Tarrok udělat Ulu-Mulu.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_03");	//Tady! Cizinec nosit Ulu-Mulu hrdě! Tarrok teď spát!
	B_GiveInvItems(self,other,itmw_2h_orcprestige,1);
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_04");	//Díky, už tě nebudu rušit.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_05");	//Tarrok přát štěstí, cizinec.
	FINDULUMULU = TRUE;
	URSHAKKNOWULUMULU = FALSE;
	Log_SetTopicStatus(TOPIC_ULUMULUFIND,LOG_SUCCESS);
	B_LogEntry(TOPIC_ULUMULUFIND,"Mám Ulu-Mulu. Nyní můžu do města skřetů a zjistit jak do Spáčova chrámu.");
};


instance DIA_ORC_8524_BUMSHAK_AFTER(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_after_condition;
	information = dia_orc_8524_bumshak_after_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_orc_8524_bumshak_after_condition()
{
	if((FINDULUMULU == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_after_info()
{
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_After_Info_18_00");	//Cizinec teď jít dál.
	AI_StopProcessInfos(self);
	FINDULUMULU = TRUE;
};

