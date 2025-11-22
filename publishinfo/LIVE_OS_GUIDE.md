# ModernOS Live Operating System - Complete Guide

**A complete bootable operating system, not just an app**

---

## 🖥️ What is ModernOS Live OS?

ModernOS is a **complete operating system** that:
- ✅ **Boots from USB/CD** - No hard disk needed
- ✅ **Runs entirely from RAM** - Fast and responsive
- ✅ **Based on Alpine Linux** - Lightweight and secure
- ✅ **ModernOS as primary UI** - Not an application, the OS itself
- ✅ **No installation required** - Live environment
- ✅ **Closed-source** - Protected distribution

---

## 🚀 Quick Start

### Step 1: Download ISO

Download: **ModernOS-v1.0.0-live.iso** (~200-300 MB)

### Step 2: Burn to USB

**macOS**:
```bash
# Find USB device
diskutil list

# Unmount USB
diskutil unmountDisk /dev/diskN

# Burn ISO
sudo dd if=ModernOS-v1.0.0-live.iso of=/dev/rdiskN bs=1m

# Eject
diskutil eject /dev/diskN
```

**Linux**:
```bash
# Find USB device
lsblk

# Burn ISO
sudo dd if=ModernOS-v1.0.0-live.iso of=/dev/sdX bs=4M status=progress

# Sync
sync
```

**Windows**:
1. Download **Rufus**: https://rufus.ie
2. Select ModernOS ISO
3. Click "START"
4. Wait for completion

### Step 3: Boot from USB

1. Insert USB drive
2. Restart computer
3. Press boot key (F12, F2, Del, etc.)
4. Select USB drive
5. Select "ModernOS v1.0.0 (Live OS)"
6. Wait 20-30 seconds
7. ModernOS desktop appears!

---

## 🎯 Boot Process

### What Happens When You Boot

```
1. BIOS/UEFI loads bootloader
   ↓
2. GRUB menu appears (5 second timeout)
   ↓
3. Linux kernel loads
   ↓
4. ModernOS init system starts
   ↓
5. System mounts to RAM
   ↓
6. X server starts
   ↓
7. ModernOS desktop launches
   ↓
8. Rainboot X bootloader animation
   ↓
9. ModernOS desktop ready!
```

**Total boot time**: 20-30 seconds

---

## 💻 System Architecture

### Base System

- **Operating System**: Alpine Linux 3.19
- **Kernel**: Linux (latest stable)
- **Init System**: Custom ModernOS init
- **Display Server**: X11
- **Window Manager**: ModernOS (JavaFX-based)
- **Shell**: BusyBox sh

### ModernOS Layer

```
┌─────────────────────────────────────┐
│      ModernOS Desktop (JavaFX)      │  ← Your interface
├─────────────────────────────────────┤
│         X11 Display Server          │  ← Graphics
├─────────────────────────────────────┤
│      Custom Init System             │  ← Startup
├─────────────────────────────────────┤
│      Linux Kernel                   │  ← Core OS
├─────────────────────────────────────┤
│      Alpine Linux Base              │  ← Foundation
└─────────────────────────────────────┘
```

### File System Layout

```
/
├── boot/              # Kernel and bootloader
├── modernos/          # ModernOS installation
│   ├── ModernOS.jar   # Main application
│   ├── init.sh        # Init system
│   └── autostart.sh   # Autostart script
├── bin/               # System binaries
├── lib/               # System libraries
├── etc/               # Configuration
└── tmp/               # Temporary files (RAM)
```

---

## 🎮 Using ModernOS Live OS

### First Boot Experience

1. **GRUB Menu** (5 seconds)
   - ModernOS v1.0.0 (Live OS)
   - ModernOS v1.0.0 (Safe Mode)
   - Boot from Hard Disk

2. **Kernel Boot** (10 seconds)
   - Loading kernel...
   - Mounting filesystems...
   - Starting services...

3. **ModernOS Init** (5 seconds)
   - Copying to RAM...
   - Starting X server...
   - Launching ModernOS...

4. **Rainboot X** (5 seconds)
   - Architecture selection
   - Boot animation
   - System checks

5. **Desktop Ready!**
   - Gradient background
   - Status bar
   - Dock with applications

### Desktop Environment

**Status Bar** (top):
- ModernOS logo
- Notifications (🔔)
- WiFi (📶)
- Volume (🔊)
- Battery (🔋)
- Time

**Dock** (bottom):
- 💬 Messages
- 🌐 Browser (HTML6)
- 📁 Files
- 🌊 Wave (IDE)
- 🧮 Calculator
- 📷 Photos
- 🎵 Music
- ⚙️ Settings
- 🤖 Host (AI)
- 📦 Core (Package Manager)

### Applications

All applications run as part of the OS, not separate windows:

1. **Browser** - HTML6 with Grain converter
2. **File Manager** - Browse USB/CD contents
3. **Music Player** - Play audio files
4. **Photo Gallery** - View images
5. **Calculator** - Scientific calculator
6. **Settings** - System configuration
7. **AI Integration** - Ollama support
8. **Package Manager** - Install software

---

## 🔧 Technical Details

### System Requirements

**Minimum**:
- CPU: x86_64 (Intel/AMD) 64-bit
- RAM: 2GB
- Storage: None (runs from RAM)
- Graphics: VGA compatible
- Boot: CD/DVD or USB

**Recommended**:
- CPU: Dual-core 2GHz+
- RAM: 4GB
- Graphics: OpenGL 2.0+
- Boot: USB 3.0

### Memory Usage

```
Base System:     ~100 MB
ModernOS:        ~200 MB
Applications:    ~100-500 MB
Free for user:   ~1-3 GB (with 4GB RAM)
```

### Boot Options

**Normal Boot**:
```
linux /boot/vmlinuz-lts quiet splash init=/modernos/init.sh
initrd /boot/initramfs-lts
```

**Safe Mode**:
```
linux /boot/vmlinuz-lts nomodeset init=/modernos/init.sh
initrd /boot/initramfs-lts
```

### Persistence

**Live OS Mode** (default):
- All changes lost on reboot
- Runs entirely from RAM
- No data saved to disk

**Persistent Mode** (optional):
- Save changes to USB
- Requires persistent partition
- Data survives reboot

---

## 🐛 Troubleshooting

### Issue: Won't boot from USB

**Solutions**:
1. Check BIOS boot order
2. Disable Secure Boot
3. Try different USB port
4. Re-burn ISO to USB
5. Verify ISO checksum

### Issue: Stuck at GRUB menu

**Solutions**:
1. Wait 5 seconds (auto-boots)
2. Press Enter on first option
3. Try Safe Mode
4. Check USB drive integrity

### Issue: Black screen after boot

**Solutions**:
1. Wait 30-60 seconds
2. Try Safe Mode (nomodeset)
3. Press Ctrl+Alt+F2 for console
4. Check graphics compatibility

### Issue: ModernOS doesn't start

**Solutions**:
1. Check RAM (need 2GB minimum)
2. Verify Java is included in ISO
3. Try Safe Mode
4. Check boot logs

### Issue: Slow performance

**Solutions**:
1. Add more RAM (4GB recommended)
2. Use USB 3.0 port
3. Close unused applications
4. Reboot to clear RAM

---

## 🔐 Security & Privacy

### Live OS Security

- ✅ **No data persistence** - Everything erased on shutdown
- ✅ **RAM-only operation** - No disk writes
- ✅ **Closed-source** - Protected code
- ✅ **Isolated environment** - Doesn't touch host OS

### Privacy Features

- **No tracking** - No telemetry or analytics
- **No logging** - Logs cleared on shutdown
- **Offline capable** - Works without internet
- **Secure** - Based on Alpine Linux (security-focused)

### Verify ISO Integrity

```bash
# Check SHA256 checksum
shasum -a 256 ModernOS-v1.0.0-live.iso

# Compare with official checksum
cat ModernOS-v1.0.0-live.iso.sha256

# Should match exactly
```

---

## 🌐 Virtual Machine Usage

### VirtualBox

```bash
# Create VM
VBoxManage createvm --name "ModernOS" --ostype "Linux_64" --register

# Configure VM
VBoxManage modifyvm "ModernOS" \
  --memory 2048 \
  --vram 128 \
  --cpus 2 \
  --boot1 dvd

# Attach ISO
VBoxManage storagectl "ModernOS" --name "IDE" --add ide
VBoxManage storageattach "ModernOS" \
  --storagectl "IDE" \
  --port 0 \
  --device 0 \
  --type dvddrive \
  --medium ModernOS-v1.0.0-live.iso

# Start VM
VBoxManage startvm "ModernOS"
```

### VMware

1. Create new VM
2. Select "I will install the operating system later"
3. Guest OS: Linux → Other Linux 5.x kernel 64-bit
4. Memory: 2048 MB
5. Attach ISO as CD-ROM
6. Power on

### QEMU

```bash
# Basic
qemu-system-x86_64 \
  -cdrom ModernOS-v1.0.0-live.iso \
  -m 2048

# With acceleration (macOS)
qemu-system-x86_64 \
  -cdrom ModernOS-v1.0.0-live.iso \
  -m 2048 \
  -accel hvf \
  -smp 2

# With acceleration (Linux)
qemu-system-x86_64 \
  -cdrom ModernOS-v1.0.0-live.iso \
  -m 2048 \
  -enable-kvm \
  -smp 2
```

---

## 📊 Comparison

### ModernOS vs Traditional OS

| Feature | ModernOS Live | Traditional OS |
|---------|---------------|----------------|
| **Installation** | None | Required |
| **Boot Time** | 20-30 seconds | 1-2 minutes |
| **Disk Usage** | 0 (RAM only) | 10-50 GB |
| **Persistence** | Optional | Always |
| **Portability** | USB/CD | Fixed disk |
| **Privacy** | High (no traces) | Low (logs) |
| **Updates** | New ISO | Package manager |

### ModernOS vs Live Linux

| Feature | ModernOS | Ubuntu Live | Arch Live |
|---------|----------|-------------|-----------|
| **Base** | Alpine | Ubuntu | Arch |
| **Size** | ~300 MB | ~3 GB | ~800 MB |
| **Boot Time** | 20-30s | 1-2 min | 30-60s |
| **Interface** | ModernOS | GNOME/KDE | Console |
| **Purpose** | Desktop OS | Installer | Installer |
| **Apps** | 10 built-in | Many | Few |

---

## 🎯 Use Cases

### 1. Portable Desktop

- Carry your OS on USB
- Use on any computer
- No installation needed
- Your environment everywhere

### 2. Privacy & Security

- No traces left behind
- Secure browsing
- Safe online banking
- Anonymous usage

### 3. System Recovery

- Boot when main OS fails
- Access files
- Repair systems
- Data recovery

### 4. Testing & Development

- Test software safely
- Development environment
- No risk to main OS
- Clean slate each boot

### 5. Demonstrations

- Show ModernOS to others
- No installation required
- Quick setup
- Professional presentation

---

## 🔄 Building from Source

### Build Requirements

- macOS or Linux
- Java 17+
- Maven
- curl
- xorriso

### Build Command

```bash
./build-live-os.sh
```

### Build Process

1. Download Alpine Linux base
2. Extract Alpine ISO
3. Build ModernOS JAR
4. Obfuscate JAR
5. Create init system
6. Configure bootloader
7. Build bootable ISO
8. Generate checksums

### Build Output

```
dist/
├── ModernOS-v1.0.0-live.iso        # Bootable ISO
└── ModernOS-v1.0.0-live.iso.sha256 # Checksum
```

---

## 📝 Advanced Usage

### Custom Boot Parameters

Edit GRUB menu at boot:
- Press 'e' to edit
- Add parameters to kernel line
- Press Ctrl+X to boot

**Useful parameters**:
- `nomodeset` - Disable graphics drivers
- `mem=2G` - Limit RAM usage
- `debug` - Enable debug mode
- `single` - Single user mode

### Persistent Storage

Create persistent USB:
```bash
# Create partition for persistence
sudo fdisk /dev/sdX
# Create ext4 partition

# Format partition
sudo mkfs.ext4 -L persistence /dev/sdX2

# Mount and configure
sudo mount /dev/sdX2 /mnt
echo "/ union" | sudo tee /mnt/persistence.conf
sudo umount /mnt
```

### Custom Configuration

Mount ISO and modify:
```bash
# Extract ISO
7z x ModernOS-v1.0.0-live.iso -o/tmp/modernos

# Modify files
# Edit /tmp/modernos/modernos/init.sh
# Edit /tmp/modernos/boot/grub/grub.cfg

# Rebuild ISO
xorriso -as mkisofs -o ModernOS-custom.iso /tmp/modernos
```

---

<div align="center">

## 🎉 ModernOS - A True Operating System!

**✅ Bootable OS** - Not just an app  
**✅ Runs from RAM** - Fast and responsive  
**✅ Complete Desktop** - Full environment  
**✅ No Installation** - Live OS  
**✅ Portable** - USB/CD bootable  

**Boot it, use it, love it!**

</div>
