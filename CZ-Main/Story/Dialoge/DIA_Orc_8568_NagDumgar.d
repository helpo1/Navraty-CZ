
instance DIA_Orc_8568_NagDumgar_EXIT(C_Info)
{
	npc = Orc_8568_NagDumgar;
	condition = DIA_Orc_8568_NagDumgar_exit_condition;
	information = DIA_Orc_8568_NagDumgar_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8568_NagDumgar_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8568_NagDumgar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8568_NagDumgar_Hello(C_Info)
{
	npc = Orc_8568_NagDumgar;
	condition = DIA_Orc_8568_NagDumgar_Hello_condition;
	information = DIA_Orc_8568_NagDumgar_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8568_NagDumgar_Hello_condition()
{
	if((MIS_NagDumgar == LOG_Running) && (NagDumgarInsertDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8568_NagDumgar_Hello_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Orc_8568_NagDumgar_Hello_Info_18_01");	//Další hlupák přicházet, aby tady našel jeho smrt! (škodolibě se usmívá)
	AI_Output(self,other,"DIA_Orc_8568_NagDumgar_Hello_Info_18_02");	//Pak bys možná rád vědel, že už dál nemusíš hledat, ubohej člověče. Smrt stát přímo před tebou!
	AI_Output(other,self,"DIA_Orc_8568_NagDumgar_Hello_Info_18_03");	//Chmmm. Tak ty musíš být sám strašlivý Nag-Dumgar?
	AI_Output(self,other,"DIA_Orc_8568_NagDumgar_Hello_Info_18_04");	//(hrozivě) To já sám být!
	AI_Output(other,self,"DIA_Orc_8568_NagDumgar_Hello_Info_18_05");	//No, pak je dobře, že jsem tě nemusel příliš dlouho hledat.
	AI_Output(other,self,"DIA_Orc_8568_NagDumgar_Hello_Info_18_06");	//I když já už potkal démony strašnější než jsi ty - samotného Spáče.
	AI_Output(self,other,"DIA_Orc_8568_NagDumgar_Hello_Info_18_07");	//Co?! Jak si dovoluješ zmiňovat jméno mého pána, ty všiváku!
	AI_Output(other,self,"DIA_Orc_8568_NagDumgar_Hello_Info_18_08");	//Dávno už jsem se postaral o to aby tvůj pán poputoval tam kam patří. A ty za chvilku odpochoduješ hezky za ním.
	AI_Output(self,other,"DIA_Orc_8568_NagDumgar_Hello_Info_18_10");	//Arrgh... Já tě zničím, ty mizernej červe!
	B_LogEntry(TOPIC_NagDumgar,"Našel jsem Nag-Dumgara. Teď zůstává jen vyrvat mu střeva a můžu zpátky za Ur-Thrallem.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};
