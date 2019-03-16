
instance DIA_SHRAT_EXIT(C_Info)
{
	npc = sek_8047_shrat;
	nr = 999;
	condition = dia_shrat_exit_condition;
	information = dia_shrat_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_shrat_exit_condition()
{
	return TRUE;
};

func void dia_shrat_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SHRAT_NOFOREVER(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_noforever_condition;
	information = dia_shrat_noforever_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};

func int dia_shrat_noforever_condition()
{
	return TRUE;
};

func void dia_shrat_noforever_info()
{
	AI_Output(other,self,"DIA_Shrat_NoForever_01_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Shrat_NoForever_01_01");	//Jako kdyby to nebylo zřejmé. My sbíráme drogu a naši bratři v táboře ji kouří.
	AI_Output(self,other,"DIA_Shrat_NoForever_01_02");	//Víš jak moc se v Bratrstvu kouří?! (smích)... MOC!

	MeetLobartPsiCamp = TRUE;

	if(MIS_Lobart_Psicamp == LOG_Running)
	{
		B_GivePlayerXP(50);
		B_LogEntry(TOPIC_Lobart_Psicamp,"Zdá se že lidé, na které se ptá Lobart, jsou jen obyčejní výhulenci.");
	};
};


instance DIA_SHRAT_PSIINFO(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_psiinfo_condition;
	information = dia_shrat_psiinfo_info;
	permanent = FALSE;
	description = "V Bratrstvu? V jakém Bratrstvu?";
};


func int dia_shrat_psiinfo_condition()
{
	if(!Npc_KnowsInfo(hero,dia_tpl_8014_templer_first) && !Npc_KnowsInfo(hero,dia_hanis_psiinfo) && !Npc_KnowsInfo(hero,dia_balam_psiinfo) && Npc_KnowsInfo(hero,dia_shrat_noforever))
	{
		return TRUE;
	};
};

func void dia_shrat_psiinfo_info()
{
	AI_Output(other,self,"DIA_Shrat_PsiInfo_01_00");	//V Bratrstvu? V jakém Bratrstvu?
	AI_Output(self,other,"DIA_Shrat_PsiInfo_01_01");	//V Bratrstvu Spáče, samozřejmě! I když teď ho stačí nazývat jen Bratrstvem.
	AI_Output(other,self,"DIA_Shrat_PsiInfo_01_02");	//Ale já si myslel, že po pádu bariéry Bratrstvo Spáče přestalo existovat?!
	AI_Output(self,other,"DIA_Shrat_PsiInfo_01_03");	//Tak to není! Většina z našich bratrů zemřela, nebo byli posednuti démony...
	AI_Output(self,other,"DIA_Shrat_PsiInfo_01_04");	//Ale někteří z nás přežili. Tak jsme založili nový tábor.
	AI_Output(other,self,"DIA_Shrat_PsiInfo_01_05");	//A kde je váš tábor?
	AI_Output(self,other,"DIA_Shrat_PsiInfo_01_06");	//Jdi po cestě k Hornickému údolí. Poblíž vstupu najdeš malé jezero. Jdi po jeho břehu...
	AI_Output(self,other,"DIA_Shrat_PsiInfo_01_07");	//Poblíž najdeš tábor Bratrstva.
};


instance DIA_SHRAT_HELLO(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_hello_condition;
	information = dia_shrat_hello_info;
	permanent = FALSE;
	description = "Počkej, já tě znám!";
};


func int dia_shrat_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_shrat_noforever))
	{
		return TRUE;
	};
};

func void dia_shrat_hello_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Shrat_Hello_01_00");	//Počkej, já tě znám!
	AI_Output(other,self,"DIA_Shrat_Hello_01_01");	//Ty jsi ten chlápek, který byl schovaný v chatrči hluboko v bažině.
	AI_Output(self,other,"DIA_Shrat_Hello_01_02");	//Hmmm... Správně! Už jsme se potkali?!
	AI_Output(self,other,"DIA_Shrat_Hello_01_03");	//Ale, počkej!... Možná? (podrobně si tě prohlíží)...
	AI_Output(self,other,"DIA_Shrat_Hello_01_04");	//Ach, ano! Teď už si vzpomínám. Ty jsi ten chlap, co nám donesl vejce královny důlních červů!
	AI_Output(other,self,"DIA_Shrat_Hello_01_05");	//Ano, teď už si na vše vzpomínám!
	AI_Output(self,other,"DIA_Shrat_Hello_01_06");	//Neber si to osobně, v poslední době se stalo tolik věcí a já si to prostě všechno nemůžu pamatovat.
	AI_Output(self,other,"DIA_Shrat_Hello_01_07");	//Jsem rád, že tě vidím živého a zdravého!
};


instance DIA_SHRAT_HELLOTWO(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_hellotwo_condition;
	information = dia_shrat_hellotwo_info;
	permanent = TRUE;
	description = "Jak pokračuje sběr drogy?";
};


func int dia_shrat_hellotwo_condition()
{
	if(Npc_KnowsInfo(hero,dia_shrat_noforever))
	{
		return TRUE;
	};
};

func void dia_shrat_hellotwo_info()
{
	AI_Output(other,self,"DIA_Shrat_HelloTwo_01_00");	//Jak pokračuje sběr drogy?
	AI_Output(self,other,"DIA_Shrat_HelloTwo_01_01");	//Pokud nebudeš obtěžovat naše sběrače, půjde mnohem rychleji!
};

instance dia_shrat_PrioratStart(C_Info)
{
	npc = sek_8047_shrat;
	nr = 1;
	condition = dia_shrat_PrioratStart_condition;
	information = dia_shrat_PrioratStart_info;
	permanent = FALSE;
	description = "Poslal mě Baal Namib.";
};

func int dia_shrat_PrioratStart_condition()
{
	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_shrat_PrioratStart_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"dia_shrat_PrioratStart_01_00");	//Poslal mě Baal Namib.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_01");	//Jsem jedno ucho. Co ode mě Guru chce?
	AI_Output(other,self,"dia_shrat_PrioratStart_01_02");	//Chce vědět, jaká je situace ve tvém táboře.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_03");	//Můžeš mu říct, že je vše v pořádku.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_04");	//Sběr drogy probíhá standartním tempem a novou zásliku doručíme včas.
	AI_Output(other,self,"dia_shrat_PrioratStart_01_05");	//Dobře, vzkážu. Ještě ale jedna otázka.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_06");	//Ptej se.
	AI_Output(other,self,"dia_shrat_PrioratStart_01_07");	//Slyšel jsi něco o zmizelých novicích?
	AI_Output(self,other,"dia_shrat_PrioratStart_01_08");	//Cože? (zděšeně) Kolk našich noviců zmizelo?
	AI_Output(other,self,"dia_shrat_PrioratStart_01_09");	//Ale to není nic vážného.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_10");	//... no jestli je to tak...(zmateně) Myslel jsem, že se stalo něco špatného.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_11");	//Nic o tom nevím.
	PsiCamp_02_Ok = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"V táboře u města se nic neděje. O zmizelých novicích nikdo nic neví.");
};

instance DIA_SHRAT_GIVEPLANT(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_giveplant_condition;
	information = dia_shrat_giveplant_info;
	permanent = TRUE;
	description = "Přicházím od Baal Cadara.";
};


func int dia_shrat_giveplant_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_Running) && (THIRDGROUPSEK == FALSE) && (other.guild == GIL_SEK) && Npc_KnowsInfo(hero,dia_shrat_noforever))
	{
		return TRUE;
	};
};

func void dia_shrat_giveplant_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Shrat_GivePlant_01_00");	//Přicházím od Baal Cadara.
	AI_Output(self,other,"DIA_Shrat_GivePlant_01_01");	//Baal Cadar tě posílá? Ale proč?
	AI_Output(other,self,"DIA_Shrat_GivePlant_01_02");	//Mám vyzvednout drogu, kterou jste zatím nasbírali.
	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE) || (Hlp_IsItem(itm,itar_slp_ul) == TRUE) || (Hlp_IsItem(itm,itar_slp_l) == TRUE))
	{
		AI_Output(self,other,"DIA_Shrat_GivePlant_01_03");	//Konečně! A já si už myslel, že na nás úplně zapomněli.
		B_GiveInvItems(self,other,ItPl_SwampHerb,50);
		AI_Output(self,other,"DIA_Shrat_GivePlant_01_04");	//Tady, vem si to všechno. A neztrať to.
		THIRDGROUPSEK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Shrat_GivePlant_01_05");	//Baal Cadar by nikdy neposlal nějakého cizince!
		AI_Output(self,other,"DIA_Shrat_GivePlant_01_06");	//To byl špatný vtip, kamaráde.
	};
};

