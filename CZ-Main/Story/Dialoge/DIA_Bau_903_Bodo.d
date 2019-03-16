
instance DIA_Bodo_EXIT(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 999;
	condition = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bodo_Hallo(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 1;
	condition = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//Jak se vede?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//Domobrana nás vydírala už dost dlouho. Teď, když jsou žoldáci na naší straně, se tu už raději ani neobjeví.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//Král si myslí, že si může jednoduše vzít cokoli, co si zamane. Ale my už mu nic nedáme.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//Fajn. Když uvidíš někoho z domobrany, nandej mu to i za mě, jo?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//Fajn. Innos s tebou.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//Královi vojáci nejsou na téhle farmě vítáni.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//Možná s tebou tady lidi budou mluvit, ale určitě si tu neuděláš přátele.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_07");	//Odkdy se lidi jako ty zajímají o problémy ostatních? Pořád jen myslíte akorát tak na trávu z bažin!
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_08");	//Vše dobré, Adanos s tebou!
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_09");	//(koktavě) Do... dobře. Všechno jde prostě skvěle! Já... já prostě půjdu, dobrá?
	};
};


instance DIA_Bodo_Bauernaufstand(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 2;
	condition = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent = FALSE;
	description = "Ve městě se mluví o rolnické vzpouře.";
};


func int DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//Ve městě se mluví o rolnické vzpouře.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//Nesmysl! Jen se snažíme bránit výsledky naší tvrdé dřiny.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//Válka vždycky nejvíc doléhá na bedra rolníků. A Onar už nehodlá dál jen tak stát a koukat, jak nás ty královské pijavice vysávají.
};


instance DIA_Bodo_Bett(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 3;
	condition = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent = FALSE;
	description = "Můžu si tady někde odpočinout?";
};


func int DIA_Bodo_Bett_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bett_Info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//Můžu si tady někde odpočinout?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//Jestli hledáš místo na spaní, zajdi si do stodoly. Ale ani omylem si nelehni na žoldáckou postel.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//Onar zajistil, aby nechali nás, rolníky, na pokoji. Ale s cizinci, co nepatří na farmu, si žoldáci mohou dělat, co se jim zlíbí.
};


instance DIA_Bodo_Cipher(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 4;
	condition = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent = FALSE;
	description = "Cipher říká, že mu někdo ukradl jeho balík trávy z bažin...";
};


func int DIA_Bodo_Cipher_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) || (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bodo_Cipher_Info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//Cipher říká, že mu někdo ukradl jeho balík trávy z bažin...
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//No a co?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//No a myslí si, žes to byl ty.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//Aha, tak proto na mě ten chlap vždycky tak přiblble zírá.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//Poslední dobou jsem na něj byl obzvlášť milý, protože vypadal, že slíznul pořádnou pecku.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//Ale s tím já nic neudělám. Můžu se k němu chovat přátelsky, jak chci, ale on se na mě stejně šklebí, jako by mě chtěl zabít.
};


instance DIA_Bodo_WeedOrElse(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 5;
	condition = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent = FALSE;
	description = "Dej mi radši tu trávu!";
};


func int DIA_Bodo_WeedOrElse_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) && Npc_KnowsInfo(other,DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedOrElse_Info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//Dej mi radši tu trávu!
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//Hele, všechno, co mám, je tenhle špek. Vem si ho a nech mě na pokoji.
	B_GiveInvItems(self,other,ItMi_Joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//Je ti jasný, že my, rolníci, jsme pod ochranou žoldáků, jo?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//Tak raději nedělej žádný hlouposti!
	};
};


instance DIA_Bodo_WeedPERM(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 6;
	condition = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent = TRUE;
	description = "Nevěřím ti ani slovo. Dej mi tu trávu!";
};


func int DIA_Bodo_WeedPERM_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) && Npc_KnowsInfo(other,DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedPERM_Info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//Nevěřím ti ani slovo. Dej mi tu trávu!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//Nemám ji. Namouduši.
};


instance DIA_Bodo_PICKPOCKET(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 900;
	condition = DIA_Bodo_PICKPOCKET_Condition;
	information = DIA_Bodo_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bodo_PICKPOCKET_Condition()
{
	return C_Beklauen(30,60);
};

func void DIA_Bodo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
	Info_AddChoice(DIA_Bodo_PICKPOCKET,Dialog_Back,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bodo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

