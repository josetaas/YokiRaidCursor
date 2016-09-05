local Repository = YokiRaidCursor.Repository
local FrameRepository = YokiRaidCursor.Class('FrameRepository', Repository)


function FrameRepository:Get(identifier)
    return _G[identifier]
end


YokiRaidCursor.Repositories.FrameRepository = FrameRepository
