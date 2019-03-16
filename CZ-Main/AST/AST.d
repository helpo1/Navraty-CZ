var int game_mode;

/*Funktsii nizhe, prednaznacheny dlya otslezhivaniya odevaniya/snimaniya(ekipirovki)
predmetov, dlya vsekh nps v tekushchem mire, tak zhe v etoy chasti skripta deystvuyut global'nyye instantsii item,self

item - odevayemyy predmet
self - nps, kotoryy odevayet predmet
*/

//****************************************
//Pri ekipirovke
func void OnEquipItems()
{
};

//****************************************
//Pri snyatii
func void OnUnEquipItems()
{
};

/*
Funktsiya "zakhvata" teksta dialogov, vyzyvayetsya v moment nachala kazhdoy repliki v dialoge (gg/nps - znayechniya ne imeyet)
replika zapisyvayetsya v peremennuyu - DIA_CurrentReply .
Global'nyye peremennyye other,self imeyut te zhe znacheniya, chto i v samom dialoge
self - nps
other - GG

info:
Dlya vklyucheniya etoy funktsii, neobkhodimo ukazat' znacheniye konstanty bEnableMsgCallback = 1
*/

//
var string DIA_CurrentReply;

//
func void MsgCallback()
{
	AI_Print(DIA_CurrentReply);
};

func void HandleEvent(var int uKey)
{
	var C_NPC pNpc;
	var int tmpMorph;
	var int tmpMana;
	var int tmpHp;
	var int ranbers;
	var C_Item weapon;
	var int DayNow;
	var int tempPickPocket;
	var C_Item CurHelm;
	var int bChestLvl;
	var int bChestStrenghNeed;
	var int bChestLockNeed;
	var string concatText;
	var C_Npc DetWsp;
	var C_Npc DetWspr;

	weapon = Npc_GetEquippedRangedWeapon(hero);
	pNpc = GetFocusNpc(hero);

	if((Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) >= 1) && (uKey == KEY_B))
	{
		if(PickPocketBonusCount >= 90)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_PICKPOCKET,4);
		}
		else if(PickPocketBonusCount >= 60)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_PICKPOCKET,3);
		}
		else if(PickPocketBonusCount >= 30)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_PICKPOCKET,2);
		}
		else if(PickPocketBonusCount > 0)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_PICKPOCKET,1);
		};
		if((Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) >= 1) && (PickPocketBonusCount < 100) && (PickPocketBonusCount > 0))
		{
			Npc_SetTalentValue(hero,NPC_TALENT_PICKPOCKET,PickPocketBonusCount);		
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
		{
			//PickPocketBonusCount = FALSE;
			//Npc_SetTalentValue(hero,NPC_TALENT_PICKPOCKET,0);		
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		//PickPocketBonusCount = FALSE;
		//Npc_SetTalentValue(hero,NPC_TALENT_PICKPOCKET,0);
	};
	if((Mount_Up == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (FlyCarpetIsOn == FALSE) && (PlayerSitDust == TRUE) && (hero.guild <= GIL_SEPERATOR_HUM) && ((uKey == KEY_UPARROW) || (uKey == KEY_LEFTARROW) || (uKey == KEY_RIGHTARROW) || (uKey == KEY_DOWNARROW) || (uKey == KEY_D) || (uKey == KEY_S) || (uKey == KEY_A) || (uKey == KEY_W) || (uKey == MOUSE_BUTTONLEFT)))
	{
		AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
		PlayerSitDust = FALSE;
		WhistleCount = FALSE;
		bHeroRestStatus = FALSE;
		PauseCount = FALSE;
	};
	if((uKey == KEY_RCONTROL) && (Steal_Mode == FALSE) && (FlyCarpetIsOn == TRUE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		Ext_RemoveFromSlot(hero,"BIP01");	
		Npc_RemoveInvItems(hero,ItSe_FlyCarpet,Npc_HasItems(hero,ItSe_FlyCarpet));
		AI_Dodge(hero);
		Mdl_RemoveOverlayMds(hero,"fliegender_drache.mds");
		FlyCarpetIsOn = FALSE;
		CheckDismount = TRUE;
	};
	if((uKey == KEY_LCONTROL) && (Steal_Mode == FALSE) && (FlyCarpetIsOn == TRUE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		Ext_RemoveFromSlot(hero,"BIP01");	
		Npc_RemoveInvItems(hero,ItSe_FlyCarpet,Npc_HasItems(hero,ItSe_FlyCarpet));
		AI_Dodge(hero);
		Mdl_RemoveOverlayMds(hero,"fliegender_drache.mds");
		FlyCarpetIsOn = FALSE;
		CheckDismount = TRUE;
	};
	if((uKey == KEY_SPACE) && (Steal_Mode == FALSE) && (FlyCarpetIsOn == TRUE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		Ext_RemoveFromSlot(hero,"BIP01");	
		Npc_RemoveInvItems(hero,ItSe_FlyCarpet,Npc_HasItems(hero,ItSe_FlyCarpet));
		AI_Dodge(hero);
		Mdl_RemoveOverlayMds(hero,"fliegender_drache.mds");
		FlyCarpetIsOn = FALSE;
		CheckDismount = TRUE;
	};

	//------------------------Pereklyucheniye akrobatiki-----------------------------------------------BS_FALL

	if(KeyPressed(KEY_T) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (LowHealth == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == TRUE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(AcrobatTurnOFF == FALSE)
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Acrobatic.MDS");
			AcrobatTurnOFF = TRUE;
		}
		else
		{
			Mdl_ApplyOverlayMds(hero,"Humans_Acrobatic.MDS");
			AcrobatTurnOFF = FALSE;
		};
	};
	if(KeyPressed(KEY_Y) && !KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		bChestLvl = Mob_GetBreakNum();
		bChestStrenghNeed = bChestLvl * 15;

		if(Npc_HasEquippedMeleeWeapon(hero) == TRUE)
		{
			if(hero.attribute[ATR_STRENGTH] >= bChestStrenghNeed)
			{
				Mob_SetBrakeChest();

				if(BreakChest == TRUE)
				{
					AI_ReadyMeleeWeapon(hero);
				
					if(EquipedIndex_1H == TRUE)
					{
						AI_PlayAni(hero,"T_1HSBRKCHST");
					}
					else
					{
						AI_PlayAni(hero,"T_2HSBRKCHST");
					};

					AI_WaitMs(hero,10);
					AI_RemoveWeapon(hero);

					if(ATR_STAMINA[0] > 25)
					{
						ATR_STAMINA[0] -= 25;
					}
					else
					{
						ATR_STAMINA[0] = 0;
					};

					AI_PrintClr("Truhlice otevřena!",83,152,48);
					BreakChest = FALSE;

					if(hero.attribute[ATR_DEXTERITY] < Hlp_Random(100))
					{
						Npc_SendPassivePerc(hero,PERC_ASSESSQUIETSOUND,hero,hero);
					};
				};
			}
			else
			{
				AI_PlayAni(self,"T_DONTKNOW");
				B_Say(hero,hero,"$TOOHEAVYFORME");
				concatText = ConcatStrings("Pro vypáčení chybí ",IntToString(bChestStrenghNeed - hero.attribute[ATR_STRENGTH]));
				concatText = ConcatStrings(concatText," bodů síly...");
				AI_Print(concatText);
			};
		}
		else
		{
			AI_PlayAni(self,"T_DONTKNOW");
			AI_Print(PRINT_MissingWeap);
			B_Say_Overlay(hero,hero,"$MISSINGITEM");
		};
	};
	if(KeyPressed(KEY_Y) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) > 0)
		{
			if(hero.attribute[ATR_DEXTERITY] >= 100)
			{
				bChestLvl = Mob_GetBreakNum();

				if(bChestLvl < 4)
				{
					bChestLockNeed = 1;
				}
				else
				{
					bChestLockNeed = (bChestLvl / 2) - (hero.attribute[ATR_DEXTERITY] / 100);

					if(bChestLockNeed < 1)
					{
						bChestLockNeed = 1;
					};
				};
				if(Npc_HasItems(hero,ItKE_lockpick) >= bChestLockNeed)
				{
					Mob_SetBrakeChest();

					if(BreakChest == TRUE)
					{
						AI_PlayAni(hero,"T_PLUNDER");
						Snd_Play("PICKLOCK_SUCCESS");
						AI_PrintClr("Truhlice otevřena!",83,152,48);
						BreakChest = FALSE;
						Npc_RemoveInvItems(hero,ItKE_lockpick,bChestLockNeed);
						concatText = ConcatStrings("Použil jsi ",IntToString(bChestLockNeed));

						if(bChestLockNeed >= 5) 
						{
							concatText = ConcatStrings(concatText," paklíčů...");
						}
						else if(bChestLockNeed > 1) 
						{
							concatText = ConcatStrings(concatText," paklíče...");
						}
						else 
						{
							concatText = ConcatStrings(concatText," paklíč...");
						};

						AI_Print(concatText);
					};
				}
				else
				{
					AI_PlayAni(self,"T_DONTKNOW");
					B_Say_Overlay(self,self,"$PICKLOCKMISSING");
					concatText = ConcatStrings("Pro vypáčení potřebuješ ",IntToString(bChestLockNeed));
					
					if(bChestLockNeed >= 5) 
					{
						concatText = ConcatStrings(concatText," paklíčů...");
					}
					else if(bChestLockNeed > 1) 
					{
						concatText = ConcatStrings(concatText," paklíče...");
					}
					else 
					{
						concatText = ConcatStrings(concatText," paklíč...");
					};

					AI_Print(concatText);
				};
			}
			else
			{
				AI_PlayAni(self,"T_DONTKNOW");
				B_Say(hero,hero,"$TOOHEAVYFORME");
				concatText = ConcatStrings("Pro vypáčení chybí ",IntToString(100 - hero.attribute[ATR_DEXTERITY]));
				concatText = ConcatStrings(concatText," bodů obratnosti...");
				AI_Print(concatText);
			};
		}
		else
		{
			AI_PlayAni(self,"T_DONTKNOW");
			B_Say_Overlay(self,self,"$NOPICKLOCKTALENT");
			AI_Print(PRINT_NoPicklockTalent);
		};
	};

	//------------------------glavnyye knopki-----------------------------------------------------

	if(KeyPressed(KEY_GRAVE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (bSprintTime == FALSE) && (HeroIsDead == FALSE) && (FlyCarpetIsOn == FALSE) && (ShakoIsOn[0] == FALSE) && (HeroDrunk == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (PlayerSitDust == FALSE) && (Mount_Up == FALSE) && (hero.guild <= GIL_SEPERATOR_HUM) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		B_Hotkey_Sprint();
	}
	if(KeyPressed(KEY_NUMPAD1) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && !KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (FlyCarpetIsOn == FALSE) && (PlayerSitDust == FALSE) && (hero.guild <= GIL_SEPERATOR_HUM) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		B_Hotkey_Health_Potion();
	};
	if(KeyPressed(KEY_NUMPAD2) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && !KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (FlyCarpetIsOn == FALSE) && (PlayerSitDust == FALSE) && (hero.guild <= GIL_SEPERATOR_HUM) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		B_Hotkey_Mana_Potion();
	};
	if(KeyPressed(KEY_NUMPAD3) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && !KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (FlyCarpetIsOn == FALSE) && (PlayerSitDust == FALSE) && (hero.guild <= GIL_SEPERATOR_HUM) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		B_Hotkey_Stamina_Potion();
	};
	if(KeyPressed(KEY_NUMPAD4) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && !KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (FlyCarpetIsOn == FALSE) && (PlayerSitDust == FALSE) && (hero.guild <= GIL_SEPERATOR_HUM) && (LowHealth == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		B_Hotkey_Speed_Potion();
	};
	if(KeyPressed(KEY_NUMPAD5) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && !KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (FlyCarpetIsOn == FALSE) && (PlayerSitDust == FALSE) && (hero.guild <= GIL_SEPERATOR_HUM) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		B_Hotkey_UnPoison_Potion();
	};
	if(KeyPressed(KEY_NUMPAD6) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && !KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (PlayerSitDust == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (LowHealth == FALSE) && (HeroIsDead == FALSE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		if(TorchIsOn == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(hero,"BIP01 L HAND");
			Npc_RemoveInvItems(hero,ItLsFireTorch,Npc_HasItems(hero,ItLsFireTorch));
			TorchIsOn = FALSE;
		}
		else
		{
			if(Npc_HasItems(hero,ItLsTorch) >= 1)
			{
				Npc_RemoveInvItems(hero,ItLsTorch,1);
				Mdl_ApplyOverlayMds(hero,"HUMANS_NEWTORCH.MDS");
				ActivateZSSlot(hero,"BIP01 L HAND");
				Ext_RemoveFromSlot(hero,"BIP01 L HAND");	
				Ext_PutInSlot(hero,"BIP01 L HAND",ItLsFireTorch);
				Npc_RemoveInvItems(hero,ItLsFireTorch,Npc_HasItems(hero,ItLsFireTorch));
				TorchIsOn = TRUE;
			}
			else
			{
				AI_Print("Nemáš žádnou pochodeň...");
				B_Say(hero,hero,"$MISSINGITEM");	
			};
		};
	};
	if(KeyPressed(KEY_NUMPAD7) && !KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(OgonekIsUp == TRUE)
		{
			DetWspr = Hlp_GetNpc(Wisp_Detector);
		
			if(Npc_IsDead(DetWspr) == FALSE)
			{
				Snd_Play("WSP_Dead_A1");
			};

			AI_Teleport(DetWspr,"TOT");
			B_RemoveNpc(DetWspr);
			AI_Teleport(DetWspr,"TOT");
			OgonekIsUp = FALSE;
		}
		else
		{
			if(Npc_HasItems(hero,ItAm_Addon_WispDetector) >= 1)
			{
				if(Equip_WispDetector_OneTime == FALSE)
				{
					player_talent_wispdetector[WISPSKILL_NF] = TRUE;
					Equip_WispDetector_OneTime = TRUE;
				};
				
				DetWsp = Hlp_GetNpc(Wisp_Detector);
				AI_Teleport(DetWsp,"TOT");
				Wld_SpawnNpcRange(hero,Wisp_Detector,1,500);
				Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",Wisp_Detector,Wisp_Detector,0,0,0,FALSE);
				Snd_Play("MFX_Transform_Cast");
				OgonekIsUp = TRUE;
			}
			else
			{
				AI_Print("Nemáš amulet pátrací bludičky...");
				B_Say(hero,hero,"$MISSINGITEM");	
			};
		};
	};
	if(KeyPressed(KEY_NUMPAD8) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && !KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (PlayerSitDust == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (LowHealth == FALSE) && (HeroIsDead == FALSE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		if(CandleIsOn == TRUE)
		{
			Ext_RemoveFromSlot(hero,"BIP01 L THIGH");
			CandleIsOn = FALSE;
		}
		else
		{
			if(Npc_HasItems(hero,ItLs_BeltCandle) >= 1)
			{
				ActivateZSSlot(hero,"BIP01 L THIGH");
				Ext_RemoveFromSlot(hero,"BIP01 L THIGH");	
				Ext_PutInSlot(hero,"BIP01 L THIGH",ItUt_FireBeltCandle);
				Npc_RemoveInvItems(hero,ItUt_FireBeltCandle,Npc_HasItems(hero,ItUt_FireBeltCandle));
				CandleIsOn = TRUE;
			}
			else
			{
				AI_Print("Nemáš žádnou lucernu...");
				B_Say(hero,hero,"$MISSINGITEM");	
			};
		};
	};
	if(KeyPressed(KEY_NUMPAD9) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && !KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (PlayerSitDust == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (LowHealth == FALSE) && (HeroIsDead == FALSE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		if(Npc_HasItems(hero,ItMi_ZharpStone) >= 1)
		{
			Use_ItMi_SharpStone();
		}
		else
		{
			AI_Print("Nemáš žádný brusný kámen...");
			B_Say(hero,hero,"$MISSINGITEM");	
		};
	};
	if(KeyPressed(KEY_NUMPAD1) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
	{
		if(Use_Arrow == FALSE)
		{				
			if(Npc_HasItems(hero,ItRw_Arrow) >= 1)
			{
				weapon.munition = ItRw_Arrow;
				Use_Arrow = TRUE;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_FireArrow = FALSE;
				Use_MagicArrow = FALSE;
				AI_Print("Používáš obyčejné šípy...");
			}
			else
			{
				AI_Print("Nemáš žádné šípy tohoto druhu!");
			};
		}
		else
		{
			AI_Print("Už používáš tenhle druh šípů!");	
		};
	};
	if(KeyPressed(KEY_NUMPAD1) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Hlp_IsItem(weapon,ITRW_ADDON_MAGICCROSSBOW_SHV) != TRUE) && ((weapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW))
	{
		if(Use_Bolt == FALSE)
		{	
			if(Npc_HasItems(hero,ItRw_Bolt) >= 1)
			{
				weapon.munition = ItRw_Bolt;
				Use_Bolt = TRUE;
				Use_MagicBolt = FALSE;
				Use_HolyBolt = FALSE;
				AI_Print("Používáš obyčejné šipky...");		
			}
			else
			{
				AI_Print("Nemáš žádné šipky tohoto druhu!");
			};				
		}
		else
		{
			AI_Print("Už používáš tenhle druh šipek!");	
		};
	};
	if(KeyPressed(KEY_NUMPAD2) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
	{
		if(Use_MagicArrow == FALSE)
		{				
			if(Npc_HasItems(hero,ItRw_Addon_MagicArrow) >= 1)
			{
				weapon.munition = ItRw_Addon_MagicArrow;
				Use_Arrow = FALSE;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_FireArrow = FALSE;
				Use_MagicArrow = TRUE;
				AI_Print("Používáš magické šípy...");
			}
			else
			{
				AI_Print("Nemáš žádné šípy tohoto druhu!");
			};
		}
		else
		{
			AI_Print("Už používáš tenhle druh šípů!");	
		};
	};
	if(KeyPressed(KEY_NUMPAD2) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Hlp_IsItem(weapon,ITRW_ADDON_MAGICCROSSBOW_SHV) != TRUE) && ((weapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW))
	{
		if(Use_MagicBolt == FALSE)
		{	
			if(Npc_HasItems(hero,ItRw_Addon_MagicBolt) >= 1)
			{
				weapon.munition = ItRw_Addon_MagicBolt;
				Use_Bolt = FALSE;
				Use_MagicBolt = TRUE;
				Use_HolyBolt = FALSE;
				AI_Print("Používáš magické šipky...");		
			}
			else
			{
				AI_Print("Nemáš žádné šipky tohoto druhu!");
			};				
		}
		else
		{
			AI_Print("Už používáš tenhle druh šipek!");	
		};
	};
	if(KeyPressed(KEY_NUMPAD3) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
	{
		if(Use_HolyArrow == FALSE)
		{				
			if(Npc_HasItems(hero,ItRw_HolyArrow) >= 1)
			{
				weapon.munition = ItRw_HolyArrow;
				Use_Arrow = FALSE;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = TRUE;
				Use_FireArrow = FALSE;
				Use_MagicArrow = FALSE;
				AI_Print("Používáš posvěcené šípy...");
			}
			else
			{
				AI_Print("Nemáš žádné šípy tohoto druhu!");
			};
		}
		else
		{
			AI_Print("Už používáš tenhle druh šípů!");	
		};
	};
	if(KeyPressed(KEY_NUMPAD3) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Hlp_IsItem(weapon,ITRW_ADDON_MAGICCROSSBOW_SHV) != TRUE) && ((weapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW))
	{
		if(Use_HolyBolt == FALSE)
		{	
			if(Npc_HasItems(hero,ItRw_HolyBolt) >= 1)
			{
				weapon.munition = ItRw_HolyBolt;
				Use_Bolt = FALSE;
				Use_MagicBolt = FALSE;
				Use_HolyBolt = TRUE;
				AI_Print("Používáš posvěcené šipky...");		
			}
			else
			{
				AI_Print("Nemáš žádné šipky tohoto druhu!");
			};				
		}
		else
		{
			AI_Print("Už používáš tenhle druh šipek!");	
		};
	};
	if(KeyPressed(KEY_NUMPAD4) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
	{
		if(Use_FireArrow == FALSE)
		{				
			if(Npc_HasItems(hero,ItRw_Addon_FireArrow) >= 1)
			{
				weapon.munition = ItRw_Addon_FireArrow;
				Use_Arrow = FALSE;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_FireArrow = TRUE;
				Use_MagicArrow = FALSE;
				AI_Print("Používáš ohnivé šípy...");
			}
			else
			{
				AI_Print("Nemáš žádné šípy tohoto druhu!");
			};
		}
		else
		{
			AI_Print("Už používáš tenhle druh šípů!");	
		};
	};
	if(KeyPressed(KEY_NUMPAD5) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
	{
		if(Use_PoisonArrow == FALSE)
		{				
			if(Npc_HasItems(hero,ItRw_PoisonArrow) >= 1)
			{
				weapon.munition = ItRw_PoisonArrow;
				Use_Arrow = FALSE;
				Use_PoisonArrow = TRUE;
				Use_HolyArrow = FALSE;
				Use_FireArrow = FALSE;
				Use_MagicArrow = FALSE;
				AI_Print("Používáš otrávené šípy...");
			}
			else
			{
				AI_Print("Nemáš žádné šípy tohoto druhu!");
			};
		}
		else
		{
			AI_Print("Už používáš tenhle druh šípů!");	
		};
	};
	if(KeyPressed(KEY_NUMPAD6) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (PlayerSitDust == FALSE) && (HeroTRANS == FALSE) && (HeroIsDead == FALSE) && (ShakoIsOn[0] == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		if(CraitIsUp == FALSE)
		{
			if(PlayerSitDust == TRUE)
			{
				AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_SIT);
				PlayerSitDust = FALSE;
				WhistleCount = FALSE;
			};
			if((hero.attribute[ATR_MANA_MAX] >= 350) && (Npc_HasItems(hero,ItMi_FlyCarpet) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4))
			{
				if(FlyCarpetIsOn == FALSE)
				{
					Mdl_ApplyOverlayMds(hero,"fliegender_drache.mds");
					ActivateZSSlot(hero,"BIP01");
					Ext_RemoveFromSlot(hero,"BIP01");	
					Ext_PutInSlot(hero,"BIP01",ItSe_FlyCarpet);
					Npc_RemoveInvItems(hero,ItSe_FlyCarpet,Npc_HasItems(hero,ItSe_FlyCarpet));
					FlyCarpetIsOn = TRUE;
				}
				else
				{
					Ext_RemoveFromSlot(hero,"BIP01");	
					Npc_RemoveInvItems(hero,ItSe_FlyCarpet,Npc_HasItems(hero,ItSe_FlyCarpet));
					AI_Dodge(hero);
					AI_StandUpQuick(hero);
					Mdl_RemoveOverlayMds(hero,"fliegender_drache.mds");
					FlyCarpetIsOn = FALSE;
					CheckDismount = TRUE;
				};
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"fliegender_drache.mds");

				if(Npc_HasItems(hero,ItMi_FlyCarpet) == FALSE)
				{
					B_Say(hero,hero,"$MISSINGITEM");
				}
				else
				{
					B_Say(hero,hero,"$TOOHEAVYFORME");
					AI_Print("Pro použití potřebuješ mít 350 bodů many a ovládat 4. kruh magie...");
				};
			};
		};
	};
	//------------------------Procheye-----------------------------------------------

	if(KeyPressed(KEY_NUMPAD7) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(RegenSummoned == FALSE)
		{
			RegenSummoned = TRUE;
		}
		else
		{
			RegenSummoned = FALSE;
		};
	};
	if(KeyPressed(KEY_NUMPAD8) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && KeyPressed(KEY_LSHIFT) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (PlayerSitDust == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (HeroIsDead == FALSE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		if(Npc_HasItems(hero,ItMi_Angel) >= 1)
		{
			if(Wld_IsFPAvailable(hero,"CATCHFISH") && (AngelIsOn == FALSE))
			{
				AI_GotoFP(hero,"CATCHFISH");
				AI_Standup(hero);
				AI_AlignToFP(hero);
				ActivateZSSlot(hero,"BIP01 R HAND");
				Ext_RemoveFromSlot(hero,"BIP01 R HAND");	
				Ext_PutInSlot(hero,"BIP01 R HAND",ItSe_FAngel);
				Npc_RemoveInvItems(hero,ItSe_FAngel,Npc_HasItems(hero,ItSe_FAngel));
				AI_ProcessInfos(hero);
				AngelIsOn = TRUE;
			}
			else
			{
				AI_Print("Tohle není zrovna nejlepší místo pro rybaření...");
				B_Say(hero,hero,"$DONTWORK");	
				ActivateZSSlot(hero,"BIP01 R HAND");
				Ext_RemoveFromSlot(hero,"BIP01 R HAND");
				AngelIsOn = FALSE;
			};
		}
		else
		{
			AI_Print("Nemáš žádnou udici...");
			B_Say(hero,hero,"$MISSINGITEM");
			ActivateZSSlot(hero,"BIP01 R HAND");
			Ext_RemoveFromSlot(hero,"BIP01 R HAND");
			AngelIsOn = FALSE;	
		};
	};
	if(KeyPressed(KEY_NUMPAD9) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && KeyPressed(KEY_LSHIFT) && (Steal_Mode == FALSE) && (HeroIsDead == FALSE) && (Mount_Up == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		if(Npc_ValidFocusNpc(hero))
		{
			if((pNpc.guild <= GIL_SEPERATOR_HUM) && (pNpc.attribute[ATR_HITPOINTS] == FALSE) && (pNpc.aivar[90] == FALSE) && (pNpc.guild != GIL_DMT))
			{
				if(pNpc.aivar[AIV_StoryBandit] == FALSE)
				{
					if((Npc_HasItems(hero,ItSc_Ressurect) >= 1) && (hero.attribute[ATR_MANA] >= SPL_COST_SCROLL4))
					{
						AI_RemoveWeapon(hero);
						Npc_RemoveInvItems(hero,ItSc_Ressurect,1);
						AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
						pNpc.attribute[ATR_HITPOINTS] = pNpc.attribute[ATR_HITPOINTS_MAX];
						pNpc.attribute[ATR_HITPOINTS] = pNpc.attribute[ATR_HITPOINTS_MAX];
						hero.attribute[ATR_MANA] -= SPL_COST_SCROLL4;
						Npc_ClearAIQueue(pNpc);
						Npc_PerceiveAll(pNpc);
						Snd_Play("MFX_GHOSTVOICE");
						AI_PlayAni(pNpc,"T_STAND_2_SUCKENERGY_VICTIM");
						AI_PlayAni(pNpc,"S_SUCKENERGY_VICTIM");
						Wld_PlayEffect("SPELLFX_HEALSHRINE",pNpc,pNpc,0,0,0,FALSE);
						AI_Wait(pNpc,5);
						AI_Wait(hero,5);
						AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
						AI_PlayAniBS(pNpc,"T_SUCKENERGY_VICTIM_2_STAND",BS_STAND);
						AI_ContinueRoutine(pNpc);
					}
					else if(Npc_HasItems(hero,ItSc_Ressurect) == FALSE)
					{
						AI_Print("Nemáš žádný svitek oživení...");
						B_Say(hero,hero,"$MISSINGITEM");
					}
					else if(hero.attribute[ATR_MANA] < SPL_COST_SCROLL4)
					{
						AI_Print("Nemáš dostatek many...");
						B_Say(hero,hero,"$DONTWORK");
					};
				}
				else
				{
					if(Hlp_GetInstanceID(pNpc) != Hlp_GetInstanceID(VLK_444_Jack))
					{
						AI_Print("To nepomůže...");
					};

					B_Say(hero,hero,"$DONTWORK");
				};
			};
		};
	};
	if(KeyPressed(KEY_BACK) && KeyPressed(KEY_LSHIFT) && !KeyPressed(KEY_RSHIFT) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (FlyCarpetIsOn == FALSE) && (PlayerSitDust == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		if((hero.attribute[ATR_HITPOINTS] > 0) && (HeroIsDead == FALSE) && (Npc_IsInState(hero,ZS_Talk) == FALSE) && (Npc_IsInState(hero,ZS_Unconscious) == FALSE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE))
		{
			AI_RemoveWeapon(hero);
			tmpMana = hero.attribute[ATR_MANA];
			tmpHp = hero.attribute[ATR_HITPOINTS];
			AI_Standup(hero);
			AI_PlayAniBS(hero,"T_LGUARD_STRETCH",BS_STAND);
			hero.attribute[ATR_MANA] = tmpMana;
			hero.attribute[ATR_HITPOINTS] = tmpHp;
			AI_Wait(hero,1);
			bManaBar = 1;
			bHealthBar = 1;
			CamModeOn = FALSE;
		};
	};
	if(KeyPressed(KEY_NUMPAD3) && !KeyPressed(KEY_LSHIFT) && KeyPressed(KEY_RSHIFT) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (AIV_OrcWeaponEquip == FALSE) && (RH_Ready_2X2 == FALSE) && (LH_Ready_2X2 == FALSE) && (LowHealth == FALSE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(EquipedIndex_1H == TRUE)
		{
			if((EquipedIndex_Chief == FALSE) && (AIV_Shield_01 == FALSE) && (AIV_Shield_02 == FALSE) && (AIV_Shield_03 == FALSE) && (AIV_Shield_04 == FALSE) && (AIV_Shield_05 == FALSE) && (AIV_Shield_06 == FALSE) && (AIV_Shield_07 == FALSE) && (AIV_Shield_Caracust == FALSE))
			{
				if(hero.HitChance[NPC_TALENT_1H] >= 90)
				{
					Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
					Mdl_ApplyOverlayMds(hero,"humans_1hST3.mds");
					AI_Print("Vybrána úroveň boje s jednoručními zbraněmi - 'Mistr'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			}
			else if(EquipedIndex_Chief == TRUE)
			{
				if(hero.HitChance[NPC_TALENT_1H] >= 90)
				{
					Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
					Mdl_ApplyOverlayMds(hero,"Humans_Rapier_ST3.mds");
					AI_Print("Vybrána úroveň boje s jednoručními zbraněmi - 'Mistr'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			}
			else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
					AI_Print("Vybrána úroveň boje se štítem - 'Mistr'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			};
		};
		if(EquipedIndex_2H == TRUE)
		{
			if((AIV_Speer == FALSE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE) && (AIV_Staff_10 == FALSE))
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 90)
				{
					Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");

					if(AXE_ST3 == TRUE)
					{
						Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
					}
					else if(AXE_ST2 == TRUE)
					{
						Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
						AXE_ST2 = FALSE;
						AXE_ST3 = TRUE;
					}
					else if(AXE_STON == TRUE)
					{
						Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
						AXE_ST2 = FALSE;
						AXE_ST3 = TRUE;
					}
					else
					{
						Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
					};

					AI_Print("Vybrána úroveň boje s obouručními zbraněmi - 'Mistr'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			}
			else if(AIV_Speer == TRUE)
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 90)
				{
					Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
					AI_Print("Vybrána úroveň boje s kopím - 'Mistr'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			};
			if((AIV_Staff_01 == TRUE) || (AIV_Staff_Blood == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_10 == TRUE))
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 90)
				{
					Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
					AI_Print("Vybrána úroveň boje s holí - 'Mistr'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			};
		};
	};
	if(KeyPressed(KEY_NUMPAD2) && !KeyPressed(KEY_LSHIFT) && KeyPressed(KEY_RSHIFT) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (AIV_OrcWeaponEquip == FALSE) && (RH_Ready_2X2 == FALSE) && (LH_Ready_2X2 == FALSE) && (LowHealth == FALSE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(EquipedIndex_1H == TRUE)
		{
			if((EquipedIndex_Chief == FALSE) && (AIV_Shield_01 == FALSE) && (AIV_Shield_02 == FALSE) && (AIV_Shield_03 == FALSE) && (AIV_Shield_04 == FALSE) && (AIV_Shield_05 == FALSE) && (AIV_Shield_06 == FALSE) && (AIV_Shield_07 == FALSE) && (AIV_Shield_Caracust == FALSE))
			{
				if(hero.HitChance[NPC_TALENT_1H] >= 60)
				{
					Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
					Mdl_ApplyOverlayMds(hero,"humans_1hST2.mds");
					AI_Print("Vybrána úroveň boje s jednoručními zbraněmi - 'Expert'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			}
			else if(EquipedIndex_Chief == TRUE)
			{
				if(hero.HitChance[NPC_TALENT_1H] >= 60)
				{
					Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
					Mdl_ApplyOverlayMds(hero,"Humans_Rapier_ST2.mds");
					AI_Print("Vybrána úroveň boje s jednoručními zbraněmi - 'Expert'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			}
			else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
					AI_Print("Vybrána úroveň boje se štítem - 'Expert'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			};
		};
		if(EquipedIndex_2H == TRUE)
		{
			if((AIV_Speer == FALSE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE) && (AIV_Staff_10 == FALSE))
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 60)
				{
					Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");

					if(AXE_ST2 == TRUE)
					{
						Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
					}
					else if(AXE_STON == TRUE)
					{	
						Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
						AXE_ST2 = TRUE;
					}
					else
					{
						Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
					};

					AI_Print("Vybrána úroveň boje s obouručními zbraněmi - 'Expert'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			}
			else if(AIV_Speer == TRUE)
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 60)
				{
					Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
					AI_Print("Vybrána úroveň boje s kopím - 'Expert'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			};
			if((AIV_Staff_01 == TRUE) || (AIV_Staff_Blood == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_10 == TRUE))
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 60)
				{
					Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
					AI_Print("Vybrána úroveň boje s holí - 'Expert'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			};
		};
	};
	if(KeyPressed(KEY_NUMPAD1) && !KeyPressed(KEY_LSHIFT) && KeyPressed(KEY_RSHIFT) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (AIV_OrcWeaponEquip == FALSE) && (RH_Ready_2X2 == FALSE) && (LH_Ready_2X2 == FALSE) && (LowHealth == FALSE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(EquipedIndex_1H == TRUE)
		{
			if((EquipedIndex_Chief == FALSE) && (AIV_Shield_01 == FALSE) && (AIV_Shield_02 == FALSE) && (AIV_Shield_03 == FALSE) && (AIV_Shield_04 == FALSE) && (AIV_Shield_05 == FALSE) && (AIV_Shield_06 == FALSE) && (AIV_Shield_07 == FALSE) && (AIV_Shield_Caracust == FALSE))
			{
				if(hero.HitChance[NPC_TALENT_1H] >= 30)
				{
					Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
					Mdl_ApplyOverlayMds(hero,"humans_1hST1.mds");
					AI_Print("Vybrána úroveň boje s jednoručními zbraněmi - 'Bojovník'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			}
			else if(EquipedIndex_Chief == TRUE)
			{
				if(hero.HitChance[NPC_TALENT_1H] >= 30)
				{
					Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
					Mdl_ApplyOverlayMds(hero,"Humans_Rapier_ST1.mds");
					AI_Print("Vybrána úroveň boje s jednoručními zbraněmi - 'Bojovník'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			}
			else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
					AI_Print("Vybrána úroveň boje se štítem - 'Bojovník'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			};
		};
		if(EquipedIndex_2H == TRUE)
		{
			if((AIV_Speer == FALSE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE) && (AIV_Staff_10 == FALSE))
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 30)
				{
					Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
					Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
					AI_Print("Vybrána úroveň boje s obouručními zbraněmi - 'Bojovník'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			}
			else if(AIV_Speer == TRUE)
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 30)
				{
					Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
					AI_Print("Vybrána úroveň boje s kopím - 'Bojovník'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			};
			if((AIV_Staff_01 == TRUE) || (AIV_Staff_Blood == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_10 == TRUE))
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 30)
				{
					Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
					Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
					AI_Print("Vybrána úroveň boje s holí - 'Bojovník'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			};
		};
	};
	if(KeyPressed(KEY_NUMPAD0) && !KeyPressed(KEY_LSHIFT) && KeyPressed(KEY_RSHIFT) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (AIV_OrcWeaponEquip == FALSE) && (RH_Ready_2X2 == FALSE) && (LH_Ready_2X2 == FALSE) && (LowHealth == FALSE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(EquipedIndex_1H == TRUE)
		{
			if((EquipedIndex_Chief == FALSE) && (AIV_Shield_01 == FALSE) && (AIV_Shield_02 == FALSE) && (AIV_Shield_03 == FALSE) && (AIV_Shield_04 == FALSE) && (AIV_Shield_05 == FALSE) && (AIV_Shield_06 == FALSE) && (AIV_Shield_07 == FALSE) && (AIV_Shield_Caracust == FALSE))
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				AI_Print("Vybrána úroveň boje s jednoručními zbraněmi - 'Rekrut'");
				B_CheckAcroAni(hero);
			}
			else if(EquipedIndex_Chief == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				Mdl_ApplyOverlayMds(hero,"Humans_Pirate.mds");
				AI_Print("Vybrána úroveň boje s jednoručními zbraněmi - 'Rekrut'");
				B_CheckAcroAni(hero);
			}
			else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Pirate.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST3.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST2.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rapier_ST1.mds");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
					AI_Print("Vybrána úroveň boje se štítem - 'Rekrut'");
					B_CheckAcroAni(hero);
				}
				else
				{
					AI_PrintClr("Nedostatečná úroveň boje se zbraněmi!",177,58,17);
				};
			};
		};
		if(EquipedIndex_2H == TRUE)
		{
			if((AIV_Speer == FALSE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE) && (AIV_Staff_10 == FALSE))
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				AI_Print("Vybrána úroveň boje s obouručními zbraněmi - 'Rekrut'");
				B_CheckAcroAni(hero);
			}
			else if(AIV_Speer == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				AI_Print("Vybrána úroveň boje s kopím - 'Rekrut'");
				B_CheckAcroAni(hero);
			};
			if((AIV_Staff_01 == TRUE) || (AIV_Staff_Blood == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_10 == TRUE))
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				AI_Print("Vybrána úroveň boje s holí - 'Rekrut'");
				B_CheckAcroAni(hero);
			};
		};
	};
	if(KeyPressed(KEY_U))
	{
		if(Menu_ReadInt("SOUND","musicEnabled") == TRUE)
		{
			Menu_WriteInt("SOUND","musicEnabled",FALSE);
			Menu_WriteInt("SOUND","musicEnabled",TRUE);
		};
	};
	if(KeyClick(KEY_I) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (bDevMode == FALSE) && (Steal_Mode == FALSE) && (Mount_Up == FALSE) && (ShakoIsOn[0] == FALSE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(MoreInfoOnScreen == FALSE)
		{
			MoreInfoOnScreen = TRUE;
		}
		else
		{
			MoreInfoOnScreen = FALSE;
		};
	};
	if(hero.guild <= GIL_SEPERATOR_HUM)
	{
		G_OpenSteal(uKey);
	};
	//if(KeyPressed(KEY_LSHIFT) && KeyPressed(KEY_LCONTROL) && KeyPressed(KEY_K))
	//{
	//	B_UseItem(hero,ItWr_UndefBook);
	//};
};

func void JHJKGHJhjfgdhfhfdglGHjdjggEUIERh1()
{
};

func void JHJKGHJhjfgdhfhfdglGHjdjggEUIERh()
{
};

func void JHJKGHJhjfgdhfhfdglGHjdjggEUIERhKLSDHhfhd()
{
	JHJKGHJhjfgdhfhfdglGHjdjggEUIERh();
	JHJKGHJhjfgdhfhfdglGHjdjggEUIERh1();
};