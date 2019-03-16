
func int Spell_ProcessMana(var int manaInvested)
{
	var int activeSpell;
	activeSpell = Npc_GetActiveSpell(self);

	if(activeSpell == SPL_PalLight)
	{
		return Spell_Logic_PalLight(manaInvested);
	};
	if(activeSpell == SPL_PalLightHeal)
	{
		return Spell_Logic_PalLightHeal(manaInvested);
	};
	if(activeSpell == SPL_PalHolyBolt)
	{
		return Spell_Logic_PalHolyBolt(manaInvested);
	};
	if(activeSpell == SPL_PalMediumHeal)
	{
		return Spell_Logic_PalMediumHeal(manaInvested);
	};
	if(activeSpell == SPL_PalRepelEvil)
	{
		return Spell_Logic_PalRepelEvil(manaInvested);
	};
	if(activeSpell == SPL_PalFullHeal)
	{
		return Spell_Logic_PalFullHeal(manaInvested);
	};
	if(activeSpell == SPL_PalDestroyEvil)
	{
		return Spell_Logic_PalDestroyEvil(manaInvested);
	};
	if(activeSpell == SPL_PalTeleportSecret)
	{
		return Spell_Logic_PalTeleportSecret(manaInvested);
	};
	if(activeSpell == SPL_TeleportSeaport)
	{
		return Spell_Logic_TeleportSeaport(manaInvested);
	};
	if(activeSpell == SPL_TeleportMonastery)
	{
		return Spell_Logic_TeleportMonastery(manaInvested);
	};
	if(activeSpell == SPL_TeleportFarm)
	{
		return Spell_Logic_TeleportFarm(manaInvested);
	};
	if(activeSpell == SPL_TeleportXardas)
	{
		return Spell_Logic_TeleportXardas(manaInvested);
	};
	if(activeSpell == SPL_TeleportPassNW)
	{
		return Spell_Logic_TeleportPassNW(manaInvested);
	};
	if(activeSpell == SPL_SummonCrait)
	{
		return spell_logic_SummonCrait(manaInvested);
	};
	if(activeSpell == SPL_TeleportPassOW)
	{
		return Spell_Logic_TeleportPassOW(manaInvested);
	};
	if(activeSpell == SPL_TeleportOC)
	{
		return Spell_Logic_TeleportOC(manaInvested);
	};
	if(activeSpell == SPL_TeleportOWDemonTower)
	{
		return Spell_Logic_TeleportOWDemonTower(manaInvested);
	};
	if(activeSpell == SPL_UnlockChest)
	{
		return Spell_Logic_UnlockChest(manaInvested);
	};
	if(activeSpell == SPL_TELEPORTDAGOT)
	{
		return spell_logic_teleportdagot(manaInvested);
	};
	if(activeSpell == SPL_TELEPORTORC)
	{
		return spell_logic_teleportorc(manaInvested);
	};
	if(activeSpell == SPL_TELEPORTPSICAMP)
	{
		return spell_logic_teleportpsicamp(manaInvested);
	};
	if(activeSpell == SPL_TeleportTaverne)
	{
		return Spell_Logic_TeleportTaverne(manaInvested);
	};
	if(activeSpell == SPL_Light)
	{
		return Spell_Logic_Light(manaInvested);
	};
	if(activeSpell == SPL_Firebolt)
	{
		return Spell_Logic_Firebolt(manaInvested);
	};
	if(activeSpell == SPL_Icebolt)
	{
		return Spell_Logic_IceBolt(manaInvested);
	};
	if(activeSpell == SPL_Zap)
	{
		return Spell_Logic_Zap(manaInvested);
	};
	if(activeSpell == SPL_LightHeal)
	{
		return Spell_Logic_LightHeal(manaInvested);
	};
	if(activeSpell == SPL_SummonGoblinSkeleton)
	{
		return Spell_Logic_SummonGoblinSkeleton(manaInvested);
	};
	if(activeSpell == SPL_OrcFireball)
	{
		return Spell_Logic_OrcFireball(manaInvested);
	};
	if(activeSpell == SPL_InstantFireball)
	{
		return Spell_Logic_InstantFireball(manaInvested);
	};
	if(activeSpell == SPL_SUMMONSHOAL)
	{
		return spell_logic_summonshoal(manaInvested);
	};
	if(activeSpell == SPL_SEVEREFETIDITY)
	{
		return spell_logic_severefetidity(manaInvested);
	};
	if(activeSpell == SPL_SummonWolf)
	{
		return Spell_Logic_SummonWolf(manaInvested);
	};
	if(activeSpell == SPL_WindFist)
	{
		return Spell_Logic_WindFist(manaInvested);
	};
	if(activeSpell == SPL_Sleep)
	{
		return Spell_Logic_Sleep(manaInvested);
	};
	if(activeSpell == SPL_MediumHeal)
	{
		return Spell_Logic_MediumHeal(manaInvested);
	};
	if(activeSpell == SPL_LightningFlash)
	{
		return Spell_Logic_LightningFlash(manaInvested);
	};
	if(activeSpell == SPL_ChargeFireball)
	{
		return Spell_Logic_ChargeFireball(manaInvested);
	};
	if(activeSpell == SPL_ChargeZap)
	{
		return Spell_Logic_ChargeZap(manaInvested);
	};
	if(activeSpell == SPL_SummonSkeleton)
	{
		return Spell_Logic_SummonSkeleton(manaInvested);
	};
	if(activeSpell == SPL_Fear)
	{
		return Spell_Logic_Fear(manaInvested);
	};
	if(activeSpell == SPL_IceCube)
	{
		return Spell_Logic_IceCube(manaInvested);
	};
	if(activeSpell == SPL_ChargeZap)
	{
		return Spell_Logic_ChargeZap(manaInvested);
	};
	if(activeSpell == SPL_SummonGolem)
	{
		return Spell_Logic_SummonGolem(manaInvested);
	};
	if(activeSpell == SPL_DestroyUndead)
	{
		return Spell_Logic_DestroyUndead(manaInvested);
	};
	if(activeSpell == SPL_Pyrokinesis)
	{
		return Spell_Logic_Pyrokinesis(manaInvested);
	};
	if(activeSpell == SPL_Firestorm)
	{
		return Spell_Logic_Firestorm(manaInvested);
	};
	if(activeSpell == SPL_IceWave)
	{
		return Spell_Logic_IceWave(manaInvested);
	};
	if(activeSpell == SPL_SummonDemon)
	{
		return Spell_Logic_SummonDemon(manaInvested);
	};
	if(activeSpell == SPL_FullHeal)
	{
		return Spell_Logic_FullHeal(manaInvested);
	};
	if(activeSpell == SPL_Firerain)
	{
		return Spell_Logic_Firerain(manaInvested);
	};
	if(activeSpell == SPL_BreathOfDeath)
	{
		return Spell_Logic_BreathOfDeath(manaInvested);
	};
	if(activeSpell == SPL_MassDeath)
	{
		return Spell_Logic_Massdeath(manaInvested);
	};
	if(activeSpell == SPL_ArmyOfDarkness)
	{
		return Spell_Logic_ArmyOfDarkness(manaInvested);
	};
	if(activeSpell == SPL_Shrink)
	{
		return Spell_Logic_Shrink(manaInvested);
	};
	if(activeSpell == SPL_TrfSheep)
	{
		return Spell_Logic_TrfSheep(manaInvested);
	};
	if(activeSpell == SPL_TrfScavenger)
	{
		return Spell_Logic_TrfScavenger(manaInvested);
	};
	if(activeSpell == SPL_TrfGiantBug)
	{
		return Spell_Logic_TrfGiantBug(manaInvested);
	};
	if(activeSpell == SPL_TrfWolf)
	{
		return Spell_Logic_TrfWolf(manaInvested);
	};
	if(activeSpell == SPL_TrfWaran)
	{
		return Spell_Logic_TrfWaran(manaInvested);
	};
	if(activeSpell == SPL_TrfSnapper)
	{
		return Spell_Logic_TrfSnapper(manaInvested);
	};
	if(activeSpell == SPL_TrfWarg)
	{
		return Spell_Logic_TrfWarg(manaInvested);
	};
	if(activeSpell == SPL_TrfFireWaran)
	{
		return Spell_Logic_TrfFireWaran(manaInvested);
	};
	if(activeSpell == SPL_TrfLurker)
	{
		return Spell_Logic_TrfLurker(manaInvested);
	};
	if(activeSpell == SPL_TrfShadowbeast)
	{
		return Spell_Logic_TrfShadowbeast(manaInvested);
	};
	if(activeSpell == SPL_TrfDragonSnapper)
	{
		return Spell_Logic_TrfDragonSnapper(manaInvested);
	};
	if(activeSpell == SPL_TrfTroll)
	{
		return Spell_Logic_TrfTroll(manaInvested);
	};
	if(activeSpell == SPL_TRFMEATBUG)
	{
		return spell_logic_trfmeatbug(manaInvested);
	};
	if(activeSpell == SPL_Charm)
	{
		return Spell_Logic_Charm(manaInvested);
	};
	if(activeSpell == SPL_MasterOfDisaster)
	{
		return Spell_Logic_MasterOfDisaster(manaInvested);
	};
	if(activeSpell == SPL_ConcussionBolt)
	{
		return Spell_Logic_Concussionbolt(manaInvested);
	};
	if(activeSpell == SPL_BELIARRUNE)
	{
		return spell_logic_beliarrune(manaInvested);
	};
	if(activeSpell == SPL_Deathbolt)
	{
		return Spell_Logic_Deathbolt(manaInvested);
	};
	if(activeSpell == SPL_Deathball)
	{
		return Spell_Logic_Deathball(manaInvested);
	};
	if(activeSpell == SPL_Thunderstorm)
	{
		return Spell_Logic_Thunderstorm(manaInvested);
	};
	if(activeSpell == SPL_WaterFist)
	{
		return Spell_Logic_Waterfist(manaInvested);
	};
	if(activeSpell == SPL_Whirlwind)
	{
		return Spell_Logic_Whirlwind(manaInvested);
	};
	if(activeSpell == SPL_Geyser)
	{
		return Spell_Logic_Geyser(manaInvested);
	};
	if(activeSpell == SPL_Inflate)
	{
		return Spell_Logic_Inflate(manaInvested);
	};
	if(activeSpell == SPL_Waterwall)
	{
		return spell_logic_waterwall(manaInvested);
	};
	if(activeSpell == SPL_IceLance)
	{
		return Spell_Logic_Icelance(manaInvested);
	};
	if(activeSpell == SPL_Swarm)
	{
		return Spell_Logic_Swarm(manaInvested);
	};
	if(activeSpell == SPL_GreenTentacle)
	{
		return Spell_Logic_Greententacle(manaInvested);
	};
	if(activeSpell == SPL_SummonGuardian)
	{
		return Spell_Logic_SummonGuardian(manaInvested);
	};
	if(activeSpell == SPL_Energyball)
	{
		return Spell_Logic_EnergyBall(manaInvested);
	};
	if(activeSpell == SPL_ManaForLife)
	{
		return Spell_Logic_ManaForLife(manaInvested);
	};
	if(activeSpell == SPL_Skull)
	{
		return Spell_Logic_Skull(manaInvested);
	};
	if(activeSpell == SPL_SummonZombie)
	{
		return Spell_Logic_SummonZombie(manaInvested);
	};
	if(activeSpell == SPL_SUMMONICEGOLEM)
	{
		return spell_logic_summonicegolem(manaInvested);
	};
	if(activeSpell == SPL_SUMMONELIGOR)
	{
		return spell_logic_summoneligor(manaInvested);
	};
	if(activeSpell == SPL_TELEKINESIS)
	{
		return spell_logic_telekinesis(manaInvested);
	};
	if(activeSpell == SPL_FIRELIGHT)
	{
		return spell_logic_firelight(manaInvested);
	};
	if(activeSpell == SPL_CONTROL)
	{
		return spell_logic_control(manaInvested);
	};
	if(activeSpell == SPL_BERZERK)
	{
		return spell_logic_berzerk(manaInvested);
	};
	if(activeSpell == SPL_TPLLIGHTHEAL)
	{
		return spell_logic_tpllightheal(manaInvested);
	};
	if(activeSpell == SPL_TPLMEDIUMHEAL)
	{
		return spell_logic_tplmediumheal(manaInvested);
	};
	if(activeSpell == SPL_TPLHEAVYHEAL)
	{
		return spell_logic_tplheavyheal(manaInvested);
	};
	if(activeSpell == SPL_TPLSUPERHEAL)
	{
		return spell_logic_tplsuperheal(manaInvested);
	};
	if(activeSpell == SPL_TPLLIGHTSTRIKE)
	{
		return spell_logic_tpllightstrike(manaInvested);
	};
	if(activeSpell == SPL_TPLMEDIUMSTRIKE)
	{
		return spell_logic_tplmediumstrike(manaInvested);
	};
	if(activeSpell == SPL_TPLHEAVYSTRIKE)
	{
		return spell_logic_tplheavystrike(manaInvested);
	};
	if(activeSpell == SPL_TPLSUPERSTRIKE)
	{
		return spell_logic_tplsuperstrike(manaInvested);
	};
	if(activeSpell == SPL_SUMMONFIREGOLEM)
	{
		return spell_logic_summonfiregolem(manaInvested);
	};
	if(activeSpell == SPL_SUMMONSWAMPGOLEM)
	{
		return spell_logic_summonswampgolem(manaInvested);
	};
	if(activeSpell == SPL_DESTROYGUARDIANS)
	{
		return spell_logic_destroyguardians(manaInvested);
	};
	if(activeSpell == SPL_SUMMONTREANT)
	{
		return spell_logic_summontreant(manaInvested);
	};
	if(activeSpell == SPL_FireMeteor)
	{
		return spell_logic_FireMeteor(manaInvested);
	};
	if(activeSpell == SPL_GuruWrath)
	{
		return spell_logic_GuruWrath(manaInvested);
	};
	if(activeSpell == SPL_RapidFirebolt)
	{
		return Spell_Logic_RapidFirebolt(manaInvested);
	};
	if(activeSpell == SPL_RapidIcebolt)
	{
		return Spell_Logic_RapidIcebolt(manaInvested);
	};
	if(activeSpell == SPL_Rage)
	{
		return Spell_Logic_Rage(manaInvested);
	};
	if(activeSpell == SPL_Quake)
	{
		return Spell_Logic_Quake(manaInvested);
	};
	if(activeSpell == SPL_MagicCage)
	{
		return Spell_Logic_MagicCage(manaInvested);
	};
	if(activeSpell == SPL_Lacerate)
	{
		return Spell_Logic_Lacerate(manaInvested);
	};
	if(activeSpell == SPL_Extricate)
	{
		return Spell_Logic_Extricate(manaInvested);
	};
	if(activeSpell == SPL_Explosion)
	{
		return Spell_Logic_Extricate(manaInvested);
	};
	if(activeSpell == SPL_Elevate)
	{
		return Spell_Logic_Elevate(manaInvested);
	};
	if(activeSpell == SPL_AdanosBall)
	{
		return Spell_Logic_AdanosBall(manaInvested);
	};
	if(activeSpell == SPL_Acid)
	{
		return Spell_Logic_Acid(manaInvested);
	};

	return SPL_SENDSTOP;
};
