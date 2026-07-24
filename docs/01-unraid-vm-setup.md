# UnRAID VM Setup

## Objective
Deploy a Windows Server 2022 virtual machine on KVM/QEMU via UnRAID to serve as the primary domain controller for the enterprise lab environment.

## Environment
| Component | Details |
|---|---|
| Hypervisor | KVM/QEMU via UnRAID |
| VM Name | DC1 |
| OS | Windows Server 2022 Standard Evaluation (Desktop Experience) |
| vCPUs | 2 |
| RAM | 4GB |
| Disk | 60GB qcow2 |
| Network | br0 bridge |
| BIOS | OVMF TPM |

## Steps

### 1. VM Manager Configuration
- Enabled VMs in UnRAID VM Manager
- Enabled RDP menu option
- Confirmed VirtIO drivers ISO downloaded

### 2. DC1 VM Creation
- Used Windows Server 2016 template as base
- Loaded VirtIO SCSI driver (amd64\2k22\viostor.inf) during installation to detect virtual disk
- Configured CPU, RAM, and disk settings as above

### 3. Initial Configuration
- Installed remaining VirtIO drivers via Device Manager
- Renamed computer to DC1
- Disabled IPv6
- Configured static IP: 192.168.1.251
- Temporary DNS set to 1.1.1.1 pending AD DS installation