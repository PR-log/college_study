열심히 작성했는데 pc reboot 하면서 날아감
...

wsl ubuntu micosoft store에서 다운로드
# 우회로: 온라인 다운로드 없이 로컬로 엔진 켜기

### Step 1 — Windows 기능 2개를 DISM으로 직접 활성화 (관리자 PowerShell)

powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

이건 Store를 안 거치고 Windows에 내장된 기능을 켜는 거라 403을 우회함.

GUI가 편하면: 시작 → "Windows 기능 켜기/끄기" → "Linux용 Windows 하위 시스템" + "가상 머신 플랫폼" 체크 → 확인. 똑같이 로컬 처리.

### Step 2 — 재부팅 (필수. 안 하면 다음 단계 실패)

### Step 3 — WSL2 커널 설치
재부팅 후 먼저 이걸 시도:

powershell
wsl --update

이것도 403 나면 (Store 차단이 원인일 때) → 커널 MSI를 직접 설치해서 우회:

브라우저로 https://aka.ms/wsl2kernel 열면 Microsoft 공식 wsl_update_x64.msi가 받아짐 → 더블클릭 설치

<img width="960" height="530" alt="image" src="https://github.com/user-attachments/assets/027db112-68b9-4838-897f-10b70e956116" />
오류 발생 > 다시 windows 기능 2개 켜고 재부팅


### Step 4 — 기본값 WSL2로 지정

powershell
wsl --set-default-version 2

### Step 5 — Ubuntu 실행 & 계정 생성
시작 메뉴 → Ubuntu 클릭 → username(소문자)·password 입력. (비번은 화면에 안 보이는 게 정상)

### Step 6 — 검증

powershell
wsl -l -v

Ubuntu의 VERSION이 2면 성공.
