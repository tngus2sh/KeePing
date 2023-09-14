package com.keeping.missionservice.api.controller.mission;

import com.keeping.missionservice.api.ApiResponse;
import com.keeping.missionservice.api.controller.mission.request.AddMissionRequest;
import com.keeping.missionservice.api.service.mission.MissionService;
import com.keeping.missionservice.api.service.mission.dto.AddMissionDto;
import com.keeping.missionservice.global.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RequiredArgsConstructor
@RestController
@RequestMapping("/mission-service")
@Slf4j
public class MissionApiController {

    private final MissionService missionService;

    /**
     * 미션 등록
     * @param request 미션 request
     * @return 미션 식별키
     */
    @PostMapping
    public ApiResponse<Long> addMission(
            @Valid @RequestBody AddMissionRequest request
            ) {
        // 사용자 정보 가져오기
        String memberId = "";

        log.debug("addMission :: request={}", request);
        log.info("addMission :: request={}", request);

        AddMissionDto dto = AddMissionDto.toDto(request);

        try {
            Long missionId = missionService.addMission(memberId, dto);
            return ApiResponse.ok(missionId);
        } catch (NotFoundException e) {
            return ApiResponse.of(Integer.parseInt(e.getResultCode()), e.getHttpStatus(), e.getResultMessage(), null);
        }
    }
}
