local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local coinContainer = game.Workspace.Normal.CoinContainer
local isCollecting = false
local isRunning = false

-- Создание GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 1, -60)
toggleButton.Text = "Start"
toggleButton.Parent = screenGui

-- Функция для перемещения персонажа к монетке
local function moveToCoin(coin)
    local targetPosition = coin.Position
    local adjustedPosition = Vector3.new(targetPosition.X, targetPosition.Y + 2, targetPosition.Z) -- Немного выше монетки
    local tweenInfo = TweenInfo.new(
        (humanoidRootPart.Position - targetPosition).Magnitude / 29, -- Медленнее движение
        Enum.EasingStyle.Linear
    )
    local goal = {CFrame = CFrame.new(adjustedPosition) * CFrame.Angles(0, 0, math.rad(90))} -- Поворот на 90 градусов, чтобы лежал
    local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
    tween:Play()
    tween.Completed:Wait()
end

-- Функция для поиска случайной монетки
local function getRandomCoin()
    local coins = coinContainer:GetChildren()
    local coinCount = #coins
    if coinCount == 0 then
        return nil
    end
    local randomIndex = math.random(1, coinCount)
    return coins[randomIndex]
end

-- Основной цикл для поиска и сбора монеток
local function startCollectingCoins()
    while isRunning do
        local coin = getRandomCoin()
        if coin and coin:IsA("BasePart") and coin.Name == "Coin_Server" then
            moveToCoin(coin)
            wait(0.5) -- Задержка для имитации времени на сбор монетки
        end
        wait(1) -- Задержка перед следующей попыткой найти монетку
    end
end

-- Обработка нажатия кнопки
toggleButton.MouseButton1Click:Connect(function()
    if not isRunning then
        isRunning = true
        toggleButton.Text = "Stop"
        startCollectingCoins()
    else
        isRunning = false
        toggleButton.Text = "Start"
    end
end)
