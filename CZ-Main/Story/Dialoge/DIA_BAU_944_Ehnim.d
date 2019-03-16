
instance DIA_Ehnim_EXIT(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 999;
	condition = DIA_Ehnim_EXIT_Condition;
	information = DIA_Ehnim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ehnim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ehnim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_HALLO(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 3;
	condition = DIA_Ehnim_HALLO_Condition;
	information = DIA_Ehnim_HALLO_Info;
	description = "Kdo jsi?";
};


func int DIA_Ehnim_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info()
{
	AI_Output(other,self,"DIA_Ehnim_HALLO_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_01");	//Jmenuju se Ehnim. Pracuji tady.
	if(Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill))
	{
		AI_Output(self,other,"DIA_Ehnim_HALLO_12_02");	//A támhleten prcek je můj bratr Egill.
	};
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_03");	//Už tady na farmě pracuju pro Akila několik let.
};


instance DIA_Ehnim_FELDARBEIT(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 4;
	condition = DIA_Ehnim_FELDARBEIT_Condition;
	information = DIA_Ehnim_FELDARBEIT_Info;
	description = "Jak jdou polní práce?";
};


func int DIA_Ehnim_FELDARBEIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_FELDARBEIT_Info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDARBEIT_15_00");	//Jak jdou polní práce?
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_01");	//Chceš pomoct? Támhle je další motyka. Vezmi si ji a vyraž na pole.
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_02");	//Měl by ses jen mít na pozoru před polními škůdci. Utrhnou ti ruku, ani nemrkneš.
};


instance DIA_Ehnim_FELDRAEUBER(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 5;
	condition = DIA_Ehnim_FELDRAEUBER_Condition;
	information = DIA_Ehnim_FELDRAEUBER_Info;
	description = "Proč s těmi škůdci něco neuděláte?";
};


func int DIA_Ehnim_FELDRAEUBER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_FELDARBEIT))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_FELDRAEUBER_Info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDRAEUBER_15_00");	//Proč s těmi škůdci něco neuděláte?
	AI_Output(self,other,"DIA_Ehnim_FELDRAEUBER_12_01");	//Zabil už jsem jich víc, než dokážu spočítat. Jedinej problém je, že zase přijdou další.
};


instance DIA_Ehnim_STREIT1(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 6;
	condition = DIA_Ehnim_STREIT1_Condition;
	information = DIA_Ehnim_STREIT1_Info;
	description = "Tvůj bratr mi říkal to samé.";
};


func int DIA_Ehnim_STREIT1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_FELDRAEUBER) && Npc_KnowsInfo(other,DIA_Ehnim_FELDRAEUBER) && (Npc_KnowsInfo(other,DIA_Egill_STREIT2) == FALSE) && (Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill)))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT1_Info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT1_15_00");	//Tvůj bratr mi říkal to samé.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_01");	//Co? Ta srábotka? Vždycky se vytratí hned, jak se ty bestie objeví na našem pozemku.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_02");	//Neměl by říkat takové nesmysly.
};


instance DIA_Ehnim_STREIT3(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 7;
	condition = DIA_Ehnim_STREIT3_Condition;
	information = DIA_Ehnim_STREIT3_Info;
	description = "Tvůj bratr si myslí, že se akorát vytahuješ.";
};


func int DIA_Ehnim_STREIT3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_STREIT2) && (Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill)))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT3_Info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT3_15_00");	//Tvůj bratr si myslí, že se akorát vytahuješ.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_01");	//Co? To má vážně odvahu tohle říct?
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_02");	//Raději by si měl dávat pozor, než mu uštědřím pořádnou lekci.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_03");	//Tak mu to běž říct.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_STREIT5(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 8;
	condition = DIA_Ehnim_STREIT5_Condition;
	information = DIA_Ehnim_STREIT5_Info;
	permanent = TRUE;
	description = "Mám dojem, že byste se měli oba trochu zklidnit.";
};


var int DIA_Ehnim_STREIT5_noPerm;

func int DIA_Ehnim_STREIT5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_STREIT4) && (Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill)) && (DIA_Ehnim_STREIT5_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT5_Info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_15_00");	//Mám dojem, že byste se měli oba trochu zklidnit.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_01");	//Ten bastard to ještě nevzdal, co?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_02");	//Já ho roztrhnu. Řekni mu to.
	Info_ClearChoices(DIA_Ehnim_STREIT5);
	Info_AddChoice(DIA_Ehnim_STREIT5,"Dělej si, co chceš. Odcházím.",DIA_Ehnim_STREIT5_gehen);
	Info_AddChoice(DIA_Ehnim_STREIT5,"Proč mu to neřekneš sám?",DIA_Ehnim_STREIT5_Attack);
};

func void DIA_Ehnim_STREIT5_Attack()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_Attack_15_00");	//Proč mu to neřekneš sám?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_Attack_12_01");	//To přesně udělám.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;

	AI_StopProcessInfos(self);
	DIA_Ehnim_STREIT5_noPerm = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack(self,Egill,AR_NONE,0);
	B_GivePlayerXP(XP_EgillEhnimStreit);
};

func void DIA_Ehnim_STREIT5_gehen()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_gehen_15_00");	//Dělej si, co chceš. Odcházím.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_gehen_12_01");	//Jo, jen se rychle ztrať.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_PERMKAP1(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_PERMKAP1_Condition;
	information = DIA_Ehnim_PERMKAP1_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Ehnim_PERMKAP1_Condition()
{
	if((DIA_Ehnim_STREIT5_noPerm == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_PERMKAP1_Info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP1_12_00");	//Chceš dělat další problémy? Mám dojem, že bude lepší, když se hned ztratíš.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_MoleRatFett(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_MoleRatFett_Condition;
	information = DIA_Ehnim_MoleRatFett_Info;
	important = TRUE;
};

func int DIA_Ehnim_MoleRatFett_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_PERMKAP1) && (DIA_Ehnim_STREIT5_noPerm == TRUE) && Npc_IsInState(self,ZS_Talk) && ((hero.guild != GIL_KDF) || (hero.guild != GIL_KDW)))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_MoleRatFett_Info()
{
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_00");	//Ty tu JEŠTĚ jsi?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_01");	//Vypadá to tak. Pořád vytočenej?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_02");	//Nic se neděje, zapomeň na to. Řekni mi, byl jsi poslední dobou na Lobartově farmě?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_03");	//Možná ano. Proč?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_04");	//Nic důležitého. Jen jsem chtěl mluvit s Vinem o jeho palírně.
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Na tohle nemám čas.",DIA_Ehnim_MoleRatFett_nein);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Palírna? Jaká palírna?",DIA_Ehnim_MoleRatFett_was);
	if(Npc_IsDead(Vino))
	{
		Info_AddChoice(DIA_Ehnim_MoleRatFett,"Vino je mrtvý.",DIA_Ehnim_MoleRatFett_tot);
	};
};

func void DIA_Ehnim_MoleRatFett_tot()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_tot_15_00");	//Vino je mrtvý.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_tot_12_01");	//Proboha. No nic. Tak to se nedá nic dělat.
};

func void DIA_Ehnim_MoleRatFett_was()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_15_00");	//Palírna? Jaká palírna?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_01");	//Asi jsem to neměl říkat. Vino byl na to své malé tajemství vždycky hodně citlivý.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_02");	//Ale teď jsem si to nechal vyklouznout. Tam vzadu v lese si Vino zařídil tajnou palírnu.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_03");	//Nedávno mě žádal o něco, čím by mohl promazat padací mříž.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_04");	//V poslední době hodně pršelo a začala ho zlobit rez. Teď je naviják zaseknutý a nikdo už se tam nedostane. Jsme v pěkné bryndě.
	Log_CreateTopic(TOPIC_FoundVinosKellerei,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FoundVinosKellerei,LOG_Running);
	B_LogEntry(TOPIC_FoundVinosKellerei,"Ehnim mi řekl, že Vino ukrývá v lesích, poblíž Akilova statku, tajnou palírnu. Ale mechanismus dveří je zadřený a dokud ho nenamažu krysokrtím sádlem, dovnitř se nedostanu.");
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"A? Máš nějaký mazivo?",DIA_Ehnim_MoleRatFett_was_Fett);
};

func void DIA_Ehnim_MoleRatFett_was_Fett()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_15_00");	//Máš nějaké mazivo?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_12_01");	//Jo, jasně. Nejlepší, co se tu dá sehnat. Krysokrtí sádlo. Příšerná věc, to ti povím. Taky se používá na promazání lodních děl.
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Prodej mi ten tuk.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill);
};


var int Ehnim_MoleRatFettOffer;

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00");	//Prodej mi ten tuk.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01");	//To nebude levné, kámaráde. V tomhle kraji to je zatraceně vzácná věc.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03");	//Hmm... 100 zlatých?
	Ehnim_MoleRatFettOffer = 100;
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"To je příliš!",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Dohodnuto.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00");	//Dohodnuto.
	if(B_GiveInvItems(other,self,ItMi_Gold,Ehnim_MoleRatFettOffer))
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01");	//Dobrá. Tady to máš.

		if(Npc_HasItems(self,ItMi_Moleratlubric_MIS))
		{
			B_GiveInvItems(self,other,ItMi_Moleratlubric_MIS,1);
			if(Npc_IsDead(Vino) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02");	//Ach... (pro sebe) Zatraceně. Vino mě zabije!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03");	//Sakra, to je mám? Tak fajn, promiň. Jak se zdá, už to nemám. Vem si své prachy zpátky.
			B_GiveInvItems(self,other,ItMi_Gold,Ehnim_MoleRatFettOffer);
			if(Npc_IsDead(Egill) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04");	//Vsadím se, za to může můj bratr. Ten bastard!
				AI_StopProcessInfos(self);
				other.aivar[AIV_INVINCIBLE] = FALSE;
				B_Attack(self,Egill,AR_NONE,0);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05");	//No to je bezvadný. Nejdřív chceš udělat velkej kšeft a pak nemáš dost prachů. Ztrať se!
	};
	AI_StopProcessInfos(self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00");	//To je příliš!
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01");	//Fajn, fajn. Tak teda 70 zlatých. Ale to je moje poslední nabídka!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	Ehnim_MoleRatFettOffer = 70;
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"To je ještě pořád moc.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"Dohodnuto.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_immernoch_15_00");	//To je ještě pořád moc.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_immernoch_12_01");	//(naštvaně) Tak si trhni. Měj se!
	AI_StopProcessInfos(self);
};

func void DIA_Ehnim_MoleRatFett_nein()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_nein_15_00");	//Na tohle nemám čas.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_nein_12_01");	//Pak tě nebudu zdržovat...
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_PERMKAP3(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_PERMKAP3_Condition;
	information = DIA_Ehnim_PERMKAP3_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Ehnim_PERMKAP3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_MoleRatFett) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_PERMKAP3_Info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP3_12_00");	//Nemám na tebe čas.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_PICKPOCKET(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 900;
	condition = DIA_Ehnim_PICKPOCKET_Condition;
	information = DIA_Ehnim_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ehnim_PICKPOCKET_Condition()
{
	return C_Beklauen(76,35);
};

func void DIA_Ehnim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
	Info_AddChoice(DIA_Ehnim_PICKPOCKET,Dialog_Back,DIA_Ehnim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ehnim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ehnim_PICKPOCKET_DoIt);
};

func void DIA_Ehnim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
};

func void DIA_Ehnim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
};

