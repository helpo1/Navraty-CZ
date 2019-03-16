
instance DIA_Kati_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_EXIT_Condition;
	information = DIA_Kati_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Kati_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_SLDNOCHDA(C_Info)
{
	npc = BAU_941_Kati;
	nr = 4;
	condition = DIA_Kati_SLDNOCHDA_Condition;
	information = DIA_Kati_SLDNOCHDA_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Kati_SLDNOCHDA_Condition()
{
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Kati_SLDNOCHDA_Info()
{
	var int Hilfe;
	if(Hilfe == FALSE)
	{
		AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_00");	//Ti hrdlořezové vyhrožují mému manželovi! Jsme jen obyčejní farmáři města věrní králi, a ti hrozní žoldáci nás chtějí oloupit o všechno!
		Hilfe = TRUE;
	};
	AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_01");	//Tak tady jen tak nestůj. Dělej něco! Pomoz nám!
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"Akilův statek ohrožují žoldáci.");
	AI_StopProcessInfos(self);
};


instance DIA_Kati_HALLO(C_Info)
{
	npc = BAU_941_Kati;
	nr = 5;
	condition = DIA_Kati_HALLO_Condition;
	information = DIA_Kati_HALLO_Info;
	permanent = FALSE;
	description = "Jsi v pořádku?";
};


func int DIA_Kati_HALLO_Condition()
{
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Kati_HALLO_Info()
{
	AI_Output(other,self,"DIA_Kati_HALLO_15_00");	//Jsi v pořádku?
	if(Npc_IsDead(Akil))
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_01");	//Můj muž je mrtvý! Ó, Innosi, za co mě trestáš?!
		Npc_ExchangeRoutine(self,"Start");
		B_StartOtherRoutine(Randolph,"Start");
		B_GivePlayerXP(XP_Akil_Tot);
	}
	else
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_02");	//Ano, jsem v pořádku.
	};
};


instance DIA_Kati_ESSEN(C_Info)
{
	npc = BAU_941_Kati;
	nr = 12;
	condition = DIA_Kati_ESSEN_Condition;
	information = DIA_Kati_ESSEN_Info;
	permanent = FALSE;
	description = "Akil mi řekl, že mi můžeš dát něco k jídlu.";
};


func int DIA_Kati_ESSEN_Condition()
{
	if((Kati_Mahlzeit == TRUE) && (Npc_IsDead(Akil) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kati_ESSEN_Info()
{
	AI_Output(other,self,"DIA_Kati_ESSEN_15_00");	//Akil mi řekl, že mi můžeš dát něco k jídlu.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_01");	//Od doby, kdy padla bariéra, přišly těžké časy. Není tu bezpečno.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_02");	//Vem si tenhe bochník, trochu masa a vodu na zahnání žízně. Víc ti dát nemohu.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItFo_Bread,1);
	CreateInvItems(other,ItFo_Water,1);
	CreateInvItems(other,ItFo_Milk,1);
};


instance DIA_Kati_Baltram(C_Info)
{
	npc = BAU_941_Kati;
	nr = 4;
	condition = DIA_Kati_Baltram_Condition;
	information = DIA_Kati_Baltram_Info;
	permanent = FALSE;
	description = "Posílá mě Baltram.";
};


func int DIA_Kati_Baltram_Condition()
{
	if(Npc_IsDead(Akil) && (MIS_Baltram_ScoutAkil == LOG_Running) && (Lieferung_Geholt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kati_Baltram_Info()
{
	AI_Output(other,self,"DIA_Kati_Baltram_15_00");	//Posílá mě Baltram. Mám pro něj vyzvednout zboží.
	AI_Output(self,other,"DIA_Kati_Baltram_16_01");	//Ach ano, tady to je.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
};


instance DIA_Kati_BAUERNAUFSTAND(C_Info)
{
	npc = BAU_941_Kati;
	nr = 6;
	condition = DIA_Kati_BAUERNAUFSTAND_Condition;
	information = DIA_Kati_BAUERNAUFSTAND_Info;
	permanent = FALSE;
	description = "Proč se sami nebráníte proti Onarově tyranii?";
};


func int DIA_Kati_BAUERNAUFSTAND_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Kati_BAUERNAUFSTAND_Info()
{
	AI_Output(other,self,"DIA_Kati_BAUERNAUFSTAND_15_00");	//Proč se sami nebráníte proti Onarově tyranii?
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_01");	//Pro nás, co máme farmy blízko města, má větší smysl zůstat na straně domobrany, než se spoléhat na Onarovy žoldáky.
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_02");	//Na druhou stranu, jsou tu i takoví jako Bengar a Sekob, co by se raději vzdali svých farem, než by pracovali pro krále.
};


instance DIA_Kati_ANDEREHOEFE(C_Info)
{
	npc = BAU_941_Kati;
	nr = 7;
	condition = DIA_Kati_ANDEREHOEFE_Condition;
	information = DIA_Kati_ANDEREHOEFE_Info;
	permanent = FALSE;
	description = "Kde najdu farmy Sekoba a Bengara?";
};


func int DIA_Kati_ANDEREHOEFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_ANDEREHOEFE_Info()
{
	AI_Output(other,self,"DIA_Kati_ANDEREHOEFE_15_00");	//Kde najdu farmy Sekoba a Bengara?
	AI_Output(self,other,"DIA_Kati_ANDEREHOEFE_16_01");	//Není to daleko od farmy, na které velkostatkář žije. Nalezneš je, když odsud půjdeš na východ.
};


instance DIA_Kati_HIERWEG(C_Info)
{
	npc = BAU_941_Kati;
	nr = 9;
	condition = DIA_Kati_HIERWEG_Condition;
	information = DIA_Kati_HIERWEG_Info;
	permanent = FALSE;
	description = "Pomýšleli jste někdy na to, že byste odsud odešli?";
};


func int DIA_Kati_HIERWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_HIERWEG_Info()
{
	AI_Output(other,self,"DIA_Kati_HIERWEG_15_00");	//Pomýšleli jste někdy na to, že byste odsud odešli?
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_01");	//Není zrovna snadné dostat se z tohodle kousku země. Celý kraj je obklopen vysokým a nepřekonatelným horským masivem.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_02");	//Jediné dvě cesty ven jsou průsmyk do Hornického údolí a přístav v Khorinisu.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_03");	//Protože si nemůžeme dovolit cestu lodí a z Hornického údolí není návratu, zůstáváme tady.
};


instance DIA_Kati_PASS(C_Info)
{
	npc = BAU_941_Kati;
	nr = 10;
	condition = DIA_Kati_PASS_Condition;
	information = DIA_Kati_PASS_Info;
	permanent = FALSE;
	description = "Co víš o tom průsmyku?";
};


func int DIA_Kati_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_HIERWEG))
	{
		return TRUE;
	};
};

func void DIA_Kati_PASS_Info()
{
	AI_Output(other,self,"DIA_Kati_PASS_15_00");	//Co víš o tom průsmyku?
	AI_Output(self,other,"DIA_Kati_PASS_16_01");	//Nikdy jsem tam osobně nebyla. Musí to být někde poblíž Bengarovy farmy na náhorních pastvinách.
};


instance DIA_Kati_PERMKAP1(C_Info)
{
	npc = BAU_941_Kati;
	nr = 11;
	condition = DIA_Kati_PERMKAP1_Condition;
	information = DIA_Kati_PERMKAP1_Info;
	permanent = TRUE;
	description = "Dávej pozor na svého manžela.";
};


func int DIA_Kati_PERMKAP1_Condition()
{
	if(!C_NpcIsDown(Akil) && Npc_KnowsInfo(other,DIA_Kati_HALLO) && Npc_KnowsInfo(other,DIA_Kati_BAUERNAUFSTAND) && Npc_KnowsInfo(other,DIA_Kati_ANDEREHOEFE) && Npc_KnowsInfo(other,DIA_Kati_HIERWEG) && Npc_KnowsInfo(other,DIA_Kati_PASS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Kati_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Kati_PERMKAP1_15_00");	//Dávej pozor na svého manžela.
	AI_Output(self,other,"DIA_Kati_PERMKAP1_16_01");	//Pokusím se.
	AI_StopProcessInfos(self);
};


instance DIA_Kati_KAP3_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP3_EXIT_Condition;
	information = DIA_Kati_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_PERM(C_Info)
{
	npc = BAU_941_Kati;
	nr = 3;
	condition = DIA_Kati_PERM_Condition;
	information = DIA_Kati_PERM_Info;
	permanent = TRUE;
	description = "Vše v pořádku?";
};


func int DIA_Kati_PERM_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Kati_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Kati_PERM_Info()
{
	AI_Output(other,self,"DIA_Kati_PERM_15_00");	//Vše v pořádku?
	AI_Output(self,other,"DIA_Kati_PERM_16_01");	//Ano. Jen jsem zvědavá jak dlouho budeme muset snášet ty v těch černých kápích.
	AI_Output(self,other,"DIA_Kati_PERM_16_02");	//Nemůžu je vystát. Chodí stále kolem domu a do všeho strkají svůj nos.
};


instance DIA_Kati_KAP4_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP4_EXIT_Condition;
	information = DIA_Kati_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_KAP5_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP5_EXIT_Condition;
	information = DIA_Kati_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_KAP6_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP6_EXIT_Condition;
	information = DIA_Kati_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_PICKPOCKET(C_Info)
{
	npc = BAU_941_Kati;
	nr = 900;
	condition = DIA_Kati_PICKPOCKET_Condition;
	information = DIA_Kati_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Kati_PICKPOCKET_Condition()
{
	return C_Beklauen(13,15);
};

func void DIA_Kati_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
	Info_AddChoice(DIA_Kati_PICKPOCKET,Dialog_Back,DIA_Kati_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kati_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kati_PICKPOCKET_DoIt);
};

func void DIA_Kati_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
};

func void DIA_Kati_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
};

