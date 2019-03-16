
const string PAL_199_CHECKPOINT = "NW_FORESTFORT_01";

instance DIA_PAL_199_RITTER_EXIT(C_Info)
{
	npc = pal_199_ritter;
	nr = 999;
	condition = dia_pal_199_ritter_exit_condition;
	information = dia_pal_199_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_199_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_199_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_FIRSTWARN(C_Info)
{
	npc = pal_199_ritter;
	nr = 1;
	condition = dia_pal_199_ritter_firstwarn_condition;
	information = dia_pal_199_ritter_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_firstwarn_condition()
{
	if(GRANTTOFORT == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (PYROKARSENTTOHAGEN == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(self,"NW_FORESTFORT_01") < 500) && (GRANTTOFORT == FALSE) && (Npc_HasItems(hero,itwr_hagenorderfort) < 1) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_firstwarn_info()
{
	AI_Output(self,other,"DIA_PAL_199_Ritter_FirstWarn_01_00");	//STÁT! Kam si myslíš, že jdeš, chlape?
	AI_Output(other,self,"DIA_PAL_199_Ritter_FirstWarn_01_01");	//Ehm... Támhle! Proč?
	AI_Output(self,other,"DIA_PAL_199_Ritter_FirstWarn_01_02");	//Tudy smí projít pouze lidi ve službách krále. A jen na osobní rozkaz lorda Hagena!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_199_CHECKPOINT);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_PAL_199_RITTER_ATTACK(C_Info)
{
	npc = pal_199_ritter;
	nr = 3;
	condition = dia_pal_199_ritter_attack_condition;
	information = dia_pal_199_ritter_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_attack_condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (PYROKARSENTTOHAGEN == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (GRANTTOFORT == FALSE) && (Npc_HasItems(hero,itwr_hagenorderfort) < 1) && (Kapitel < 6) && (Npc_GetDistToWP(other,PAL_199_CHECKPOINT) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_attack_info()
{
	AI_Output(self,other,"DIA_PAL_199_Ritter_Attack_01_00");	//Myslím, že jsem tě varoval!
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_199_RITTER_HAGEN(C_Info)
{
	npc = pal_199_ritter;
	nr = 2;
	condition = dia_pal_199_ritter_hagen_condition;
	information = dia_pal_199_ritter_hagen_info;
	permanent = FALSE;
	description = "Co je tohle za místo?";
};


func int dia_pal_199_ritter_hagen_condition()
{
	if((GRANTTOFORT == FALSE) && !Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_hagen_info()
{
	AI_Output(other,self,"DIA_PAL_199_Ritter_Hagen_01_00");	//Co je tohle za místo?
	AI_Output(self,other,"DIA_PAL_199_Ritter_Hagen_01_01");	//Jsi snad slepý? Strážnice!
	AI_Output(other,self,"DIA_PAL_199_Ritter_Hagen_01_02");	//A co tu střežíte?
	AI_Output(self,other,"DIA_PAL_199_Ritter_Hagen_01_03");	//Průchod na jižní část Khorinisu. Nachází se tam královská vojenská pevnost Azgan.
	AI_Output(other,self,"DIA_PAL_199_Ritter_Hagen_01_04");	//Myslel jsem, že všichni paladinové jsou ve městě.
	AI_Output(self,other,"DIA_PAL_199_Ritter_Hagen_01_05");	//Malá skupina s lordem Hagenem ano. Zbytek však prošel průchodem do pevnosti.
	AI_Output(other,self,"DIA_PAL_199_Ritter_Hagen_01_06");	//Jak se můžu do té pevnosti dostat?
	AI_Output(self,other,"DIA_PAL_199_Ritter_Hagen_01_07");	//Pouze na osobní rozkaz lorda Hagena. Bez něj jen plýtváš svým i mým časem.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_MAGE(C_Info)
{
	npc = pal_199_ritter;
	nr = 2;
	condition = dia_pal_199_ritter_mage_condition;
	information = dia_pal_199_ritter_mage_info;
	permanent = FALSE;
	description = "Jsem mág Ohně!";
};


func int dia_pal_199_ritter_mage_condition()
{
	if((GRANTTOFORT == FALSE) && (other.guild == GIL_KDF) && !Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_mage_info()
{
	AI_Output(other,self,"DIA_PAL_199_Ritter_Mage_01_00");	//Jsem mág Ohně!
	AI_Output(self,other,"DIA_PAL_199_Ritter_Mage_01_03");	//No a co? Bez povolení od lorda Hagena se do pevnosti stejně nedostaneš!
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_PALADIN(C_Info)
{
	npc = pal_199_ritter;
	nr = 2;
	condition = dia_pal_199_ritter_paladin_condition;
	information = dia_pal_199_ritter_paladin_info;
	permanent = FALSE;
	description = "Jsem paladin jako ty!";
};


func int dia_pal_199_ritter_paladin_condition()
{
	if((GRANTTOFORT == FALSE) && (other.guild == GIL_PAL) && !Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_paladin_info()
{
	AI_Output(other,self,"DIA_PAL_199_Ritter_Paladin_01_00");	//Jsem paladin jako ty!
	AI_Output(self,other,"DIA_PAL_199_Ritter_Paladin_01_03");	//No a co? Bez povolení od lorda Hagena se do pevnosti stejně nedostaneš!
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_PASSASMIL(C_Info)
{
	npc = pal_199_ritter;
	nr = 3;
	condition = dia_pal_199_ritter_passasmil_condition;
	information = dia_pal_199_ritter_passasmil_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_passasmil_condition()
{
	if((GRANTTOFORT == FALSE) && (Npc_HasItems(other,itwr_hagenorderfort) >= 1) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_passasmil_info()
{
	var C_Npc gatekeeper;
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_00");	//STÁT!
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_01");	//Tudy smí projít pouze lidi ve službách krále. A jen na osobní rozkaz lorda Hagena!
	AI_Output(other,self,"DIA_PAL_199_Ritter_PassAsMil_01_03");	//Mám povolení od lorda Hagena.
	AI_Output(other,self,"DIA_PAL_199_Ritter_PassAsMil_01_05");	//Tady máš.

	if(B_GiveInvItems(other,self,itwr_hagenorderfort,1))
	{
		Npc_RemoveInvItems(self,itwr_hagenorderfort,1);
	};

	B_UseFakeScroll();
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_06");	//Ano, opravdu. (překvapeně) Dobrá, můžeš vstoupit!
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_08");	//Tady máš klíč od navijáku - otevírá průchod do pevnosti.
	self.aivar[AIV_PASSGATE] = TRUE;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	GRANTTOFORT = TRUE;
	gatekeeper = Hlp_GetNpc(pal_193_ritter);
	AI_TurnToNPC(self,gatekeeper);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_09");	//(křičí) Hej, tam nahoře. Otevřít bránu!
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_10");	//Vstup.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_PASSEVER(C_Info)
{
	npc = pal_199_ritter;
	nr = 1;
	condition = dia_pal_199_ritter_passever_condition;
	information = dia_pal_199_ritter_passever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_passever_condition()
{
	if((GRANTTOFORT == FALSE) && (Kapitel >= 6) && (Npc_HasItems(other,itwr_pyrorderfort) >= 1) && (PYROKARSENTTOHAGEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_passever_info()
{
	var C_Npc gatekeeper;
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_00");		//STÁT! Co tu chceš?
	AI_Output(other,self,"DIA_PAL_199_Ritter_PassEver_01_01");		//Potřebuji se dostat do pevnosti! Mám urgentní zprávu pro paladiny!
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_02");		//Urgentní zpráva? Od koho?
	AI_Output(other,self,"DIA_PAL_199_Ritter_PassEver_01_03");		//Od Pyrokara, vůdce mágů Ohně! Nebo ti to snad nestačí?
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_04");		//Zpráva od mágů Ohně?
	AI_Output(other,self,"DIA_PAL_199_Ritter_PassAsMil_01_05");	//Tady máš.

	if(B_GiveInvItems(other,self,itwr_pyrorderfort,1))
	{
		Npc_RemoveInvItems(self,itwr_pyrorderfort,1);
	};

	B_UseFakeScroll();
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_06");	//(zamyšleně) No dobrá. Tady máš klíč od navijáku - otevírá průchod do pevnosti.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_07");		//(mrzutě) Jen nedělej problémy, rozumíš?
	self.aivar[AIV_PASSGATE] = TRUE;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	GRANTTOFORT = TRUE;
	gatekeeper = Hlp_GetNpc(pal_193_ritter);
	AI_TurnToNPC(self,gatekeeper);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_08");	//(křičí) Hej, tam nahoře. Otevřít bránu!
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_09");	//Vstup.
	AI_StopProcessInfos(self);
};