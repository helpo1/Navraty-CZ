
instance DIA_Dragon_Ice_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Ice_Exit_Condition;
	information = DIA_Dragon_Ice_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Ice_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Ice_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Ice_Exit_20_00");	//Síla Oka vyhasla a tvůj čas vypršel.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;

	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};

	Wld_SpawnNpcRange(hero,IceGolem_Dragon,2,500);
};


instance DIA_Dragon_Ice_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Ice_Hello_Condition;
	information = DIA_Dragon_Ice_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Ice_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
	return 0;
};

func void DIA_Dragon_Ice_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_00");	//Proč rušíš můj odpočinek? To se musím věčně zahrabávat na stále vzdálenějších místech jen proto, aby mě taková protivná havěť jako ty nechala na pokoji?
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_01");	//Mluvící drak. Požehnáno buď Innosovo oko.
	};
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_02");	//Vy lidé jste podivná stvoření. I když vás smete ledový vichr smrti, vždycky se najde někdo, kdo povstane z popela a myslí si o sobě, že je mu dáno být hrdinou.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_03");	//Ale to brzo skončí. Osobně dohlédnu na to, aby nikdo z vás už nikdy z ničeho nepovstal.
	AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_04");	//Ticho. S mocí posvátného Oka, jež mi byla propůjčena, si můžu dovolit zeptat se tě na pár věcí.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_05");	//Ha ha ha. Jen se ptej. Tvé vědomosti ti nebudou k ničemu.
};


instance DIA_Dragon_Ice_WERBISTDU(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Ice_WERBISTDU_Condition;
	information = DIA_Dragon_Ice_WERBISTDU_Info;
	description = "Kdo jsi?";
};


func int DIA_Dragon_Ice_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Ice_Hello))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Ice_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Ice_WERBISTDU_20_01");	//Jsem Finkregh. Pán ledu a sněhu, strážce shromáždění a koneckonců i tvá smrt.
};

func void B_AssignDragonTalk_Ice(var C_Npc slf)
{
	DIA_Dragon_Ice_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

