instance DIA_Ass_183_Adept_EXIT(C_Info)
{
	npc = Ass_183_Adept;
	nr = 999;
	condition = DIA_Ass_183_Adept_exit_condition;
	information = DIA_Ass_183_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_183_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_183_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_183_Adept_Hello(C_Info)
{
	npc = Ass_183_Adept;
	nr = 1;
	condition = DIA_Ass_183_Adept_hello_condition;
	information = DIA_Ass_183_Adept_hello_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};
	
func int DIA_Ass_183_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_183_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_183_Adept_hello_01_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Ass_183_Adept_hello_01_02");	//Jmenuji se Kadú ibn Akbar ibn Imám ibn Hasím ibn Salím ibn Amán ibn Džadír ibn Omar Chalíd ben Hádží al-Mudárí.
	AI_Output(other,self,"DIA_Ass_183_Adept_hello_01_03");	//Ty jo! A krátce by to nešlo?
	AI_Output(self,other,"DIA_Ass_183_Adept_hello_01_04");	//Ale ano. Bratři mi říkají jen Kaduin.
	AI_Output(other,self,"DIA_Ass_183_Adept_hello_01_05");	//To je o dost lepší.
};	

instance DIA_Ass_183_Adept_WhatDo(C_Info)
{
	npc = Ass_183_Adept;
	nr = 1;
	condition = DIA_Ass_183_Adept_WhatDo_condition;
	information = DIA_Ass_183_Adept_WhatDo_info;
	permanent = FALSE;
	description = "Co tu vůbec děláš?";
};
	
func int DIA_Ass_183_Adept_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_183_Adept_Hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_183_Adept_WhatDo_info()
{
	AI_Output(other,self,"DIA_Ass_183_Adept_WhatDo_01_01");	//Co tu vůbec děláš?
	AI_Output(self,other,"DIA_Ass_183_Adept_WhatDo_01_02");	//Většinou něco zařizuji pro mistra Nrozase.
	AI_Output(self,other,"DIA_Ass_183_Adept_WhatDo_01_03");	//Získávám pro něj různé ingredience, které většinou využije na své experimenty s jedem.
	AI_Output(self,other,"DIA_Ass_183_Adept_WhatDo_01_04");	//Ale tebe to nejspíš tolik zajímat nebude. 
};
	
instance DIA_Ass_183_Adept_TalkAboutJoin(C_Info)
{
	npc = Ass_183_Adept;
	nr = 1;
	condition = DIA_Ass_183_Adept_TalkAboutJoin_condition;
	information = DIA_Ass_183_Adept_TalkAboutJoin_info;
	permanent = FALSE;
	description = "Vypadáš docela rozrušeně.";
};
	
func int DIA_Ass_183_Adept_TalkAboutJoin_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_183_Adept_Hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_183_Adept_TalkAboutJoin_info()
{
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_00");	//Vypadáš docela rozrušeně.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_01");	//(sklíčeně) To je to na mně tak znát? Asi máš pravdu. Opravdu mám nemalý problém.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_02");	//Co se děje?
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_03");	//Problém je v tom, že mistr Nrozas mě poslal získat vzácný jedovatý extrakt - tesák Muritana.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_04");	//Vůbec nemám tucha, kde bych ho měl hledat.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_05");	//Slyšel jsem, že ta nestvůra je velmi nebezpečná a jestli se s ní setkám, může mě to stát život.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_06");	//O tom není pochyb.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_07");	//Když se k mistru Nrozasovi vrátím s prázdnou, strhne ze mě kůži zaživa.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_08");	//Určitě chápeš, že nechci, aby se to stalo. Vůbec nemá rád, když mu někdo něco odmítne.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_09");	//Možná ti můžu s tvým úkolem nějak pomoct?
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_10");	//Slyšel jsem, že mistr Tiamant jeden takový tesák Muritana má.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_11");	//V tom je však háček. Mistr Nrozas už o tom s mistrem Tiamantem mluvil, ale on mu ho odmítl dát.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_12");	//V ten moment zachvátil mistra Nrozase takový vztek, že málem poslal k Beliarovi několik noviců bratrstva. 
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_13");	//A po tom všem mě poslal hledat ten prokletý tesák.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_14");	//Takže to nakonec všechno slíznu já.
	MIS_KaduinTooth = LOG_Running;
	B_LogEntry(TOPIC_Intriges,"Mistr Nrozas zadal tomu chudákovi Kaduinovi získat jedovatý tesák Muritana. Mistr Nrozas se už o tomhle bavil s mistrem Tiamantem, který sám vlastní jeden exemplář, ale ten mu ho odmítl dát. Jestli pomůžu Kaduinovi, bude to skvělý moment, protože se dozvím o mistru Nrozasovi a mistru Tiamantovi více podrobností.");
	Wld_InsertNpc(Muritan_PW_02,"PW_MURITAN_02");
};	


instance DIA_Ass_183_Adept_TalkAboutJoin_Done(C_Info)
{
	npc = Ass_183_Adept;
	nr = 1;
	condition = DIA_Ass_183_Adept_TalkAboutJoin_Done_condition;
	information = DIA_Ass_183_Adept_TalkAboutJoin_Done_info;
	permanent = FALSE;
	description = "Mám u sebe tesák Muritana.";
};
	
func int DIA_Ass_183_Adept_TalkAboutJoin_Done_condition()
{
	if((MIS_KaduinTooth == LOG_Running) && (Npc_HasItems(other,ItAt_PW_MuritanTooth) >= 1))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_183_Adept_TalkAboutJoin_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_00");	//Mám u sebe tesák Muritana. Můžu ti ho dát.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_01");	//Co? Děláš si srandu?
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_02");	//Žádná sranda! Nedávno jsem sám zabil jednu z těch stvůr.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_03");	//Já ho vůbec nepotřebuju, ale tobě by se mohl hodit.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_04");	//(zmateně) No dobře... jsem připraven dát za něj... cokoliv!
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_05");	//O tom nepochybuji. Ale bude mi stačit, když mi odpovíš na jednu otázku.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_06");	//Domluveno. Ptej se! Pokusím se ti odpovědět.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_07");	//Takže, to co mě zajímá: jak se mistr Nrozas chová k mistru Tiamantovi?
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_08");	//No, jak... doteď se spolu moc nedohodli.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_09");	//Po tom rozhovoru mistr Nrozas pravděpodobně skrývá velkou křivdu k mistru Tiamantovi.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_10");	//Přinejmenším mi to tak přijde, hlavně když si mistr Nrozas mumlá pod knírem, že mu to někdy vrátí.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_11");	//No, nic víc už o tom nevím.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_12");	//To mi stačí. Tady máš svůj tesák.
	B_GiveInvItems(other,self,ItAt_PW_MuritanTooth,1);
	Npc_RemoveInvItems(self,ItAt_PW_MuritanTooth,1);

	if(Trophy_MuritanTooth  == TRUE)
	{
		if((Npc_HasItems(other,ItAt_PW_MuritanTooth) == FALSE) && (Npc_HasItems(other,ItAt_BuritanTooth) == FALSE))
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
			Trophy_MuritanTooth  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_13");	//Díky, příteli! Zachránil jsi mě.
	MIS_KaduinTooth = LOG_SUCCESS;
	KnowNrozasToTiamant = TRUE;
	B_LogEntry(TOPIC_Intriges,"Zdá se, že mistr Nrozas tají velkou křivdu k mistru Tiamantovi a prahne po pomstě. Věřím, že tohle by mohlo mistra Haniara velmi zajímat.");
};	

instance DIA_Ass_183_Adept_Trade(C_Info)
{
	npc = Ass_183_Adept;
	nr = 80;
	condition = DIA_Ass_183_Adept_Trade_Condition;
	information = DIA_Ass_183_Adept_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mi můžeš nabídnout?";
};

func int DIA_Ass_183_Adept_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ass_183_Adept_WhatDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_183_Adept_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Co mi můžeš nabídnout?
	B_GiveTradeInv(self);
};
