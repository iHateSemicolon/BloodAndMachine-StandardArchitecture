--localScipt--

local player = game.Players.LocalPlayer
local textButton = script.Parent
local replicatedStorage = game:GetService("ReplicatedStorage")
local eSkillEvent = replicatedStorage:WaitForChild("ESkillEvent")

textButton.MouseButton1Click:Connect(function()
	eSkillEvent:FireServer()

----------------custom Part!---------------------------
	-- 여기서 버튼 쿨타임 애니 또는 딜레이 효과 넣기 
	
	
	
-----------------------------------------------------heh
end)


--serverScript--

local replicatedStorage = game:GetService("ReplicatedStorage")
local eSkillEvent = replicatedStorage:WaitForChild("ESkillEvent")
local UnionTemplate = replicatedStorage:WaitForChild("Union")

eSkillEvent.OnServerEvent:Connect(function(player)
	local character = player.Character
	if not character then return end

	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart then return end

	-- 유니온 원본 복사
	local spawnedUnion = UnionTemplate:Clone() --> 리플리케이티드 스토리지에 원본 있음!

	-- 설치 위치
	local spawnCFrame = rootPart.CFrame * CFrame.new(0, -3, 0)  -- 수정 필요 (예외 처리 많이 많이 필요 ㅡㅡ)

	-- 유니온이 모델인지 단일 파트인지 체크해서 위치 지정
	if spawnedUnion:IsA("Model") then
		spawnedUnion:PivotTo(spawnCFrame)
	else
		spawnedUnion.CFrame = spawnCFrame
		spawnedUnion.Anchored = true -- 앵커커커앵커 바닥에다 앵커 박아야함 
	end

	-- 워크스페이스에 배치
	spawnedUnion.Parent = workspace
end)
