local Class = YokiRaidCursor.Class
local Test = YokiRaidCursor.Testing.Test
local CursorTest = Class('CursorTest', Test)

function CursorTest:Initialize()
    Test:Register(CursorTest.Move_WithValidFrame_CentersOnFrame)
    Test:Register(CursorTest.Move_WithValidFrame_SetsTargetToFrame)
end

function CursorTest:Move_WithValidFrame_CentersOnFrame()
    local x, y, mockCursorFrame, mockFrame, cursor

    mockCursorFrame = Test:GetMock()
    mockFrame = Test:GetMock()
    cursor = YokiRaidCursor.Core.Cursor(mockCursorFrame)

    cursor:Move(mockFrame)

    Test:Verify(mockCursorFrame:ClearAllPoints())
    Test:Verify(mockCursorFrame:SetPoint('TOPLEFT', mockFrame, 'CENTER', 0, 0))
end

function CursorTest:Move_WithValidFrame_SetsTargetToFrame()
    local frame, mockCursorFrame, mockFrame, cursor

    mockCursorFrame = Test:GetMock()
    mockFrame = Test:GetMock()
    cursor = YokiRaidCursor.Core.Cursor(mockCursorFrame)

    cursor:Move(mockFrame)

    frame = cursor:GetTarget()
    Test:AssertEquals(mockFrame, frame)
end


local test = CursorTest()
