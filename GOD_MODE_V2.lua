--[[
    GOD MODE TSUNAMI V2 (NO KEY)
    Tính năng: Tự động hồi máu, Chống lực đẩy sóng, GUI kéo thả được.
--]]

local UI = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local GodBtn = Instance.new("TextButton")
local AntiBtn = Instance.new("TextButton")
local Close = Instance.new("TextButton")

-- Cấu hình GUI
UI.Name = "Tsunami_V2"
UI.Parent = game:GetService("CoreGui") -- Dán thẳng executor sẽ chạy vào CoreGui để không mất khi chết

Main.Name = "Main"
Main.Parent = UI
Main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.3, 0, 0.3, 0)
Main.Size = UDim2.new(0, 180, 0, 160)
Main.Active = true
Main.Draggable = true -- Cho phép di chuyển GUI

Title.Parent = Main
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
Title.Text = "GOD MODE V2"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 16

-- Nút God Mode
GodBtn.Parent = Main
GodBtn.Size = UDim2.new(0.8, 0, 0, 35)
GodBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
GodBtn.Text = "Bật Bất Tử"
GodBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GodBtn.TextColor3 = Color3.new(1,1,1)

-- Nút Chống Sóng
AntiBtn.Parent = Main
AntiBtn.Size = UDim2.new(0.8, 0, 0, 35)
AntiBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
AntiBtn.Text = "Kháng Lực Sóng"
AntiBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AntiBtn.TextColor3 = Color3.new(1,1,1)

-- Nút Tắt GUI
Close.Parent = Main
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Position = UDim2.new(1, -25, 0, 0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.new(1,0,0)
Close.TextColor3 = Color3.new(1,1,1)
Close.MouseButton1Click:Connect(function() UI:Destroy() end)

-- Biến trạng thái
local god = false
local anti = false

GodBtn.MouseButton1Click:Connect(function()
    god = not god
    GodBtn.Text = god and "God: ON" or "Bật Bất Tử"
    GodBtn.BackgroundColor3 = god and Color3.new(0,0.6,0) or Color3.fromRGB(50,50,50)
end)

AntiBtn.MouseButton1Click:Connect(function()
    anti = not anti
    AntiBtn.Text = anti and "Kháng: ON" or "Kháng Lực Sóng"
    AntiBtn.BackgroundColor3 = anti and Color3.new(0,0.6,0) or Color3.fromRGB(50,50,50)
end)

-- Vòng lặp xử lý (Loop)
game:GetService("RunService").RenderStepped:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char then
        -- Xử lý God Mode
        if god then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.MaxHealth = 9e9
                hum.Health = 9e9
            end
        end
        -- Xử lý Kháng Sóng (Đóng băng vận tốc)
        if anti then
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                root.Velocity = Vector3.new(0, 0, 0)
                root.RotVelocity = Vector3.new(0, 0, 0)
            end
        end
    end
end)
