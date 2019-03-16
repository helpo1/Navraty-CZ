
var int NpcObsessedByDMT;
var int NpcObsessedByDMT_Brutus;
var int NpcObsessedByDMT_Engrom;
var int NpcObsessedByDMT_Vino;
var int NpcObsessedByDMT_Malak;
var int NpcObsessedByDMT_Fernando;
var int NpcObsessedByDMT_Bromor;
var int NpcObsessedByDMT_Sekob;
var int NpcObsessedByDMT_Randolph;

func void B_DMTWurm()
{
	AI_Output(self,other,"DIA_NoName_ObsessedByDMT_19_00");	//Vidíme tě, červe. Nemůžeš nám utéct.
};

func void B_NpcClearObsessionByDMT(var C_Npc medium)
{
	AI_StopProcessInfos(medium);

	if(NpcObsessedByDMT == TRUE)
	{
		Npc_RemoveInvItems(medium,ITAR_Dementor,1);
		AI_EquipBestArmor(medium);
		NpcObsessedByDMT = FALSE;
		medium.flags = 0;
		B_Attack(medium,other,AR_NONE,1);
		Wld_StopEffect("DEMENTOR_FX");
		Snd_Play("MFX_FEAR_CAST");
		B_SCIsObsessed(medium);

		if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Malak))
		{
			Npc_SetTarget(BAU_962_Bauer,other);
			AI_StartState(BAU_962_Bauer,ZS_Flee,0,"");
			Npc_SetTarget(BAU_964_Bauer,other);
			AI_StartState(BAU_964_Bauer,ZS_Flee,0,"");
			Npc_SetTarget(BAU_965_Bauer,other);
			AI_StartState(BAU_965_Bauer,ZS_Flee,0,"");
			Npc_SetTarget(BAU_966_Bauer,other);
			AI_StartState(BAU_966_Bauer,ZS_Flee,0,"");
			Npc_SetTarget(BAU_967_Bauer,other);
			AI_StartState(BAU_967_Bauer,ZS_Flee,0,"");
			Npc_SetTarget(BAU_968_Bauer,other);
			AI_StartState(BAU_968_Bauer,ZS_Flee,0,"");
			Npc_SetTarget(BAU_969_Bauer,other);
			AI_StartState(BAU_969_Bauer,ZS_Flee,0,"");
		};
	};
};

func void B_NpcObsessedByDMT(var C_Npc medium)
{
	if(NpcObsessedByDMT == FALSE)
	{
		AI_PlayAni(medium,"T_INSANE");
		AI_Wait(medium,0);
		//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		CreateInvItems(medium,ITAR_Dementor,1);
		AI_UnequipArmor(medium);
		AI_EquipArmor(medium,ITAR_Dementor);
		AI_PlayAni(medium,"T_PRACTICEMAGIC5");
		Wld_PlayEffect("spellFX_Fear",medium,medium,0,0,0,FALSE);
		NpcObsessedByDMT = TRUE;
		if(Npc_HasItems(medium,ITWR_DementorObsessionBook_MIS) == FALSE)
		{
			CreateInvItems(medium,ITWR_DementorObsessionBook_MIS,1);
		};
		if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Brutus))
		{
			if(MIS_OCGateOpen == TRUE)
			{
				AI_Output(self,other,"DIA_Brutus_ObsessedByDMT_19_00");	//Otevření brány byla dobrá služba pro našeho Mistra, slabý smrtelníku. Vybudujeme svatyni v jeho cti na tvém hrobě.
			}
			else
			{
				B_DMTWurm();
			};
			NpcObsessedByDMT_Brutus = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Engrom))
		{
			AI_Output(self,other,"DIA_Engrom_ObsessedByDMT_19_00");	//Otoč se. Dokud pro tebe není příliš pozdě.
			NpcObsessedByDMT_Engrom = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Vino))
		{
			AI_Output(self,other,"DIA_Vino_ObsessedByDMT_19_00");	//Brzy budeme poroučet jim všem. Ty a tvá ubohá magie pro nás nejste nebezpečím.
			NpcObsessedByDMT_Vino = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Malak))
		{
			AI_Output(self,other,"DIA_Malak_ObsessedByDMT_19_00");	//Nejsi schopen záchránit tuhle duši, mágu. Nikdy se nevrátí do svého já.
			NpcObsessedByDMT_Malak = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Sekob))
		{
			AI_Output(self,other,"DIA_Sekob_ObsessedByDMT_19_00");	//Vzdej se, mágu. Nemůžeš vyhrát.
			NpcObsessedByDMT_Sekob = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Randolph))
		{
			AI_Output(self,other,"DIA_Randolph_ObsessedByDMT_19_00");	//Nezabývej se slabými. Všechny si je zotročíme.
			NpcObsessedByDMT_Randolph = TRUE;
		}
		else
		{
			B_DMTWurm();
			if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Bromor))
			{
				NpcObsessedByDMT_Bromor = TRUE;
			};
			if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Fernando))
			{
				NpcObsessedByDMT_Fernando = TRUE;
			};
		};
		B_GivePlayerXP(XP_SCFoundObsessedNpc);
	}
	else
	{
		B_NpcClearObsessionByDMT(medium);
	};
};

