일단 cmd 창 켜서 콘솔에 
```
>nvidia-smi
```
결과 
```
Thu Nov 13 15:17:06 2025
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 560.94                 Driver Version: 560.94         CUDA Version: 12.6     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                  Driver-Model | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 4050 ...  WDDM  |   00000000:01:00.0 Off |                  N/A |
| N/A   41C    P8              6W /   30W |       0MiB /   6141MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI        PID   Type   Process name                              GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|    0   N/A  N/A      3152    C+G   ...m Files (x86)\Overwolf\Overwolf.exe      N/A      |
|    0   N/A  N/A     34372      C   C:\Python310\python.exe                     N/A      |
|    0   N/A  N/A     42668      C   C:\Python310\python.exe                     N/A      |
+-----------------------------------------------------------------------------------------+
```
이렇게 나오는데 cuda version이 설치가능한 최대 버전
저 버전 인터넷에 검색해서 다운로드
<img width="1389" height="276" alt="image" src="https://github.com/user-attachments/assets/1322dd9b-5397-4842-978b-070ce13eac5a" />
이런거 들어가서
<img width="1303" height="577" alt="image" src="https://github.com/user-attachments/assets/b19d564d-44cf-4208-89b0-ca2e1c999883" />
윈도우, 윈도우 버전,  
로컬 네트워크 상관없음 선택하고 아래 다운로드 눌러서 설치

<img width="1739" height="691" alt="image" src="https://github.com/user-attachments/assets/e1a5fbab-be79-47f7-b91d-30d4c9a1aa42" />
여기서 맞는 버전 선택하고 커맨드에 나오는 코드 입력하면됨

<img width="2141" height="1371" alt="image" src="https://github.com/user-attachments/assets/3d401e26-c8b7-4227-978e-b915a1a8cae0" />

제대로 설치되었는지 확인
```
import torch

print("CUDA Available:", torch.cuda.is_available())
print("GPU Count:", torch.cuda.device_count())
print("Current GPU:", torch.cuda.get_device_name(0) if torch.cuda.is_available() else "None")
print("Torch CUDA Version:", torch.version.cuda)

# Torch가 CUDA로 빌드되었는지 판단하는 우회 방식
print("Torch Built With CUDA:", (torch.version.cuda is not None))

```


프롬스트에서 설치, anaconda 프롬프트 실행
```
conda activate img2
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia


```

