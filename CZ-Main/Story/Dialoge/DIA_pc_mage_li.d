
var int trd_mageli;

instance DIA_MILTEN_LI_EXIT(C_Info)
{
	npc = pc_mage_li;
	nr = 999;
	condition = dia_milten_li_exit_condition;
	information = dia_milten_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_milten_li_exit_condition()
{
	return TRUE;
};

func void dia_milten_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MAGE_LI_HELLOS(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_hellos_condition;
	information = dia_mage_li_hellos_info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int dia_mage_li_hellos_condition()
{
	return TRUE;
};

func void dia_mage_li_hellos_info()
{
	AI_Output(other,self,"DIA_Mage_LI_Ancient_01_01");	//Jak to jde?
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_02");	//Zatím dobře, ale všichni jsou otrávení po té bouři!
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_04");	//Ale ruší mě tu jedna věc. Stále mám takové tušení, že za naše přistání zaplatíme.
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_06");	//Pochop, že když jsme přistáli na pobřeží, ucítil jsem něco jako magii.
	AI_Output(other,self,"DIA_Mage_LI_Ancient_01_08");	//A co to podle tebe je?!
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_09");	//Ještě nevím... Ale je možné, že zde na ostrově žije něco, co dokáže ovládat magii prastarých.
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_10");	//A ta možnost mi nedá klidu!
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_13");	//Ale vím, že zdroj je někde na ostrově.
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_15");	//Absolutně!... Trochu blíže do středu ostrova je již to cítění obrovské.
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_21");	//Uvědomil jsem si, že jsem ve středu ostrova viděl věž!
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_22");	//Je zakrytá stromy, takže sis jí možná nevšiml.
	AI_Output(other,self,"DIA_Mage_LI_Ancient_01_24");	//Tak tu věž prozkoumám co nejdříve to bude možné!
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_26");	//Ale bojím se, že ho budeš muset uskutečnit sám.
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_30");	//Ta magie co tu cítím. Já se k věži nedostanu.
	AI_Output(other,self,"DIA_Mage_LI_Ancient_01_32");	//Dobrá, tak já se tam podívám a dám ti vědět.
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		self.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	MIS_MILTENANCIENT = LOG_Running;
	Log_CreateTopic(TOPIC_MILTENANCIENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MILTENANCIENT,LOG_Running);
	B_LogEntry(TOPIC_MILTENANCIENT,"Milten mi řekl o jedné velmi neobvyklé věci. Když udělal pár kroků ke středu ostrova, ucítil prastarou magii. Někde na ostrově je zdroj prastaré magické síly! Podle Miltena je zdroj někde ve středu ostrova. Podle Miltena v jedné staré věži v prostřed ostrova. Myslím, že bych se tam měl rychle podívat!");
};


instance DIA_MAGE_LI_ANCIENTPROGRESS(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogress_condition;
	information = dia_mage_li_ancientprogress_info;
	permanent = FALSE;
	description = "Byl jsem v tý věži.";
};


func int dia_mage_li_ancientprogress_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (Npc_HasItems(other,itwr_ancient) >= 1))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Mage_LI_AncientProgress_01_01");	//Byl jsem v tý věži.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_02");	//A co? Našel jsi něco?!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgress_01_03");	//Obávám se, že jsem v té věži nic zajímavého nenašel.
	AI_Output(other,self,"DIA_Mage_LI_AncientProgress_01_04");	//Kromě téhle knihy pojednávající o magii!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_05");	//Opravdu? Ukaž mi ji.
	B_GiveInvItems(other,self,itwr_ancient,1);
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_07");	//Hmm... (blíže prozkoumává knihu) To máš pravdu!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_08");	//Tahle kniha rozebírá podstatu síly na ostrově. Nebo tomu odpovídá název.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_11");	//Je to těžké... Potřebuji nějaký čas na porozumění.
	AI_Output(other,self,"DIA_Mage_LI_AncientProgress_01_12");	//Dobrá. A mimochodem, nedokázal jsem ji otevřít.
	AI_Output(other,self,"DIA_Mage_LI_AncientProgress_01_13");	//Vypadá to, že ta kniha je chráněna nějakým kouzlem!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_14");	//Hmm... Možná na ní objevím ještě něco, díky za varování!
	B_LogEntry(TOPIC_MILTENANCIENT,"Donesl jsem Miltenovi knihu, kterou jsem našel ve věži. Slíbil mi, že mi brzy vysvětlí co v ní stojí!");
	MILTENDEMONTIMER = Wld_GetDay();
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTWO(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogresstwo_condition;
	information = dia_mage_li_ancientprogresstwo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogresstwo_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_MILTENANCIENT == LOG_Running) && (MEANDMILTENTELEPORTDC == FALSE) && Npc_KnowsInfo(hero,dia_mage_li_ancientprogress) && (MILTENDEMONTIMER <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogresstwo_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressTwo_01_01");	//Mám nějaké novinky o té knize co jsi mi donesl.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressTwo_01_03");	//Už vím jak je možné ji otevřít! Je to lehké!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressTwo_01_05");	//Hmm... Není to nezbytné a nemyslím, že je to dobrý nápad!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressTwo_01_06");	//Čeho se bojíš?!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressTwo_01_07");	//Nebojím - jednoduše nevím, co se může stát!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressTwo_01_08");	//Je to jen obyčejné otevření knížky.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressTwo_01_09");	//Dobrá, tak když to chceš, ať je po tvém. Připraven?!
	B_LogEntry(TOPIC_MILTENANCIENT,"Milten odhalil tajemstí knihy, Nyní ji otevřeme!");
	Info_ClearChoices(dia_mage_li_ancientprogresstwo);
	Info_AddChoice(dia_mage_li_ancientprogresstwo,"No tak, otevři ji!",dia_mage_li_ancientprogresstwo_freedemon);
};

func void dia_mage_li_ancientprogresstwo_freedemon()
{
	AI_StopProcessInfos(self);
	MEANDMILTENTELEPORTDC = TRUE;
	B_UseFakeScroll();
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	Wld_SendTrigger("LI_TRIGGER_TELEPORTDC");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressthree_condition;
	information = dia_mage_li_ancientprogressthree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressthree_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (MEANDMILTENTELEPORTDC == TRUE) && (MEANDMILTENTELEPORTDCDONE == TRUE) && (Hlp_StrCmp(Npc_GetNearestWP(self),"DEM_CAVE_01") == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_info()
{
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_01");	//Funguje!... Kam jsme se to dostali?!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_03");	//Tady vidíš co se může stát když otvíráš takovéhle knihy!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressThree_01_04");	//Co budeme dělat?!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_05");	//Se ptáš mě?!... Nemám páru!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressThree_01_06");	//Tak to vypadá, že budu muset něco vymyslet.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_07");	//Jo... (pochybně)
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressThree_01_08");	//Tak pojď, prozkoumáme jeskyni.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_09");	//Dobrá.
	B_LogEntry(TOPIC_MILTENANCIENT,"Já a Milten jsme se po otevření knihy ocitli v jeskyni. Jak se odsud dostaneme?!");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE_SLEEP(C_Info)
{
	npc = pc_mage_li;
	nr = 14;
	condition = dia_mage_li_ancientprogressthree_sleep_condition;
	information = dia_mage_li_ancientprogressthree_sleep_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressthree_sleep_condition()
{
	if(((Npc_GetDistToWP(self,"EASTER_SKELETON_3") < 2000) || (Npc_GetDistToWP(self,"EASTER_SKELETON_2") < 2000) || (Npc_GetDistToWP(self,"EASTER_ASH") < 5000)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_MILTENANCIENT == LOG_Running) && (LIDEMCAVEAWAY != TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_sleep_info()
{
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_SLEEP_01_01");	//Sakra!... Co je to za ohnivý svinstvo?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_SLEEP_01_02");	//Jen jsem si chtěl něco vyzkoušet!
	AI_StopProcessInfos(self);
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE_WAIT(C_Info)
{
	npc = pc_mage_li;
	nr = 13;
	condition = dia_mage_li_ancientprogressthree_wait_condition;
	information = dia_mage_li_ancientprogressthree_wait_info;
	permanent = TRUE;
	description = "Počkej tady!";
};


func int dia_mage_li_ancientprogressthree_wait_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_MILTENANCIENT == LOG_Running) && (LIDEMCAVEAWAY != TRUE) && (MEANDMILTENTELEPORTDC == TRUE) && (MEANDMILTENTELEPORTDCDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_wait_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_WarteHier_15_00");	//Počkej tady!
	AI_Output(self,other,"DIA_Mage_LI_GoHome_11_05");	//Počkám tu poblíž.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"CAVE");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE_FOLL(C_Info)
{
	npc = pc_mage_li;
	nr = 12;
	condition = dia_mage_li_ancientprogressthree_foll_condition;
	information = dia_mage_li_ancientprogressthree_foll_info;
	permanent = TRUE;
	description = "Pojď za mnou.";
};


func int dia_mage_li_ancientprogressthree_foll_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (LIDEMCAVEAWAY != TRUE) && (MEANDMILTENTELEPORTDC == TRUE) && (MEANDMILTENTELEPORTDCDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_foll_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_ComeOn_15_00");	//Pojď za mnou.
	AI_Output(self,other,"DIA_Mage_LI_ComeOn_11_02");	//Dobře.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_MAGE_LI_ANCIENTPROGRESSDONE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressdone_condition;
	information = dia_mage_li_ancientprogressdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressdone_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (LIDEMONISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDone_01_01");	//Jsi v pořádku? Co to bylo za kreaturu?!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressDone_01_04");	//V pohodě, je to za námi.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDone_01_05");	//Jo... Jsem jenom trochu nervózní, dostal jsi nás do obrovského nebezpečí.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDone_01_06");	//Nyní bychom měli přemýšlet jak odsud - napadá tě něco?!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressDone_01_07");	//Něco jo, na začátku tunelu jsem viděl teleport.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDone_01_10");	//Tak rychle, mám z těch jeskyní mrchožroutí kůži.
	self.flags = 0;
	B_LogEntry(TOPIC_MILTENANCIENT,"Tento ostrov je plný překvapení. V té jeskyni byl temný, velký a zlý démon. Ta svině byla mnohem silnější než my, ale nakonec jsme ji s Miltenem zdolali! Když je teď démon tuhej, měli bychom se dostat z jeho doupěte.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSDONEEXT(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressdoneext_condition;
	information = dia_mage_li_ancientprogressdoneext_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressdoneext_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (LIDEMCAVEAWAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressdoneext_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_01");	//Konečně je to za náma!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_03");	//Osud nám dopřál cennou lekci!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_04");	//Můžeme být vděčni Innosovi, že jsme ještě živí!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressDoneExt_01_05");	//Takže jsi v pohodě?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_06");	//Jo, ale takovou blbost jsi se mnou udělal naposled! Něco se změnilo...
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_08");	//Už necítím z ostrova magii jako předtím!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_10");	//Pravděpodobně jo, musel být zdrojem té magie.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_11");	//Nic jiného mě nenapadlo!
	MIS_MILTENANCIENT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MILTENANCIENT,LOG_SUCCESS);
	B_LogEntry(TOPIC_MILTENANCIENT,"Něco se změnilo! Milten už necítí sílu z ostrova jako předtím! Vypadá to, že její zdroj byl ten démon.");
	MILTENDEMONTIMEREXT = Wld_GetDay();
};


instance DIA_MAGE_LI_ANCIENTPROGRESSDONEEXTBOOK(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressdoneextbook_condition;
	information = dia_mage_li_ancientprogressdoneextbook_info;
	permanent = FALSE;
	description = "Máš ještě tu knížku?";
};


func int dia_mage_li_ancientprogressdoneextbook_condition()
{
	if(MIS_MILTENANCIENT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressdoneextbook_info()
{
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressDoneExtBook_01_01");	//Máš ještě tu knížku?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExtBook_01_02");	//Ještě je u mě, proč se ptáš?
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressDoneExtBook_01_03");	//Mohl bys mi ji dát.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExtBook_01_07");	//Ale už by tě to nemělo nikam hodit.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExtBook_01_09");	//Jo, tady ji máš.
	B_GiveInvItems(self,other,itwr_ancient,1);
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExtBook_01_10");	//Doufám, že nic nevyvedeš!
};


instance DIA_MAGE_LI_ANCIENTAFTER(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientafter_condition;
	information = dia_mage_li_ancientafter_info;
	permanent = TRUE;
	description = "Změnilo se něco od posledka?";
};


func int dia_mage_li_ancientafter_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_MILTENANCIENT == LOG_SUCCESS) && (MILTENDEMONTIMEREXT <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientafter_info()
{
	AI_Output(other,self,"DIA_Mage_LI_AncientAfter_01_01");	//Změnilo se něco od posledka?
	if(MILTENJOKE == FALSE)
	{
		AI_Output(self,other,"DIA_Mage_LI_AncientAfter_01_02");	//Ne, vše je tiché a jednoduché.
		MILTENJOKE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mage_LI_AncientAfter_01_11");	//Ne... Nic!
	};
};


instance DIA_MILTEN_LI_TRADE(C_Info)
{
	npc = pc_mage_li;
	nr = 12;
	condition = dia_milten_li_trade_condition;
	information = dia_milten_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Nemůžeš postrádat pár lektvarů?";
};


func int dia_milten_li_trade_condition()
{
	return TRUE;
};

func void dia_milten_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//Nemůžeš postrádat pár lektvarů?
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//Ber, dokud jsou.

	if(TRD_MAGELI != TRUE)
	{
		CreateInvItems(self,ItPl_Temp_Herb,9);
		CreateInvItems(self,ItPl_Health_Herb_01,15);
		CreateInvItems(self,ItPl_Health_Herb_02,4);
		CreateInvItems(self,ItPl_Health_Herb_03,3);
		CreateInvItems(self,ItPl_Mana_Herb_01,13);
		CreateInvItems(self,ItPl_Mana_Herb_02,8);
		CreateInvItems(self,ItPl_Mana_Herb_03,2);
		CreateInvItems(self,ItPo_Health_02,5);
		CreateInvItems(self,ItPo_Health_03,2);
		CreateInvItems(self,ItPo_Mana_01,4);
		CreateInvItems(self,ItPo_Mana_02,2);
		CreateInvItems(self,ItMi_RuneBlank,1);
		CreateInvItems(self,ItPo_HealObsession_MIS,2);
		TRD_MAGELI = TRUE;
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	B_GiveTradeInv(self);
};


instance DIA_MILTEN_LI_TEACHMAGIC(C_Info)
{
	npc = pc_mage_li;
	nr = 31;
	condition = dia_milten_li_teachmagic_condition;
	information = dia_milten_li_teachmagic_info;
	permanent = TRUE;
	description = "Chci zlepšit mé magické dovednosti.";
};


func int dia_milten_li_teachmagic_condition()
{
	return TRUE;
};

func void dia_milten_li_teachmagic_info()
{
	AI_Output(other,self,"DIA_Milten_DI_TeachMagic_15_00");	//Chci zlepšit mé magické dovednosti.
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_03");	//Co přesně?
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_milten_li_teachmagic_mana_1);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_milten_li_teachmagic_mana_5);

	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(dia_milten_li_teachmagic,"Vytvořit runy",dia_milten_li_teachmagic_runes);
	};
};

func void dia_milten_li_teachmagic_runes()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//Ale ne! V tomhle se kdovíjak nevyznám, ale nějak si poradíme.

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(dia_milten_li_teachmagic,"4. kruh magie",dia_milten_li_teachmagic_runen_circle_4);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 5) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(dia_milten_li_teachmagic,"5. kruh magie",dia_milten_li_teachmagic_runen_circle_5);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(dia_milten_li_teachmagic,"6. kruh magie",dia_milten_li_teachmagic_runen_circle_6);
	};
};

func void dia_milten_li_teachmagic_runen_circle_4()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),dia_milten_li_teachmagic_runen_circle_4_spl_chargefireball);
	};
	if(PLAYER_TALENT_RUNES[93] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_FIRELIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FIRELIGHT)),dia_milten_li_teachmagic_runen_circle_4_spl_firelight);
	};
};

func void dia_milten_li_teachmagic_runen_circle_4_spl_chargefireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void dia_milten_li_teachmagic_runen_circle_4_spl_firelight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FIRELIGHT);
};

func void dia_milten_li_teachmagic_runen_circle_5()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);

	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),dia_milten_li_teachmagic_runen_circle_5_spl_pyrokinesis);
	};
	if(PLAYER_TALENT_RUNES[SPL_Explosion] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_Explosion,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Explosion)),dia_milten_li_teachmagic_runen_circle_5_SPL_Explosion);
	};
};

func void dia_milten_li_teachmagic_runen_circle_5_spl_pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void dia_milten_li_teachmagic_runen_circle_5_SPL_Explosion()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Explosion);
};

func void dia_milten_li_teachmagic_runen_circle_6()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);

	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),dia_milten_li_teachmagic_runen_circle_6_spl_firerain);
	};
};

func void dia_milten_li_teachmagic_runen_circle_6_spl_firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void dia_milten_li_teachmagic_back()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
};

func void dia_milten_li_teachmagic_mana_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//Innosova ruka tě chrání.
	};
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_milten_li_teachmagic_mana_1);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_milten_li_teachmagic_mana_5);
};

func void dia_milten_li_teachmagic_mana_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//Nechť ti na cestu svítí světlo Innosovo.
	};
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_milten_li_teachmagic_mana_1);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_milten_li_teachmagic_mana_5);
};


instance DIA_MAGE_LI_PICKPOCKET(C_Info)
{
	npc = pc_mage_li;
	nr = 900;
	condition = dia_mage_li_pickpocket_condition;
	information = dia_mage_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_mage_li_pickpocket_condition()
{
	return C_Beklauen(45,120);
};

func void dia_mage_li_pickpocket_info()
{
	Info_ClearChoices(dia_mage_li_pickpocket);
	Info_AddChoice(dia_mage_li_pickpocket,Dialog_Back,dia_mage_li_pickpocket_back);
	Info_AddChoice(dia_mage_li_pickpocket,DIALOG_PICKPOCKET,dia_mage_li_pickpocket_doit);
};

func void dia_mage_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_mage_li_pickpocket);
};

func void dia_mage_li_pickpocket_back()
{
	Info_ClearChoices(dia_mage_li_pickpocket);
};


instance DIA_MAGE_LI_MISSMYGOLD(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_missmygold_condition;
	information = dia_mage_li_missmygold_info;
	permanent = FALSE;
	description = "Nemáš tušení kde je moje zlato?";
};


func int dia_mage_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_mage_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Mage_LI_MissMyGold_01_01");	//Nemáš tušení kde je moje zlato?
	AI_Output(self,other,"DIA_Mage_LI_MissMyGold_01_02");	//Ne, příteli, to nevím!
	AI_Output(self,other,"DIA_Mage_LI_MissMyGold_01_05");	//Měl bys vědět - jsem mág Ohně a ne zloděj!
	AI_Output(self,other,"DIA_Mage_LI_MissMyGold_01_06");	//Nejcennější jsou pro mě vědomosti a nejvábivější jsou pro mne pak zase runy.
	B_LogEntry(TOPIC_MISSMYGOLD,"Milten neví kde je mé zlato.");
};


instance DIA_MAGE_LI_AWAY(C_Info)
{
	npc = pc_mage_li;
	nr = 3;
	condition = dia_mage_li_away_condition;
	information = dia_mage_li_away_info;
	permanent = FALSE;
	description = "Je čas vrátit se.";
};


func int dia_mage_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (MILTENLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_mage_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Mage_LI_Away_01_01");	//Je čas vrátit se.
	AI_Output(self,other,"DIA_Mage_LI_Away_01_02");	//Opouštíme ostrov?
	AI_Output(other,self,"DIA_Mage_LI_Away_01_03");	//Ano, před chvílí jsme dokončili poslední opravy lodi.
	AI_Output(self,other,"DIA_Mage_LI_Away_01_04");	//Výborně, tak na lodi.
	B_LogEntry(TOPIC_GATHERCREW,"Sdělil jsem Miltenovi, že opouštíme ostrov.");
	MILTENLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeopple) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_MAGE_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_findmagicorecave_condition;
	information = dia_mage_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem na ostrově ložisko magické rudy.";
};


func int dia_mage_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_mage_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Mage_LI_FindMagicOreCave_01_01");	//Našel jsem na ostrově ložisko magické rudy.
	AI_Output(self,other,"DIA_Mage_LI_FindMagicOreCave_01_02");	//Opravdu? To bys měl říci kapitánovi.
	AI_Output(self,other,"DIA_Mage_LI_FindMagicOreCave_01_03");	//Myslím, že ho to překvapí.
	GOTOORECAPITAN = TRUE;
};


instance DIA_MAGE_LI_CHANGECOURSE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_changecourse_condition;
	information = dia_mage_li_changecourse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_changecourse_condition()
{
	if((MIS_CHANGECOURSE == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (MIS_MILTENANCIENT != LOG_Running))
	{
		return TRUE;
	};
};

func void dia_mage_li_changecourse_info()
{
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_Mage_LI_ChangeCourse_01_00");	//Slyšel jsem správně, že chceš zpět na Khorinis informovat paladiny o rudě?!
	AI_Output(self,other,"DIA_Mage_LI_ChangeCourse_01_03");	//Hagen by se o ní měl dozvědět.
	AI_Output(other,self,"DIA_Mage_LI_ChangeCourse_01_04");	//Jdeš se mnou?!
	AI_Output(self,other,"DIA_Mage_LI_ChangeCourse_01_05");	//Samozřejmě! Je to má svatá povinnost Innosovi... (smích)
	AI_Output(self,other,"DIA_Mage_LI_ChangeCourse_01_06");	//V klášteře se ještě uvidím s ostatními mágy.
	AI_Output(self,other,"DIA_Mage_LI_ChangeCourse_01_07");	//Musím se s nimi domluvit co kdyby skřeti napadli město.
	AI_Output(other,self,"DIA_Mage_LI_ChangeCourse_01_10");	//To jsem rád, Miltene.
	B_LogEntry(TOPIC_CHANGECOURSE,"Milten je rád, že se vracíme na Khorinis!");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Už jsem mluvil se všemi chlapi, musím zpět na loď.");
	};
};

