local Frame = {}

function Frame.GetPosition(frame)
    local l, b, w, h = frame:GetRect()

    return l+w/2, b+h/2
end

YokiRaidCursor.Core.Utilities.Frame = Frame
