
func void b_orccanothermove()
{
	var int randomeat;
	var int randomMove;
	var int random;

	if(CurrentLevel == ORCCITY_ZEN)
	{
		if(self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR)
		{
			randomMove = Hlp_Random(40);
			if(randomMove <= 3)
			{
				AI_RemoveWeapon(self);
				AI_PlayAni(self,"T_STAND_2_GUARDSLEEP");
				AI_Wait(self,15);
				AI_PlayAni(self,"T_GUARDSLEEP_2_STAND");
				AI_SetWalkMode(self,NPC_WALK);
			}
			else if(randomMove == 5)
			{
				AI_RemoveWeapon(self);
				AI_PlayAni(self,"T_STAND_2_DANCE");
				AI_PlayAni(self,"T_DANCE");
				AI_PlayAni(self,"T_DANCE");
				AI_PlayAni(self,"T_DANCE_RANDOM_1");
				AI_PlayAni(self,"T_DANCE");
				AI_PlayAni(self,"T_DANCE");
				AI_PlayAni(self,"T_DANCE_2_STAND");
				AI_SetWalkMode(self,NPC_WALK);
			}
			else if(randomMove <= 7)
			{
				AI_RemoveWeapon(self);
				random = Hlp_Random(8);
				if(random == 0)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_01");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Happy");
							};
						};
					};
				}
				else if(random == 1)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_02");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Die_A1");
							};
						};
					};
				}
				else if(random == 2)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_03");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Die_A2");
							};
						};
					};
				}
				else if(random == 3)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_04");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Die_A1");
							};
						};
					};
				}
				else if(random == 4)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_05");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Die_A2");
							};
						};
					};
				}
				else if(random == 5)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_06");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Angry");
							};
						};
					};
				}
				else if(random == 6)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_07");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Frightened");
							};
						};
					};
				}
				else if(random == 7)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_08");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Angry");
							};
						};
					};
				};

				AI_SetWalkMode(self,NPC_WALK);
			}
			else if(randomMove <= 15)
			{
				AI_RemoveWeapon(self);
				AI_PlayAni(self,"T_BORINGKICK");
				AI_SetWalkMode(self,NPC_WALK);
			}
			else
			{
				AI_RemoveWeapon(self);
				AI_SetWalkMode(self,NPC_WALK);
			};
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE)
		{
			randomMove = Hlp_Random(40);
			if(randomMove <= 5)
			{
				AI_RemoveWeapon(self);
				if(Npc_HasItems(self,itfo_addon_orcrum) < 1)
				{
					CreateInvItem(self,itfo_addon_orcrum);
				};
				AI_UseItem(self,itfo_addon_orcrum);
				AI_SetWalkMode(self,NPC_WALK);
			}
			else if(randomMove <= 10)
			{
				AI_RemoveWeapon(self);
				random = Hlp_Random(8);
				if(random == 0)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_01");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Happy");
							};
						};
					};
				}
				else if(random == 1)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_02");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Die_A1");
							};
						};
					};
				}
				else if(random == 2)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_03");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Die_A2");
							};
						};
					};
				}
				else if(random == 3)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_04");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Die_A1");
							};
						};
					};
				}
				else if(random == 4)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_05");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Die_A2");
							};
						};
					};
				}
				else if(random == 5)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_06");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Angry");
							};
						};
					};
				}
				else if(random == 6)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_07");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Frightened");
							};
						};
					};
				}
				else if(random == 7)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_08");

					if(PlayerKnowsOrcLanguage == TRUE)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Orc();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								Snd_Play3d(self,"ORC_Angry");
							};
						};
					};
				};

				AI_SetWalkMode(self,NPC_WALK);
			}
			else
			{
				AI_RemoveWeapon(self);
				AI_SetWalkMode(self,NPC_WALK);
			};
		};
	}
	else if(self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR)
	{
		randomMove = Hlp_Random(50);
		if(randomMove == 0)
		{
			AI_ReadyMeleeWeapon(self);
			AI_PlayAni(self,"R_ROAM3");
			AI_PlayAni(self,"R_ROAM1");
			AI_RemoveWeapon(self);
			AI_SetWalkMode(self,NPC_WALK);
		}
		else if(randomMove == 1)
		{
			AI_ReadyMeleeWeapon(self);
			AI_PlayAni(self,"T_STAND_2_DANCE");
			AI_PlayAni(self,"T_DANCE");
			AI_PlayAni(self,"T_DANCE");
			AI_PlayAni(self,"T_DANCE_RANDOM_1");
			AI_PlayAni(self,"T_DANCE");
			AI_PlayAni(self,"T_DANCE");
			AI_PlayAni(self,"T_DANCE_2_STAND");
			AI_RemoveWeapon(self);
			AI_SetWalkMode(self,NPC_WALK);
		}
		else if(randomMove <= 5)
		{
			AI_RemoveWeapon(self);
			AI_PlayAni(self,"T_STAND_2_GUARDSLEEP");
			AI_Wait(self,15);
			AI_PlayAni(self,"T_GUARDSLEEP_2_STAND");
			AI_SetWalkMode(self,NPC_WALK);
		}
		else if(randomMove <= 12)
		{
			AI_RemoveWeapon(self);
			random = Hlp_Random(8);

			if(random == 0)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_01");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Happy");
						};
					};
				};
			}
			else if(random == 1)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_02");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Die_A1");
						};
					};
				};
			}
			else if(random == 2)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_03");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Die_A2");
						};
					};
				};
			}
			else if(random == 3)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_04");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Die_A1");
						};
					};
				};
			}
			else if(random == 4)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_05");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Die_A2");
						};
					};
				};
			}
			else if(random == 5)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_06");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Angry");
						};
					};
				};
			}
			else if(random == 6)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_07");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Frightened");
						};
					};
				};
			}
			else if(random == 7)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_08");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Angry");
						};
					};
				};
			};

			AI_SetWalkMode(self,NPC_WALK);
		}
		else if(randomMove <= 15)
		{
			AI_RemoveWeapon(self);
			AI_PlayAni(self,"T_BORINGKICK");
			AI_SetWalkMode(self,NPC_WALK);
		}
		else
		{
			AI_RemoveWeapon(self);
			AI_SetWalkMode(self,NPC_WALK);
		};
	}
	else if(self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE)
	{
		randomMove = Hlp_Random(40);
		if(randomMove <= 15)
		{
			AI_RemoveWeapon(self);
			if(Npc_HasItems(self,itfo_addon_orcrum) < 1)
			{
				CreateInvItem(self,itfo_addon_orcrum);
			};
			AI_UseItem(self,itfo_addon_orcrum);
			AI_SetWalkMode(self,NPC_WALK);
		}
		else if(randomMove <= 25)
		{
			AI_RemoveWeapon(self);
			random = Hlp_Random(8);

			if(random == 0)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_01");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Happy");
						};
					};
				};
			}
			else if(random == 1)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_02");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Die_A1");
						};
					};
				};
			}
			else if(random == 2)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_03");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Die_A2");
						};
					};
				};
			}
			else if(random == 3)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_04");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Die_A1");
						};
					};
				};
			}
			else if(random == 4)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_05");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Die_A2");
						};
					};
				};
			}
			else if(random == 5)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_06");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Angry");
						};
					};
				};
			}
			else if(random == 6)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_07");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Frightened");
						};
					};
				};
			}
			else if(random == 7)
			{
				AI_PlayAni(self,"T_DIALOGGESTURE_08");

				if(PlayerKnowsOrcLanguage == TRUE)
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							B_Say_Smalltalk_Orc();
						};
					};
				}
				else
				{
					if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
					{
						if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
						{
							Snd_Play3d(self,"ORC_Angry");
						};
					};
				};
			};

			AI_SetWalkMode(self,NPC_WALK);
		}
		else
		{
			AI_RemoveWeapon(self);
			AI_SetWalkMode(self,NPC_WALK);
		};
	};
};

func void ZS_MM_Rtn_Roam()
{
	var C_Item npcweapon;

	Perception_Set_Monster_Rtn();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();

	npcweapon = Npc_GetEquippedMeleeWeapon(self);

	if((Hlp_IsItem(npcweapon,ITMW_1H_DoomSpeer) == TRUE) || (Hlp_IsItem(npcweapon,ITMW_1H_DoomSpeer_Elite) == TRUE))
	{
		AI_RemoveWeapon(self);
		Mdl_RemoveOverlayMds(self,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST1.mds");
		Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");	
	};
	if(Hlp_IsItem(npcweapon,ITMW_2H_DOOMAXE) == TRUE)
	{
		AI_RemoveWeapon(self);
		Mdl_RemoveOverlayMds(self,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST1.mds");
		Mdl_ApplyOverlayMds(self,"HUMANS_AXEST2.MDS");	
	};
	if((Hlp_IsItem(npcweapon,ITMW_SHADOWPRIEST) == TRUE) || (Hlp_IsItem(npcweapon,ITMW_SHADOWPRIEST_ELITE) == TRUE) || (Hlp_IsItem(npcweapon,ITMW_SHADOWPRIEST_OBER) == TRUE))
	{
		AI_RemoveWeapon(self);
		Mdl_RemoveOverlayMds(self,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST1.mds");
		Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");	
	};

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_Roam_loop()
{
	var int wanderTime;
	var int randomMove;
	var int random;
	var int randomhowl;

	b_staminainvent_monster(self);

	if(!Wld_IsTime(self.aivar[AIV_MM_RoamStart],0,self.aivar[AIV_MM_RoamEnd],0) && (self.aivar[AIV_MM_RoamStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		wanderTime = Hlp_Random(5);
		Npc_SetStateTime(self,0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ogre))
		{
			if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
			{
				AI_SetWalkMode(self,NPC_WALK);
				AI_GotoNextFP(self,"FP_ROAM");
				AI_PlayAni(self,"T_STAND_2_HGUARD");
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ogre))
	{
		if((Npc_GetStateTime(self) > 10) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
		{
			random = Hlp_Random(5);

			if(random == 1)
			{
				AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
			}
			else if(random == 2)
			{
				AI_PlayAni(self,"R_LEGSHAKE");
			}
			else if(random == 3)
			{
				AI_PlayAni(self,"R_SCRATCHEGG");
			}
			else if(random == 4)
			{
				if(Npc_HasItems(self,itfo_addon_orcrum) == 0)
				{
					CreateInvItem(self,itfo_addon_orcrum);
				};

				AI_UseItem(self,itfo_addon_orcrum);
			};

			Npc_SetStateTime(self,0);
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		};
	}
	else
	{
		if(Npc_GetStateTime(self) > wanderTime)
		{
			if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
			{
				AI_GotoNextFP(self,"FP_ROAM");
			}
			else if((self.guild == GIL_ORC) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCBOWMEN) && Wld_IsTime(22,0,6,0))
			{
				AI_GotoWP(self,Npc_GetNearestWP(self));
				randomMove = Hlp_Random(3);
				if(randomMove == 0)
				{
					AI_PlayAni(self,"R_ROAM1");
				};
				if(randomMove == 1)
				{
					AI_PlayAni(self,"R_ROAM2");
				};
				if(randomMove == 2)
				{
					AI_PlayAni(self,"R_ROAM3");
				};
			};

			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		}
		else if(Hlp_Random(1000) <= 5)
		{
			randomMove = Hlp_Random(3);

			if(randomMove == 0)
			{
				AI_PlayAni(self,"R_ROAM1");

				if((self.aivar[AIV_MM_REAL_ID] == ID_BARAN) && (Hlp_Random(100) <= 10))
				{
					if(Npc_GetDistToNpc(self,hero) <= 1000)
					{
						Snd_Play3d(self,"AMB_SHEEP_01");
					};
				};
				if((self.guild == GIL_ORC) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCBOWMEN) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCBF) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (self.flags != ORCTEMPLENPCFLAGS))
				{
					b_orccanothermove();

					if(Wld_IsTime(22,0,6,0))
					{
						return LOOP_END;
					};
				};
				if((Hlp_Random(100) <= 25) && ((self.aivar[AIV_MM_REAL_ID] == ID_WOLF) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf)))
				{
					randomhowl = Hlp_Random(6);

					if(randomhowl == 1)
					{
						Snd_Play3d(self,"WOLF_HOWL_01");
					};
					if(randomhowl == 2)
					{
						Snd_Play3d(self,"WOLF_HOWL_02");
					};
					if(randomhowl == 3)
					{
						Snd_Play3d(self,"WOLF_HOWL_03");
					};
					if(randomhowl == 4)
					{
						Snd_Play3d(self,"WOLF_HOWL_04");
					};
					if(randomhowl == 5)
					{
						Snd_Play3d(self,"WOLF_HOWL_05");
					};
				};
			};
			if(randomMove == 1)
			{
				AI_PlayAni(self,"R_ROAM2");

				if((self.aivar[AIV_MM_REAL_ID] == ID_BARAN) && (Hlp_Random(100) <= 10))
				{
					if(Npc_GetDistToNpc(self,hero) <= 1000)
					{
						Snd_Play3d(self,"AMB_SHEEP_02");
					};
				};
				if((self.guild == GIL_ORC) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCBOWMEN) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCBF) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (self.flags != ORCTEMPLENPCFLAGS))
				{
					b_orccanothermove();

					if(Wld_IsTime(22,0,6,0))
					{
						return LOOP_END;
					};
				};
				if((Hlp_Random(100) <= 25) && ((self.aivar[AIV_MM_REAL_ID] == ID_WOLF) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf)))
				{
					randomhowl = Hlp_Random(6);

					if(randomhowl == 1)
					{
						Snd_Play3d(self,"WOLF_HOWL_01");
					};
					if(randomhowl == 2)
					{
						Snd_Play3d(self,"WOLF_HOWL_02");
					};
					if(randomhowl == 3)
					{
						Snd_Play3d(self,"WOLF_HOWL_03");
					};
					if(randomhowl == 4)
					{
						Snd_Play3d(self,"WOLF_HOWL_04");
					};
					if(randomhowl == 5)
					{
						Snd_Play3d(self,"WOLF_HOWL_05");
					};
				};
			};
			if(randomMove == 2)
			{
				AI_PlayAni(self,"R_ROAM3");

				if((self.aivar[AIV_MM_REAL_ID] == ID_BARAN) && (Hlp_Random(100) <= 10))
				{
					if(Npc_GetDistToNpc(self,hero) <= 1000)
					{
						Snd_Play3d(self,"AMB_SHEEP_03");
					};
				};
				if((self.guild == GIL_ORC) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCBOWMEN) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCBF) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (self.flags != ORCTEMPLENPCFLAGS))
				{
					b_orccanothermove();

					if(Wld_IsTime(22,0,6,0))
					{
						return LOOP_END;
					};
				};
				if((Hlp_Random(100) <= 25) && ((self.aivar[AIV_MM_REAL_ID] == ID_WOLF) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf)))
				{
					randomhowl = Hlp_Random(6);

					if(randomhowl == 1)
					{
						Snd_Play3d(self,"WOLF_HOWL_01");
					};
					if(randomhowl == 2)
					{
						Snd_Play3d(self,"WOLF_HOWL_02");
					};
					if(randomhowl == 3)
					{
						Snd_Play3d(self,"WOLF_HOWL_03");
					};
					if(randomhowl == 4)
					{
						Snd_Play3d(self,"WOLF_HOWL_04");
					};
					if(randomhowl == 5)
					{
						Snd_Play3d(self,"WOLF_HOWL_05");
					};
				};
			};
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Roam_end()
{
	b_staminainvent();
};