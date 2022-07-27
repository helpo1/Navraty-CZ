
instance DIA_DRAX_EXIT(C_Info)
{
	npc = xbs_7509_drax;
	nr = 999;
	condition = dia_drax_exit_condition;
	information = dia_drax_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_drax_exit_condition()
{
	return TRUE;
};

func void dia_drax_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAX_PICKPOCKET(C_Info)
{
	npc = xbs_7509_drax;
	nr = 900;
	condition = dia_drax_pickpocket_condition;
	information = dia_drax_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_drax_pickpocket_condition()
{
	return C_Beklauen(25,30);
};

func void dia_drax_pickpocket_info()
{
	Info_ClearChoices(dia_drax_pickpocket);
	Info_AddChoice(dia_drax_pickpocket,Dialog_Back,dia_drax_pickpocket_back);
	Info_AddChoice(dia_drax_pickpocket,DIALOG_PICKPOCKET,dia_drax_pickpocket_doit);
};

func void dia_drax_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_drax_pickpocket);
};

func void dia_drax_pickpocket_back()
{
	Info_ClearChoices(dia_drax_pickpocket);
};


instance DIA_DRAX_HALLO(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = dia_drax_hallo_condition;
	information = dia_drax_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_drax_hallo_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_drax_hallo_info()
{
	AI_Output(self,other,"DIA_Drax_Hallo_01_0E");	//Tak, tak...

	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_00");	//Už jsi ani nepamatuji kolik let je tomu, co jsem viděl služebníka Innose...
	}
	else if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_0A");	//Už jsi ani nepamatuji jak dlouho je tomu, co jsem viděl Adanova služebníka...
	}
	else if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_0B");	//Služebníka Beliara si nemůžu s nikým splést...
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_0C");	//Další ztracená duše z Bratrstva...
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_0D");	//Další žoldák, jak ses sem dostal?!
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_01");	//Už dlouho jsem tu neviděl královské vojáky...
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_02");	//Další poutník.
	};
	AI_Output(other,self,"DIA_Drax_Hallo_15_03");	//Ty jsi Drax, že? Pamatuji si tě z kolonie...
	AI_Output(self,other,"DIA_Drax_Hallo_01_04");	//Ano? Vlastně si tě taky pamatuji - lovili jsme u průsmyku.
	AI_Output(other,self,"DIA_Drax_Hallo_15_05");	//Ne každému svědčil Starý tábor.
	AI_Output(self,other,"DIA_Drax_Hallo_01_06");	//Sídlo rudobaronů než padla bariéra!
	AI_Output(self,other,"DIA_Drax_Hallo_01_07");	//Škoda, že Raven to přežil.

	if(RavenIsDead == TRUE)
	{
		AI_Output(other,self,"DIA_Drax_Hallo_15_08");	//Mýlíš se, našel jsem ho a zabil.
		AI_Output(self,other,"DIA_Drax_Hallo_01_09");	//No, to ti snad ani nevěřím!
		AI_Output(self,other,"DIA_Drax_Hallo_01_10");	//To je snad Ravenův prsten!

		if(Npc_HasItems(other,ITMI_RAVENGOLDRING) >= 1)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_Drax_Hallo_15_11");	//Na, můžeš si ho nechat!
			B_GiveInvItems(other,self,ITMI_RAVENGOLDRING,1);
			Npc_RemoveInvItems(self,ITMI_RAVENGOLDRING,1);
			AI_Output(self,other,"DIA_Drax_Hallo_01_12");	//Aaa, tak ten hajzl to koupil, díky bratře.
			AI_Output(other,self,"DIA_Drax_RavenRing_15_00");	//Tak a co za ten prsten dostanu?
			AI_Output(self,other,"DIA_Drax_RavenRing_01_01");	//Myslíš za problémy které jsi s tím měl... (smích) No, proč ne? Pro dobrého člověka všechno.
			AI_Output(self,other,"DIA_Drax_RavenRing_01_02");	//Samozřejmě, jen Innos ví jak se ti odvděčit - předpokládám že by to mělo stát za to.
			B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
			AI_Output(self,other,"DIA_Drax_RavenRing_01_03");	//Na vezmi si tuto starodávnou kamennou tabulku, stejně nevím co s ní.
			AI_Output(self,other,"DIA_Drax_RavenRing_01_04");	//Možná že pro ni najdeš využití.
			AI_Output(other,self,"DIA_Drax_RavenRing_01_05");	//Aáá tak za tu ti děkuji!
			DRAXHASRING = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Drax_Hallo_15_13");	//... Prodal jsem ho.
			AI_Output(self,other,"DIA_Drax_Hallo_01_14");	//Hmm.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Drax_Hallo_15_15");	//Však se to brzy změní.
		AI_Output(self,other,"DIA_Drax_Hallo_01_16");	//Už aby to bylo.
		AI_Output(self,other,"DIA_Drax_Hallo_01_17");	//Přines mi pak jeho prsten.
		AI_Output(self,other,"DIA_Drax_Hallo_01_18");	//Zaplatím ti ho!
		MIS_RavenRing = LOG_Running;
		Log_CreateTopic(TOPIC_RavenRing,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RavenRing,LOG_Running);
		B_LogEntry(TOPIC_RavenRing,"Drax mě poprosil o Ravenův prsten, jako důkaz jeho smrti.");
	};
};

instance DIA_DRAX_RAVENRING(C_Info)
{
	npc = xbs_7509_drax;
	nr = 1;
	condition = dia_drax_ravenring_condition;
	information = dia_drax_ravenring_info;
	permanent = FALSE;
	description = "Mám Ravenův prsten!";
};

func int dia_drax_ravenring_condition()
{
	if((MIS_RavenRing == LOG_Running) && (DRAXHASRING == FALSE) && (Npc_HasItems(hero,ITMI_RAVENGOLDRING) >= 1))
	{
		return TRUE;
	};
};

func void dia_drax_ravenring_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Drax_RavenRing_01_06");	//Mám Ravenův prsten!
	AI_Output(self,other,"DIA_Drax_RavenRing_01_07");	//Opravdu?
	AI_Output(other,self,"DIA_Drax_Hallo_15_11");		//Zde je - prohlížej si ho jak jen chceš dlouho. Můžeš si ho dokonce nechat.
	B_GiveInvItems(other,self,ITMI_RAVENGOLDRING,1);
	Npc_RemoveInvItems(self,ITMI_RAVENGOLDRING,1);
	AI_Output(self,other,"DIA_Drax_Hallo_01_12");		//(přemýšlí) Ano, konečně někdo sejmul toho parchanta! No, děkuji ti kamaráde.
	AI_Output(other,self,"DIA_Drax_RavenRing_15_00");	//Dostanu za ten prstýnek něco?
	AI_Output(self,other,"DIA_Drax_RavenRing_01_01");	//No a proč ne.
	AI_Output(self,other,"DIA_Drax_RavenRing_01_02");	//Něco ti dám.
	B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
	AI_Output(self,other,"DIA_Drax_RavenRing_01_03");	//Vezmi si tuto tabulku, ty pro ni najdeš využití.
	AI_Output(self,other,"DIA_Drax_RavenRing_01_04");	//Může ti zvednout obratnost, jestli jí porozumíš.
	AI_Output(other,self,"DIA_Drax_RavenRing_01_05");	//Díky!
	DRAXHASRING = TRUE;
	MIS_RavenRing = LOG_Success;
	Log_SetTopicStatus(TOPIC_RavenRing,LOG_Success);
	B_LogEntry(TOPIC_RavenRing,"Přinesl jsem Draxovi Ravenův prsten.");
	AI_StopProcessInfos(self);
};

instance DIA_DRAX_KAPITEL4(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = dia_drax_kapitel4_condition;
	information = dia_drax_kapitel4_info;
	permanent = FALSE;
	description = "Neprošli tudy nedávno skřeti?";
};

func int dia_drax_kapitel4_condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void dia_drax_kapitel4_info()
{
	AI_Output(other,self,"DIA_Drax_Kapitel4_15_00");	//Neprošli tudy nedávno skřeti?
	AI_Output(self,other,"DIA_Drax_Kapitel4_01_01");	//Neprošli - proběhli. Nějak jim vadí ten les.
	AI_Output(self,other,"DIA_Drax_Kapitel4_01_02");	//Celá tlupa skřetů. Ani se neotočili pelášili se schovat za palisádu, jen se jim za patami prášilo.
	AI_Output(other,self,"DIA_Drax_Kapitel4_15_03");	//Rozumím.
};

instance DIA_DRAX_CAMPER(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = dia_drax_camper_condition;
	information = dia_drax_camper_info;
	permanent = FALSE;
	description = "A kdo je tu s vámi?";
};

func int dia_drax_camper_condition()
{
	if(!Npc_KnowsInfo(other,dia_camper01_hallo) && (Npc_IsDead(camper_7501) == FALSE) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void dia_drax_camper_info()
{
	AI_Output(other,self,"DIA_Drax_Camper_15_00");	//A kdo je tu s vámi?
	AI_Output(self,other,"DIA_Drax_Camper_01_01");	//Je to týpek z tábora, co se nachází někde na severu.
	AI_Output(self,other,"DIA_Drax_Camper_01_02");	//Zval nás k nim. Říká, že tam mají nějakého mága nebo proroka - a spokojený život.

	if(Npc_IsDead(ratford))
	{
		AI_Output(self,other,"DIA_Drax_Camper_01_03");	//Ale mě je to jedno, my tady máme taky klid.
		AI_Output(self,other,"DIA_Drax_Camper_01_04");	//Ani mi nevadí, že tu nikdo není.
		AI_Output(self,other,"DIA_Drax_Camper_01_05");	//Teda kromě Ratforda, ale ten toho moc nenamluví.
	}
	else
	{
		AI_Output(self,other,"DIA_Drax_Camper_01_06");	//A co mě do toho, mě je tady taky dobře.
	};
};

instance DIA_DRAX_GOHOME(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = DIA_DRAX_GOHOME_condition;
	information = DIA_DRAX_GOHOME_info;
	permanent = FALSE;
	description = "A co vy tady?";
};

func int DIA_DRAX_GOHOME_condition()
{
	if((Kapitel >= 5) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DRAX_GOHOME_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_DRAX_GOHOME_01_00");	//A co vy tady?
	AI_Output(self,other,"DIA_DRAX_GOHOME_01_01");	//Máme tady co potřebujem! Ticho a klid.
	AI_Output(self,other,"DIA_DRAX_GOHOME_01_02");	//A ještě jsem slyšel, že skřeti opět útočí na hrad. A kdo ví co mají dalšího v úmyslu!
	AI_Output(self,other,"DIA_DRAX_GOHOME_01_03");	//A jedno vím jistě - sem se jen tak nevrátí.
	AI_Output(other,self,"DIA_DRAX_GOHOME_01_04");	//A co zde děláte celé dny?
	AI_Output(self,other,"DIA_DRAX_GOHOME_01_05");	//Stojíme na stráži. Samozřejmě ne v kuse. Na střídačku s Ratfordem.
	AI_Output(self,other,"DIA_DRAX_GOHOME_01_06");	//Pozorujeme okolí abychom mohli dát signál. Kdyby se skřeti přiblížili do blízkosti našeho tábora.
	AI_Output(other,self,"DIA_DRAX_GOHOME_01_07");	//No, nezařídili jste si to špatně.
};

instance DIA_DRAX_WHOCAP(C_Info)
{
	npc = xbs_7509_drax;
	nr = 1;
	condition = DIA_DRAX_WHOCAP_condition;
	information = DIA_DRAX_WHOCAP_info;
	permanent = FALSE;
	description = "Nevíš, jestli mezi vámi není nějaký námořník?";
};

func int DIA_DRAX_WHOCAP_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (RatfordAgree == FALSE) && (RatfordNeedMap == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DRAX_WHOCAP_info()
{
	AI_Output(other,self,"DIA_DRAX_WHOCAP_01_00");	//Nevíš, jestli mezi vámi není nějaký námořník?

	if(Npc_IsDead(xbs_7510_ratford) == TRUE)
	{
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_01");	//Ach, příteli...
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_02");	//Ratford kdysi býval kapitánem obchodní lodi, než ho uvrhli do kolonie.
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_03");	//No to už není důležitý. Nyní je mrtvý...
		AI_Output(other,self,"DIA_DRAX_WHOCAP_01_04");	//Kruci.
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_05");	//No jak to mám říct... Někdo by tu byl.
		AI_Output(other,self,"DIA_DRAX_WHOCAP_01_06");	//A kdo je to?
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_07");	//Je to můj přítel Ratford.
		AI_Output(other,self,"DIA_DRAX_WHOCAP_01_08");	//Myslíš to vážně?
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_09");	//Samozřejmě! On kdysi býval kapitánem obchodní lodi, než ho uvrhli do kolonie.
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_10");	//Než opilý rozbil hubu královskému exekutorovi. A tak je tady.
		AI_Output(other,self,"DIA_DRAX_WHOCAP_01_11");	//No to jste veselá kopa!
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_12");	//No a co!
		RatfordCap = TRUE;
	};
};

instance DIA_Drax_Sail(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = DIA_Drax_Sail_condition;
	information = DIA_Drax_Sail_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Drax_Sail_condition()
{
	if((RatfordAgree == TRUE) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Drax_Sail_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Drax_Sail_01_01");	//Hej, příteli... (usmívá se) Ratford mě vyprávěl, co zamýšlíš?
	AI_Output(self,other,"DIA_Drax_Sail_01_02");	//Myslí, že je to nejlepší zpráva od tý doby co jsem se ocitl za bariérou.
	AI_Output(self,other,"DIA_Drax_Sail_01_03");	//Rád bych se vrátil zpět na pevninu! 
	AI_Output(self,other,"DIA_Drax_Sail_01_04");	//Říká se, že pro někoho mazaného jako jsem já je tam dost práce. 
	AI_Output(other,self,"DIA_Drax_Sail_01_05");	//Sny se můžou splnit. Jen se nesmíš nechat znova chytit!
	AI_Output(self,other,"DIA_Drax_Sail_01_06");	//To je pravda příteli, to je pravda...
	AI_StopProcessInfos(self);
};

instance DIA_Drax_Drakar_Perm(C_Info)
{
	npc = xbs_7509_drax;
	nr = 1;
	condition = DIA_Drax_Drakar_Perm_condition;
	information = DIA_Drax_Drakar_Perm_info;
	permanent = TRUE;
	description = "Jak se ti líbí na lodi?";
};

func int DIA_Drax_Drakar_Perm_condition()
{
	if((MoveDracarBoard == TRUE) && (DraxOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Drax_Drakar_Perm_info()
{
	AI_Output(other,self,"DIA_Drax_Drakar_Perm_01_00");	//Jak se ti líbí na lodi?
	AI_Output(self,other,"DIA_Drax_Drakar_Perm_01_01");	//V pohodě, jen kdyby Ratford už opravil to zatracený kormidlo!
	AI_Output(self,other,"DIA_Drax_Drakar_Perm_01_02");	//A pak v noci, když zavřu oči vidím v každém koutu skřety.
	AI_Output(other,self,"DIA_Drax_Drakar_Perm_01_03");	//V klidu příteli, myslím že skřeti se tu jen tak neukážou.
	AI_Output(self,other,"DIA_Drax_Drakar_Perm_01_04");	//Ach... (vzdychne) Chtěl bych mít tvoji víru.
};
