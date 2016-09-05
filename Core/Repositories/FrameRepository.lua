local Repository = YokiRaidCursor.Core.Repository
local FrameRepository = YokiRaidCursor.Class('FrameRepository', Repository)


function FrameRepository:Get(identifier)
    return _G[identifier]
end


YokiRaidCursor.Core.Repositories.FrameRepository = FrameRepository
