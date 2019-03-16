
instance DIA_Dragon_Swamp_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Swamp_Exit_Condition;
	information = DIA_Dragon_Swamp_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Swamp_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Swamp_Exit_20_00");	//Moc Oka je vyčerpána. Nit tvého života tady končí, člověče.
	SwampDragon = Hlp_GetNpc(Dragon_Swamp);
	SwampDragon.flags = 0;
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;

	if(DJG_SwampParty_GoGoGo == TRUE)
	{
		if((DJG_SwampParty == TRUE) && (Npc_IsDead(DJG_Cipher) == FALSE))
		{
			B_StartOtherRoutine(DJG_Rod,"SwampDragon");
		};
		B_StartOtherRoutine(DJG_Cipher,"SwampDragon");
	};
	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};
	if(SBMODE == TRUE)
	{
		if(RealMode[2] == TRUE)
		{
			Wld_SpawnNpcRange(hero,SwampGolem,3,500);
		}
		else
		{
			Wld_SpawnNpcRange(hero,SwampGolem,2,500);
		};
	};
};


instance DIA_Dragon_Swamp_Hello(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Swamp_Hello_Condition;
	information = DIA_Dragon_Swamp_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Swamp_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_00");	//Čekají tě jen samé potíže, jestli se odvážíš ještě o krok blíž!
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_01");	//Ach. Vypadá to, že Innosovo oko funguje.
	};
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_02");	//Už přišli mnozí z tvého druhu. Všechny jsem je smetl z povrchu zemského.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_03");	//Šetři si dech. Tvá velká slova mě nemohou vyděsit, ty smrdutý zplozenče pekel.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_04");	//Řekni mi, co chci vědět, nebo tě utopím ve tvé vlastní krvi.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_05");	//Ha ha ha. Opovažuješ se mi vyhrožovat, bídný červe? Řekni mi jeden jediný důvod, proč bych tě hned teď neměl rozsekat na tisíc kousků.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_06");	//Jsem Innosův posel a mám u sebe posvátné Innosovo oko. Nemáš na výběr. Musíš se podrobit mé vůli, nebo budeš zničen.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_07");	//(řve) Arrh. Řekni, co ode mě chceš.
};


instance DIA_Dragon_Swamp_WERBISTDU(C_Info)
{
	nr = 6;
	condition = DIA_Dragon_Swamp_WERBISTDU_Condition;
	information = DIA_Dragon_Swamp_WERBISTDU_Info;
	description = "Kdo jsi?";
};


func int DIA_Dragon_Swamp_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Swamp_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Swamp_WERBISTDU_20_01");	//Jmenuju se Pandrodor. A měl bys sis dobře rozmyslet, jestli nebude lepší zalézt zpět mezi skály, odkud jsi přišel.
};


instance DIA_Dragon_Swamp_WOSINDDIEANDEREN(C_Info)
{
	nr = 7;
	condition = DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition;
	information = DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info;
	description = "Kde najdu zbytek tobě podobných odporných stvoření?";
};


func int DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00");	//Kde najdu zbytek tobě podobných odporných stvoření?
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01");	//Elementy, z nichž bylo vše stvořeno, drží tento svět pohromadě.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02");	//Každý z nich vyjadřuje schopnost ovládat část světa.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03");	//Hledej elementy a najdeš všechny ostatní.
};

func void B_AssignDragonTalk_Swamp(var C_Npc slf)
{
	DIA_Dragon_Swamp_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WOSINDDIEANDEREN.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

