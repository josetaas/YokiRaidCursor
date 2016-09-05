YokiRaidCursor = LibStub('AceAddon-3.0')
                    :NewAddon('YokiRaidCursor', 'AceConsole-3.0')

YokiRaidCursor.Class = LibStub('MiddleClass'):GetClassObject()

function YokiRaidCursor:OnInitialize()
    local frameRepository, frames, mbr, mbl

    self.Strings('en')
    
    frameRepository = self.Repositories.FrameRepository()

    mbl = { frameRepository:Get('MultiBarLeft'):GetChildren() }
    mbr = { frameRepository:Get('MultiBarRight'):GetChildren() }

    frames = self.Utilities.MergeTables(mbl, mbr)

    self.grid = self.Grid(frames)
    self.cursor = self.Cursor(nil, self.grid:GetFirst())
end

function YokiRaidCursor:Up()
    local frame = self.cursor:GetTarget()
    self.cursor:Move(self.grid:GetNeighbor(frame, 'Up'))
end

function YokiRaidCursor:Down()
    local frame = self.cursor:GetTarget()
    self.cursor:Move(self.grid:GetNeighbor(frame, 'Down'))
end

function YokiRaidCursor:Left()
    local frame = self.cursor:GetTarget()
    self.cursor:Move(self.grid:GetNeighbor(frame, 'Left'))
end

function YokiRaidCursor:Right()
    local frame = self.cursor:GetTarget()
    self.cursor:Move(self.grid:GetNeighbor(frame, 'Right'))
end
