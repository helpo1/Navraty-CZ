instance DIA_Ass_178_Prior_ArchDemon_EXIT(C_Info)
{
	npc = Ass_178_Prior_ArchDemon;
	nr = 999;
	condition = DIA_Ass_178_Prior_ArchDemon_exit_condition;
	information = DIA_Ass_178_Prior_ArchDemon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_178_Prior_ArchDemon_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_178_Prior_ArchDemon_exit_info()
{
	AI_StopProcessInfos(self);
};

var int GonsHere;

instance DIA_Ass_178_Prior_ArchDemon_Hello(C_Info)
{
	npc = Ass_178_Prior_ArchDemon;
	nr = 1;
	condition = DIA_Ass_178_Prior_ArchDemon_hello_condition;
	information = DIA_Ass_178_Prior_ArchDemon_hello_info;
	permanent = FALSE;
	important= TRUE;
};
	
func int DIA_Ass_178_Prior_ArchDemon_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_178_Prior_ArchDemon_hello_info()
{
	if((GonsalesPW_Up == TRUE) && (GonsalesIsDead == FALSE))
	{
		Npc_ExchangeRoutine(NONE_1190_Assasin,"Temple");
		AI_Teleport(NONE_1190_Assasin,"PW_OUT_TO_IN_CHAMBERS");
		Wld_SendTrigger("EVT_CAM_02");
		GonsHere = TRUE;
		AI_Wait(self,20);
	};

	AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_00");	//Takže se ti nakonec podařilo dostat na toto místo. Tím hůř pro tebe.
	AI_Output(other,self,"DIA_Ass_178_Prior_ArchDemon_hello_01_01");	//Mně se neschováš.
	AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_02");	//Jsi asi hlupák, že takhle tvrdohlavě hledáš svoji smrt.
	AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_03");	//Můj mistr mě varoval, že dříve jsi byl dobrý válečník, který porazil velkého démona.
	AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_04");	//Ale teď už nevyhraješ. Protože je tu se mnou síla a moc samotného Beliara!

	if(GonsHere == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_05");	//Aha. Vidím, že tvůj přítel Gonzales je zde taky.
		AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_06");	//Ten budižkničemu ti nepomůže!
		AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_07");	//Zemřete tu společně, protože jste prodali naše bratrstvo! 
	};
	if(MIS_RebelsWeapon == LOG_RUNNING)
	{
		MIS_RebelsWeapon = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_RebelsWeapon);
	};

	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Ass_178_Prior_ArchDemon_hello_01_08");	//Dost keců. Ve jménu Beliara!
	Info_ClearChoices(DIA_Ass_178_Prior_ArchDemon_hello);
	Info_AddChoice(DIA_Ass_178_Prior_ArchDemon_hello,Dialog_Ende,DIA_Ass_178_Prior_ArchDemon_hello_Exit);
};

func void DIA_Ass_178_Prior_ArchDemon_hello_Exit()
{
	var C_Npc Gonsales;

	Gonsales = Hlp_GetNpc(NONE_1190_Assasin);
	Gonsales.attribute[ATR_HITPOINTS] = Gonsales.attribute[ATR_HITPOINTS_MAX];
	Gonsales.aivar[AIV_PARTYMEMBER] = TRUE;
	PlayerIsPrioratFake = TRUE;
	HaniarOrderKill = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	B_Attack(Gonsales,self,AR_KILL,1);
};
