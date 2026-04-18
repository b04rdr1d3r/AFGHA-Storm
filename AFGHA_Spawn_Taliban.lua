-- spawn taliban and allied groups
ZoneTable = { ZONE:New( "Spawn1" ), ZONE:New( "Spawn2" ), ZONE:New( "Spawn3" ), ZONE:New( "Spawn4" ), ZONE:New( "Spawn5" ), ZONE:New( "Spawn6" ), ZONE:New( "Spawn7" ), ZONE:New( "Spawn8" ), ZONE:New( "Spawn9" ), ZONE:New( "Spawn10" ), ZONE:New( "Spawn11" ) }

Spawn_Taliban1 = SPAWN:New( "Taliban Convoy 1" , false)
  :InitRandomizeRoute( 1, 1, 200 )
  :InitRandomizeZones( ZoneTable )
  :OnSpawnGroup(function(T1)

    -- Debug: confirm callback fires
    env.info("OnSpawnGroup for Taliban Convoy 1 fired")

    if not T1 then
      env.info("T1 is nil in OnSpawnGroup")
      return
    end

    local convoyCoord = T1:GetCoordinate()
    local convoyVec2  = convoyCoord:GetVec2()

    -- Create a temporary 1 km radius zone around the convoy
    local zoneAroundConvoy = ZONE_RADIUS:New("Zone_T1_1km", convoyVec2, 1000)

    -- Spawn Patrol UK somewhere inside that 1 km zone
    P1 = SPAWN:New("Patrol UK")
      :SpawnInZone(zoneAroundConvoy, true)
    local patrolCoord1 = P1:GetCoordinate():ToStringLLDMS()
    local messageText1 = "All airborne elements, this is Overlord, priority tasking. Friendly ground unit UK Patrol Zulu4-1, at coordinates " .. patrolCoord1 .. " reports possible troops in contact and requests immediate air cover. Provide armed overwatch and close air support-on-call for that grid."
    MessageBLUE = MESSAGE:New( messageText1, 120 ):ToCoalition( coalition.side.BLUE )

  end)
Spawn_Taliban1:Spawn()

Spawn_Taliban2 = SPAWN:New( "Taliban Convoy 2" , false)
   :InitRandomizeRoute( 1, 1, 200 )
   :InitRandomizeZones( ZoneTable )
   :OnSpawnGroup(function(T2)

    -- Debug: confirm callback fires
    env.info("OnSpawnGroup for Taliban Convoy 2 fired")

    if not T2 then
      env.info("T1 is nil in OnSpawnGroup")
      return
    end

    local convoyCoord = T2:GetCoordinate()
    local convoyVec2  = convoyCoord:GetVec2()

    -- Create a temporary 1 km radius zone around the convoy
    local zoneAroundConvoy = ZONE_RADIUS:New("Zone_T2_1km", convoyVec2, 1000)

    -- Spawn Patrol UK somewhere inside that 1 km zone
    P2 = SPAWN:New("Patrol USA")
      :SpawnInZone(zoneAroundConvoy, true)
    local patrolCoord2 = P2:GetCoordinate():ToStringLLDMS()
    local messageText2 = "All airborne elements, this is Overlord, priority tasking. Friendly ground unit US Patrol Bravo6-4, at coordinates " ..   patrolCoord2 .. " reports possible troops in contact and requests immediate air cover. Provide armed overwatch and close air support-on-call for that grid."
    MessageBLUE = MESSAGE:New( messageText2, 120 ):ToCoalition( coalition.side.BLUE )

  end)
Spawn_Taliban2:Spawn()







