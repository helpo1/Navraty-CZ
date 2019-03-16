
instance DIA_Addon_Owen_EXIT(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 999;
	condition = DIA_Addon_Owen_EXIT_Condition;
	information = DIA_Addon_Owen_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Owen_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Owen_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Owen_PICKPOCKET(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 900;
	condition = DIA_Addon_Owen_PICKPOCKET_Condition;
	information = DIA_Addon_Owen_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Owen_PICKPOCKET_Condition()
{
	return C_Beklauen(20,30);
};

func void DIA_Addon_Owen_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Owen_PICKPOCKET,Dialog_Back,DIA_Addon_Owen_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Owen_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Owen_PICKPOCKET_DoIt);
};

func void DIA_Addon_Owen_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
};

func void DIA_Addon_Owen_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
};


instance DIA_Addon_Owen_Hello(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 1;
	condition = DIA_Addon_Owen_Hello_Condition;
	information = DIA_Addon_Owen_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Owen_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Owen_Hello_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_00");	//Všechno v pořádku?
	AI_Output(self,other,"DIA_Addon_Owen_Hello_13_01");	//A ty jsi KDO? Jsi jedním z banditů?
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_02");	//Vypadám tak?
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_PIR_M_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_L_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_H_Addon) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_03");	//Nosíš naše oblečení, ale neznám tě.
	}
	else if((Hlp_IsItem(itm,ItAr_BDT_M) == TRUE) || (Hlp_IsItem(itm,ItAr_BDT_H) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_04");	//Kdybych měl být upřímný, řekl bych ti, abys to udělal.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_05");	//Ne. Jak se tak dívám na tvoje šaty, tak bych řekl, že jsi zdaleka.
	};
};


instance DIA_Addon_Owen_WasMachen(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 2;
	condition = DIA_Addon_Owen_WasMachen_Condition;
	information = DIA_Addon_Owen_WasMachen_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Owen_WasMachen_Condition()
{
	if(Malcom_Accident == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Owen_WasMachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_WasMachen_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_01");	//Jsem dřevorubec a sekám dříví pro náš tábor.
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_02");	//Vláčím se sem za touto vyčerpávající prací a jiní si lenoší na slunci.
};


instance DIA_Addon_Owen_Perm(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 99;
	condition = DIA_Addon_Owen_Perm_Condition;
	information = DIA_Addon_Owen_Perm_Info;
	permanent = TRUE;
	description = "Co jiného?";
};


func int DIA_Addon_Owen_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_WasMachen) || Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Owen_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Perm_15_00");	//Co jiného?
	AI_Output(self,other,"DIA_Addon_Owen_Perm_13_01");	//Pokud bych všehno tohle věděl dřív, nestal bych se pirátem.
};


instance DIA_Addon_Owen_Henry(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 3;
	condition = DIA_Addon_Owen_Henry_Condition;
	information = DIA_Addon_Owen_Henry_Info;
	permanent = TRUE;
	description = "Henry čeká na doručení dřava na palisádu.";
};


func int DIA_Addon_Owen_Henry_Condition()
{
	if((MIS_Henry_HolOwen == LOG_Running) && (Owen_ComesToHenry == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Owen_Henry_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Henry_15_00");	//Henry čeká na doručení dřava na palisádu.
	if(MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_01");	//První chci vědět, co se stalo s mým kámošem Malcomem.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_02");	//Dobře, dobře. Přesvědčím se, jestli dostane to jeho hloupé dřevo.
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_03");	//Jdi zpátky a vyřiď mu to.
		B_LogEntry(TOPIC_Addon_HolOwen,"Řekl jsem Henrymu, že Owen tu dodávku dřeva doručí.");
		AI_StopProcessInfos(self);
		Owen_ComesToHenry = TRUE;
	};
};


instance DIA_Addon_Owen_MalcomStunt(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 1;
	condition = DIA_Addon_Owen_MalcomStunt_Condition;
	information = DIA_Addon_Owen_MalcomStunt_Info;
	description = "Co je?";
};


func int DIA_Addon_Owen_MalcomStunt_Condition()
{
	if(Malcom_Accident == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Owen_MalcomStunt_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomStunt_15_00");	//Co je?
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_01");	//Můj kámoš Malcom pořád chybí.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_02");	//Zaútočil na nás jeden z těch číhavců.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_03");	//Tak jsme se schovali do této jeskyně.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_04");	//Bohužel ten číhavec přišel za námi.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_05");	//Malcom s ním bojoval a pak s ním spadl tady to té díry.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_06");	//Vypadá to, že je tam voda.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_07");	//Malcom s číhavcem ještě chvíli bojovali. Potom ale nastalo úplné ticho.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_08");	//Nemám tušení jestli je ještě na živu nebo ne.
	Log_CreateTopic(TOPIC_Addon_MalcomsStunt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MalcomsStunt,LOG_Running);
	B_LogEntry(TOPIC_Addon_MalcomsStunt,"Owen chce vědět, jestli jeho kamarád Malcom stále žije. Spadl totiž s číhavcem do hluboké propasti vedle tábora.");
	Log_AddEntry(TOPIC_Addon_MalcomsStunt,"Owen říkal, že je tam dole vodopád a že Malcom byl ještě chvíli na živu. Ale krátce na to bylo všude ticho.");
	MIS_Owen_FindMalcom = LOG_Running;
};


instance DIA_Addon_Owen_runter(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 2;
	condition = DIA_Addon_Owen_runter_Condition;
	information = DIA_Addon_Owen_runter_Info;
	description = "Jak bych se mohl dostat do té štěrbiny?";
};

func int DIA_Addon_Owen_runter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt) && (MIS_Owen_FindMalcom == LOG_Running) && (Npc_HasItems(Malcom,ItWr_TwoHStonePlate3_Addon) > 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Owen_runter_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_runter_15_00");	//Jak bych se mohl dostat do té štěrbiny?
	AI_Output(self,other,"DIA_Addon_Owen_runter_13_01");	//Kdo ví. Ale hádal bych, že jedině šplháním nebo skákáním.
};


instance DIA_Addon_Owen_MalcomDead(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 3;
	condition = DIA_Addon_Owen_MalcomDead_Condition;
	information = DIA_Addon_Owen_MalcomDead_Info;
	description = "Tvůj kámoš Malcom je mrtvý.";
};

func int DIA_Addon_Owen_MalcomDead_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt) && (MIS_Owen_FindMalcom == LOG_Running) && (Npc_HasItems(Malcom,ItWr_TwoHStonePlate3_Addon) == 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Owen_MalcomDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomDead_15_00");	//Tvůj kámoš Malcom je mrtvý.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_01");	//Toho jsem se obával. Chudák. Měl jsem mu pomoct.
	if(SC_MadeStunt == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_02");	//Máš opravdu odvahu, víš to?
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_03");	//Nikdy bych to nemohl udělat.
	};
	B_LogEntry(TOPIC_Addon_MalcomsStunt,"Informoval jsem Owena o Malcomově smrti. Vzal to docela dobře.");
	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Owen_MalcomDead);
};

