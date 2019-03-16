
func int C_SnapperDeath()
{
	if(Npc_IsDead(NewMine_Snapper1) && Npc_IsDead(NewMine_Snapper2) && Npc_IsDead(NewMine_Snapper3) && Npc_IsDead(NewMine_Snapper4) && Npc_IsDead(NewMine_Snapper5) && Npc_IsDead(NewMine_Snapper6) && Npc_IsDead(NewMine_Snapper7) && Npc_IsDead(NewMine_Snapper8))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_Fajeth_EXIT(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 999;
	condition = DIA_Fajeth_EXIT_Condition;
	information = DIA_Fajeth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fajeth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fajeth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_First(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_First_Condition;
	information = DIA_Fajeth_First_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fajeth_First_Condition()
{
	if(Garond.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_First_Info()
{
	AI_Output(self,other,"DIA_Fajeth_First_12_00");	//Kdo jsi a co tady děláš?
	AI_Output(other,self,"DIA_Fajeth_First_15_01");	//Jsem tady z rozkazu lorda Hagena.
	AI_Output(self,other,"DIA_Fajeth_First_12_02");	//Pak bys měl jít na hrad za velitelem Garondem. On vede celou tuto expedici.
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_Hallo(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_Hallo_Condition;
	information = DIA_Fajeth_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fajeth_Hallo_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Hallo_Info()
{
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_00");	//Odkud jsi přišel?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_01");	//Jsem tady na rozkaz Garonda.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_02");	//Výborně. Potřebuji nové muže.
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_03");	//Nejsem tady, abych ti pomohl.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_04");	//Ne? Tak proč jsi přišel?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_05");	//Můj úkol je zjisit, kolik jste zatím vytěžili rudy.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_06");	//Ctihodný mágu, tvá přítomnost posiluje morálku mých mužů.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_07");	//Byl bych ti velmi vděčný, kdybys nám Innosovou sílou pomohl.
		Info_AddChoice(DIA_Fajeth_Hallo,"Co potřebuješ?",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"Má mise je důležitější. Nemohu ti pomoci.",DIA_Fajeth_Hallo_KDFNein);
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_08");	//Mám udělat vše pro to, abych ochránil rudu.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_09");	//To znamená taky ochránit své lidi. Jsi ve službách Innose a království, takže poslechneš mé rozkazy.
		Info_AddChoice(DIA_Fajeth_Hallo,"Co pro tebe můžu udělat?",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"Už mám rozkazy od Garonda.",DIA_Fajeth_Hallo_MILNein);
	}
	else if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_10");	//Nevím, proč Garond posílá žoldáka, ale určitě má svůj důvod.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_11");	//Než tě ale pošlu zpět, něco pro mě uděláš.
		Info_AddChoice(DIA_Fajeth_Hallo,"Vše má svou cenu. Jestli mi zaplatíš, možná se dohodneme.",DIA_Fajeth_Hallo_SLDJa);
		Info_AddChoice(DIA_Fajeth_Hallo,"Na to nemám čas.",DIA_Fajeth_Hallo_SLDNein);
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_12");	//Nevím, proč Garond posílá místo paladinů mága Vody, ale určitě má svůj důvod.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_13");	//Ale než tě pošlu zpět, něco pro mě uděláš.
		Info_AddChoice(DIA_Fajeth_Hallo,"Co pro tebe můžu udělat?",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"Na to nemám čas.",dia_fajeth_hallo_kdwnein);
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_14");	//Nevím, proč Garond posílá místo paladinů nekromanta, ale určitě má svůj důvod.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_15");	//Ale než tě pošlu zpět, něco pro mě uděláš.
		Info_AddChoice(DIA_Fajeth_Hallo,"Co pro tebe můžu udělat?",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"Na to nemám čas.",dia_fajeth_hallo_kdmnein);
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_16");	//Nevím, proč Garond posílá místo paladinů tebe, ale určitě má svůj důvod.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_17");	//Ale než tě pošlu zpět, něco pro mě uděláš.
		Info_AddChoice(DIA_Fajeth_Hallo,"Co pro tebe můžu udělat?",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"Na to nemám čas.",dia_fajeth_hallo_seknein);
	};
};

func void DIA_Fajeth_Hallo_Tun()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_Tun_15_00");	//Co pro tebe můžu udělat?
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_01");	//Už pár dní krouží kolem našeho tábora chňapavci. Vypadají, že čekají na příležitost zaútočit.
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_02");	//Nevím, na co čekají, ale dokud jsou tady, v táboře nebude klid.
	if(Npc_IsDead(Fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_03");	//Fed je z nich na smrt vystrašenej - a ostatní trestanci taky.
	};
	if(Npc_IsDead(Bilgot) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_04");	//Koho bych měl poslat? Bilgota? Toho slabocha určitě ne.
	};
	if(Npc_IsDead(Tengron) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_05");	//Tengrona? Jistě, je dobrý válečník, ale chybí mu správná lovecká vychytralost.
	};
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_06");	//Jsi jediný, kdo to může udělat. Chci, abys zabil všechny chňapavce kolem tábora.
	MIS_Fajeth_Kill_Snapper = LOG_Running;
	Log_CreateTopic(TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FajethKillSnapper,LOG_Running);
	B_LogEntry(TOPIC_FajethKillSnapper,"Fajeth chce, abych zabil chňapavce, kteří už několik dní krouží kolem tábora.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(NewMine_Snapper7,"OW_PATH_333");
	Wld_InsertNpc(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
};

func void DIA_Fajeth_Hallo_KDFNein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDFNein_15_00");	//Má mise je důležitější. Nemohu ti pomoci.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDFNein_12_01");	//Samozřejmě, ctihodný mágu. Řeknu ti vše, co potřebuješ vědět.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void DIA_Fajeth_Hallo_MILNein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_MILNein_15_00");	//Už mám rozkazy od Garonda.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_01");	//A taky je splníš, ale až tě propustím ze svých služeb já.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_02");	//Jediné, co od tebe uslyším, je - 'co pro tebe můžu udělat'. Jasné?
};

func void DIA_Fajeth_Hallo_SLDJa()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDJa_15_00");	//Vše má svou cenu. Jestli mi zaplatíš, možná se dohodneme.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_01");	//Nejsem zvyklý obchodovat s žoldáky. Nesnáším smlouvání.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_02");	//Ale jestli to uděláš, jako znak dobré vůle ti dám sto zlatých.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_03");	//Dohodnuto?
	Fajeth_Pay = TRUE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
	Info_AddChoice(DIA_Fajeth_Hallo,"Co potřebuješ?",DIA_Fajeth_Hallo_Tun);
	Info_AddChoice(DIA_Fajeth_Hallo,"Na to nemám čas.",DIA_Fajeth_Hallo_SLDNein);
};

func void DIA_Fajeth_Hallo_SLDNein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDNein_15_00");	//Na to nemám čas.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_01");	//Ty nechceš peníze? To jsem od žoldáka nečekal.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_02");	//Jestli nám nechceš pomoci, tak řekni co tu chceš a vypadni.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void dia_fajeth_hallo_kdwnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDWNein_15_00");	//Na to nemám čas.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDWNein_12_01");	//Nu, tak to budu muset vyřešit sám. Ale díky, že jsi mě vyslechl.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void dia_fajeth_hallo_kdmnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDMNein_15_00");	//Na to nemám čas.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDMNein_12_01");	//Nu, tak to budu muset vyřešit sám. Ale díky, že jsi mě vyslechl.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void dia_fajeth_hallo_seknein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SEKNein_15_00");	//Na to nemám čas.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SEKNein_12_01");	//Nu, tak to budu muset vyřešit sám. Ale díky, že jsi mě vyslechl.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};


instance DIA_Fajeth_Leader(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_Leader_Condition;
	information = DIA_Fajeth_Leader_Info;
	permanent = FALSE;
	description = "Zabil jsem vůdce chňapavců.";
};


func int DIA_Fajeth_Leader_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER) && Npc_IsDead(NewMine_LeadSnapper))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Leader_Info()
{
	AI_Output(other,self,"DIA_Fajeth_Leader_15_00");	//Zabil jsem vůdce chňapavců.
	AI_Output(self,other,"DIA_Fajeth_Leader_12_01");	//Dobře. Bez vůdce nebudou tak nebezpeční. Snad si teď nedovolí zaútočit.
	B_GivePlayerXP(150);
};


instance DIA_Fajeth_SNAPPER_KILLED(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_SNAPPER_KILLED_Condition;
	information = DIA_Fajeth_SNAPPER_KILLED_Info;
	permanent = TRUE;
	description = "Ti chňapavci jsou minulostí.";
};


func int DIA_Fajeth_SNAPPER_KILLED_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_Running) && (C_SnapperDeath() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_SNAPPER_KILLED_Info()
{
	AI_Output(hero,self,"DIA_Fajeth_SNAPPER_KILLED_15_00");	//Ti chňapavci jsou minulostí.
	AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_01");	//Dobrá práce. Snad teď ostatní bestie pochopí náš odkaz.
	if(Fajeth_Pay == TRUE)
	{
		AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_02");	//Zasloužil sis své peníze - tady je těch sto zlatých.
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP(XP_FajethKillSnapper);
};


instance DIA_Fajeth_Running(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_Running_Condition;
	information = DIA_Fajeth_Running_Info;
	permanent = TRUE;
	description = "Jak jsou na tom tví lidé?";
};


func int DIA_Fajeth_Running_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Running_Info()
{
	AI_Output(other,self,"DIA_Fajeth_Running_15_00");	//Jak jsou na tom tví lidé?
	AI_Output(self,other,"DIA_Fajeth_Running_12_01");	//Mí lidé? Pro samý strach můžou jen stěží pracovat!
	AI_Output(self,other,"DIA_Fajeth_Running_12_02");	//Raději se o ty chňapavce postarej, než se něco stane.
};


instance DIA_Fajeth_BELOHNUNG(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 3;
	condition = DIA_Fajeth_BELOHNUNG_Condition;
	information = DIA_Fajeth_BELOHNUNG_Info;
	permanent = FALSE;
	description = "Kolik jste už vytěžili rudy?";
};


func int DIA_Fajeth_BELOHNUNG_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) || (MIS_Fajeth_Kill_Snapper == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_BELOHNUNG_Info()
{
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_00");	//Kolik jste už vytěžili rudy?
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_01");	//Řekni Garondovi, že jsme vytěžili jen dvě bedny.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_02");	//Kvůli divé zvěři jsme ztratili hodně lidí.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_03");	//Jestli Garond pošle více lidí, vytěžíme toho víc.
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_04");	//Jasně. Řeknu mu to.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_05");	//Dobře. Spoléháme na tebe. Budeme zde tak dlouho, jak budeme moci.
	Fajeth_Ore = TRUE;
	B_LogEntry(TOPIC_ScoutMine,"Fajethovi kopáči vytěžili DVĚ bedny rudy.");
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_Perm2(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_Perm2_Condition;
	information = DIA_Fajeth_Perm2_Info;
	permanent = TRUE;
	description = "Jak jde těžba?";
};


func int DIA_Fajeth_Perm2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fajeth_BELOHNUNG) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Perm2_Info()
{
	AI_Output(other,self,"DIA_Fajeth_Perm2_15_00");	//Jak jde těžba?
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_01");	//Špatně. Téměř žádný pokrok.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_02");	//Když jsme přišli, vypadalo to dobře, ale teď kluci nevytěží nic než kámen. Celkem nic, co by za tu námahu stálo.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_03");	//Ale dokud zde velím já, tak to nevzdáme.
};


instance DIA_Fajeth_ERZABBAU(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 11;
	condition = DIA_Fajeth_ERZABBAU_Condition;
	information = DIA_Fajeth_ERZABBAU_Info;
	permanent = TRUE;
	description = "Jak jde těžba?";
};


func int DIA_Fajeth_ERZABBAU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fajeth_BELOHNUNG) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_ERZABBAU_Info()
{
	AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_00");	//Jak jde těžba?
	if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_01");	//Poslední dobou je tady nějak klidněji.
		AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_02");	//Draci jsou mrtví.
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_03");	//Pak doufám že už nebude dlouho trvat, než dorazí posily. Mojich lidí pořád ubývá.
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_04");	//Podívej se sám.
	};
};


instance DIA_Fajeth_PICKPOCKET(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 900;
	condition = DIA_Fajeth_PICKPOCKET_Condition;
	information = DIA_Fajeth_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fajeth_PICKPOCKET_Condition()
{
	return C_Beklauen(56,95);
};

func void DIA_Fajeth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
	Info_AddChoice(DIA_Fajeth_PICKPOCKET,Dialog_Back,DIA_Fajeth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fajeth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fajeth_PICKPOCKET_DoIt);
};

func void DIA_Fajeth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
};

func void DIA_Fajeth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
};

