
instance DIA_Dragon_Fire_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Fire_Exit_Condition;
	information = DIA_Dragon_Fire_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Fire_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Fire_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Fire_Exit_20_00");	//Oko ztratilo svou moc a ty se nedočkáš příštího dne.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;

	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};

	Wld_SpawnNpcRange(hero,FireGolem_Dragon,2,500);
};


instance DIA_Dragon_Fire_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Fire_Hello_Condition;
	information = DIA_Dragon_Fire_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Fire_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
	return FALSE;
};

func void DIA_Dragon_Fire_Hello_Info()
{
	Wld_SendTrigger("FIREDRAGON_GATE");
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_00");	//Prostě nemůžu uvěřit, že opravdu ještě existují lidé, kteří jsou ochotni obětovat svůj život jen proto, aby na vlastní oči viděli draka.
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_01");	//Jsi docela výřečný - na takovou neskladnou obludu.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_02");	//Nepřišel jsem se obdivovat tvému zevnějšku. Mám poněkud radikálnější úmysly, je mi líto.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_03");	//Nechceš tím říct, že se mi hodláš postavit?
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_04");	//Ha ha ha. Zlomím ti ten tvůj hubený krček.
	AI_PlayAni(hero,"T_INNOSEYE");
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_05");	//Ne tak rychle, příteli. Mám u sebe Innosovo oko. Nemůžeš odolat mé moci.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_06");	//(řve) Arrgh. Tak se pochlub s těmi tvými otázkami, dokud můžeš. Tvá moc nebude mít dlouhého trvání.
};


instance DIA_Dragon_Fire_WerBistDu(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Fire_WerBistDu_Condition;
	information = DIA_Dragon_Fire_WerBistDu_Info;
	description = "Kdo jsi?";
};


func int DIA_Dragon_Fire_WerBistDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Fire_Hello))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Fire_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_01");	//Jmenuju se Feomathar, a to je vše, co se o mně dozvíš.
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_02");	//Jakmile uniknu účinkům kouzla Oka, užiješ si žáru pořádného plamene.
};


instance DIA_Dragon_Fire_HORT(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Fire_HORT_Condition;
	information = DIA_Dragon_Fire_HORT_Info;
	description = "Tak kde máš ty své poklady?";
};


func int DIA_Dragon_Fire_HORT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Fire_Hello))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Fire_HORT_Info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_HORT_15_00");	//Každý drak má skrýš, ve které schovává své poklady. Takže, kde ta skrýš je?
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_01");	//Na místě, na které se nemůžeš dostat, protože já se nakonec zbavím řetězů toho Oka.
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_02");	//Vzal jsem svůj poklad nahoru na žhavé útesy, které lze nazvat všelijak, jenom ne přístupnými neokřídlenému človíčkovi, jako jsi ty.
};

func void B_AssignDragonTalk_Fire(var C_Npc slf)
{
	DIA_Dragon_Fire_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_WerBistDu.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_HORT.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

