-- Use custom dialogue, if it exists
ModUtil.Path.Wrap(
    "DisplayTextLine",
    function (base, screen, source, line, parentLine)
        if line.Text ~= nil and line.Cue ~= nil then

        -- Custom Dialogue
            local text = line.Text
            if GetLanguage({}) == "en" then
                -- If the cue is defined, look up the translation without the '/VO/' prefix
                if line.Cue then
                    local helpTextId = string.sub( line.Cue, 5 )
                    text = helpTextId
    
                    if HasDisplayName({ Text = helpTextId }) then
                        text = GetDisplayName({ Text = text })
                    else 
                        text = line.Text -- Revert to default text
                    end
    
                end
            end

            line.Text = text
        end
        
        return base(screen, source, line, parentLine)
    end
)