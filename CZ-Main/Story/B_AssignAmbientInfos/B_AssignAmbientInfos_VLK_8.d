
instance DIA_VLK_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_8_EXIT_Condition;
	information = DIA_VLK_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_8_JOIN_Condition;
	information = DIA_VLK_8_JOIN_Info;
	permanent = TRUE;
	description = "Chci se stát občanem tohoto města!";
};


func int DIA_VLK_8_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_VLK_8_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//Chci se stát občanem tohoto města!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//A proč to říkáš mně? Zajdi za jedním z řemeslnických mistrů v dolní čtvrti. Možná, když budeš mít štěstí, bude některý z nich hledat učedníka.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//Jindy bys mohl zajít za místodržícím a nechat se zapsat do registru měšťanů.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//Ale teď na to můžeš rovnou zapomenout. Od té doby, co sem přišli paladinové, nemá místodržící žádné pravomoci.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//A jejich velitel, lord Hagen, zaručeně nemá na podobné věci čas.
};


instance DIA_VLK_8_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_8_PEOPLE_Condition;
	information = DIA_VLK_8_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo v tomhle městě požívá největší vážnosti?";
};


func int DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//Kdo v tomhle městě požívá největší vážnosti?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//Kromě paladinů... mistři řemeslnící v dolní čtvrti. Ti jsou také velmi vážení.
};


instance DIA_VLK_8_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_8_LOCATION_Condition;
	information = DIA_VLK_8_LOCATION_Info;
	permanent = TRUE;
	description = "Co zajímavého je tu k vidění?";
};


func int DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//Co zajímavého je tu k vidění?
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//V přístavu je obrovská loď, na které paladinové připluli. Je to neuvěřitelně velké plavidlo. Měl by ses na něj podívat.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//Ale nedokážu si představit, že by tě pustili na palubu. Paladinové tu loď střeží jako královské klenoty.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//Není divu. Je to také jediná plavbyschopná loď zakotvená široko daleko.
};


instance DIA_VLK_8_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_8_STANDARD_Condition;
	information = DIA_VLK_8_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//Co je nového?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_00");	//Každý se v poslední době cití nesvůj, lidé jsou nervozní.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_01");	//Jako kdyby nebylo dost, že se tu paladinové zabydleli jako doma, ale ješté i lidé stále prapodivněji mizejí.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_02");	//Už je na čase, aby s tím konečně domobrana začala něco dělat.
		if(SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
			B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
		};
		SC_HearedAboutMissingPeople = TRUE;
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//Všichni čekají na to, až paladinové oznámí, proč tu doopravdy jsou. Předpokládám, že kvůli skřetům. Určitě co nevidět zaútočí!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//Paladinové možná mají Innosovo požehnání, ale až se objeví skřeti, je s námi ámen.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//Říká se, že tu paladinové jsou jen kvůli tomu, aby dostali všechnu rudu z ostrova. Prý kvůli válce na pevnině.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//Víš, co to znamená? Královi je úplně volný, jestli tady všichni chcípneme, až skřeti zaútočí.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//Budu se snažit být na palubě, až budou paladinové zvedat kotvy.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//Říká se, že skřeti přiletí do našeho města na dracích, co jsou velcí jako půl města! Nemáme proti nic nejmenší šanci!
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//Mezi lidmi se povídá, že draci byli poraženi. Mohla by to být pravda?
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_08");	//Radši se ani neptej!
	};
};

func void B_AssignAmbientInfos_VLK_8(var C_Npc slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

