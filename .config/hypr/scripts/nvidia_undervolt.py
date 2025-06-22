#!/usr/bin/env python
from pynvml import *
nvmlInit()
device = nvmlDeviceGetHandleByIndex(0)
nvmlDeviceSetGpuLockedClocks(device,210,1695)
nvmlDeviceSetGpcClkVfOffset(device,255)
nvmlDeviceSetPowerManagementLimit(device,300000)
