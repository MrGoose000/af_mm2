local Players = game:GetService("Players");
local UserInputService = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");
local player = Players.LocalPlayer;
local character = player.Character or player.CharacterAdded:Wait();
local humanoidRootPart = character:WaitForChild("HumanoidRootPart");
local coinContainer = game.Workspace.Normal.CoinContainer;
local isCollecting = false;
local isRunning = false;
local isMinimized = false;
local screenGui = Instance.new("ScreenGui");
screenGui.Parent = player:WaitForChild("PlayerGui");
local frame = Instance.new("Frame");
frame.Size = UDim2.new(0, 150, 0, 120);
frame.Position = UDim2.new(0, 10, 1, -160);
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1);
frame.BorderColor3 = Color3.new(1, 1, 1);
frame.Active = true;
frame.Draggable = true;
frame.Parent = screenGui;
local authorText = Instance.new("TextLabel");
authorText.Size = UDim2.new(1, -20, 0, 20);
authorText.Position = UDim2.new(0, 10, 0, 10);
authorText.Text = "Made by MrGoose000";
authorText.TextColor3 = Color3.new(1, 1, 1);
authorText.BackgroundTransparency = 1;
authorText.TextScaled = true;
authorText.Parent = frame;
local toggleButton = Instance.new("TextButton");
toggleButton.Size = UDim2.new(0, 130, 0, 40);
toggleButton.Position = UDim2.new(0, 10, 0, 40);
toggleButton.Text = "Start";
toggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2);
toggleButton.TextColor3 = Color3.new(1, 1, 1);
toggleButton.BorderSizePixel = 0;
toggleButton.TextScaled = true;
toggleButton.Parent = frame;
local minimizeButton = Instance.new("TextButton");
minimizeButton.Size = UDim2.new(0, 130, 0, 20);
minimizeButton.Position = UDim2.new(0, 10, 0, 90);
minimizeButton.Text = "Minimize";
minimizeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2);
minimizeButton.TextColor3 = Color3.new(1, 1, 1);
minimizeButton.BorderSizePixel = 0;
minimizeButton.TextScaled = true;
minimizeButton.Parent = frame;
local function moveToCoin(coin)
	local targetPosition = coin.Position;
	local adjustedPosition = Vector3.new(targetPosition.X, targetPosition.Y + 2, targetPosition.Z);
	local currentPosition = humanoidRootPart.Position;
	local tweenInfo = TweenInfo.new((currentPosition - targetPosition).Magnitude / 20, Enum.EasingStyle.Linear);
	local goal = {CFrame=(CFrame.new(adjustedPosition) * CFrame.Angles(0, 0, math.rad(90)))};
	local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal);
	tween:Play();
	tween.Completed:Wait();
end
local function getClosestCoin()
	local coins = coinContainer:GetChildren();
	local closestCoin = nil;
	local shortestDistance = math.huge;
	for _, coin in ipairs(coins) do
		if (coin:IsA("BasePart") and (coin.Name == "Coin_Server")) then
			local distance = (coin.Position - humanoidRootPart.Position).Magnitude;
			if (distance < shortestDistance) then
				shortestDistance = distance;
				closestCoin = coin;
			end
		end
	end
	return closestCoin;
end
local function startCollectingCoins()
	while isRunning do
		local coin = getClosestCoin();
		if coin then
			moveToCoin(coin);
			wait(0.5);
		else
			wait(1);
		end
	end
end
toggleButton.MouseButton1Click:Connect(function()
	if not isRunning then
		isRunning = true;
		toggleButton.Text = "Stop";
		startCollectingCoins();
	else
		isRunning = false;
		toggleButton.Text = "Start";
	end
end);
minimizeButton.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized;
	if isMinimized then
		toggleButton.Visible = false;
		minimizeButton.Text = "Maximize";
		frame.Size = UDim2.new(0, 150, 0, 40);
	else
		toggleButton.Visible = true;
		minimizeButton.Text = "Minimize";
		frame.Size = UDim2.new(0, 150, 0, 120);
	end
end);
