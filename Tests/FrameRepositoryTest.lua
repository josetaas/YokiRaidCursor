local Test = YokiRaidCursor.Testing.Test
local FrameRepositoryTest = YokiRaidCursor.Class('FrameRepositoryTest', Test)


function FrameRepositoryTest:Initialize()
    self:Register(self.Get_WithValidNameOfFrame_ReturnsFrame)

    self.frameRepository = YokiRaidCursor.Repositories.FrameRepository()
end

function FrameRepositoryTest:Get_WithValidNameOfFrame_ReturnsFrame()
    local frame

    frame = self.frameRepository:Get('UIParent')

    self:AssertEquals('UIParent', frame:GetName())
end


local test = FrameRepositoryTest()
