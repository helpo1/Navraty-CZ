/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

instance DIA_TALBIN_RECRUITDT - zamezení možnosti poslat Talbina do tábora (kvůli úpravám úkolů Noví lovci (TOPIC_NewHunters) a Lidé pro tábor (TOPIC_PPL_FOR_TOWER))

*/




instance DIA_Talbin_NW_EXIT(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 999;
	condition = DIA_Talbin_NW_EXIT_Condition;
	information = DIA_Talbin_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Talbin_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Talbin_NW(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_Condition;
	information = DIA_Talbin_NW_Info;
	description = "Průchod nebyl tak špatný, ne?";
};

func int DIA_Talbin_NW_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_Info()
{
	AI_Output(other,self,"DIA_Talbin_NW_15_00");	//Průchod nebyl tak špatný, ne?
	AI_Output(self,other,"DIA_Talbin_NW_07_01");	//Díky za záchranu.
	AI_Output(self,other,"DIA_Talbin_NW_07_02");	//Tady, tohle jsem našel v průsmyku - snad se ti to bude hodit.

	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_03");	//Je to asi runový kámen.
		CreateInvItems(self,ItMi_RuneBlank,1);
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_04");	//Je to kousek rudy.
		CreateInvItems(self,ItMi_Nugget,1);
		B_GiveInvItems(self,other,ItMi_Nugget,1);
	};

	AI_Output(self,other,"DIA_Talbin_NW_07_05");	//Innos tě ochraňuj.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Farm");
	TOPIC_END_Talbin_Runs = TRUE;
	B_GivePlayerXP(XP_SavedTalbin);
};

instance DIA_Talbin_NW_PERM(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_PERM_Condition;
	information = DIA_Talbin_NW_PERM_Info;
	permanent = TRUE;
	description = "Vše v pořádku?";
};

func int DIA_Talbin_NW_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_NW))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_PERM_Info()
{
	AI_Output(other,self,"DIA_Talbin_NW_PERM_15_00");	//Vše v pořádku?
	AI_Output(self,other,"DIA_Talbin_NW_PERM_07_01");	//Ano, díky. Můžeš jít, já budu v pořádku.
	AI_StopProcessInfos(self);
};

instance DIA_Talbin_NW_HuntCamp(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_HuntCamp_Condition;
	information = DIA_Talbin_NW_HuntCamp_Info;
	permanent = FALSE;
	description = "Ty jsi lovec?";
};

func int DIA_Talbin_NW_HuntCamp_Condition()
{
	if((MIS_NewHunters == LOG_Running) && (TALBINRECRUITEDDT == FALSE) && (Npc_KnowsInfo(other,DIA_Talbin_NW)))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_HuntCamp_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_00");	//Ty jsi lovec?
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_01");	//Býval jsem. Ale premýšlím, že s tím seknu.
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_02");	//Pročpak?
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_03");	//Prostě nemůžu zapomenout na Hornické údolí.
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_04");	//Myslím, že si potřebuješ jenom odpočinout. Dělat věci, které máš rád. To tě rozptýlí.
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_06");	//To bych rád... (povzdech) Ale pro lovení nemám výbavu!
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_07");	//A co potřebuješ?
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_08");	//Pro začátek potřebuji dobrou zbraň a zbroj, aby se ze mne nestalo žrádlo pro všechny ty bestie. Ale netuším, kde nějaké sehnat. 
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_10");	//Například v táboře lovců, který je poblíž Onarovy farmy.
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_11");	//V táboře lovců? (nadejně) O něm jsem už slyšel. Myslel jsem si, že je to jenom povídačka.
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_12");	//Ne, tábor existuje a právě teď shání zkušené lidi jako ty.
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_13");	//Nekecáš, kámo?
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_14");	//Kdepak! Vždyť se jdi přesvědčit sám.
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_15");	//Tak to nebudu marnit čas a půjdu se tam kouknout.
	B_LogEntry(TOPIC_NewHunters,"Talbin zněl docela nadšeně. Vypadá to, že jsem odvedl kus dobré práce.");
	TalbinBecameHunt = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoHuntCamp");
};


/* instance DIA_TALBIN_RECRUITDT(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = dia_talbin_recruitdt_condition;
	information = dia_talbin_recruitdt_info;
	permanent = FALSE;
	description = "Kde budeš žít teď?";
};

func int dia_talbin_recruitdt_condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_NW) && (TalbinBecameHunt == FALSE) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_talbin_recruitdt_info()
{
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_00");	//Kde budeš žít teď?
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_01");	//Zamířím na Akilovu farmu. Kdysi jsem tam žil dlouho.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_02");	//Jestli teda nebude moc dobré lovit v těhlech lesích, tam se mi lovilo dobře a tiše.
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_03");	//No ano. Alo co když narazíš na skřety.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_04");	//S-s-skřeti? Jací další skřeti?
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_05");	//Před nedávnem, v lese u farmáře Akila putovala četa skřetů.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_06");	//(zoufale) Nooo, už zase ti zatracení skřeti! Dostali se někteří z nich i do Khorinisu?
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_07");	//Obávám se že ano.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_08");	//Sakra! Kam mám jít teď lovit?
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_09");	//Jestli chceš můžeš se usadit se mnou ve věži nedaleko Onarovy farm. Okolo je spousta lesů.
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_10");	//Je tam spousta žoldáků, paladinů a pevnost. Skřeti si tam nedovolí.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_11");	//Jo? Rád přijmu tvůj návrh. děkuji! Jenom, co za to budeš chtít?
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_12");	//Potřebuji lovce, který opatří maso pro tábor.

	if(NICLASRECRUITEDDT == TRUE)
	{
		AI_Output(other,self,"Dia_Talbin_RecruitDT_15_13");	//Jednu osobu jsem našel, jeho jméno je Niclas. Ale on nechce...
		AI_Output(self,other,"Dia_Talbin_RecruitDT_07_14");	//Niclas? Dobrý lovec! Nebyl bych proti tomu s ním lovit zas.
	};

	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_15");	//Přijímám tvoje podmínky.
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_16");	//Super. Kolik chceš, abych ti za to platil?
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_17");	//(překvapeně) Peníze? Ale to vůbec ne. Mám tě rád - bezpečný dům, jak jsi říkal - maso. Kromě toho v současné době sbírám spousty loveckých trofejí na prodej.
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_18");	//Pak dohodnuto. A až budeš chtít jít do tábora, zvolej heslo 'dračí poklad'.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_19");	//Dobře. Říkáš věž nedaleko farmy? Nuže, uvidíme se tam. 
	B_GivePlayerXP(300);
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Lovec Talbin se připojil k táboru.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	TALBINRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(VLK_4132_Talbin_NW,"InCastle");
};

instance DIA_TALBIN_INTOWER(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 22;
	condition = dia_talbin_intower_condition;
	information = dia_talbin_intower_info;
	permanent = TRUE;
	description = "Jak jde lov?";
};

func int dia_talbin_intower_condition()
{
	if((TALBINRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 2000))
	{
		return TRUE;
	};
};

func void dia_talbin_intower_info()
{
	AI_Output(other,self,"DIA_Talbin_InTower_15_00");	//Jak jde lov?
	AI_Output(self,other,"DIA_Talbin_InTower_01_01");	//Dobře, díky. Skřeti nikde nejsou a to je hlavní.
};

instance DIA_TALBIN_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 22;
	condition = dia_talbin_intower_orckap_condition;
	information = dia_talbin_intower_orckap_info;
	permanent = TRUE;
	description = "Jsi v pořádku?";
};

func int dia_talbin_intower_orckap_condition()
{
	if((TALBINRECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE))
	{
		return TRUE;
	};
};

func void dia_talbin_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Talbin_InTower_OrcKap_15_00");	//Jsi v pořádku?
	AI_Output(self,other,"DIA_Talbin_InTower_OrcKap_01_01");	//Jedno slovo - skřeti. Tolik, tak moc. Hajzlové...
}; */
