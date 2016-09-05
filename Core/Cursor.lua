local Cursor = YokiRaidCursor.Class('Cursor')


function Cursor:Initialize(frame, target)
    if (frame ~= nil) then
        self._frame = frame
    else
        self._frame = self:CreateFrame()
    end

    self:Move(target)
end

function Cursor:GetTarget()
    return self._target
end

function Cursor:Move(frame)
    self._frame:ClearAllPoints()
    self._frame:SetPoint('TOPLEFT', frame, 'CENTER', 0, 0)
    self._target = frame
end

function Cursor:CreateFrame()
    local cursorFrame, cursorTexture

    cursorFrame = CreateFrame('Frame', 'YRC_Cursor', UIParent)
    cursorFrame:SetFrameStrata('HIGH')
    cursorFrame:SetWidth(32)
    cursorFrame:SetHeight(32)

    cursorTexture = cursorFrame:CreateTexture(nil, 'ARTWORK')
    cursorTexture:SetTexture("Interface\\CURSOR\\Attack.blp")
    cursorTexture:SetAllPoints(cursorFrame)
    cursorFrame.texture = cursorTexture

    cursorFrame:SetPoint('CENTER', 0, 0)
    cursorFrame:Show()

    return cursorFrame
end


YokiRaidCursor.Cursor = Cursor
