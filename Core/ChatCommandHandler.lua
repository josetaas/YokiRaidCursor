YokiRaidCursor:RegisterChatCommand('yrc', 'OnChatCommand')

function YokiRaidCursor:OnChatCommand(input)
    if (input == 'test') then
        YokiRaidCursor.Testing.Test.RunAll()
    elseif (input == 'up') then
        YokiRaidCursor:Up()
    elseif (input == 'down') then
        YokiRaidCursor:Down()
    elseif (input == 'left') then
        YokiRaidCursor:Left()
    elseif (input == 'right') then
        YokiRaidCursor:Right()
    end
end
