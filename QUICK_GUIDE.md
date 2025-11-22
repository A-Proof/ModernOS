# Quick Guide: Test & Publish ModernOS v1.0.1

## Once the ISO Build Completes

### Step 1: Test in QEMU

```bash
./test-and-publish.sh
```

This will:
1. ✅ Start QEMU with your ISO
2. ✅ Open a window showing ModernOS booting
3. ✅ Wait for you to test
4. ✅ Ask if test passed

**What to look for**:
- Boot menu appears
- Linux kernel loads
- X11 starts
- ModernOS desktop appears

### Step 2: Manual QEMU Test (Alternative)

```bash
qemu-system-x86_64 \
  -cdrom dist/ModernOS-v1.0.0.iso \
  -m 2048 \
  -boot d \
  -vga std
```

**Controls**:
- Close window to exit
- Ctrl+Alt+G to release mouse
- Ctrl+Alt+F for fullscreen

### Step 3: Publish as v1.0.1

The script will automatically:
1. ✅ Rename ISO to v1.0.1
2. ✅ Generate checksum
3. ✅ Create GitHub release
4. ✅ Upload ISO files
5. ✅ Update website
6. ✅ Push to GitHub

### Step 4: Verify

Check your release:
```bash
gh release view v1.0.1 --web
```

Or visit:
https://github.com/A-Proof/ModernOS-Desktop/releases/tag/v1.0.1

---

## Current Build Status

Check if build is complete:
```bash
docker ps
```

If you see `modernos-fulllinux-builder` running, it's still building.

View build progress:
```bash
tail -f build.log
```

---

## What the Full Linux ISO Has

✅ **Complete Debian Linux** (~800MB-1.2GB)  
✅ **Real Linux kernel** (boots anywhere)  
✅ **X11 graphics** (full display server)  
✅ **Openbox WM** (window manager)  
✅ **ModernOS** (auto-starts)  
✅ **Java 17** (included)  
✅ **GRUB + ISOLINUX** (dual bootloaders)  

---

## Troubleshooting

### Build still running?
```bash
# Check Docker
docker ps

# View logs
docker logs $(docker ps -q --filter ancestor=modernos-fulllinux-builder)
```

### Build failed?
```bash
# Clean and retry
docker system prune -a
./build-full-linux-iso.sh
```

### QEMU not installed?
```bash
brew install qemu
```

---

## After Publishing

Users can download from:
- **GitHub Releases**: Direct download
- **Website**: https://a-proof.github.io/ModernOS-Desktop

Boot methods:
- USB (burn with dd/Rufus/Etcher)
- VM (VirtualBox/VMware/QEMU)
- CD/DVD (burn with any tool)

---

**You're almost there! Once the build completes, run `./test-and-publish.sh`** 🚀
