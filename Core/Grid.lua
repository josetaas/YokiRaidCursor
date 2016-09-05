local Grid = YokiRaidCursor.Class('Grid')

local GetPosition = YokiRaidCursor.Utilities.Frame.GetPosition

function Grid:Initialize(frames)
    if (frames) then
        self:UpdateFrames(frames)
    end
end

function Grid:UpdateFrames(frames)
    self.frames = frames
    self:_UpdateFrames()
end

function Grid:GetFirst()
    local frame, ox, oy, x, y, swap
    for _, f in pairs(self.frames) do
        if (frame == nil) then
            swap = true
        else
            x, y = GetPosition(f)
            if (y >= oy
                and x <= ox) then
                swap = true
            end
        end

        if (swap) then
            frame = f
            ox, oy = GetPosition(f)
        end
    end

    return frame
end

function Grid:GetNeighbor(frame, direction)
    if (self._frameLookupTable[frame]) then
        if (self._frameLookupTable[frame][direction]) then
            return self._frameLookupTable[frame][direction]
        end
    end

    return nil
    --return self:_GetNeighbor(frame, direction)
end

function Grid:_UpdateFrames()
    local neighbors

    self._frameLookupTable = {}

    for _, f in pairs(self.frames) do
        neighbors = {}
        neighbors['Up'] = self:_GetNeighbor(f, 'Up')
        neighbors['Down'] = self:_GetNeighbor(f, 'Down')
        neighbors['Left'] = self:_GetNeighbor(f, 'Left')
        neighbors['Right'] = self:_GetNeighbor(f, 'Right')

        if (neighbors['Up'] == f) then
            neighbors['Up'] = self:_GetFarthest(f, 'Down')
        end

        if (neighbors['Down'] == f) then
            neighbors['Down'] = self:_GetFarthest(f, 'Up')
        end
            
        if (neighbors['Left'] == f) then
            neighbors['Left'] = self:_GetFarthest(f, 'Right')
        end

        if (neighbors['Right'] == f) then
            neighbors['Right'] = self:_GetFarthest(f, 'Left')
        end

        self._frameLookupTable[f] = neighbors
    end
end

function Grid:_GetNeighbor(frame, direction)
    local swap, current, ox, oy, dx, dy, tx, ty, x, y
    local ox, oy = GetPosition(frame)

    current = frame
    x = 10000
    y = 10000

    for _, f in pairs(self.frames) do
        if (f ~= frame) then
            tx, ty = GetPosition(f)
            dx = abs(tx - ox)
            dy = abs(ty - oy)

            if (dx + dy < x + y) then
                if (direction == 'Up') then
                    if (dy > dx and ty > oy) then
                        swap = true
                    end
                elseif (direction == 'Down') then
                    if (dy > dx and ty < oy) then
                        swap = true
                    end
                elseif (direction == 'Left') then
                    if (dy < dx and tx < ox) then
                        swap = true
                    end
                elseif (direction == 'Right') then
                    if (dy < dx and tx > ox) then
                        swap = true
                    end
                end
            end

            if (swap) then
                current = f
                x = dx
                y = dy
                swap = false
            end
        end
    end

    return current
end

function Grid:_GetFarthest(frame, direction)
    local swap, current, ox, oy, tx, ty
    local ox, oy = GetPosition(frame)
    current = frame

    for _, f in pairs(self.frames) do
        if (current ~= f) then
            tx, ty = GetPosition(f)

            if (direction == 'Up') then
                if (oy < ty and ox == tx) then
                    swap = true
                end
            elseif (direction == 'Down') then
                if (oy > ty and ox == tx) then
                    swap = true
                end
            elseif (direction == 'Left') then
                if (ox > tx and oy == ty) then
                    swap = true
                end
            elseif (direction == 'Right') then
                if (ox < tx and oy == ty) then
                    swap = true
                end
            end
        end

        if (swap) then
            current = f
            ox = tx
            oy = ty
            swap = false
        end
    end

    return current
end

YokiRaidCursor.Grid = Grid
