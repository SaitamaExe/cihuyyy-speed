-- [[ CUSTOM REMOTE SPY & LOGGER FOR DELTA ]]
-- Skrip ini akan merekam semua aktivitas Remote Event & Function yang Anda picu dalam game.

if not getgenv then
    error("Executor Anda tidak mendukung lingkungan global getgenv!")
end

-- Menyiapkan tempat penyimpanan log agar tidak hilang saat karakter mati
getgenv().LoggedRemotes = getgenv().LoggedRemotes or {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local LogCount = #getgenv().LoggedRemotes

local function formatTable(tbl, indent)
    indent = indent or 1
    local str = "{\n"
    for k, v in pairs(tbl) do
        local formatting = string.rep("  ", indent) .. tostring(k) .. " = "
        if type(v) == "table" then
            str = str .. formatting .. formatTable(v, indent + 1) .. ",\n"
        elseif type(v) == "string" then
            str = str .. formatting .. '"' .. tostring(v) .. '"' .. ",\n"
        else
            str = str .. formatting .. tostring(v) .. ",\n"
        end
    end
    str = str .. string.rep("  ", indent - 1) .. "}"
    return str
end

local function logRemote(remote, method, args)
    LogCount = LogCount + 1
    local path = remote:GetFullName()
    local name = remote.Name
    
    -- Menyusun data log
    local logEntry = {
        Number = LogCount,
        Time = os.date("%H:%M:%S"),
        Name = name,
        Path = "game:" .. path,
        Method = method,
        Arguments = args
    }
    
    table.insert(getgenv().LoggedRemotes, logEntry)
    
    -- Mencetak ke Konsol Internal/F9 agar Anda tahu skrip sedang bekerja
    print(string.format("[LOGGED #%d] %s -> %s", LogCount, name, method))
end

-- HOOKING SISTEM JARINGAN ROBLOX
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    -- Filter hanya merekam pemicu Remote ke Server
    if (method == "FireServer" or method == "InvokeServer") and self:IsA("RemoteEvent") or self:IsA("RemoteFunction") then
        -- Abaikan remote bawaan sistem Roblox (Chat, Voice, dll) agar output tidak penuh sampah
        local path = self:GetFullName()
        if not path:find("Chat") and not path:find("Voice") and not path:find("TextChat") then
            logRemote(self, method, args)
        end
    end
    
    return oldNamecall(self, ...)
end)

-- [[ FUNGSI UNTUK MENGAMBIL HASIL LOG ]]
-- Jalankan fungsi ini via Executor terpisah atau tunggu instruksi untuk mengekspor data.
getgenv().GetDumpOutput = function()
    local output = "=========================================\n"
    output = output .. "    TUKANG BANGUNAN INDO DUMP REPORT     \n"
    output = output .. "=========================================\n\n"
    
    for _, log in ipairs(getgenv().LoggedRemotes) do
        output = output .. string.format("[%s | #%d] ➾ %s | Type: %s\n", log.Time, log.Number, log.Name, log.Method)
        output = output .. string.format("↳ Path: %s\n", log.Path)
        
        -- Membaca isi argumen asli secara mendalam
        if #log.Arguments > 0 then
            output = output .. "↳ Args: " .. formatTable(log.Arguments) .. "\n"
        else
            output = output .. "↳ Args: {}\n"
        end
        output = output .. "-----------------------------------------\n"
    end
    
    return output
end

print("[SUCCESS] Logger aktif! Silakan lakukan aktivitas (Mencangkul, Beli Warung, dll) sekarang.")
