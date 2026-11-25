local m = {}

local objects = {[""] = {type = "group", isVisible = true}}

function m.newBox(name, x, y, width, height, isFilled)
    if not name then
        error("missing #1 name value (must be a string)", 2)
    elseif not x then
        error("missing #2 x value (must be a number)", 2)
    elseif not y then
        error("missing #3 y value (must be a number)", 2)
    elseif not width then
        error("missing #4 width value (must be a number)", 2)
    elseif not height then
        error("missing #5 height value (must be a number)", 2)
    elseif isFilled == nil then
        error("missing #6 isFilled value (must be a boolean)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(x) ~= "number" then 
        error("invalid type #2 x value (must be a number)", 2)
    elseif type(y) ~= "number" then 
        error("invalid type #3 y value (must be a number)", 2)
    elseif type(width) ~= "number" then 
        error("invalid type #4 width value (must be a number)", 2)
    elseif type(height) ~= "number" then 
        error("invalid type #5 height value (must be a number)", 2)
    elseif type(isFilled) ~= "boolean" then 
        error("invalid type #6 isFilled value (must be a boolean)", 2)
    else
        objects[name] = {
            type = "box",
            x = x,
            y = y,
            width = width,
            height = height,
            isFilled = isFilled,
            color = colors.white,
            isVisible = true,
            parent = ""
        }
    end
end

function m.newText(name, text, x, y, align)
    if not name then
        error("missing #1 name value (must be a string)", 2)
    elseif not text then
        error("missing #2 text value (must be a string)", 2)
    elseif not x then
        error("missing #3 x value (must be a number)", 2)
    elseif not y then
        error("missing #4 y value (must be a number)", 2)
    elseif not align then
        error("missing #5 align value (must be a string)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(text) ~= "string" and type(text) ~= "number" then
        error("invalid type #2 text value (must be a string or number)", 2)
    elseif type(x) ~= "number" then
        error("invalid type #3 x value (must be a number)", 2)
    elseif type(y) ~= "number" then
        error("invalid type #4 y value (must be a number)", 2)
    elseif type(align) ~= "string" then
        error("invalid type #5 align value (must be a string)", 2)
    elseif align ~= "left" and align ~= "center" and align ~= "right" then
        error("invalid data in #5 align value (left/center/right)")
    else
        objects[name] = {
            type = "text",
            text = text,
            x = x,
            y = y,
            align = align,
            color = colors.white,
            bgColor = colors.black,
            isVisible = true,
            parent = ""
        }
    end
end

function m.newGroup(name)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    else
        objects[name] = {
            type = "group",
            isVisible = true,
            parent = ""
        }
    end
end

function m.newLine(name, startX, startY, endX, endY)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif not startX then
        error("missing #2 startX value (must be a number)", 2)
    elseif not startY then
        error("missing #3 startY value (must be a number)", 2)
    elseif not endX then
        error("missing #4 endX value (must be a number)", 2)
    elseif not endY then
        error("missing #5 endY value (must be a number)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(startX) ~= "number" then
        error("invalid type #2 startX value (must be a number)", 2)
    elseif type(startY) ~= "number" then
        error("invalid type #3 startY value (must be a number)", 2)
    elseif type(endX) ~= "number" then
        error("invalid type #4 endX value (must be a number)", 2)
    elseif type(endY) ~= "number" then
        error("invalid type #5 endY value (must be a number)", 2)
    else
        objects[name] = {
            type = "line",
            isVisible = true,
            parent = "",
            startX = startX,
            startY = startY,
            endX = endX,
            endY = endY,
            color = colors.white
        }
    end
end

function m.setLinePoses(name, startX, startY, endX, endY)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif not startX then
        error("missing #2 startX value (must be a number)", 2)
    elseif not startY then
        error("missing #3 startY value (must be a number)", 2)
    elseif not endX then
        error("missing #4 endX value (must be a number)", 2)
    elseif not endY then
        error("missing #5 endY value (must be a number)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(startX) ~= "number" then
        error("invalid type #2 startX value (must be a number)", 2)
    elseif type(startY) ~= "number" then
        error("invalid type #3 startY value (must be a number)", 2)
    elseif type(endX) ~= "number" then
        error("invalid type #4 endX value (must be a number)", 2)
    elseif type(endY) ~= "number" then
        error("invalid type #5 endY value (must be a number)", 2)
    elseif not objects[name] then
        error("object not found", 2)
    elseif not objects[name].startX then
        error("object haven't startX value", 2)
    elseif not objects[name].startY then
        error("object haven't startY value", 2)
    elseif not objects[name].endX then
        error("object haven't endX value", 2)
    elseif not objects[name].endY then
        error("object haven't endY value", 2)
    else
        objects[name].startX = startX
        objects[name].startY = startY
        objects[name].endX = endX
        objects[name].endY = endY
    end
end

function m.insert(name, object)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif not object then
        error("missing #2 object value (must be an object)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(object) ~= "string" then
        error("invalid type #2 object value (must be an object)", 2)
    elseif not objects[name] then
        error("group object not found", 2)
    elseif not objects[object] then
        error("object not found", 2)
    elseif objects[name].type ~= "group" then
        error("object is not a group", 2)
    else
        objects[object].parent = name
    end
end

function m.extract(name, object)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif not object then
        error("missing #2 object value (must be an object)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(object) ~= "string" then
        error("invalid type #2 object value (must be an object)", 2)
    elseif not objects[name] then
        error("group object not found", 2)
    elseif not objects[object] then
        error("object not found", 2)
    elseif objects[name].type ~= "group" then
        error("object is not a group")
    else
        objects[object].parent = ""
    end
end

function m.setColor(name, color)
    if not name then
        error("missing #1 object value (must be an object)", 2)
    elseif not color then
        error("missing #2 color value (must be a number (or colors./colours.))", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 object value (must be an object)", 2)
    elseif type(color) ~= "number" then
        error("invalid type #2 color value (must be a number (or colors./colours.))", 2)
    elseif not objects[name] then
        error("object not found", 2)
    else
        if objects[name] then
            if objects[name].color then
                objects[name].color = color
            else
                error("object haven't color value", 2)
            end
        end
    end
end

function m.setBackgroundColor(name, color)
    if not name then
        error("missing #1 object value (must be an object)", 2)
    elseif not color then
        error("missing #2 backgroundColor value (must be a number (or colors./colours.))", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 object value (must be an object)", 2)
    elseif type(color) ~= "number" then
        error("invalid type #2 backgroundColor value (must be a number (or colors./colours.))", 2)
    elseif not objects[name] then
        error("object not found", 2)
    else
        if objects[name] then
            if objects[name].bgColor then
                objects[name].bgColor = color
            else
                error("object haven't color value", 2)
            end
        end
    end
end

function m.getColor(name)
    if not name then
        error("missing #1 name value (must be an object)", 1)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)")
    elseif not objects[name] then
        error("object not found", 1)
    elseif not objects[name].color then
        error("object haven't color value")
    else
        return objects[name].color
    end
end

function m.setPos(name, x, y)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif not x then
        error("missing #2 x value (must be a number)", 2)
    elseif not y then
        error("missing #3 y value (must be a number)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(x) ~= "number" then
        error("invalid type #2 x value (must be a number)", 2)
    elseif type(y) ~= "number" then
        error("invalid type #3 y value (must be a number)", 2)
    elseif not objects[name] then
        error("object not found", 2)
    elseif not objects[name].x then
        error("object haven't x value", 2)
    elseif not objects[name].y then
        error("object haven't y value", 2)
    else
        objects[name].x = x
        objects[name].y = y
    end
end

function m.getPos(name)
    if not name then
        error("missing #1 name value (must be an object)", 1)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)")
    elseif not objects[name] then
        error("object not found", 1)
    elseif not objects[name].x then
        error("object haven't x value")
    elseif not objects[name].y then
        error("object haven't y value")
    else
        return objects[name].x, objects[name].y
    end
end

function m.setWidth(name, width)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif not width then
        error("missing #2 width value (must be a number)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(width) ~= "number" then
        error("invalid type #2 width value (must be a number)", 2)
    elseif not objects[name] then
        error("object not found", 2)
    elseif not objects[name].width then
        error("object haven't width value", 2)
    else
        objects[name].width = width
    end
end

function m.setHeight(name, height)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif not height then
        error("missing #2 height value (must be a number)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(height) ~= "number" then
        error("invalid type #2 height value (must be a number)", 2)
    elseif not objects[name] then
        error("object not found", 2)
    elseif not objects[name].height then
        error("object haven't height value", 2)
    else
        objects[name].height = height
    end
end

function m.getWidth(name)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif not objects[name] then
        error("object not found", 2)
    elseif not objects[name].width then
        error("object haven't width value", 2)
    else
        return objects[name].width
    end
end

function m.getHeight(name)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif not objects[name] then
        error("object not found", 2)
    elseif not objects[name].height then
        error("object haven't height value", 2)
    else
        return objects[name].height
    end
end

function m.setSize(name, width, height)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif not width then
        error("missing #2 width value (must be a number)", 2)
    elseif not height then
        error("missing #3 height value (must be a number)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(width) ~= "number" then
        error("invalid type #2 width value (must be a number)", 2)
    elseif type(height) ~= "number" then
        error("invalid type #3 height value (must be a number)", 2)
    elseif not objects[name] then
        error("object not found", 2)
    elseif not objects[name].width then
        error("object haven't width value", 2)
    elseif not objects[name].height then
        error("object haven't height value", 2)
    else
        objects[name].width = width
        objects[name].height = height
    end
end

function m.getSize(name)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif not objects[name] then
        error("object not found", 2)
    elseif not objects[name].width then
        error("object haven't width value")
    elseif not objects[name].height then
        error("object haven't height value", 2)
    else
        return objects[name].width, objects[name].height
    end
end

function m.setText(name, text)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif not text then
        error("missing #2 text value (must be a string)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(text) ~= "string" then
        error("invalid type #2 text value (must be a string)", 2)
    elseif not objects[name] then
        error("object not found", 2)
    elseif not objects[name].text then
        error("object haven't text value", 2)
    else
        objects[name].text = text
    end
end

function m.rename(oldName, newName)
    if not oldName then
        error("missing #1 oldName value (must be an object)", 2)
    elseif not newName then
        error("missing #2 newName value (must be an object)", 2)
    elseif type(oldName) ~= "string" then
        error("invalid type #1 oldName value (must be an object)", 2)
    elseif type(newName) ~= "string" then
        error("invalid type #2 newName value (must be an object)", 2)
    elseif not objects[oldName] then
        error("object not found")
    else
        objects[newName] = objects[oldName]
        objects[oldName] = nil
    end
end

function m.remove(name)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif not objects[name] then
        error("object not found")
    else
        objects[name] = nil
    end
end

function m.setVisibility(name, state)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif state == nil then
        error("missing #2 state value (must be a boolean)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif type(state) ~= "boolean" then
        error("invalid type #2 state value (must be a boolean)", 2)
    elseif not objects[name] then
        error("object not found")
    elseif not objects[name].isVisible then
        error("object haven't isVisible value")
    else
        objects[name].isVisible = state
    end
end

function m.isExists(name)
    if not name then
        error("missing #1 name value (must be an object)", 2)
    elseif type(name) ~= "string" then
        error("invalid type #1 name value (must be an object)", 2)
    elseif not objects[name] then
        return false
    else
        return true
    end
end

function m.draw()
    local w, h = term.getSize()
    paintutils.drawFilledBox(1, 1, w, h, colors.black)
    local function redraw(path)
        for k, v in pairs(path) do
            if v.type == "box" and v.isVisible == true and objects[v.parent].isVisible == true then
                if v.isFilled == true then
                    paintutils.drawFilledBox(v.x, v.y, v.x + v.width, v.y + v.height, v.color)
                elseif v.isFilled == false then
                    paintutils.drawBox(v.x, v.y, v.x + v.width, v.y + v.height, v.color)
                end
            elseif v.type == "text" and v.isVisible == true and objects[v.parent].isVisible == true then
                local x = v.x
                if v.align == "center" then
                    x = v.x - math.floor(string.len(v.text)/2)
                elseif v.align == "right" then
                    x = v.x - string.len(v.text) + 1
                end
                term.setCursorPos(x, v.y)
                local oldColor = term.getTextColor()
                local oldBgColor = term.getBackgroundColor()
                term.setTextColor(v.color)
                term.setBackgroundColor(v.bgColor)
                term.write(v.text)
                term.setTextColor(oldColor)
                term.setBackgroundColor(oldBgColor)
            elseif v.type == "line" and v.isVisible == true and objects[v.parent].isVisible == true then
                paintutils.drawLine(v.startX, v.startY, v.endX, v.endY, v.color)
            end
        end
    end
    redraw(objects)
end

function m.ver()
    return 1, "1.0", "(C) Entaru Studio. 2026"
end

return m