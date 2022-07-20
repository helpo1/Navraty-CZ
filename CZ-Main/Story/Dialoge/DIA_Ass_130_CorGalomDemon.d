instance DIA_Ass_130_CorGalomDemon_EXIT(C_Info)
{
	npc = Ass_130_CorGalomDemon;
	nr = 999;
	condition = DIA_Ass_130_CorGalomDemon_exit_condition;
	information = DIA_Ass_130_CorGalomDemon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_130_CorGalomDemon_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_130_CorGalomDemon_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_130_CorGalomDemon_Hello(C_Info)
{
	npc = Ass_130_CorGalomDemon;
	nr = 1;
	condition = DIA_Ass_130_CorGalomDemon_hello_condition;
	information = DIA_Ass_130_CorGalomDemon_hello_info;
	permanent = FALSE;
	important= TRUE;
};
	
func int DIA_Ass_130_CorGalomDemon_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_130_CorGalomDemon_hello_info()
{
	if(Npc_HasItems(other,ItKe_Masiaf_Prision) >= 1)
	{
		Npc_RemoveInvItems(other,ItKe_Masiaf_Prision,1);
	};

	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_00");	//Tady je náš hrdina!
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_01");	//Opravdu jsem se nemohl dočkat našeho dalšího setkání.
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_02");	//My se známe?
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_03");	//Jistě. Copak už jsi zapomněl co se stalo v Spáčově chrámu?
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_04");	//Hmm... nech mě hádat! Cor Kalom!
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_05");	//Nezapomněl jsi...
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_06");	//To ani nejde! Zabil jsem tě! 
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_07");	//Je tomu tak. Ale síla temnot mne vrátila do tohoto světa.
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_08");	//A podle všeho se můj pán rozhodl že budu užitečnější v této démonické formě, než jako kostlivý mág.

	if(MeetDarkTempleMage == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_09");	//Myslím, že ses s ním již setkal.
		AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_10");	//Myslíš toho nekromanta? No jo...

		if(Npc_IsDead(dmt_1298_darkmage) == TRUE)
		{

			AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_11");	//... zabil jsem ho tak, jako jsem zabil a znovu zabiji tebe.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_12");	//Jsem si jistý, že se s ním znovu setkáš.
		AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_13");	//Nemohu se dočkat.
	};

	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_14");	//Raději mi odpověz na jinou otázku!
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_15");	//Proč unášíš členy Bratrstva?
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_16");	//To je jednoduché. Znáš moji vášeň pro experimenty.
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_17");	//A pro to potřebuji materiál...
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_18");	//Haniar Slepý a jeho stínové Masyafu... užiteční v získávání toho, co jsem potřeboval...
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_19");	//Za jeho služby jsem mu poskytl to, po čem toužil. Moc.
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_20");	//To mu moc nepomohlo...
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_21");	//(chmurně) Už jsem si uvědomil, že jsi ho zabil. Stejně jako mého dalšího služebníka...
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_22");	//Mimochodem, byl jen jedním z výtvorů mého výzkumu.
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_23");	//Už jsem ocenil tvoji práci. A poslal tvůj výtvor do pekla!
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_24");	//Hmm... zdá se, že tebe nemůže nic zastavit.
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_25");	//O tom se můžeš hned přesvědčit!
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_26");	//Mám to v úmyslu. Jak jsem říkal, na tohle jsem ČEKAL VELICE DLOUHO!
	Info_ClearChoices(DIA_Ass_130_CorGalomDemon_hello);
	Info_AddChoice(DIA_Ass_130_CorGalomDemon_hello,Dialog_Ende,DIA_Ass_130_CorGalomDemon_hello_Exit);
};

func void DIA_Ass_130_CorGalomDemon_hello_Exit()
{
	CorGalomDontSpeak = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
	self.aivar[AIV_EnemyOverride] = FALSE;
};	
