
instance DIA_Addon_Raven_EXIT(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 999;
	condition = DIA_Addon_Raven_EXIT_Condition;
	information = DIA_Addon_Raven_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

instance DIA_Addon_Raven_Hi(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 1;
	condition = DIA_Addon_Raven_Hi_Condition;
	information = DIA_Addon_Raven_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Raven_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_Hi_Info()
{
	if(RavenDoorClosed == FALSE)
	{
		Wld_SendTrigger("EVT_ADANOS_ROOM_RAVENPRAY");
		RavenDoorClosed = TRUE;
	};

	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//Á, podívejme se, kdo to sem přišel.

	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(other,ItMi_TempelTorKey) >= 1)
	{
		Npc_RemoveInvItems(other,ItMi_TempelTorKey,1);
	};

	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//Můj pán mě varoval, že Innos na mě pošle svého oblíbence.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//Neočekával jsem tě ale tak brzy.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//Dobře, nyní když jsi tu tak rychle,(směje se) můžu tě ujistit, že i tvá smrt bude rychlá.
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Ty jsi ten, kdo zemře!",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Tys zaprodal svou duši Beliarovi!",DIA_Addon_Raven_Hi_Soul);
};

func void DIA_Addon_Raven_Hi_DU()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//Ty jsi ten, kdo zemře!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//(posměšně) Ty pro mě nejsi hrozba. Já ovládám Beliarův dráp.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//Já povedu draky na pevninu. Společně pak přinesem temnotu na svět lidí.
};

func void DIA_Addon_Raven_Hi_Soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//Tys zaprodal svou duši Beliarovi!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//Byl to ale dobrý obchod. Budu hlavním vůdcem jeho armád.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//A ty? Jaká je cena za TVOU duši?
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"To stačí, slyšel jsem dost...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Dělám pouze to, co musí být uděláno.",DIA_Addon_Raven_Hi_only);
};

func void DIA_Addon_Raven_Hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//Dělám pouze to, co musí být uděláno.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//(posměšně) Poslouchej ho. Opravdový služebník Innosův! (hlasitý smích)
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"To stačí, slyšel jsem dost...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Jsi si jistý, že jsem Innosův služebník?",DIA_Addon_Raven_Hi_Sure);
};

func void DIA_Addon_Raven_Hi_Sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//Jsi si jistý, že jsem Innosův služebník?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//Co? O čem to mluvíš?
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//A co když jsem služebník Adana?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//(posměšně) Nesmysl!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//Možná 'JÁ' také sloužím Beliarovi - nebo pouze sám sobě.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//(posmívá se) Dobře, když je to tak, pak pro mě nejsi vůbec nepřítel!
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"To stačí, slyšel jsem dost...",DIA_Addon_Raven_Hi_Attack);
};

func void DIA_Addon_Raven_Hi_Attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//To stačí, slyšel jsem dost...
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//(posmívá se) Ty fakt chceš tak rychle zemřít? Dobrá, když to tak chceš...
	AI_StopProcessInfos(self);
	RavenCanAway = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


//---------------Raven na plato------------------------------

instance DIA_BDT_2090_Addon_Raven_EXIT(C_Info)
{
	npc = BDT_2090_Addon_Raven;
	nr = 999;
	condition = DIA_BDT_2090_Addon_Raven_EXIT_Condition;
	information = DIA_BDT_2090_Addon_Raven_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_BDT_2090_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_2090_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	self.aivar[AIV_EnemyOverride] = FALSE;
};

instance DIA_BDT_2090_Addon_Raven_Hi(C_Info)
{
	npc = BDT_2090_Addon_Raven;
	nr = 1;
	condition = DIA_BDT_2090_Addon_Raven_Hi_Condition;
	information = DIA_BDT_2090_Addon_Raven_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_BDT_2090_Addon_Raven_Hi_Condition()
{
	return TRUE;
};

func void DIA_BDT_2090_Addon_Raven_Hi_Info()
{
	B_GivePlayerXP(1000);
	Wld_SendTrigger("EVT_RAVENTEMPLEDOOR_MAIN_01");

	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};

	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_01_00");	//Takže ty jsi ten, koho si Adanos vybral jako svého vyvoleného!
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_01_01");	//Upřímně řečeno, jsem zklamán tím, co vidím. Dokonce i přesto, že jsi byl schopen dostat se až sem.
	AI_Output(other,self,"DIA_BDT_2090_Addon_Raven_Hi_01_03");	//Ravene?! Takže ty jsi to zlo, o kterém mluvila stráž před chrámem?
	AI_Output(other,self,"DIA_BDT_2090_Addon_Raven_Hi_01_04");	//Mimochodem, zdá se mi to, nebo ses vůbec nezměnil od našeho posledního setkání?
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_01_05");	//Mám mnoho jmen, ale nic pro mě neznamenají. Stejně tak můj vzhled.
	AI_Output(other,self,"DIA_BDT_2090_Addon_Raven_Hi_01_06");	//Ale nosíš Beliarův dráp! A jeho poslední majitel byl rudobaron Raven.
	AI_Output(other,self,"DIA_BDT_2090_Addon_Raven_Hi_01_07");	//A vypadáš jako on. Jen trochu se změnila tvoje tvář.
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_01_08");	//Můj pán mi daroval znamení své síly a duši toho ubožáka, který se odvážil nosit tento mocný artefakt.
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_01_09");	//Ostatní se můžeš naučit od něj samotného, když se ocitneteš v říši mrtvých.
	Info_ClearChoices(DIA_BDT_2090_Addon_Raven_Hi);
	Info_AddChoice(DIA_BDT_2090_Addon_Raven_Hi,"Takže kdo opravdu jsi?",DIA_BDT_2090_Addon_Raven_Hi_Who);
};

func void DIA_BDT_2090_Addon_Raven_Hi_Who()
{
	AI_Output(other,self,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_00");	//Takže kdo opravdu jsi?
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_01");	//(Smích) Bohužel jsi nic nepochopil?
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_02");	//Podívejte se na sebe - a porozumíš, v čem se skrývá odpověď na tvoji otázku.
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_03");	//Od dávných dob, bohové bojují mezi sebou o moc na tomto světě...
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_04");	//Bojují rukou svých vyvolených zástupců, jako jsi ty a nebo já.
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_05");	//Náš střet téměř nic nevyřeší ve válce, která zuří už po více než tisíc let.
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_06");	//Ale čím méně takových jako jsi ty, mě bude křížit cestu, tím větší je pravděpodobnost, že můj pán získá konečné vítězství!
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_07");	//Je na čase zjistit, kdo dneska zvítězí a kdo upadne navždy v zapomnění!
	Info_ClearChoices(DIA_BDT_2090_Addon_Raven_Hi);
	Info_AddChoice(DIA_BDT_2090_Addon_Raven_Hi,Dialog_Ende,DIA_BDT_2090_Addon_Raven_Hi_Exit);
};

func void DIA_BDT_2090_Addon_Raven_Hi_Exit()
{
	RavenCanKill = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Summon");
	Wld_InsertNpc(Raven_Mummy_01,"FP_ROAM_RAVENGUARD_01");
	Wld_InsertNpc(Raven_Mummy_02,"FP_ROAM_RAVENGUARD_02");
	Wld_InsertNpc(Raven_Mummy_03,"FP_ROAM_RAVENGUARD_03");
	Wld_InsertNpc(Raven_Mummy_04,"FP_ROAM_RAVENGUARD_04");
};