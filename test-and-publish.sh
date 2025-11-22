#!/bin/bash

# Test and Publish ModernOS ISO as v1.0.1

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

ISO_FILE="dist/ModernOS-v1.0.0.iso"
NEW_VERSION="1.0.1"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║   ModernOS Test & Publish Script v1.0.1                   ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Step 1: Test in QEMU
echo -e "${BLUE}[1/5]${NC} Testing ISO in QEMU..."
echo -e "${YELLOW}Starting QEMU (this will open a window)...${NC}"
echo -e "${YELLOW}Press Ctrl+C when you're done testing${NC}"
echo ""

if [ ! -f "$ISO_FILE" ]; then
    echo -e "${RED}✗ ISO file not found: $ISO_FILE${NC}"
    echo "Please build the ISO first with ./build-full-linux-iso.sh"
    exit 1
fi

echo "Testing command:"
echo "  qemu-system-x86_64 -cdrom $ISO_FILE -m 2048 -boot d -vga std"
echo ""
echo -e "${GREEN}Press Enter to start QEMU test...${NC}"
read

qemu-system-x86_64 \
    -cdrom "$ISO_FILE" \
    -m 2048 \
    -boot d \
    -vga std \
    -name "ModernOS v$NEW_VERSION Test" &

QEMU_PID=$!
echo ""
echo -e "${GREEN}✓ QEMU started (PID: $QEMU_PID)${NC}"
echo -e "${YELLOW}Test the ISO, then close QEMU window or press Ctrl+C${NC}"
echo ""
echo "Waiting for QEMU to close..."
wait $QEMU_PID 2>/dev/null || true
echo ""
echo -e "${GREEN}✓ QEMU test complete${NC}"
echo ""

# Step 2: Confirm test passed
echo -e "${BLUE}[2/5]${NC} Did the ISO boot successfully?"
echo -e "${YELLOW}Did you see ModernOS start? (y/n)${NC}"
read -r response

if [[ ! "$response" =~ ^[Yy]$ ]]; then
    echo -e "${RED}✗ Test failed. Fix issues and try again.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Test passed!${NC}"
echo ""

# Step 3: Rename to v1.0.1
echo -e "${BLUE}[3/5]${NC} Renaming ISO to v$NEW_VERSION..."
NEW_ISO="dist/ModernOS-v$NEW_VERSION.iso"
cp "$ISO_FILE" "$NEW_ISO"

# Generate new checksum
cd dist
shasum -a 256 "ModernOS-v$NEW_VERSION.iso" > "ModernOS-v$NEW_VERSION.iso.sha256"
cd ..

echo -e "${GREEN}✓ Created:${NC}"
ls -lh "$NEW_ISO"
ls -lh "dist/ModernOS-v$NEW_VERSION.iso.sha256"
echo ""

# Step 4: Create GitHub release
echo -e "${BLUE}[4/5]${NC} Creating GitHub release v$NEW_VERSION..."

# Create release notes
cat > RELEASE_NOTES_v$NEW_VERSION.md << 'EOF'
# ModernOS v1.0.1

## 🎉 Full Linux System Release!

This release includes a **complete Linux operating system** with ModernOS as the desktop environment.

### What's New

- ✅ **Full Debian Linux base** - Complete operating system
- ✅ **Real Linux kernel** - Boots on any x86_64 computer
- ✅ **X11 graphics** - Full graphics stack
- ✅ **Openbox window manager** - Lightweight and fast
- ✅ **Auto-start ModernOS** - Launches on boot
- ✅ **GRUB + ISOLINUX** - Dual bootloaders
- ✅ **BIOS and UEFI** - Works everywhere

### System Components

**Base System**:
- Debian Linux (stable/bookworm)
- Linux kernel (latest)
- systemd init system
- Full hardware support

**Graphics**:
- X11 display server
- Openbox window manager
- Automatic session start

**ModernOS**:
- Java 17 runtime
- 10 built-in applications
- HTML6 browser
- AI integration (Ollama)

### How to Use

**Boot from USB**:
```bash
# Burn to USB
sudo dd if=ModernOS-v1.0.1.iso of=/dev/sdX bs=4M status=progress

# Boot from USB
# ModernOS starts automatically!
```

**In Virtual Machine**:
```bash
# QEMU
qemu-system-x86_64 -cdrom ModernOS-v1.0.1.iso -m 2048 -boot d

# VirtualBox
# Create VM, attach ISO, boot
```

### File Size

**~800MB - 1.2GB** (complete Linux system)

### Requirements

- x86_64 processor (Intel/AMD 64-bit)
- 2GB RAM minimum
- VGA graphics

### License

**Proprietary** - Personal use only. See LICENSE for details.

### Support

- **Website**: https://a-proof.github.io/ModernOS-Desktop
- **GitHub**: https://github.com/A-Proof/ModernOS-Desktop
- **Issues**: https://github.com/A-Proof/ModernOS-Desktop/issues

---

**This is a REAL, COMPLETE LINUX OPERATING SYSTEM!** 🚀
EOF

echo -e "${YELLOW}Creating release...${NC}"
gh release create "v$NEW_VERSION" \
    "$NEW_ISO" \
    "dist/ModernOS-v$NEW_VERSION.iso.sha256" \
    --title "ModernOS v$NEW_VERSION - Full Linux System" \
    --notes-file "RELEASE_NOTES_v$NEW_VERSION.md"

echo -e "${GREEN}✓ GitHub release created!${NC}"
echo ""

# Step 5: Update website
echo -e "${BLUE}[5/5]${NC} Updating website download link..."

# Update index.html with new version
sed -i.bak "s/v1\.0\.0/v$NEW_VERSION/g" docs/index.html
rm docs/index.html.bak 2>/dev/null || true

# Commit and push
git add docs/index.html "RELEASE_NOTES_v$NEW_VERSION.md"
git commit -m "Release v$NEW_VERSION - Full Linux system with ModernOS"
git push origin main

echo -e "${GREEN}✓ Website updated!${NC}"
echo ""

# Summary
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              RELEASE COMPLETE! 🎉🎉🎉                      ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo -e "${GREEN}ModernOS v$NEW_VERSION Published!${NC}"
echo ""
echo "Release URL:"
gh release view "v$NEW_VERSION" --web 2>/dev/null || \
    echo "  https://github.com/A-Proof/ModernOS-Desktop/releases/tag/v$NEW_VERSION"
echo ""
echo "Website:"
echo "  https://a-proof.github.io/ModernOS-Desktop"
echo ""
echo "Files:"
ls -lh "$NEW_ISO"
ls -lh "dist/ModernOS-v$NEW_VERSION.iso.sha256"
echo ""
echo -e "${BLUE}Users can now download and boot ModernOS v$NEW_VERSION!${NC}"
echo ""
