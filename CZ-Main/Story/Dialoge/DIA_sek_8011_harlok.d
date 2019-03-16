
instance DIA_HARLOK_EXIT(C_Info)
{
	npc = sek_8011_harlok;
	nr = 999;
	condition = dia_harlok_exit_condition;
	information = dia_harlok_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_harlok_exit_condition()
{
	return TRUE;
};

func void dia_harlok_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARLOK_HALLO(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_hallo_condition;
	information = dia_harlok_hallo_info;
	permanent = FALSE;
	description = "Zdravím.";
};


func int dia_harlok_hallo_condition()
{
	return TRUE;
};

func void dia_harlok_hallo_info()
{
	AI_Output(other,self,"DIA_Harlok_Hallo_01_00");	//Zdravím.
	if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_Harlok_Hallo_01_01");	//Vítám tě, bratře!
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other,"DIA_Harlok_Hallo_01_02");	//Máte můj respekt, ctihodný templáři!
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_Harlok_Hallo_01_03");	//Máte můj respekt, mistře!
	}
	else
	{
		AI_Output(self,other,"DIA_Harlok_Hallo_01_04");	//Spáč s tebou, cizinče!
	};
};


instance DIA_HARLOK_ORT(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_ort_condition;
	information = dia_harlok_ort_info;
	permanent = FALSE;
	description = "Řekni mi o tomto místu.";
};


func int dia_harlok_ort_condition()
{
	if(Npc_KnowsInfo(hero,dia_harlok_hallo) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_harlok_ort_info()
{
	AI_Output(other,self,"DIA_Harlok_Ort_01_00");	//Řekni mi o tomto místu.
	AI_Output(self,other,"DIA_Harlok_Ort_01_01");	//Dobře... Guru jsou zde asi nejdůležitější. Jsou to moudří muži. (s obdivem) Vedou naše bratry po správné cestě a učí nás.
	AI_Output(other,self,"DIA_Harlok_Ort_01_02");	//A co vás učí?
	AI_Output(self,other,"DIA_Harlok_Ort_01_03");	//Pomáhájí posílit naši duši a pochopit podstatu věcí.
	AI_Output(self,other,"DIA_Harlok_Ort_01_04");	//Ale tomu ty nemůžeš rozumět!
};


instance DIA_HARLOK_WELCOME(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_welcome_condition;
	information = dia_harlok_welcome_info;
	permanent = TRUE;
	description = "Jak je?";
};


func int dia_harlok_welcome_condition()
{
	if(Npc_KnowsInfo(hero,dia_harlok_hallo))
	{
		return TRUE;
	};
};

func void dia_harlok_welcome_info()
{
	AI_Output(other,self,"DIA_Harlok_Welcome_01_00");	//Jak je?
	if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_Harlok_Welcome_01_01");	//Velmi dobře, bratře!
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other,"DIA_Harlok_Welcome_01_02");	//Velmi dobře, ctihodný templáři!
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_Harlok_Welcome_01_03");	//Velmi dobře, mistře!
	}
	else
	{
		AI_Output(self,other,"DIA_Harlok_Welcome_01_04");	//Vše je v pořádku, cizinče.
	};
};


instance DIA_HARLOK_WORK(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_work_condition;
	information = dia_harlok_work_info;
	permanent = FALSE;
	description = "Co je tvá práce?";
};


func int dia_harlok_work_condition()
{
	if(Npc_KnowsInfo(hero,dia_harlok_hallo) && (other.guild != GIL_TPL) && (other.guild != GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_harlok_work_info()
{
	AI_Output(other,self,"DIA_Harlok_Work_01_00");	//Co je tvá práce?
	AI_Output(self,other,"DIA_Harlok_Work_01_01");	//Starám se o nováčky. Dávám pozor, aby nedělali nějaké problémy.
	AI_Output(self,other,"DIA_Harlok_Work_01_02");	//U nás v Bratrstvu panujou přísné zákony! A pro mnohé je těžké si na ně zvyknout.
	AI_Output(self,other,"DIA_Harlok_Work_01_03");	//A občas se stanou nějaké nepřijemnosti.
	AI_Output(self,other,"DIA_Harlok_Work_01_04");	//Obzvláště cizincům, jako jsi ty.
	AI_Output(other,self,"DIA_Harlok_Work_01_05");	//A co když se mi taková nepřijemnost stane?
	AI_Output(self,other,"DIA_Harlok_Work_01_06");	//Pokud budeš mít někdy problémy s někým z Bratrstva, jdi za Baalem Orunem.
	AI_Output(self,other,"DIA_Harlok_Work_01_07");	//Pomůže ti je urovnat.
};


instance DIA_HARLOK_HARWR(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_harwr_condition;
	information = dia_harlok_harwr_info;
	permanent = FALSE;
	description = "Chtěl bych se přidat do vašeho tábora. Můžeš mi nějak pomoci?";
};


func int dia_harlok_harwr_condition()
{
	if((PSI_TALK == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_harlok_harwr_info()
{
	AI_Output(other,self,"DIA_Harlok_HarWr_01_00");	//Chtěl bych se přidat do vašeho tábora. Můžeš mi nějak pomoci?
	AI_Output(self,other,"DIA_Harlok_HarWr_01_01");	//Tak ty by ses se k nám chtěl přidat? Moudré rozhodnutí!
	AI_Output(self,other,"DIA_Harlok_HarWr_01_02");	//Jistěže bych ti mohl pomoci... (přemýšlí), samozřejmě, pokud mi prokážeš jednu malou službičku.
	AI_Output(self,other,"DIA_Harlok_HarWr_01_04");	//Řekni mi, mluvil jsi už s Talasem?
	Info_ClearChoices(dia_harlok_harwr);
	Info_AddChoice(dia_harlok_harwr,"Ne.",dia_harlok_harwr_nein);
	Info_AddChoice(dia_harlok_harwr,"Ano.",dia_harlok_harwr_ja);
};

func void dia_harlok_harwr_ja()
{
	AI_Output(self,other,"DIA_Harlok_HarWr_Ja_07_00");	//Pak bys měl dostat denní dávku drogy. Pokud mi ji dáš, pokusím se ti pomoci.
	AI_Output(other,self,"DIA_Harlok_HarWr_Ja_15_01");	//Budu o tom přemýšlet.
	HARLOK_BRINGJOINTS = LOG_Running;
	Log_CreateTopic(TOPIC_HARLOKJOINPSI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARLOKJOINPSI,LOG_Running);
	B_LogEntry(TOPIC_HARLOKJOINPSI,"Harlok by si rád vzal mou dávku drogy, kterou jsem dostal od Talase.");
	Info_ClearChoices(dia_harlok_harwr);
};

func void dia_harlok_harwr_nein()
{
	AI_Output(self,other,"DIA_Harlok_HarWr_Nein_07_00");	//Tak běž a získej denní dávku. Pokud mi ji pak dáš, pomohu ti.
	AI_Output(other,self,"DIA_Harlok_HarWr_Nein_15_01");	//Budu o tom přemýšlet.
	HARLOK_BRINGJOINTS = LOG_Running;
	Log_CreateTopic(TOPIC_HARLOKJOINPSI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARLOKJOINPSI,LOG_Running);
	B_LogEntry(TOPIC_HARLOKJOINPSI,"Harlok by si rád vzal mou dávku drogy, kterou jsem dostal od Talase.");
	Info_ClearChoices(dia_harlok_harwr);
};


instance DIA_HARLOK_JOINTSRUNNING(C_Info)
{
	npc = sek_8011_harlok;
	nr = 5;
	condition = dia_harlok_jointsrunning_condition;
	information = dia_harlok_jointsrunning_info;
	permanent = TRUE;
	description = "Mám tu tři stébla. Vezmi si je.";
};


func int dia_harlok_jointsrunning_condition()
{
	if((HARLOK_BRINGJOINTS == LOG_Running) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_harlok_jointsrunning_info()
{
	AI_Output(other,self,"DIA_Harlok_JointsRunning_15_00");	//Mám tu tři stébla. Vezmi si je.
	if(Npc_HasItems(other,ItMi_Joint) >= 3)
	{
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_01");	//Dobře, mělo by ti být jasné, že nikdo z Guru s tebou nechce mluvit.
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_02");	//Abys to změnil, tak na ně musíš zapůsobit. Řeknu ti jak.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_03");	//Jak můžu udělat dojem na Guru?
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_04");	//Baal Namib učí své žáky Spáčově magii.
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_05");	//Pokud chceš, aby si tě všiml, použij magii.
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_06");	//Ale hlavně nepoužívej na nikoho Větrnou pěst! Raději uspi jednoho z jeho žáků.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_07");	//Ale kde získám svitek Spáčovy magie?
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_08");	//Baal Tyon prodává runy a magické svitky, ale jen Guru. Ale mám jiný návrh.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_09");	//Jaký?
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_10");	//Mám u sebe jeden svitek Spánku. Myslím, že bych ti ho mohl prodat.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_11");	//Kolik za něj chceš?
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_12");	//No, řekněme... (přemýšlí)... Vzhledem k tomu, jak moc bude pro tebe užitečné...
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_13");	//...500 zlatých mi bude stačit.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_14");	//COŽE? Za jeden svitek 500 zlatých?
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_15");	//No, já ti to jen nabízím. Nemusíš to kupovat...
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_16");	//Ale nemysli si, že slevním!
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_17");	//Pokud se rozhodneš koupit ho, řekni mi.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_18");	//Budu o tom přemýšelt.
		B_GiveInvItems(other,self,ItMi_Joint,3);
		HARLOK_BRINGJOINTS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_HARLOKJOINPSI,LOG_SUCCESS);
		B_GivePlayerXP(50);
	}
	else
	{
		AI_Output(self,other,"DIA_Harlok_JointsRunning_NO_JOINTS_07_00");	//Mám pocit, že sme se dohodli na třech stéblech nemyslíš? Dones mi je, a pak ti pomohu!
	};
};


instance DIA_HARLOK_TRADESCROLL(C_Info)
{
	npc = sek_8011_harlok;
	nr = 5;
	condition = dia_harlok_tradescroll_condition;
	information = dia_harlok_tradescroll_info;
	permanent = TRUE;
	description = "Prodej mi ten svitek.";
};


func int dia_harlok_tradescroll_condition()
{
	if((HARLOK_BRINGJOINTS == LOG_SUCCESS) && (TRADE_HARLOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_harlok_tradescroll_info()
{
	AI_Output(other,self,"DIA_Harlok_TradeScroll_07_00");	//Prodej mi ten svitek.
	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		B_GiveInvItems(other,self,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Harlok_TradeScroll_07_01");	//Dobře, tady ho máš.
		AI_Output(self,other,"DIA_Harlok_TradeScroll_07_02");	//Doufám, že ti nemusím vysvětlovat, jak ho použít.
		B_GiveInvItems(self,other,ItSc_Sleep,1);
		TRADE_HARLOK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Harlok_TradeScroll_07_03");	//Ale vždyť nemáš dost peněz!
		AI_Output(self,other,"DIA_Harlok_TradeScroll_07_04");	//Vrať se, až budeš mít pětset zlatých!
	};
};


instance DIA_HARLOK_SEKTEHEILEN(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_sekteheilen_condition;
	information = dia_harlok_sekteheilen_info;
	permanent = FALSE;
	description = "Napij se, pomůže ti od bolehlavu.";
};


func int dia_harlok_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_harlok_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Harlok_SekteHeilen_01_00");	//Napij se, pomůže ti od bolehlavu.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Harlok_SekteHeilen_01_01");	//Bolest hlavy je pryč!
	AI_Output(self,other,"DIA_Harlok_SekteHeilen_01_02");	//Děkuji ti!
};

