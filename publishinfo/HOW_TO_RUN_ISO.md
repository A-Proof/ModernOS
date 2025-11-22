# How to Run ModernOS (ISO Only)

**For users who only have the ModernOS-v1.0.0-bootable.iso file**

---

## 📦 What You Have

You downloaded: **ModernOS-v1.0.0-bootable.iso**

This is a **complete operating system** that boots on any x86_64 computer.

---

## 🚀 3 Ways to Run ModernOS

### Method 1: Boot from USB (Real Computer) ⭐ Recommended

### Method 2: Run in Virtual Machine (Safe Testing)

### Method 3: Boot from CD/DVD (Legacy)

---

## 💿 Method 1: Boot from USB

**Best for**: Using ModernOS as your main OS temporarily

### Step 1: Burn ISO to USB

**macOS**:
```bash
# Find USB device
diskutil list

# Unmount USB (replace diskN with your USB number)
diskutil unmountDisk /dev/diskN

# Burn ISO to USB
sudo dd if=ModernOS-v1.0.0-bootable.iso of=/dev/rdiskN bs=1m

# Eject
diskutil eject /dev/diskN
```

**Linux**:
```bash
# Find USB device
lsblk

# Burn ISO to USB (replace sdX with your USB)
sudo dd if=ModernOS-v1.0.0-bootable.iso of=/dev/sdX bs=4M status=progress

# Sync
sync
```

**Windows**:
1. Download **Rufus**: https://rufus.ie
2. Insert USB drive
3. Open Rufus
4. Select `ModernOS-v1.0.0-bootable.iso`
5. Click **START**
6. Wait for completion

### Step 2: Boot from USB

1. **Insert USB** into computer
2. **Restart** computer
3. **Press boot key** during startup:
   - Dell: F12
   - HP: F9 or Esc
   - Lenovo: F12
   - ASUS: Esc or F8
   - Acer: F12
   - Mac: Hold Option/Alt
4. **Select USB drive** from boot menu
5. **Select "ModernOS v1.0.0"** from GRUB menu
6. **Wait 20-30 seconds**
7. **ModernOS boots!**

### What You'll See

1. **GRUB Menu** (5 seconds)
   - ModernOS v1.0.0 (Live OS)
   - ModernOS v1.0.0 (Safe Mode)
   - Boot from Hard Disk

2. **Linux Kernel Boots** (10 seconds)
   - Loading kernel...
   - Mounting filesystems...

3. **ModernOS Starts** (10 seconds)
   - Rainboot X bootloader animation
   - System initialization

4. **Desktop Appears!**
   - Beautiful gradient background
   - Status bar with time, WiFi, battery
   - Dock with 10 application icons

---

## 🖥️ Method 2: Virtual Machine

**Best for**: Testing ModernOS safely without affecting your computer

### Option A: VirtualBox (Free, Easy)

**Install VirtualBox**:
- Download: https://www.virtualbox.org/
- Install and open

**Create VM**:
1. Click **"New"**
2. Name: `ModernOS`
3. Type: `Linux`
4. Version: `Other Linux (64-bit)`
5. Memory: `2048 MB` (2GB)
6. Hard disk: `Do not add`
7. Click **"Create"**

**Configure VM**:
1. Select `ModernOS` VM
2. Click **"Settings"**
3. **Storage** tab:
   - Click empty CD icon
   - Click disk icon → "Choose a disk file"
   - Select `ModernOS-v1.0.0-bootable.iso`
4. **System** tab:
   - Boot Order: `Optical` first
   - Processor: `2 CPUs`
5. **Display** tab:
   - Video Memory: `128 MB`
   - Graphics Controller: `VMSVGA`
6. Click **"OK"**

**Start VM**:
1. Click **"Start"**
2. ModernOS boots automatically
3. Wait 20-30 seconds
4. Desktop appears!

### Option B: VMware (Alternative)

**Install VMware**:
- VMware Workstation (Windows/Linux): https://www.vmware.com/
- VMware Fusion (macOS): https://www.vmware.com/

**Create VM**:
1. Click **"Create a New Virtual Machine"**
2. Select **"I will install the operating system later"**
3. Guest OS: `Linux` → `Other Linux 5.x kernel 64-bit`
4. Name: `ModernOS`
5. Memory: `2048 MB`
6. Network: `NAT`
7. No hard disk needed

**Attach ISO**:
1. Select VM → **"Edit virtual machine settings"**
2. **CD/DVD (IDE)** → **"Use ISO image file"**
3. Browse to `ModernOS-v1.0.0-bootable.iso`
4. Check **"Connect at power on"**
5. Click **"OK"**

**Start VM**:
1. Click **"Power on this virtual machine"**
2. ModernOS boots
3. Desktop appears!

### Option C: QEMU (Command Line)

**Install QEMU**:
```bash
# macOS
brew install qemu

# Linux
sudo apt install qemu-system-x86

# Windows
# Download from: https://www.qemu.org/download/
```

**Run ModernOS**:
```bash
# Basic
qemu-system-x86_64 -cdrom ModernOS-v1.0.0-bootable.iso -m 2048

# With acceleration (macOS)
qemu-system-x86_64 \
  -cdrom ModernOS-v1.0.0-bootable.iso \
  -m 2048 \
  -accel hvf \
  -smp 2

# With acceleration (Linux)
qemu-system-x86_64 \
  -cdrom ModernOS-v1.0.0-bootable.iso \
  -m 2048 \
  -enable-kvm \
  -smp 2
```

---

## 💿 Method 3: Boot from CD/DVD

**Best for**: Computers with CD/DVD drives

### Step 1: Burn ISO to CD/DVD

**macOS**:
1. Insert blank CD/DVD
2. Open **Disk Utility**
3. Click **"Burn"** in toolbar
4. Select `ModernOS-v1.0.0-bootable.iso`
5. Click **"Burn"**

**Linux**:
```bash
# Using cdrecord
cdrecord -v dev=/dev/sr0 ModernOS-v1.0.0-bootable.iso

# Using Brasero (GUI)
brasero ModernOS-v1.0.0-bootable.iso
```

**Windows**:
1. Right-click `ModernOS-v1.0.0-bootable.iso`
2. Select **"Burn disc image"**
3. Select CD/DVD drive
4. Click **"Burn"**

### Step 2: Boot from CD/DVD

1. Insert CD/DVD
2. Restart computer
3. Press boot key (see USB method above)
4. Select CD/DVD drive
5. ModernOS boots!

---

## 🎮 Using ModernOS

### First Boot

When ModernOS starts, you'll see:

1. **Rainboot X Bootloader** (5 seconds)
   - Architecture selection
   - Boot progress bar
   - "Starting ModernOS..."

2. **Desktop Loads** (5 seconds)
   - Beautiful gradient background (purple → pink → blue)
   - Status bar at top
   - Dock at bottom with 10 apps

3. **Welcome!**
   - You're now running ModernOS!

### Desktop Layout

**Status Bar** (top):
- ModernOS logo
- Notifications 🔔
- WiFi 📶
- Volume 🔊
- Battery 🔋
- Time

**Dock** (bottom):
- 💬 Messages (Email)
- 🌐 Browser (HTML6)
- 📁 Files
- 🌊 Wave (Python IDE)
- 🧮 Calculator
- 📷 Photos
- 🎵 Music
- ⚙️ Settings
- 🤖 Host (AI - Ollama)
- 📦 Core (Package Manager)

### Try These Apps

**Browser** (🌐):
1. Click Browser icon
2. Click **"🌾 HTML6 Demo"** button
3. See HTML6 in action!
4. Browse any website (auto-converts to HTML6)

**AI Integration** (🤖):
1. Click Host icon
2. Ollama auto-installs (wait 2-3 minutes first time)
3. Pull models: `llama2`, `codellama`, etc.
4. Start Ollama service
5. Use AI in your apps!

**Settings** (⚙️):
1. Click Settings icon
2. Change theme (Dark, Light, Ocean, Forest, Sunset)
3. Adjust brightness
4. Configure browser (HTML6 vs HTML5.3)
5. View network info

---

## 🐛 Troubleshooting

### Issue: ISO won't boot

**Solutions**:
1. Verify ISO integrity:
   ```bash
   shasum -a 256 ModernOS-v1.0.0-bootable.iso
   ```
2. Re-burn ISO to USB/CD
3. Try different USB port
4. Disable Secure Boot in BIOS
5. Enable Legacy Boot in BIOS

### Issue: Stuck at GRUB menu

**Solutions**:
1. Wait 5 seconds (auto-boots)
2. Press Enter on first option
3. Try "Safe Mode" option
4. Check BIOS settings

### Issue: Black screen after boot

**Solutions**:
1. Wait 30-60 seconds
2. Try Safe Mode from GRUB
3. Add `nomodeset` to boot parameters
4. Check RAM (need 2GB minimum)

### Issue: Slow performance

**Solutions**:
1. Allocate more RAM (4GB recommended)
2. Use USB 3.0 port
3. Close other applications
4. Try in VM first

### Issue: Can't find boot key

**Common boot keys**:
- F12 (most common)
- F2
- F9
- Del
- Esc
- F8
- F10

Try pressing repeatedly during startup.

---

## 📊 System Requirements

### Minimum

- **CPU**: x86_64 (Intel/AMD) 64-bit
- **RAM**: 2GB
- **Storage**: None (runs from RAM)
- **Graphics**: VGA compatible
- **Boot**: USB/CD drive

### Recommended

- **CPU**: Dual-core 2GHz+
- **RAM**: 4GB
- **Graphics**: OpenGL 2.0+
- **Boot**: USB 3.0

---

## 🔐 Security & Privacy

### Live OS Benefits

- ✅ **No persistence** - All changes erased on shutdown
- ✅ **RAM-only** - No disk writes
- ✅ **Isolated** - Doesn't touch host computer
- ✅ **Private** - No tracking or telemetry
- ✅ **Secure** - Closed-source, obfuscated

### Perfect For

- Secure browsing
- Online banking
- Anonymous usage
- Testing software
- System recovery
- Demonstrations

---

## ❓ FAQ

**Q: Will this erase my computer?**  
A: No! ModernOS runs from RAM. Your computer's data is untouched.

**Q: Can I install it permanently?**  
A: ModernOS is designed as a live OS. For permanent use, keep booting from USB.

**Q: Does it need internet?**  
A: No, ModernOS works offline. Internet only needed for browser and AI models.

**Q: Can I save files?**  
A: Files are saved to RAM and lost on shutdown. For persistence, use external USB drive.

**Q: What if I want to go back to my OS?**  
A: Just restart and remove the USB/CD. Your original OS is unchanged.

**Q: Can I run this on Mac?**  
A: Yes! Works on Intel Macs. Apple Silicon Macs need VM emulation.

---

## 🎉 You're Ready!

### Quick Reference

**Boot from USB**:
1. Burn ISO to USB with Rufus/dd
2. Boot computer from USB
3. Select ModernOS from GRUB
4. Enjoy!

**Run in VM**:
1. Install VirtualBox
2. Create VM, attach ISO
3. Start VM
4. Enjoy!

**That's it!** ModernOS is ready to use.

---

<div align="center">

## 🖥️ Welcome to ModernOS!

**The Future of Desktop Computing**

**✅ Boots from USB/CD**  
**✅ Runs entirely from RAM**  
**✅ No installation needed**  
**✅ Private and secure**  
**✅ 10 built-in applications**  
**✅ HTML6 browser**  
**✅ AI integration**  

**Enjoy your ModernOS experience!**

</div>
