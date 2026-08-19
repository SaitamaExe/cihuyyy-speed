-- [[ KULI INDO - SECURE INSTANCE SCANNER ]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")

local function scanRemotes(folder, folderName)
    print("--- MENINGGALKAN JEJAK FOLDER: " .. folderName .. " ---")
    for _, child in ipairs(folder:GetDescendants()) do
        if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
            print("Nama: " .. child.Name .. " | Tipe: " .. child.ClassName)
            print("Jalur: game:GetService('" .. folderName .. "')." .. child:GetFullName():sub(#folderName + 2))
            print("-----------------------------------------")
        end
    end
end

-- Menjalankan pemindaian langsung ke konsol F9
pcall(function() scanRemotes(ReplicatedStorage, "ReplicatedStorage") end)
pcall(function() scanRemotes(RobloxReplicatedStorage, "RobloxReplicatedStorage") end)

print("[SUKSES] Semua remote terdeteksi. Silakan cek daftar teks putih di atas!")
