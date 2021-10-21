
instance DIA_Rupert_EXIT(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 999;
	condition = DIA_Rupert_EXIT_Condition;
	information = DIA_Rupert_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rupert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Rupert_PICKPOCKET(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 998;
	condition = DIA_Rupert_PICKPOCKET_Condition;
	information = DIA_Rupert_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Rupert_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_Rupert_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
	Info_AddChoice(DIA_Rupert_PICKPOCKET,Dialog_Back,DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rupert_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
};

func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
};

instance DIA_RUPERT_NO_TALK(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = dia_rupert_no_talk_condition;
	information = dia_rupert_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_rupert_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_rupert_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};

instance DIA_Rupert_Hello(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_Hello_Condition;
	information = DIA_Rupert_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Rupert_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Hello_Info()
{
	AI_Output(self,other,"DIA_Rupert_Hello_03_00");	//Zdravím tě cizinče!
	AI_Output(self,other,"DIA_Rupert_Hello_03_01");	//Musíš být hladový a mít žízeň. Mohl bych tě snad zaujmout svým zboží?
};


instance DIA_Rupert_ZuPal(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_ZuPal_Condition;
	information = DIA_Rupert_ZuPal_Info;
	permanent = FALSE;
	description = "Přišel jsem, protože se chci setkat s paladiny.";
};


func int DIA_Rupert_ZuPal_Condition()
{
	if(Kapitel < 2)
	{
		return TRUE;
	};
};

func void DIA_Rupert_ZuPal_Info()
{
	AI_Output(other,self,"DIA_Rupert_ZuPal_15_00");	//Abych byl upřímný, přišel jsem, abych se setkal s paladiny.
	AI_Output(self,other,"DIA_Rupert_ZuPal_03_01");	//Tak to máš jen malou šanci! Od té doby, co se paladinové usídlili v horní čtvrti města, dostat se tam je docela obtížné.
};


instance DIA_Rupert_HelpMeIntoOV(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_HelpMeIntoOV_Condition;
	information = DIA_Rupert_HelpMeIntoOV_Info;
	permanent = FALSE;
	description = "Můžeš mi pomoci proniknout do horní čtvrti?";
};

func int DIA_Rupert_HelpMeIntoOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_ZuPal) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_HelpMeIntoOV_Info()
{
	AI_Output(other,self,"DIA_Rupert_HelpMeIntoOV_15_00");	//Můžeš mi pomoci proniknout do horní čtvrti?
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_01");	//Já? Ne, moje slovo tady přílis neznamená!
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_02");	//V dolní čtvrti je jen pár lidí, kteří mají dostatečný vliv, aby přiměli stráže k tomu, aby tě pustili.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_03");	//Matteo, můj šef, je jedním z nich. Možná by sis s ním měl promluvit.

	if((CanTeachTownMaster == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_10");	//Nicméně, soudě podle tvého vzezření, je nepravděpodobné, že by se s tebou dal do řeči.
		AI_Output(other,self,"DIA_Rupert_HelpMeIntoOV_03_11");	//A co bych měl teda udělat?
		AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_12");	//Musíš si nějak získat jeho důvěru.
		AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_13");	//Promluv si s Pablem od domobrany. Myslím, že ti bude schopný nějak pomoct.
		RupertSendPablo = TRUE;
		Log_CreateTopic(TOPIC_OV,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OV,LOG_Running);
		B_LogEntry(TOPIC_OV,"Jestli se mám dostat do horní čtvrti, musí mi v tom pomoci nějací vlivní občané z dolní čtvrti.");
		B_LogEntry_Quiet(TOPIC_OV,"Jedním z vlivných občanů dolní čtvrti je obchodník Matteo.");
		B_LogEntry_Quiet(TOPIC_OV,"Je pravda, že se mnou vůbec nebude chtít mluvit! Musím si nějak získat jeho důvěru. Rupert mi radil, abych si pohovořil s Pablem z domobrany! Možná mi pomůže s mojim problémem.");
	}
	else
	{
		Log_CreateTopic(TOPIC_OV,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OV,LOG_Running);
		B_LogEntry(TOPIC_OV,"Abych se dostal do horní čtvrti, potřebuji pomoc vlivných občanů z dolní čtvrti.");
		B_LogEntry_Quiet(TOPIC_OV,"Obchodník Matteo - jeden z nejvlivnějších měšťanů z dolní čtvrti.");
	};
};


instance DIA_Rupert_WoMatteo(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_WoMatteo_Condition;
	information = DIA_Rupert_WoMatteo_Info;
	permanent = FALSE;
	description = "Kde najdu Mattea?";
};

func int DIA_Rupert_WoMatteo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_HelpMeIntoOV) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_WoMatteo_Info()
{
	AI_Output(other,self,"DIA_Rupert_WoMatteo_15_00");	//Kde najdu Mattea?
	AI_Output(self,other,"DIA_Rupert_WoMatteo_03_01");	//Stojíš přímo před jeho krámkem. Stačí jen vejít! Je tam skoro pořád.

	if(Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Matteův obchod leží u jižní městská brány. Prodává různé vybavení, zbraně a zásoby.");
		Knows_Matteo = TRUE;
	};
};

instance DIA_Rupert_WerEinfluss(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 2;
	condition = DIA_Rupert_WerEinfluss_Condition;
	information = DIA_Rupert_WerEinfluss_Info;
	permanent = FALSE;
	description = "A co ti další vlivní měšťané?";
};


func int DIA_Rupert_WerEinfluss_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_HelpMeIntoOV) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_WerEinfluss_Info()
{
	AI_Output(other,self,"DIA_Rupert_WerEinfluss_15_00");	//A co ti další vlivní měšťané?
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_01");	//Obchodníci a mistři řemeslníci tady na hlavní ulici jsou nejvlivnějšími osobami ve městě.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_02");	//Měl by ses stát učedníkem u jednoho z nich, jako já.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_03");	//Od té doby, co pracuju pro Mattea, se ke mně lidé ve městě chovají s úctou!

	if((CanTeachTownMaster == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_10");	//Nicméně nikdo z nich s tebou mluvit nebude, pokud si u nich nezískáš důvěru.
		B_LogEntry(TOPIC_OV,"Měl bych se pokusit stát se učedníkem u jednoho z mistrů! To ale bude možné tehdy, pokud si získám jejich důvěru.");
	}
	else
	{
		B_LogEntry(TOPIC_OV,"Měl bych se stát učněm u jednoho z mistrů.");
	};
};

instance DIA_Rupert_Work(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 3;
	condition = DIA_Rupert_Work_Condition;
	information = DIA_Rupert_Work_Info;
	permanent = FALSE;
	description = "Potřebuju peníze a poohlížím se po práci.";
};


func int DIA_Rupert_Work_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Rupert_Work_Info()
{
	AI_Output(other,self,"DIA_Rupert_Work_15_00");	//Potřebuju peníze a poohlížím se po práci.
	AI_Output(self,other,"DIA_Rupert_Work_03_01");	//Slyšel jsem, že Bosper má problémy se svými dodavateli. Jeho obchod je támhle.
	AI_Output(self,other,"DIA_Rupert_Work_03_02");	//Říká se, že platí velice slušně.
};


instance DIA_Rupert_YourOffer(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 4;
	condition = DIA_Rupert_YourOffer_Condition;
	information = DIA_Rupert_YourOffer_Info;
	permanent = FALSE;
	description = "Co mi můžeš nabídnout?";
};

func int DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};

func void DIA_Rupert_YourOffer_Info()
{
	AI_Output(other,self,"DIA_Rupert_YourOffer_15_00");	//Co mi můžeš nabídnout?
	AI_Output(self,other,"DIA_Rupert_YourOffer_03_01");	//Teď zrovna toho moc nemám.

	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rupert_YourOffer_03_02");	//Ten zatracenej velkostatkář Onar nechce doručovat další zboží, a to, co získáme z malých farem, nestačí pokrýt potřebu města.
	};
};


instance DIA_Rupert_Trade(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 900;
	condition = DIA_Rupert_Trade_Condition;
	information = DIA_Rupert_Trade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int DIA_Rupert_Trade_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Rupert_YourOffer) == TRUE) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Rupert_Trade_15_00");	//Ukaž mi své zboží.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rupert_Trade_03_01");	//Musím se omluvit za mou chudou nabídkou. Člověk tvého postavení je určitě zvyklý na lepší.
	};
};


instance DIA_Rupert_Bauernaufstand(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 4;
	condition = DIA_Rupert_Bauernaufstand_Condition;
	information = DIA_Rupert_Bauernaufstand_Info;
	permanent = FALSE;
	description = "Řekni mi o té rolnické vzpouře.";
};


func int DIA_Rupert_Bauernaufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_YourOffer) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Rupert_Bauernaufstand_15_00");	//Řekni mi o té rolnické vzpouře.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_01");	//To je docela jednoduché! Onar, velký statkář, už nechce dál městu odvádět daně.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_02");	//No jen si to představ! Jsme ve válce se skřety a to tlusté prase chce všechno jen pro sebe!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_03");	//Obvykle městská stráž v takových případech užívá přísná opatření.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_04");	//Ale teď přijde to nejzajímavější: říká se, že si najal žoldáky, aby drželi vojáky z města dál od jeho farmy!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_05");	//ŽOLDÁCI! Vše to skončí válkou! Jako kdyby jedna válka nestačila!
};


instance DIA_Rupert_Mercs(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 4;
	condition = DIA_Rupert_Mercs_Condition;
	information = DIA_Rupert_Mercs_Info;
	permanent = FALSE;
	description = "Co víš o Onarových žoldácích?";
};


func int DIA_Rupert_Mercs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_Bauernaufstand) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Mercs_Info()
{
	AI_Output(other,self,"DIA_Rupert_Mercs_15_00");	//Co víš o Onarových žoldácích?
	AI_Output(self,other,"DIA_Rupert_Mercs_03_01");	//Zaslechl jsem, že většinou se jedná o bývalé trestance z Hornického údolí.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_02");	//A jejich velitel měl údajně být nějaký velký zvíře z králova okolí - generál nebo co, kterého odsoudili za zradu!
	AI_Output(self,other,"DIA_Rupert_Mercs_03_03");	//Doba je zlá!
};
