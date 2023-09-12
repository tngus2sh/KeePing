package com.keeping.missionservice.api.service.mission;

import com.keeping.missionservice.api.service.mission.dto.AddMissionDto;

public interface MissionService {

    public Long addMission(String memberId, AddMissionDto dto);
}
