local Class = YokiRaidCursor.Class
local Test = YokiRaidCursor.Testing.Test
local GridTest = Class('GridTest', Test)

function GridTest:Initialize()
    self:Register(self.GetNeighbor_WithAdjacentHorizontalFrames_ReturnsNeighbor)
    self:Register(self.GetNeighbor_WithAdjacentVerticalFrames_ReturnsNeighbor)
    self:Register(self.GetNeighbor_OnVerticalEdge_ReturnsFrameAtOppositeEnd)
    self:Register(self.GetNeighbor_OnHorizontalEdge_ReturnsFrameAtOppositeEnd)

    self:SetUp()
end

function GridTest:SetUp()

    --[[
    --      f4
    --
    -- f3   f1   f2
    --
    --      f5
    --]]

    self.f1 = self:CreateMockFrame(0, 0, 100, 100)
    self.f2 = self:CreateMockFrame(200, 0, 100, 100)
    self.f3 = self:CreateMockFrame(-200, 0, 100, 100)
    self.f4 = self:CreateMockFrame(0, 200, 100, 100)
    self.f5 = self:CreateMockFrame(0, -200, 100, 100)

    local frames = { self.f1, self.f2, self.f3, self.f4, self.f5 }

    self.grid = YokiRaidCursor.Core.Grid(frames)
end

function GridTest:GetNeighbor_WithAdjacentHorizontalFrames_ReturnsNeighbor()
    local neighbor

    neighbor = self.grid:GetNeighbor(self.f1, 'Right')
    self:AssertEquals(self.f2, neighbor)

    neighbor = self.grid:GetNeighbor(self.f2, 'Left')
    self:AssertEquals(self.f1, neighbor)

    neighbor = self.grid:GetNeighbor(self.f1, 'Left')
    self:AssertEquals(self.f3, neighbor)
end

function GridTest:GetNeighbor_WithAdjacentVerticalFrames_ReturnsNeighbor()
    local neighbor

    neighbor = self.grid:GetNeighbor(self.f1, 'Up')
    self:AssertEquals(self.f4, neighbor)

    neighbor = self.grid:GetNeighbor(self.f4, 'Down')
    self:AssertEquals(self.f1, neighbor)

    neighbor = self.grid:GetNeighbor(self.f1, 'Down')
    self:AssertEquals(self.f5, neighbor)
end

function GridTest:GetNeighbor_OnVerticalEdge_ReturnsFrameAtOppositeEnd()
    local neighbor

    neighbor = self.grid:GetNeighbor(self.f4, 'Up')
    self:AssertEquals(self.f5, neighbor)
end

function GridTest:GetNeighbor_OnHorizontalEdge_ReturnsFrameAtOppositeEnd()
    local neighbor

    neighbor = self.grid:GetNeighbor(self.f3, 'Left')
    self:AssertEquals(self.f2, neighbor)
end


local test = GridTest()
