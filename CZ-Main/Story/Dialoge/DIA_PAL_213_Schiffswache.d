
instance DIA_Pal_213_Schiffswache_EXIT(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 999;
	condition = DIA_Pal_213_Schiffswache_EXIT_Condition;
	information = DIA_Pal_213_Schiffswache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pal_213_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pal_213_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Pal_213_Checkpoint = "SHIP_DECK_09";

instance DIA_Pal_213_Schiffswache_FirstWarn(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 1;
	condition = DIA_Pal_213_Schiffswache_FirstWarn_Condition;
	information = DIA_Pal_213_Schiffswache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_FirstWarn_Condition()
{
	if((MIS_ShipIsFree == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00");	//Stůj! Kam si myslíš, že jdeš.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01");	//Chtěl jsem...
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02");	//Promiň, ale tudy jít nemůžeš.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03");	//Tady není nic k vidění, zmiz.
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Pal_213_Schiffswache_SecondWarn(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 2;
	condition = DIA_Pal_213_Schiffswache_SecondWarn_Condition;
	information = DIA_Pal_213_Schiffswache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_SecondWarn_Condition()
{
	if((MIS_ShipIsFree == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Pal_213_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_SecondWarn_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00");	//Ani krok dál, nedělám výjimky.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01");	//Ty si se mnou nechceš nic začít, mám pravdu?
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Pal_213_Schiffswache_Attack(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 3;
	condition = DIA_Pal_213_Schiffswache_Attack_Condition;
	information = DIA_Pal_213_Schiffswache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_Attack_Condition()
{
	if((MIS_ShipIsFree == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Pal_213_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_Pal_213_Schiffswache_GoOnBoard(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 5;
	condition = DIA_Pal_213_Schiffswache_GoOnBoard_Condition;
	information = DIA_Pal_213_Schiffswache_GoOnBoard_Info;
	permanent = FALSE;
	description = "Potřebuji se dostat na loď.";
};


func int DIA_Pal_213_Schiffswache_GoOnBoard_Condition()
{
	return TRUE;
};

func void DIA_Pal_213_Schiffswache_GoOnBoard_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00");	//Potřebuji se dostat na loď
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01");	//Nikdo nesmí na loď, mám své rozkazy!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02");	//Zabiju každého, kdo se pokusí nalodit bez pověření.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03");	//Ve jménu Innose budu loď bránit svým životem.
};


instance DIA_Pal_213_Schiffswache_IAmKDF(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF_Info;
	permanent = FALSE;
	description = "Máš pochybnosti o mágovi Ohně?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF_15_00");	//Máš pochybnosti o mágovi Ohně?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01");	//(nervózně) Ne, samozřejmě že ne. Innos mi odpusť
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02");	//Mágové Ohně - střeží moudrost Innose.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03");	//(nervózně) ... kdo by o nich pochyboval, pochybuje o Innosovi.
};


instance DIA_Pal_213_Schiffswache_IAmKDF2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF2_Info;
	permanent = FALSE;
	description = "Co se stane, když vstoupím na palubu?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF2_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF2_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00");	//Co se stane, když vstoupím na palubu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01");	//(nervózně) Zabiju tě... Teda, jako že tě zastavím.
};


instance DIA_Pal_213_Schiffswache_IAmKDF3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF3_Info;
	permanent = FALSE;
	description = "Opravdu chceš napadnout mága Ohně?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF3_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF2))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF3_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00");	//Opravdu chceš napadnout mága Ohně?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01");	//Ne, nikdy bych nenapadl mága (nervózní).
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02");	//Takže co uděláš když vejdu na palubu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03");	//(schlíple) Nic, pane.
};


instance DIA_Pal_213_Schiffswache_IAmKDF4(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF4_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF4_Info;
	permanent = FALSE;
	description = "Takže, jdu na palubu.";
};


func int DIA_Pal_213_Schiffswache_IAmKDF4_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF3))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF4_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00");	//Takže, jdu na palubu.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01");	//(nervózně) To nesmíš, Hagen to zakázal.
};


instance DIA_Pal_213_Schiffswache_IAmKDF5(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF5_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF5_Info;
	permanent = FALSE;
	description = "Zahrnujou Hagenovi rozkazy i mě?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF5_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF4))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF5_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00");	//Zahrnujou Hagenovi rozkazy i mě?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01");	//(nervózně) Nevím.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02");	//Myslíš si, že lord by si o mágovi myslel že je zloděj?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03");	//Ne...
};


instance DIA_Pal_213_Schiffswache_IAmKDF6(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF6_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF6_Info;
	permanent = FALSE;
	description = "Naposledy: Pusť mě na loď!";
};


func int DIA_Pal_213_Schiffswache_IAmKDF6_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF5))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF6_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00");	//Naposledy: Pusť mě na loď!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01");	//Dobře, můžeš vstoupit na palubu.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw_condition;
	information = dia_pal_213_schiffswache_iamkdw_info;
	permanent = FALSE;
	description = "Chceš skřížit zbraně s mágem Vody?";
};


func int dia_pal_213_schiffswache_iamkdw_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDW_15_00");	//Chceš skřížit zbraně s mágem Vody?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW_01_01");	//Ne, samozřejmě že ne, Adanos mi odpusť!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW_01_02");	//Vražda služebníka Vody je zločin!... (nervózně) Kdo by něco podobného udělal, zasloužil by jen smrt!
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw2_condition;
	information = dia_pal_213_schiffswache_iamkdw2_info;
	permanent = FALSE;
	description = "Co se stane když vejdu na palubu?";
};


func int dia_pal_213_schiffswache_iamkdw2_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdw))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDW2_15_00");	//Co se stane když vejdu na palubu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW2_01_01");	//(nervózně) Zabiju tě... Teda, jako že tě zastavím.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw3_condition;
	information = dia_pal_213_schiffswache_iamkdw3_info;
	permanent = FALSE;
	description = "Když teda vstoupím, tak spácháš hřích vraždy mága?";
};


func int dia_pal_213_schiffswache_iamkdw3_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdw2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDW3_15_00");	//Když teda vstoupím, tak spácháš hřích vraždy mága?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW3_01_01");	//Nikdy bych nenapadl královského mága...
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDW3_15_02");	//Takže co se stane když vejdu na palubu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW3_01_03");	//Nic... (tiše)
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW4(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw4_condition;
	information = dia_pal_213_schiffswache_iamkdw4_info;
	permanent = FALSE;
	description = "Jdu na palubu.";
};


func int dia_pal_213_schiffswache_iamkdw4_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdw3))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw4_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDW4_15_00");	//Jdu na palubu.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW4_01_01");	//Dobrá... Ale nikomu to neříkej!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDM(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdm_condition;
	information = dia_pal_213_schiffswache_iamkdm_info;
	permanent = FALSE;
	description = "Paladine, víš vůbec komu sloužím?";
};


func int dia_pal_213_schiffswache_iamkdm_condition()
{
	if((hero.guild == GIL_KDM) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdm_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_15_00");	//Paladine, víš vůbec komu sloužím?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_01");	//Myslím, že ano! Jsi nekromant - služebník Beliara!... (S opovržením)
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_02");	//A co myslíš že udělá, jesti se opvážíš pozvednout svůj meč proti jeho služebníkovi.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_03");	//Co, zabije mě? (Směje se)
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_04");	//Toho se nebojím, nekromante! Přísahal jsem položit život za Innose!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_05");	//Takže jsi připraven ztratit duši pro jeho slávu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_06");	//Cože?!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_07");	//Ptal jsem se jestli jsi připraven vzdát se své duše. Nuže?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_08");	//Blázne, myslel sis že můj bůh chce tvůj život. Věř mi, že ten nepotřebuje!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_09");	//Víš co udělá? Prokleje tě, paladine!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_10");	//Po tvé smrti se pak staneš jeho služebníkem a nedojdeš pokoje!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_11");	//Nebo jsi nikdy neslyšel o nemrtvých paladinech? O Pánech Stínu?! Proč myslíš že by sloužili Beliarovi?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_12");	//Protože ten, kdo se odváží napadnout někoho z nejvyšších služebníků Temného boha bude potrstán samotným Beliarem!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_13");	//A ani tvůj ubohý bůh ti pak nepomůže!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_14");	//Ne!... (nervózně) Jen to ne!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_15");	//Tak mě jednoduše pusť na loď než Beliar pošle své služebníky pro tvou duši.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_16");	//(skrze zuby)... Jdi.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_17");	//Správně! Tak je hodnej...(poplácání po tváři)

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_Pal_213_Schiffswache_IAmPAL(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL_Info;
	permanent = FALSE;
	description = "Ty nevěříš paladinovi?";
};


func int DIA_Pal_213_Schiffswache_IAmPAL_Condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL_15_00");	//Ty nevěříš paladinovi?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01");	//Pouze plním rozkazy.
};


instance DIA_Pal_213_Schiffswache_IAmPAL2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL2_Info;
	permanent = FALSE;
	description = "Pak bys měl vědět kdo má vyšší hodnost.";
};


func int DIA_Pal_213_Schiffswache_IAmPAL2_Condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmPAL))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL2_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00");	//Pak bys měl vědět kdo má vyšší hodnost.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01");	//Ano pane!
};


instance DIA_Pal_213_Schiffswache_IAmPAL3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL3_Info;
	permanent = FALSE;
	description = "Pusť mě na loď, to je rozkaz.";
};


func int DIA_Pal_213_Schiffswache_IAmPAL3_Condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmPAL2))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL3_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00");	//Pusť mě na loď, to je rozkaz.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01");	//Ano, pane, projdi.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_Pal_213_Schiffswache_IAmDJG(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG_Info;
	permanent = FALSE;
	description = "Můžeme tuhle situaci vyřešit nějakým způsobem?";
};


func int DIA_Pal_213_Schiffswache_IAmDJG_Condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG_15_00");	//Můžeme tuhle situaci vyřešit nějakým způsobem?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01");	//Nerozumím ti.
};


instance DIA_Pal_213_Schiffswache_IAmDJG2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG2_Info;
	permanent = FALSE;
	description = "Můžu ti zaplatit a nebudu šetřit.";
};


func int DIA_Pal_213_Schiffswache_IAmDJG2_Condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmDJG) && (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG2_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00");	//Můžu ti zaplatit, když se budeš chvilku dívat někam jinam.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01");	//Mě nemůžeš podplatit a pokud hned nezmizíš vemu to jako urážku.
};


instance DIA_Pal_213_Schiffswache_IAmDJG3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG3_Info;
	permanent = FALSE;
	description = "Mám pro tebe dopis.";
};

func int DIA_Pal_213_Schiffswache_IAmDJG3_Condition()
{
	if(hero.guild == GIL_DJG)
	{
		if(Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmDJG) && (Npc_HasItems(other,ITWr_ForgedShipLetter_MIS) >= 1))
		{
			return TRUE;
		};
	};
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		if(Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard) && (Npc_HasItems(other,ITWr_ForgedShipLetter_MIS) >= 1))
		{
			return TRUE;
		};
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG3_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00");	//Mám pro tebe dopis. Opravňuje mě ke vstupu na palubu.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01");	//Ukaž mi ho.
	B_GiveInvItems(other,self,ITWr_ForgedShipLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02");	//Všechno v pořádku, můžeš projít.
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};

instance DIA_Pal_213_Schiffswache_Rats(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_Rats_Condition;
	information = DIA_Pal_213_Schiffswache_Rats_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Pal_213_Schiffswache_Rats_Condition()
{
	if((MIS_ShipIsFree == TRUE) && ((Npc_IsDead(Ship_Rat_01) == FALSE) || (Npc_IsDead(Ship_Rat_02) == FALSE) || (Npc_IsDead(Ship_Rat_03) == FALSE) || (Npc_IsDead(Ship_Rat_04) == FALSE) || (Npc_IsDead(Ship_Rat_05) == FALSE) || (Npc_IsDead(Ship_Rat_06) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Rats_Info()
{
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_00");	//Počkej, když už jsi na palubě. Měl bych na tebe jednu prosbu.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_01_01");	//O co se jedná?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_02");	//Ty zatracené krysy mě přivádějí k šílenství.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_01_03");	//Krysy?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_04");	//Ano, krysy. (podrážděně) Obyčejný lodní krysy!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_05");	//Každý večer ty malí paraziti šramotí v nákladovém prostoru a dělají strašný ránus.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_06");	//Když tu s parťákem stojíme na stráži, tak nás to každou chvilku vyleká.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_07");	//Zejména, když jsme pořád ve střehu.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_08");	//A tydle krysy, ať je Beliar zničí! Nemůžem se kvůli nim soustředit na střežení lodě.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_09");	//Můžeš se o ně postarat... prosím... (žadoní)
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_01_10");	//A proč se o to nepostaráš sám?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_11");	//Už jsem ti říkal, že jsem tu na stráži. A opustit stráž... Innos mě chraň!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_12");	//Na druhou stranu. (Vážně): Pro tebe to nebude problém.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_01_13");	//Dobře, jdu se kouknout do podpalubí.
	MIS_SchiffswacheRats = LOG_Running;
	Log_CreateTopic(TOPIC_SchiffswacheRats,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SchiffswacheRats,LOG_Running);
	B_LogEntry(TOPIC_SchiffswacheRats,"Lodní důstojník, který si stěžoval, že každou noc krysy v nákladovém prostoru vytváří příliš velký hluk. Mě požádal, abych se s nimi vypořádal.");
};

instance DIA_Pal_213_Schiffswache_Rats_Done(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_Rats_Done_Condition;
	information = DIA_Pal_213_Schiffswache_Rats_Done_Info;
	permanent = FALSE;
	description = "Zbavil jsem se krys.";
};

func int DIA_Pal_213_Schiffswache_Rats_Done_Condition()
{
	if((MIS_SchiffswacheRats == LOG_Running) && (Npc_IsDead(Ship_Rat_01) == TRUE) && (Npc_IsDead(Ship_Rat_02) == TRUE) && (Npc_IsDead(Ship_Rat_03) == TRUE) && (Npc_IsDead(Ship_Rat_04) == TRUE) && (Npc_IsDead(Ship_Rat_05) == TRUE) && (Npc_IsDead(Ship_Rat_06) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Rats_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_Done_01_00");	//Zbavil jsem se krys.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_Done_01_01");	//Doufám žes je všechny zabil?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_Done_01_02");	//Všechny do jedný.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_Done_01_03");	//Výborně. (povzdechne si) Konečně bude v noci ticho. Děkuji ti.
	MIS_SchiffswacheRats = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SchiffswacheRats,LOG_SUCCESS);
};