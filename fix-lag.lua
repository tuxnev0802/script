local BadInstances = {"FaceInstance", "ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles", "PostEffect", "Explosion", "Clothing", "BasePart"}
local CanBeEnabled = {"ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles", "PostEffect"}

local function CheckIfBad(Instance)
    if Instance:IsA("FaceInstance") then
        Instance.Transparency = 1
    elseif table.find(CanBeEnabled, Instance.ClassName) then
        Instance.Enabled = false
    elseif Instance:IsA("Explosion") then
        Instance.Visible = false
    elseif Instance:IsA("Clothing") then
        Instance:Destroy()
    elseif Instance:IsA("BasePart") then
        Instance.Material = Enum.Material.Plastic
        Instance.Reflectance = 0
    else
        Instance:Destroy()
    end
end

workspace:FindFirstChildOfClass("Terrain").WaterWaveSize = 0
workspace:FindFirstChildOfClass("Terrain").WaterWaveSpeed = 0
workspace:FindFirstChildOfClass("Terrain").WaterReflectance = 0
workspace:FindFirstChildOfClass("Terrain").WaterTransparency = 0

game:GetService("Lighting").GlobalShadows = false
game:GetService("Lighting").FogEnd = 9e9

settings().Rendering.QualityLevel = 1

for i, v in pairs(game:GetDescendants()) do
    for i2, v2 in pairs(BadInstances) do
        if v:IsA(v2) then
            CheckIfBad(v)
        end
    end
end

game.DescendantAdded:Connect(CheckIfBad)