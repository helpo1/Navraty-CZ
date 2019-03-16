
instance DIA_Addon_Farim_EXIT(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 999;
	condition = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Farim_PICKPOCKET(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 900;
	condition = DIA_Addon_Farim_PICKPOCKET_Condition;
	information = DIA_Addon_Farim_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Farim_PICKPOCKET_Condition()
{
	return C_Beklauen(20,11);
};

func void DIA_Addon_Farim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,Dialog_Back,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};

func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};


instance DIA_Addon_Farim_Hallo(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Hallo_Condition;
	information = DIA_Addon_Farim_Hallo_Info;
	description = "Ty jsi rybář?";
};


func int DIA_Addon_Farim_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//Ty jsi rybář?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//(cynicky) Jak jsi to uhodl?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//Nemůžeš mě prostě nechat být?

	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//Nevykládej si to špatně, ale poslední dobou mám s domobranou spoustu problémů.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//Nevykládej si to špatně, ale poslední dobou mám špatnou náladu. Problémy s domobranou.
	};
};


instance DIA_Addon_Farim_MilizProbs(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MilizProbs_Condition;
	information = DIA_Addon_Farim_MilizProbs_Info;
	description = "Problémy s domobranou?";
};

func int DIA_Addon_Farim_MilizProbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Farim_MilizProbs_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//Problémy s domobranou?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//Ti šmejdi si ke mně jen tak přijdou a vezmou si, co se jim zlíbí.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//Minulý týden mi zabavili celý úlovek. Prý 'pro dobrou věc', říkali.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//Já ovšemže chápu, že teď, když farmáři přestali obchodovat s městem, se všichni musíme starat sami o sebe.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//A někdy samozřejmě lidi musí jít do postele s prázdným žaludkem. Nedivím se, že mi chtějí brát moje ryby.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//Ale jestli to tak půjde dál, ani sám se nenajím.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Dej mi všechny svoje ryby.",DIA_Addon_Farim_MilizProbs_klauen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Možná bych ti mohl pomoci.",DIA_Addon_Farim_MilizProbs_helfen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Mluvil jsi o tom s paladiny?",DIA_Addon_Farim_MilizProbs_paladine);
};

func void DIA_Addon_Farim_MilizProbs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//Mluvil jsi o tom s paladiny?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//(směje se) To si děláš srandu? Myslíš, že je zajímá, že nějaký chudák jako já má problémy s domobranou?
};


var int Farim_PissedOff;

func void DIA_Addon_Farim_MilizProbs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//Dej mi všechny svoje ryby.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//(naštvaně) Věděl jsem to. Další z těch parchantů.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//Obávám se, že jdeš pozdě. Tvoji kámoši mi všechno vzali už včera.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//Myslím, že bys měl radši jít.
	Farim_PissedOff = TRUE;
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
};

func void DIA_Addon_Farim_MilizProbs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//Možná bych ti mohl pomoci.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//Nevím. Musel bys znát někoho z domobrany, kdo má jistý vliv na paladiny.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//Ačkoliv paladinové moje ryby jen stěží vykoupí.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//Uvidím, co se dá dělat.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Log_CreateTopic(TOPIC_Addon_FarimsFish,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish,LOG_Running);
	B_LogEntry(TOPIC_Addon_FarimsFish,"Rybář Farim má problémy s domobranou. Berou mu tolik ryb, až sám nemá co jíst. Musím najít někoho z domobrany, kdo má jistý vliv u paladinů a pomůže mu.");
	MIS_Addon_Farim_PaladinFisch = LOG_Running;
};


instance DIA_Addon_Farim_MartinHelps(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MartinHelps_Condition;
	information = DIA_Addon_Farim_MartinHelps_Info;
	description = "Vím, jak vyřešit tvé problémy s domobranou.";
};


func int DIA_Addon_Farim_MartinHelps_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_Running) && (Martin_KnowsFarim == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Farim_MartinHelps_Info()
{
	B_GivePlayerXP(XP_Addon_Farim_PaladinFisch);
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//Vím, jak vyřešit tvé problémy s domobranou.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//A jak?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//Já jsem tady moc zřídka, abych mohl neustále sledovat tvoje ryby.
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//Ale znám někoho, kdo to dělat může.
	};
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//Martin, proviantmistr paladinů, si chce vyslechnout tvůj příběh.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//A myslíš, že může zajistit, aby mě domobrana už neotravovala?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//Říká, že ano.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//Skvěle! Díky. Moc toho nemám, ale počkej...
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//Tenhle zvláštní namodralý kámen jsem našel na jednom ostrůvku nedaleko Khorinisu.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//Nemyslím, že je nějak zvlášť cenný, ale člověk jako ty pro něj určitě najde nějaké využití.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_10");	//Kromě toho, pokud si budeš přát, ti můžu prodat nějaké ryby a vše ostatní, čím mě moře obdaruje.
	B_GiveInvItems(self,other,ItMi_Aquamarine,1);
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish,LOG_SUCCESS);
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Farim mi teď bude prodávat ryby a jiné dary moře.");
};

instance DIA_Addon_Farim_Trade(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Trade_Condition;
	information = DIA_Addon_Farim_Trade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};

func int DIA_Addon_Farim_Trade_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_SUCCESS) && Wld_IsTime(7,0,22,0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};

instance DIA_Addon_Farim_Landstreicher(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Landstreicher_Condition;
	information = DIA_Addon_Farim_Landstreicher_Info;
	description = "Můžeš mi říct něco o zmizelých lidech?";
};

func int DIA_Addon_Farim_Landstreicher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Farim_Landstreicher_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//Můžeš mi říct něco o zmizelých lidech?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//Můj kamarád Wiliam se začal scházet s různými pochybnými živly. A kam ho to dovedlo?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//Jednoho dne prostě nepřišel do práce a od té doby jsem ho neviděl.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


instance DIA_Addon_Farim_William(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_William_Condition;
	information = DIA_Addon_Farim_William_Info;
	description = "Tvůj kamarád William zmizel?";
};


func int DIA_Addon_Farim_William_Condition()
{
	if((SCKnowsFarimAsWilliamsFriend == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Farim_William_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//Tvůj kamarád William zmizel?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//Jo. Je to taky rybář, jenže si o sobě namýšlí trochu moc.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//Měl se radši od těch chlápků držet dál.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	Log_AddEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	Info_ClearChoices(DIA_Addon_Farim_William);
	Info_AddChoice(DIA_Addon_Farim_William,"Co to bylo za lidi?",DIA_Addon_Farim_William_typen);
	Info_AddChoice(DIA_Addon_Farim_William,"Jsem si jistý, že se znovu objeví.",DIA_Addon_Farim_William_auftauchen);
	Info_AddChoice(DIA_Addon_Farim_William,"Co měl za lubem?",DIA_Addon_Farim_William_WasGemacht);
	Info_AddChoice(DIA_Addon_Farim_William,"Kdys ho viděl naposledy?",DIA_Addon_Farim_William_WannWeg);
};

func void DIA_Addon_Farim_William_WasGemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//Co měl za lubem?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//William dělal s těmi podvodníky nějaké pochybné obchody.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//Myslím, že jim prodával nějaké pašované zboží.
};

func void DIA_Addon_Farim_William_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//Co to bylo za lidi?
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//Nevím, co jsou zač ani co dělali tady na Khorinisu.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//Můžu ti říct jen to, kde se setkali s Williamem.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//Jednou jsem ho tam zahlédl, když jsem rybařil v zátoce.
	Info_AddChoice(DIA_Addon_Farim_William,"Kde se přesně setkali?",DIA_Addon_Farim_William_Wo);
};

func void DIA_Addon_Farim_William_Wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//Kde se přesně setkali?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//Naproti přístavu je na severu malá zátoka.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//Můžeš se tam dostat jen na lodi nebo tam doplavat.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//Je na ní pláž a malý rybářský tábor. Tam jsem je viděl.
	self.flags = 0;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Rybář Farim postrádá svého kamaráda Williama. Farim říká, že William se setkával s nějakými hrdlořezy na pláži severně od přístavu.");
	Info_AddChoice(DIA_Addon_Farim_William,"Myslím jsem slyšel vše, co jsem chtěl vědět.",DIA_Addon_Farim_William_Tschau);
};

func void DIA_Addon_Farim_William_WannWeg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//Kdys ho viděl naposledy?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//Před několika dny.
	Info_AddChoice(DIA_Addon_Farim_William,"Nešel jenom rybařit někam dál na moře?",DIA_Addon_Farim_William_Fischen);
};

func void DIA_Addon_Farim_William_Fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//Nešel jenom rybařit někam dál na moře?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//To asi ne. Jeho loď pořád kotví v přístavu.
};

func void DIA_Addon_Farim_William_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//Jsem si jistý, že se znovu objeví.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//To si nemyslím. Už je pryč příliš dlouho.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//Bojím se, že jednoho dne z moře vylovím jeho mrtvolu.
};

func void DIA_Addon_Farim_William_Tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//Myslím jsem slyšel vše, co jsem chtěl vědět.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//Nedělej si s tím starosti. Nemyslím, že ho ještě najdeš.
	Info_ClearChoices(DIA_Addon_Farim_William);
};


instance DIA_Addon_Farim_Perm(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 99;
	condition = DIA_Addon_Farim_Perm_Condition;
	information = DIA_Addon_Farim_Perm_Info;
	permanent = TRUE;
	description = "Jak berou?";
};

func int DIA_Addon_Farim_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo) && (FARIMRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Jak berou?

	if(Farim_PissedOff == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//Přestaň dělat, že tě to zajímá.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//Bejvávalo líp. Přežít je teď těžké, zato umřít se dá lehko.
	};
};


instance DIA_Addon_Farim_WilliamReport(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 1;
	condition = DIA_Addon_Farim_WilliamReport_Condition;
	information = DIA_Addon_Farim_WilliamReport_Info;
	important = TRUE;
};


func int DIA_Addon_Farim_WilliamReport_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_William))
	{
		if((Npc_HasItems(other,ITWr_Addon_William_01) > 0) || (Saturas_AboutWilliam == TRUE))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void DIA_Addon_Farim_WilliamReport_Info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//Ach, to si zase ty!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//Nějaké novinky o Williamovi?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//Je mrtvý.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//(povzdech) Ano, to jsem čekal.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//Díky, žes mi to přišel říct.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//Půjdu do krčmy a za jeho podíl na našem posledním úlovku se napiju - on by to tak chtěl...
};

instance DIA_Addon_Farim_Uha(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Uha_condition;
	information = DIA_Addon_Farim_Uha_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Addon_Farim_Uha_condition()
{
	if(MIS_Addon_Farim_PaladinFisch == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Uha_info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Uha_01_01");	//Počkej chvíli...
	AI_Output(other,self,"DIA_Addon_Farim_Uha_01_02");	//Copak ještě?
	AI_Output(self,other,"DIA_Addon_Farim_Uha_01_03");	//Neměl bys náhodou trochu času, aby sis vyslechl starého muže?
	Info_ClearChoices(DIA_Addon_Farim_Uha);
	Info_AddChoice(DIA_Addon_Farim_Uha,"Promiň, mám práci.",DIA_Addon_Farim_Uha_no);
	Info_AddChoice(DIA_Addon_Farim_Uha,"Jistěže mám.",DIA_Addon_Farim_Uha_yes);
};

func void DIA_Addon_Farim_Uha_no()
{
	AI_Output(other,self,"DIA_Addon_Farim_Uha_no_01_00");	//Promiň, mám práci.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_no_01_01");	//Dobrá, promiň, že jsem zase obtěžoval...
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Farim_Uha_yes()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Farim_Uha_yes_01_01");	//Jistěže mám.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_02");	//Víš, je tady jedna záležitost... (pokašlává) Nějak jsem se roznemohl.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_03");	//Každý den všechna ta práce ve vodě se sítěmi, rybami...
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_04");	//Zdá se, že jsem se na průvanu nachladil. Ale musím pracovat, abych nějak přežil.
	AI_Output(other,self,"DIA_Addon_Farim_Uha_yes_01_05");	//Můžu ti tedy nějak pomoct?
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_06");	//Pamatuju si, že ještě jako mladík jsem jedl vynikající polévku - ne jen tak ledajakou, ale speciální!
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_07");	//Kromě ryb v ní byl i nějaký starý sýr, houby a bylinky. To vše ještě dochucené červeným pepřem.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_08");	//Sníš polévku - a cítíš, že ti okamžitě začíná pronikat až do morku kostí! Pak se cítíš jako hrdina, i když jen chvilku.
	AI_Output(other,self,"DIA_Addon_Farim_Uha_yes_01_09");	//Tak v čem je problém? Vezmi si ty přísady a uvař tu svou speciální polévku.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_10");	//Ano, to bych rád... kdybych věděl jak!
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_12");	//Prostě nejsem schopen si ten zázrak uvařit sám, ale sílu nabrat musím.
	AI_Output(other,self,"DIA_Addon_Farim_Uha_yes_01_13");	//Dobře, staříku, pomůžu ti.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_14");	//Tak si vezmi alespoň tyhle ryby. Doufám, že mi dokážeš pomoci - a dlužen ti určitě nezůstanu.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_15");	//Věř mi, že svoje díky dovedu vyjádřit - po nedávné bouři mi moře přineslo mnoho zajímavých věcí.
	B_GiveInvItems(self,other,ItFo_Fish,5);
	MIS_FARIM_QUEST = LOG_Running;
	Log_CreateTopic(TOPIC_ADDON_FARIMFISH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FARIMFISH,LOG_Running);
	B_LogEntry(TOPIC_ADDON_FARIMFISH,"Rybář Farim mě požádal, abych mu uvařil speciální rybí polévku.");
	Info_ClearChoices(DIA_Addon_Farim_Uha);
};


instance DIA_Addon_Farim_Uha_Done(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Uha_Done_condition;
	information = DIA_Addon_Farim_Uha_Done_info;
	permanent = FALSE;
	description = "Přinesl jsem ti tvou speciální polévku.";
};

func int DIA_Addon_Farim_Uha_Done_condition()
{
	if((Npc_HasItems(hero,itfo_schildkroetesoup_sborka) >= 1) && (MIS_FARIM_QUEST == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Uha_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Farim_Uha_Done_01_01");	//Přinesl jsem ti tvou speciální polévku.
	B_GiveInvItems(other,self,itfo_schildkroetesoup_sborka,1);
	AI_Output(self,other,"DIA_Addon_Farim_Uha_Done_01_02");	//Ach, díky, kamaráde... (pokašlává) To je přesně to, co teď potřebuju!
	AI_Output(self,other,"DIA_Addon_Farim_Uha_Done_01_03");	//Promiň mi tu neurvalost, ale nemůžu se dočkat, až ji znovu okusím.
	B_UseItem(self,itfo_schildkroetesoup_sborka);
	AI_Output(self,other,"DIA_Addon_Farim_Uha_Done_01_04");	//Hmm, tak chutné... Nu, vyber si svou odměnu.
	KNOWS_UHA = TRUE;
	MIS_FARIM_QUEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ADDON_FARIMFISH,LOG_SUCCESS);
	B_LogEntry(TOPIC_ADDON_FARIMFISH,"Donesl jsem Farimovi polévku. Byl velice vděčný a za mou snahu se mi bohatě odměnil.");
	Info_ClearChoices(DIA_Addon_Farim_Uha_Done);
	Info_AddChoice(DIA_Addon_Farim_Uha_Done,"Dej mi černou perlu.",DIA_Addon_Farim_Uha_Done_Gemchug);
	Info_AddChoice(DIA_Addon_Farim_Uha_Done,"Dej mi ty lastury a škeble, které si našel po bouři.",DIA_Addon_Farim_Uha_Done_Grebni);
};

func void DIA_Addon_Farim_Uha_Done_Gemchug()
{
	AI_Output(other,self,"DIA_Addon_Farim_Uha_Done_Gemchug_01_01");	//Dej mi černou perlu.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_Done_Gemchug_01_02");	//Tady máš.
	B_GiveInvItems(self,other,ItMi_DarkPearl,1);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Farim_Uha_Done_Grebni()
{
	AI_Output(other,self,"DIA_Addon_Farim_Uha_Done_Grebni_01_01");	//Dej mi ty lastury a škeble, které si našel po bouři.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_Done_Grebni_01_02");	//Tady máš.
	B_GiveInvItems(self,other,ItMi_Addon_Shell_01,10);
	B_GiveInvItems(self,other,ItMi_Addon_Shell_02,5);
	AI_StopProcessInfos(self);
};

instance DIA_FARIM_RECRDTSUGG(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 8;
	condition = dia_farim_recrdtsugg_condition;
	information = dia_farim_recrdtsugg_info;
	permanent = FALSE;
	description = "Tak co ryby? Berou?";
};

func int dia_farim_recrdtsugg_condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_SUCCESS) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_farim_recrdtsugg_info()
{
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_15_00");	//Tak co ryby? Berou?
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_01");	//Och, neptej se. Nebo mi naskáče vyrážka.
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_15_02");	//Máš hodně špatný háček?
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_03");	//Chytit něco dobrýho právě teď. Sezóna, víš.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_04");	//Jo, jak udělat zlo, moje ryby nikdo nechce.
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_15_05");	//Proč?
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_06");	//Tys to neslyšel? Ve městě byl jednou skandál.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_07");	//Některá děvka z horní čtvrti četla hodně exotický recepty, a pak se rozhodla se svými přáteli že něco z toho ukuchtí.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_08");	//Koupila si moje ryby a začala s nima vařit ty... její...
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_09");	//Ale to je mi jedno! Důležitý je že všechny ti její hnusy byly ze syrových ryb. Představ si, syrových!
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_10");	//No, jakýkémukoli člověku je jasné že ryby se potřebují buď usmažit, vařit nebo dusit.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_11");	//Jak myslíš že to může chutnat za syrova? Je to tak nechutné, co...
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_12");	//To jsem odbočil.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_13");	//Ta mladá žena nakoupila ryby a začala vařit ty sračky, myslím že potom si pozvala všechny ty hosty.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_14");	//Samozřejmě že po večeři to se všema začalo dělat divy.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_15");	//A kdo je na vině, že ženy nemají mozek?
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_16");	//No samozřejmě, rybář Farim!
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_17");	//Věc se má tak, v celém městě rozvonila že mám nekvalitní ryby.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_18");	//I lordu Andremu a místodržícímu promlouvala do duše.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_19");	//Naštěstí lord Andre není hloupý člověk a neposlouchal ji. 
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_20");	//Celé město v průběhu spousty let jedli moje ryby, najednou přijde nějaká fúrie a její hloupý feká... všude křičí 'Prodává špatné ryby'! To proto že je...! 
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_21");	//Nicméně většina občanů poslouchá idioty tohodle typu.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_22");	//Někdo mě dokonce začal obviňovat, že přidávám do ryb nějaké 'géemó', a prej kvůli tomuto 'géemu' jejich žábry pak přestávají růst.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_23");	//Jinými slovy, teď sedím s rybami ale bez zákazníků a zlata.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_24");	//A chtěl bys něco?
	Info_ClearChoices(dia_farim_recrdtsugg);
	Info_AddChoice(dia_farim_recrdtsugg,"Ne, jen jsem se ptal.",dia_farim_recrdtsugg_no);
	Info_AddChoice(dia_farim_recrdtsugg,"Koupím si ryby.",dia_farim_recrdtsugg_yes);
};

func void dia_farim_recrdtsugg_no()
{
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_No_15_00");	//Ne, jen jsem se ptal.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_No_99_01");	//Ach... opravdu jsem si myslel... v pořádku.
	AI_StopProcessInfos(self);
};

func void dia_farim_recrdtsugg_yes()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_00");	//Koupím si ryby.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_01");	//O, to není problém. Kolik bys chtěl? Jednu, dvě? Jestli chceš pět, máš je mít.
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_02");	//Tys mě úplně nepochopil. Budu kupovat všechny tvé ryby.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_03");	//Eee... všechny ryby? Ale to přece nesníš vše sám! Vypadáš jako sportovec!
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_04");	//Já nejsem sám. Je nás mnoho. Potřebuju pravidelný dodávky potravin pro můj tábor.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_05");	//Máte tábor? Kde?
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_06");	//V blízkosti Onara.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_06");	//To není špatné! Rád pomůžu.
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_07");	//Ryby se budou dodávat do tábora. Zajímalo by mě kolik ryb můžete pro tábor zajistit na den a jaká je cena?
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_07");	//Záleží na úlovku. Ale tucet ulovím minimálně tak se nebojte. Cena jedné ryby - pět mincí za každou.
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_08");	//Ujednáno.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_08");	//No tak uvidíme v táboře.
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	FARIMRECRUITEDDT = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Farim poskytne táboru ryby.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_FARIM_INTOWER(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 22;
	condition = dia_farim_intower_condition;
	information = dia_farim_intower_info;
	permanent = TRUE;
	description = "Berou?";
};

func int dia_farim_intower_condition()
{
	if((FARIMRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_farim_intower_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Berou?
	AI_Output(self,other,"DIA_Farim_InTower_01_01");	//Excelentně! A co je důležité - znovu mám komu prodávat ryby.
};

instance DIA_FARIM_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 22;
	condition = dia_farim_intower_orckap_condition;
	information = dia_farim_intower_orckap_info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};

func int dia_farim_intower_orckap_condition()
{
	if((FARIMRECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE))
	{
		return TRUE;
	};
};

func void dia_farim_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Farim_InTower_OrcKap_15_00");	//Všechno v pořádku?
	AI_Output(self,other,"DIA_Farim_InTower_OrcKap_01_01");	//Och, člověče. Kdybych nesouhlasil s tvým návrhem asi bych byl už mrtvej. Děkuju.
};