
func void bookshelf_rnd_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_BOOKSHELF;
		AI_ProcessInfos(her);
	};
};

instance PC_BOOKSHELF_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_bookshelf_end_condition;
	information = pc_bookshelf_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};


func int pc_bookshelf_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_BOOKSHELF)
	{
		return TRUE;
	};
};

func void pc_bookshelf_end_info()
{
	b_endproductiondialog();
};

var int rnd_shelf_l;
var int Found_OneHandBook;
var int Found_TwoHandBook;

instance PC_BOOKSHELF_RND(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_bookshelf_rnd_condition;
	information = pc_bookshelf_rnd_info;
	permanent = TRUE;
	description = "Prozkoumat polici s knihami";
};

func int pc_bookshelf_rnd_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_BOOKSHELF)
	{
		return TRUE;
	};
};

func void pc_bookshelf_rnd_info()
{
	var int rnd_shelf2;
	var int DayNowScroll;

	if((Hlp_StrCmp(Npc_GetNearestWP(hero),"DT_E2_03")) || (Hlp_StrCmp(Npc_GetNearestWP(hero),"OW_HIDE_BOOK")))
	{
		if((Hlp_StrCmp(Npc_GetNearestWP(hero),"DT_E2_03")) && (Found_OneHandBook == FALSE))
		{
			Found_OneHandBook = TRUE;
			CreateInvItems(hero,ItWr_EinhandBuch,1);
			AI_Print("Našel jsi knihu 'Obrana jižních zemí'!");
		}
		else	if((Hlp_StrCmp(Npc_GetNearestWP(hero),"OW_HIDE_BOOK")) && (Found_TwoHandBook == FALSE))
		{
			Found_TwoHandBook = TRUE;
			CreateInvItems(hero,ItWr_ZweihandBuch,1);
			AI_Print("Našel jsi knihu 'Dvojitý blok'!");
		}
		else
		{
			AI_Print("Nic jsi nenašel...");
		};
	}
	else
	{
		DayNowScroll = Wld_GetDay();

		if(RND_SHELF_L <= (DayNowScroll - 1))
		{
			if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0)
			{
				rnd_shelf2 = Hlp_Random(9);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_FireBolt,1);
					AI_Print("Našel jsi svitek 'Ohnivý šíp'!");
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_Zap,1);
					AI_Print("Našel jsi svitek 'Blesk'!");
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_Icebolt,1);
					AI_Print("Našel jsi svitek 'Ledový šíp'!");
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_Sleep,1);
					AI_Print("Našel jsi svitek 'Spánek'!");
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_Deathbolt,1);
					AI_Print("Našel jsi svitek 'Temný šíp'!");
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_SumGobSkel,1);
					AI_Print("Našel jsi svitek 'Vyvolání gobliního kostlivce'!");
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Light,1);
					AI_Print("Našel jsi svitek 'Světlo'!");
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_LightHeal,1);
					AI_Print("Našel jsi svitek 'Léčení'!");
				}
				else
				{
					CreateInvItems(hero,ItSc_TrfScavenger,1);
					AI_Print("Našel jsi svitek 'Přeměna v krvavou mouchu'!");
				};
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
			{
				rnd_shelf2 = Hlp_Random(11);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_SumWolf,1);
					AI_Print("Našel jsi svitek 'Vyvolání vlka'!");
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_MediumHeal,1);
					AI_Print("Našel jsi svitek 'Očisťující světlo'!");
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_HarmUndead,1);
					AI_Print("Našel jsi svitek 'Zničení nemrtvého'!");
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_InstantFireball,1);
					AI_Print("Našel jsi svitek 'Ohnivá koule'!");
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_Icelance,1);
					AI_Print("Našel jsi svitek 'Ledové kopí'!");
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_SUMSHOAL,1);
					AI_Print("Našel jsi svitek 'Vyvolání smečky ledových vlků'!");
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Windfist,1);
					AI_Print("Našel jsi svitek 'Větrná pěst'!");
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_GreenTentacle,1);
					AI_Print("Našel jsi svitek 'Spletité kořeny'!");
				}
				else if(rnd_shelf2 == 8)
				{
					CreateInvItems(hero,ItSc_ManaForLife,1);
					AI_Print("Našel jsi svitek 'Rozervání duše'!");
				}
				else if(rnd_shelf2 == 9)
				{
					CreateInvItems(hero,ItSc_SumZombie,1);
					AI_Print("Našel jsi svitek 'Vyvolání zombie'!");
				}
				else
				{
					CreateInvItems(hero,ItSc_TrfSnapper,1);
					AI_Print("Našel jsi svitek 'Přeměna v chňapavce'!");
				};
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
			{
				rnd_shelf2 = Hlp_Random(18);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_FullHeal,1);
					AI_Print("Našel jsi svitek 'Innosovo světlo'!");
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_Firestorm,1);
					AI_Print("Našel jsi svitek 'Malá ohnivá bouře'!");
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_IceCube,1);
					AI_Print("Našel jsi svitek 'Ledový blok'!");
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_ThunderBall,1);
					AI_Print("Našel jsi svitek 'Kulový blesk'!");
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_Fear,1);
					AI_Print("Našel jsi svitek 'Strach'!");
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_CHARM,1);
					AI_Print("Našel jsi svitek 'Zapomnění'!");
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Swarm,1);
					AI_Print("Našel jsi svitek 'Roj hmyzu'!");
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_SumSkel,1);
					AI_Print("Našel jsi svitek 'Vyvolání kostlivého válečníka'!");
				}
				else if(rnd_shelf2 == 8)
				{
					CreateInvItems(hero,ItSc_SumGol,1);
					AI_Print("Našel jsi svitek 'Vyvolání kamenného strážce'!");
				}
				else if(rnd_shelf2 == 9)
				{
					CreateInvItems(hero,ItSc_SUMFIREGOL,1);
					AI_Print("Našel jsi svitek 'Vyvolání ohnivého golema'!");
				}
				else if(rnd_shelf2 == 10)
				{
					CreateInvItems(hero,ItSc_TrfFireWaran,1);
					AI_Print("Našel jsi svitek 'Přeměna v ještěra'!");
				}
				else if(rnd_shelf2 == 11)
				{
					CreateInvItems(hero,ItSc_ChargeFireball,1);
					AI_Print("Našel jsi svitek 'Velká ohnivá koule'!");
				}
				else if(rnd_shelf2 == 12)
				{
					CreateInvItems(hero,ItSc_LightningFlash,1);
					AI_Print("Našel jsi svitek 'Úder blesku'!");
				}
				else if(rnd_shelf2 == 13)
				{
					CreateInvItems(hero,ItSc_SUMICEGOL,1);
					AI_Print("Našel jsi svitek 'Vyvolání ledového golema'!");
				}
				else if(rnd_shelf2 == 14)
				{
					CreateInvItems(hero,ItSc_Whirlwind,1);
					AI_Print("Našel jsi svitek 'Tornádo'!");
				}
				else if(rnd_shelf2 == 15)
				{
					CreateInvItems(hero,ItSc_SumDemon,1);
					AI_Print("Našel jsi svitek 'Vyvolej démona'!");
				}
				else if(rnd_shelf2 == 16)
				{
					CreateInvItems(hero,ItSc_Deathball,1);
					AI_Print("Našel jsi svitek 'Koule smrti'!");
				}
				else
				{
					CreateInvItems(hero,ItSc_TrfWarg,1);
					AI_Print("Našel jsi svitek 'Přeměna ve warga'!");
				};
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 3)
			{
				rnd_shelf2 = Hlp_Random(11);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_Waterfist,1);
					AI_Print("Našel jsi svitek 'Vodní pěst'!");
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_IceWave,1);
					AI_Print("Našel jsi svitek 'Ledová vlna'!");
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_ArmyOfDarkness,1);
					AI_Print("Našel jsi svitek 'Armáda temnot'!");
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_Whirlwind,1);
					AI_Print("Našel jsi svitek 'Tornádo'!");
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_SUMSWPGOL,1);
					AI_Print("Našel jsi svitek 'Vyvolání bažinného golema'!");
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_TrfShadowbeast,1);
					AI_Print("Našel jsi svitek 'Přeměna ve stínovou šelmu'!");
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Firerain,1);
					AI_Print("Našel jsi svitek 'Ohnivý déšť'!");
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_Geyser,1);
					AI_Print("Našel jsi svitek 'Gejzír'!");
				}
				else if(rnd_shelf2 == 8)
				{
					CreateInvItems(hero,ItSc_Thunderstorm,1);
					AI_Print("Našel jsi svitek 'Bouře'!");
				}
				else if(rnd_shelf2 == 9)
				{
					CreateInvItems(hero,ItSc_MassDeath,1);
					AI_Print("Našel jsi svitek 'Černá mlha'!");
				}
				else
				{
					CreateInvItems(hero,ItSc_Skull,1);
					AI_Print("Našel jsi svitek 'Řev mrtvých'!");
				};
			};

			RND_SHELF_L = Wld_GetDay();
		}
		else
		{
			AI_Print("Nic jsi nenašel...");
		};
	};

	b_endproductiondialog();
};