
local Strings = YokiRaidCursor.Class('Strings')


function Strings:Initialize(locale)
    if (not locale or locale == 'en') then
        BINDING_HEADER_YOKIRAIDCURSOR = "YokiRaidCursor"

        _G['BINDING_NAME_YOKIRAIDCURSOR_UP'] = 'Move Raid Cursor Up'
        _G['BINDING_NAME_YOKIRAIDCURSOR_DOWN'] = 'Move Raid Cursor Down'
        _G['BINDING_NAME_YOKIRAIDCURSOR_LEFT'] = 'Move Raid Cursor Left'
        _G['BINDING_NAME_YOKIRAIDCURSOR_RIGHT'] = 'Move Raid Cursor Right'
    end
end


YokiRaidCursor.Strings = Strings
