
instance DIA_Mika_EXIT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 999;
	condition = DIA_Mika_EXIT_Condition;
	information = DIA_Mika_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mika_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Mika_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mika_WOHIN(C_Info)
{
	npc = Mil_337_Mika;
	nr = 4;
	condition = DIA_Mika_WOHIN_Condition;
	information = DIA_Mika_WOHIN_Info;
	important = TRUE;
};


func int DIA_Mika_WOHIN_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mika_WOHIN_Info()
{
	AI_Output(self,other,"DIA_Mika_WOHIN_12_00");	//Hej, hej. Ne tak rychle. Bloumat tady o samotě může být docela nebezpečný. Odkud jsi?
	Info_ClearChoices(DIA_Mika_WOHIN);
	Info_AddChoice(DIA_Mika_WOHIN,"Do toho ti nic není.",DIA_Mika_WOHIN_weg);
	Info_AddChoice(DIA_Mika_WOHIN,"Z jedné z farem.",DIA_Mika_WOHIN_Bauern);
	Info_AddChoice(DIA_Mika_WOHIN,"Z města!",DIA_Mika_WOHIN_stadt);
};

func void DIA_Mika_WOHIN_stadt()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_stadt_15_00");	//Z města!
	AI_Output(self,other,"DIA_Mika_WOHIN_stadt_12_01");	//Dobrá, dobrá. Tak proč se potom poflakuješ tady, daleko od bezpečí městskejch hradeb?
	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_Bauern_15_00");	//Z jedné z farem.
	AI_Output(self,other,"DIA_Mika_WOHIN_Bauern_12_01");	//Farmář, co? Hmm. V tom případě by ses neměl courat po těchhle nebezpečnejch cestách o samotě. Kdo ví, kdo by tady na tebe mohl číhat.
	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_weg_15_00");	//Do toho ti nic není.
	AI_Output(self,other,"DIA_Mika_WOHIN_weg_12_01");	//Když myslíš. Ale až tě někdo sejme, tak si potom nestěžuj. Přeju hezkej den.
	AI_StopProcessInfos(self);
};


instance DIA_Mika_WASGEFAEHRLICH(C_Info)
{
	npc = Mil_337_Mika;
	nr = 5;
	condition = DIA_Mika_WASGEFAEHRLICH_Condition;
	information = DIA_Mika_WASGEFAEHRLICH_Info;
	description = "Co je tady tak nebezpečné?";
};

func int DIA_Mika_WASGEFAEHRLICH_Condition()
{
	return TRUE;
};

func void DIA_Mika_WASGEFAEHRLICH_Info()
{
	AI_Output(other,self,"DIA_Mika_WASGEFAEHRLICH_15_00");	//Co je tady tak nebezpečné?
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_01");	//Spousta věcí.
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_02");	//Za prvé jsou tady banditi. Takovou měkkotu, jako jsi ty, klidně zblajznou k snídani.
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_03");	//A když tě nechytěj banditi, tak se o tebe postaraj divoký zvířata v lese nebo žoldáci, co se potulujou tady po okolí.
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_04");	//Takže než někam vyrazíš, měl by sis sehnat nějakou slušnou zbroj.

	if(RealMode[2] == FALSE)
	{
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_05");	//Vsadím se, že budeš křičet o pomoc hned za první zatáčkou.
	};
};

instance DIA_Mika_WASKOSTETHILFE(C_Info)
{
	npc = Mil_337_Mika;
	nr = 6;
	condition = DIA_Mika_WASKOSTETHILFE_Condition;
	information = DIA_Mika_WASKOSTETHILFE_Info;
	description = "Jenom pro případ, že bych tvou pomoc opravdu potřeboval. Kolik by mě to stálo?";
};


func int DIA_Mika_WASKOSTETHILFE_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Mika_WASGEFAEHRLICH) == TRUE) && (RealMode[2] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mika_WASKOSTETHILFE_Info()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_15_00");	//Jenom pro případ, že bych tvou pomoc opravdu potřeboval. Kolik by mě to stálo?
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_01");	//Jsem prostý skromný služebník krále a v žádném případě bych nechtěl oškubat bezbranného občana království.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_02");	//Ale, no... když to říkáš takhle... rozhodně bych neměl nic proti nějakýmu malýmu finančnímu upevnění našich budoucích obchodních vztahů.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_03");	//Sto zlatejch by mělo pro začátek stačit. Co ty na to?
	Info_ClearChoices(DIA_Mika_WASKOSTETHILFE);
	Info_AddChoice(DIA_Mika_WASKOSTETHILFE,"Budu o tom přemýšlet.",DIA_Mika_WASKOSTETHILFE_nochnicht);
	Info_AddChoice(DIA_Mika_WASKOSTETHILFE,"Proč ne? Tady máš svých sto zlatých.",DIA_Mika_WASKOSTETHILFE_ja);
};

func void DIA_Mika_WASKOSTETHILFE_ja()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_ja_15_00");	//Proč ne? Tady máš svých sto zlatých.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_01");	//Výborně. Kdybys potřeboval pomoc, víš, kde mě hledat.
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_02");	//Ale chtěl bych tě poprosit o jednu maličkost. Nechoď za mnou se žádnejma prkotinama. To mě vždycky dokáže vytočit, rozumíme si?
		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_03");	//Tolik peněz nemáš. Možná by sis měl rozmyslet, jestli opravdu mojí pomoc potřebuješ.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Mika_WASKOSTETHILFE_nochnicht()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_nochnicht_15_00");	//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_nochnicht_12_01");	//Jak je libo. Pozdravuj zubatou.
	AI_StopProcessInfos(self);
};


instance DIA_Mika_UEBERLEGT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 7;
	condition = DIA_Mika_UEBERLEGT_Condition;
	information = DIA_Mika_UEBERLEGT_Info;
	permanent = TRUE;
	description = "Rozmyslel jsem si to. Zaplatím těch sto zlatých.";
};


func int DIA_Mika_UEBERLEGT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Mika_WASKOSTETHILFE) && (Mika_Helps == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mika_UEBERLEGT_Info()
{
	AI_Output(other,self,"DIA_Mika_UEBERLEGT_15_00");	//Rozmyslel jsem si to. Zaplatím těch sto zlatých.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_01");	//Skvělé. Lepší pozdě než nikdy. A co teď?
		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_02");	//(rozzlobeně) Vrať se, až budeš mít ty prachy.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Mika_HILFE(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_HILFE_Condition;
	information = DIA_Mika_HILFE_Info;
	permanent = TRUE;
	description = "Potřebuji tvou pomoc.";
};

func int DIA_Mika_HILFE_Condition()
{
	if(Mika_Helps == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mika_HILFE_Info()
{
	AI_Output(other,self,"DIA_Mika_HILFE_15_00");	//Potřebuji tvou pomoc.
	AI_Output(self,other,"DIA_Mika_HILFE_12_01");	//Jestli to je naprosto nezbytný... Co se děje?
	Info_ClearChoices(DIA_Mika_HILFE);
	Info_AddChoice(DIA_Mika_HILFE,"Pronásledují mě banditi.",DIA_Mika_HILFE_schongut);
	Info_AddChoice(DIA_Mika_HILFE,"Zaútočily na mě příšery.",DIA_Mika_HILFE_monster);
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && (MIKAGOFARM == FALSE) && ((Akils_SLDStillthere == TRUE) || Npc_KnowsInfo(other,DIA_Sarah_Bauern)))
	{
		Info_AddChoice(DIA_Mika_HILFE,"Na farmáře Akila zaútočili žoldáci.",DIA_Mika_HILFE_Akil);
	};
	if((MIS_SALANDRILHELP == LOG_Running) && (ORCWARRIORSALANDRILISDEAD == FALSE))
	{
		Info_AddChoice(DIA_Mika_HILFE,"Říká se, že se tady potuluje skřet.",dia_mika_hilfe_orcsalandril);
	};
};

func void DIA_Mika_HILFE_Akil()
{
	AI_Output(other,self,"DIA_Mika_HILFE_Akil_15_00");	//Na farmáře Akila zaútočili žoldáci.
	AI_Output(self,other,"DIA_Mika_HILFE_Akil_12_01");	//(znepokojeně) Cože? Ta lůza vyrazila na Akilovu farmu? Tak to není času nazbyt. Pojď za mnou.
	AI_StopProcessInfos(self);
	MIKAGOFARM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"Mika mi chce pomoct vyřešit problém se žoldáky na Akilově farmě.");
	Npc_ExchangeRoutine(self,"Akil");
};

func void DIA_Mika_HILFE_monster()
{
	AI_Output(other,self,"DIA_Mika_HILFE_monster_15_00");	//Zaútočily na mě příšery.
	AI_Output(self,other,"DIA_Mika_HILFE_monster_12_01");	//Ale já žádný příšery nevidím. Určitě sis to jenom vymyslel.
	AI_StopProcessInfos(self);
};

func void DIA_Mika_HILFE_schongut()
{
	AI_Output(other,self,"DIA_Mika_HILFE_schongut_15_00");	//Pronásledují mě banditi.
	AI_Output(self,other,"DIA_Mika_HILFE_schongut_12_01");	//Vážně? A kde tedy jsou? Kdyby tě pronásledovali, určitě bych měl vidět alespoň jednoho, ne?
	AI_StopProcessInfos(self);
};

func void dia_mika_hilfe_orcsalandril()
{
	AI_Output(other,self,"DIA_Mika_HILFE_OrcSalandril_01_00");	//Říká se, že se tady potuluje skřet.
	AI_Output(self,other,"DIA_Mika_HILFE_OrcSalandril_01_01");	//Skřet?! Hmm... (polekaně) To je tedy úctyhodný protivník!
	AI_Output(self,other,"DIA_Mika_HILFE_OrcSalandril_01_02");	//Myslím, že na tohle sto zlatejch stačit nebude.
	AI_Output(other,self,"DIA_Mika_HILFE_OrcSalandril_01_03");	//Cože? Vždyť jsme se domluvili!
	AI_Output(self,other,"DIA_Mika_HILFE_OrcSalandril_01_04");	//Chlape, nebudu pro pár mincí riskovat život se skřetem!
	AI_Output(other,self,"DIA_Mika_HILFE_OrcSalandril_01_05");	//Tak kolik chceš?
	AI_Output(self,other,"DIA_Mika_HILFE_OrcSalandril_01_06");	//Hmm... (zamyšleně) Alespoň pět set zlatejch!
	MIKATELLORKS = TRUE;
	Info_ClearChoices(DIA_Mika_HILFE);
};


instance DIA_MIKA_GOHUNT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 1;
	condition = dia_mika_gohunt_condition;
	information = dia_mika_gohunt_info;
	permanent = TRUE;
	description = "Tady máš pět set zlatých. Jdeme!";
};

func int dia_mika_gohunt_condition()
{
	if((MIS_SALANDRILHELP == LOG_Running) && (ORCWARRIORSALANDRILISDEAD == FALSE) && (MIKATELLORKS == TRUE) && (MIKATELLORKSGO == FALSE))
	{
		return TRUE;
	};
};

func void dia_mika_gohunt_info()
{
	AI_Output(other,self,"DIA_Mika_GoHunt_01_00");	//Tady máš pět set zlatých. Jdeme!

	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		MIKATELLORKSGO = TRUE;
		AI_Output(self,other,"DIA_Mika_GoHunt_01_01");	//Ech... Dobrá, pojďme! Ukaž mi, kde je ten tvůj skřet!
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Npc_ExchangeRoutine(self,"Follow");
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_GoHunt_01_02");	//A kde je schováváš? Tolik zlata nemáš!
		AI_Output(self,other,"DIA_Mika_GoHunt_01_03");	//Takže radši zůstanu tady, daleko od skřetů!
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIKA_GOHOME(C_Info)
{
	npc = Mil_337_Mika;
	nr = 1;
	condition = dia_mika_gohome_condition;
	information = dia_mika_gohome_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mika_gohome_condition()
{
	if((MIS_SALANDRILHELP == LOG_Running) && (MIKATELLORKSDONE == FALSE) && (ORCWARRIORSALANDRILISDEAD == FALSE) && (MIKATELLORKSGO == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_TO_FOREST_01") >= 10000))
	{
		return TRUE;
	};
};

func void dia_mika_gohome_info()
{
	AI_Output(self,other,"DIA_Mika_GoHome_01_00");	//Žádní skřeti tady nejsou, kámo!
	AI_Output(self,other,"DIA_Mika_GoHome_01_01");	//Takže se radši vrátím zpátky do města.
	AI_Output(other,self,"DIA_Mika_GoHome_01_02");	//Hej, počkej...
	MIKATELLORKSDONE = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Mika_Zack(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_Zack_Condition;
	information = DIA_Mika_Zack_Info;
	important = TRUE;
};


func int DIA_Mika_Zack_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 500) && !Npc_IsDead(Alvares) && !Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Mika_Zack_Info()
{
	AI_Output(self,other,"DIA_Mika_Zack_12_00");	//Teď sleduj, jak se to dělá.
	Info_AddChoice(DIA_Mika_Zack,Dialog_Ende,DIA_Mika_Zack_los);
};

func void DIA_Mika_Zack_los()
{
	AI_StopProcessInfos(self);
	if(!Npc_IsDead(Alvares))
	{
		Alvares.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(!Npc_IsDead(Engardo))
	{
		Engardo.aivar[AIV_EnemyOverride] = FALSE;
	};
};

instance DIA_Mika_WIEDERNACHHAUSE(C_Info)
{
	npc = Mil_337_Mika;
	nr = 9;
	condition = DIA_Mika_WIEDERNACHHAUSE_Condition;
	information = DIA_Mika_WIEDERNACHHAUSE_Info;
	important = TRUE;
};

func int DIA_Mika_WIEDERNACHHAUSE_Condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 10000) && Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Mika_WIEDERNACHHAUSE_Info()
{
	AI_Output(self,other,"DIA_Mika_WIEDERNACHHAUSE_12_00");	//Dobrá. Tak jo. Já tedy půjdu.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Mika_Kap3_EXIT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 999;
	condition = DIA_Mika_Kap3_EXIT_Condition;
	information = DIA_Mika_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mika_Kap3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mika_Kap3u4u5_PERM(C_Info)
{
	npc = Mil_337_Mika;
	nr = 39;
	condition = DIA_Mika_Kap3u4u5_PERM_Condition;
	information = DIA_Mika_Kap3u4u5_PERM_Info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};


func int DIA_Mika_Kap3u4u5_PERM_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Mika_WOHIN) && Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3u4u5_PERM_Info()
{
	AI_Output(other,self,"DIA_Mika_Kap3u4u5_PERM_15_00");	//Všechno v pořádku?
	AI_Output(self,other,"DIA_Mika_Kap3u4u5_PERM_12_01");	//Ještě pořád jsi naživu. To na mě udělalo dojem.
};


instance DIA_Mika_PICKPOCKET(C_Info)
{
	npc = Mil_337_Mika;
	nr = 900;
	condition = DIA_Mika_PICKPOCKET_Condition;
	information = DIA_Mika_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mika_PICKPOCKET_Condition()
{
	return C_Beklauen(65,75);
};

func void DIA_Mika_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
	Info_AddChoice(DIA_Mika_PICKPOCKET,Dialog_Back,DIA_Mika_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mika_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mika_PICKPOCKET_DoIt);
};

func void DIA_Mika_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};

func void DIA_Mika_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};

instance DIA_Mika_Key(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_Key_Condition;
	information = DIA_Mika_Key_Info;
	permanent = FALSE;
	description = "Nenašel jsi tady nějaký klíč?";
};

func int DIA_Mika_Key_Condition()
{
	if((MIS_Constantino_LostKey == LOG_Running) && (MikaHaveKey == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Mika_Key_Info()
{
	AI_Output(other,self,"DIA_Mika_Key_01_00");	//Nenašel jsi tady nějaký klíč?
	AI_Output(self,other,"DIA_Mika_Key_01_01");	//Jo, našel. Pod tímhle stromem. Asi ho tam někdo bezděčně upustil.
	AI_Output(other,self,"DIA_Mika_Key_01_02");	//Mohl bys mi ho dát?
	AI_Output(self,other,"DIA_Mika_Key_01_03");	//Jistě, kamaráde... (posměvačně) O tom žádná!
	AI_Output(self,other,"DIA_Mika_Key_01_04");	//Jen mi budeš muset zaplatit, řekněme... padesát zlatejch. Souhlas?
	AI_Output(other,self,"DIA_Mika_Key_01_05");	//Není to za takový klíč trochu moc?
	AI_Output(self,other,"DIA_Mika_Key_01_06");	//Levnější to nebude. Takže pokud ho opravdu chceš, budeš se muset plácnout přes kapsu.
	B_LogEntry(TOPIC_Constantino_LostKey,"Constantinův klíč zřejmě našel Mika. Prodá mi ho ovšem jen za padesát zlatých.");
};

instance DIA_Mika_KeyDone(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_KeyDone_Condition;
	information = DIA_Mika_KeyDone_Info;
	permanent = TRUE;
	description = "Dej mi ten klíč.";
};

func int DIA_Mika_KeyDone_Condition()
{
	if((MIS_Constantino_LostKey == LOG_Running) && (MikaGiveKey == FALSE) && (Npc_KnowsInfo(other,DIA_Mika_Key) == TRUE) && (MikaHaveKey == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Mika_KeyDone_Info()
{
	AI_Output(other,self,"DIA_Mika_KeyDone_01_00");	//Dej mi ten klíč.
	AI_Output(self,other,"DIA_Mika_KeyDone_01_01");	//A co zlato?

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		Npc_RemoveInvItems(self,ItMi_Gold,50);
		AI_Output(other,self,"DIA_Mika_KeyDone_01_02");	//Tady, padesát zlatých.
		AI_Output(self,other,"DIA_Mika_KeyDone_01_03");	//Skvěle. Tady máš ten svůj klíč.
		B_GiveInvItems(self,other,ItKe_Constantino,1);
		AI_Output(self,other,"DIA_Mika_KeyDone_01_04");	//Poctivej obchod, nemyslíš?
		AI_Output(other,self,"DIA_Mika_KeyDone_01_05");	//No jo.
		MikaGiveKey = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Mika_KeyDone_01_06");	//Nemám tolik peněz.
		AI_Output(self,other,"DIA_Mika_KeyDone_01_07");	//Tak si je sežeň. A klíč zatím zůstane u mne.
	};
};

instance DIA_Mika_Werewolf(C_Info)
{
	npc = Mil_337_Mika;
	nr = 3;
	condition = DIA_Mika_Werewolf_Condition;
	information = DIA_Mika_Werewolf_Info;
	permanent = FALSE;
	description = "Slyšel jsi v poslední době něco o napadených lidech?";
};

func int DIA_Mika_Werewolf_Condition()
{
	if(MIS_WolfAndMan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mika_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Mika_Werewolf_01_00");	//Slyšel jsi v poslední době něco o napadených lidech?
	AI_Output(self,other,"DIA_Mika_Werewolf_01_01");	//Jo, slyšel. Nedávno prý na Akilově farmě nějaká bestie unesla jednoho z rolníků.
	AI_Output(other,self,"DIA_Mika_Werewolf_01_02");	//Udělali jste ohledně toho něco?
	AI_Output(self,other,"DIA_Mika_Werewolf_01_03");	//No, lord Andre tam vyslal několik našich chlapů.
	AI_Output(self,other,"DIA_Mika_Werewolf_01_04");	//Ale kromě stop krve a cárů oblečení nic nenašli.
	AI_Output(self,other,"DIA_Mika_Werewolf_01_05");	//To monstrum očividně odneslo svou kořist hluboko do lesa.
	B_LogEntry(TOPIC_WolfAndMan,"Podle Miky nedávno nějaká bestie unesla jednoho z rolníků na Akilově farmě.");
};


//----------------------okhrana----------------------------------------

const string Mil_360_Checkpoint = "NW_CASTLEMINE_PATH_02";

instance DIA_Mil_360_Miliz_EXIT(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 999;
	condition = DIA_Mil_360_Miliz_EXIT_Condition;
	information = DIA_Mil_360_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_360_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_360_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_360_Miliz_FirstWarn(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 1;
	condition = DIA_Mil_360_Miliz_FirstWarn_Condition;
	information = DIA_Mil_360_Miliz_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_360_Miliz_FirstWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (PasswordSet == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstWarn_03_00");	//STÁT!
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstWarn_03_01");	//Tady nemáš co dělat! Tohle je soukromý majetek!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_360_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_360_Miliz_SecondWarn(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 2;
	condition = DIA_Mil_360_Miliz_SecondWarn_Condition;
	information = DIA_Mil_360_Miliz_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_360_Miliz_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (PasswordSet == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_360_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_360_Miliz_SecondWarn_03_00");	//Před chvílí jsem tě varoval. Další kror - a poznáš moje ostří.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_360_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_360_Miliz_Attack(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 3;
	condition = DIA_Mil_360_Miliz_Attack_Condition;
	information = DIA_Mil_360_Miliz_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_360_Miliz_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (PasswordSet == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_360_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_360_Miliz_Attack_03_00");	//Říkáš si o to...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

instance DIA_Mil_360_Miliz_FirstInTower(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 3;
	condition = DIA_Mil_360_Miliz_FirstInTower_condition;
	information = DIA_Mil_360_Miliz_FirstInTower_info;
	permanent = TRUE;
	description = "Klídek! Tady mám papíry.";
};

func int DIA_Mil_360_Miliz_FirstInTower_condition()
{
	if((PasswordSet == FALSE) && (Npc_HasItems(other,ItWr_HagenLoanDocs) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_FirstInTower_info()
{
	AI_Output(other,self,"DIA_Mil_360_Miliz_FirstInTower_15_00");	//Klídek! Tady mám papíry.
	B_GiveInvItems(other,self,ItWr_HagenLoanDocs,1);
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstInTower_15_01");	//Tak se na to podívám.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstInTower_15_02");	//Hmmm... Zdá se, že vše je v pořádku! Takže jsi nový majitel?
	B_GiveInvItems(self,other,ItWr_HagenLoanDocs,1);
	AI_Output(other,self,"DIA_Mil_360_Miliz_FirstInTower_15_03");	//To mluví za vše. A teď mě nech v mí věži!
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstInTower_15_04");	//Samozřejmě, pojďte dál. Bude nějaké přání?
	AI_Output(other,self,"DIA_Mil_360_Miliz_FirstInTower_15_05");	//Hmmm... Možná, že v budoucnu sem budou chodit lidi. Budeš se ptát na heslo.
	AI_Output(other,self,"DIA_Mil_360_Miliz_FirstInTower_15_06");	//Heslo je výraz - 'dračí poklad'. Všichni, kdo ho znají, ať projdou. Zbytek ne.
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstInTower_15_07");	//Dobře. Provedu to!
	PasswordSet = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Guard");
	B_StartOtherRoutine(Mil_361_Miliz,"Guard");
};

instance DIA_Mil_360_Miliz_PERM(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 1;
	condition = DIA_Mil_360_Miliz_PERM_Condition;
	information = DIA_Mil_360_Miliz_PERM_Info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int DIA_Mil_360_Miliz_PERM_Condition()
{
	if(PasswordSet == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_360_Miliz_PERM_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Mil_360_Miliz_PERM_03_01");	//Vše je v pořádku, příteli.
};

instance DIA_Mil_361_Miliz_EXIT(C_Info)
{
	npc = Mil_361_Miliz;
	nr = 999;
	condition = DIA_Mil_361_Miliz_EXIT_Condition;
	information = DIA_Mil_361_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_361_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_361_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_361_Miliz_Hallo(C_Info)
{
	npc = Mil_361_Miliz;
	nr = 2;
	condition = DIA_Mil_361_Miliz_Hallo_Condition;
	information = DIA_Mil_361_Miliz_Hallo_Info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int DIA_Mil_361_Miliz_Hallo_Condition()
{
	if(PasswordSet == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mil_361_Miliz_Hallo_Info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//Všechno je v pořádku! Ale musíme zůstat ostražití.
};

instance DIA_Mil_363_Miliz_EXIT(C_Info)
{
	npc = Mil_363_Miliz;
	nr = 999;
	condition = DIA_Mil_363_Miliz_EXIT_Condition;
	information = DIA_Mil_363_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_363_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_363_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_362_Miliz_EXIT(C_Info)
{
	npc = Mil_362_Miliz;
	nr = 999;
	condition = DIA_Mil_362_Miliz_EXIT_Condition;
	information = DIA_Mil_362_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_362_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_362_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};