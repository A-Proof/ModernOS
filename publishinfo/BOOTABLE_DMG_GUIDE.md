# ModernOS Bootable DMG - Complete Guide

**Self-contained macOS application with bundled Java runtime**

---

## 📦 What You Have

**ModernOS-v1.0.0-bootable.dmg** (39 MB)

This is a **bootable DMG** containing:
- ✅ **ModernOS.app** - Complete macOS application
- ✅ **Bundled Java 17** - No installation required
- ✅ **Closed-source** - Obfuscated JAR
- ✅ **Self-contained** - Everything included

---

## 🚀 Quick Start (3 Steps)

### Method 1: Install to Applications (Recommended)

```bash
# Step 1: Open DMG
open ModernOS-v1.0.0-bootable.dmg

# Step 2: Drag ModernOS.app to Applications folder

# Step 3: Launch from Applications or Launchpad
open /Applications/ModernOS.app
```

### Method 2: Run Directly from DMG

```bash
# Step 1: Open DMG
open ModernOS-v1.0.0-bootable.dmg

# Step 2: Double-click ModernOS.app in the DMG window
```

### Method 3: Command Line

```bash
# Mount DMG
hdiutil attach ModernOS-v1.0.0-bootable.dmg

# Run from mounted volume
/Volumes/ModernOS\ v1.0.0/run-modernos.sh

# Or run the app directly
open /Volumes/ModernOS\ v1.0.0/ModernOS.app
```

---

## 📋 System Requirements

### Minimum

- **macOS**: 10.14 (Mojave) or higher
- **RAM**: 2GB
- **Storage**: 500MB free space
- **Display**: 1280x720

### Recommended

- **macOS**: 12.0 (Monterey) or higher
- **RAM**: 4GB
- **Storage**: 1GB free space
- **Display**: 1920x1080

### No Additional Requirements

- ❌ **No Java installation needed** - Bundled in app
- ❌ **No Homebrew needed** - Self-contained
- ❌ **No dependencies** - Everything included

---

## 🎯 Installation Options

### Option A: Install to Applications Folder

**Pros**:
- Available in Launchpad
- Searchable in Spotlight
- Appears in Dock
- Standard macOS experience

**Steps**:
1. Open `ModernOS-v1.0.0-bootable.dmg`
2. Drag `ModernOS.app` to `Applications` folder
3. Eject DMG
4. Launch from Applications

### Option B: Run from DMG

**Pros**:
- No installation needed
- Portable (keep on USB drive)
- No system modifications

**Steps**:
1. Open `ModernOS-v1.0.0-bootable.dmg`
2. Double-click `ModernOS.app`
3. Keep DMG mounted while using

### Option C: Copy to Desktop

**Pros**:
- Quick access
- Easy to find
- No Applications folder clutter

**Steps**:
1. Open `ModernOS-v1.0.0-bootable.dmg`
2. Drag `ModernOS.app` to Desktop
3. Eject DMG
4. Double-click to launch

---

## 🔧 Technical Details

### App Bundle Structure

```
ModernOS.app/
├── Contents/
│   ├── Info.plist              # App metadata
│   ├── MacOS/
│   │   └── ModernOS            # Launcher script
│   ├── Resources/
│   │   └── AppIcon.icns        # App icon
│   └── Java/
│       ├── ModernOS.jar        # Application (obfuscated)
│       └── runtime/            # Bundled Java 17
│           ├── bin/
│           │   └── java        # Java executable
│           └── lib/            # Java libraries
```

### Bundled Java Runtime

- **Version**: OpenJDK 17 (from Homebrew)
- **Location**: `ModernOS.app/Contents/Java/runtime`
- **Size**: ~150 MB
- **Source**: `/opt/homebrew/opt/openjdk@17`

### Launch Process

1. User double-clicks `ModernOS.app`
2. macOS executes `Contents/MacOS/ModernOS` script
3. Script locates bundled Java runtime
4. Java launches `ModernOS.jar` with optimized settings
5. ModernOS desktop appears

### Java Command

The app runs this command internally:
```bash
/path/to/ModernOS.app/Contents/Java/runtime/bin/java \
    -Xmx2G \
    -XX:+UseG1GC \
    -Dapple.awt.application.name="ModernOS" \
    -Dapple.laf.useScreenMenuBar=true \
    -Xdock:name="ModernOS" \
    -jar ModernOS.jar
```

---

## 🎮 Using ModernOS

### First Launch

1. **Open DMG or App**
2. **Rainboot X Bootloader** appears (10 seconds)
   - Architecture selection
   - Boot progress
3. **Desktop Loads** (5 seconds)
   - Gradient background
   - Status bar
   - Dock with 10 apps

### Applications

Click dock icons to launch:

1. **💬 Messages** - Email client
2. **🌐 Browser** - HTML6 browser with Grain
3. **📁 Files** - File manager
4. **🌊 Wave** - Python IDE
5. **🧮 Calculator** - Scientific calculator
6. **📷 Photos** - Photo gallery
7. **🎵 Music** - Music player
8. **⚙️ Settings** - System configuration
9. **🤖 Host** - Ollama AI hosting
10. **📦 Core** - Package manager

### HTML6 Browser

1. Click **Browser** icon
2. Click **"🌾 HTML6 Demo"** button
3. See HTML6 in action
4. Browse web with auto-conversion

### AI Integration

1. Click **Host** icon
2. Ollama auto-installs (first time only)
3. Pull models: `llama2`, `codellama`, etc.
4. Start Ollama service
5. Use with AI applications

---

## 🐛 Troubleshooting

### Issue: App won't open - "App is damaged"

**Cause**: macOS Gatekeeper security

**Solution**:
```bash
# Remove quarantine attribute
xattr -d com.apple.quarantine /Applications/ModernOS.app

# Or allow in System Preferences
# System Preferences → Security & Privacy → Allow
```

### Issue: "ModernOS.app" can't be opened

**Cause**: Unsigned application

**Solution**:
```bash
# Right-click → Open (first time only)
# Or use command line:
open /Applications/ModernOS.app

# Or disable Gatekeeper temporarily:
sudo spctl --master-disable
open /Applications/ModernOS.app
sudo spctl --master-enable
```

### Issue: Java not found

**Cause**: Bundled Java missing or corrupted

**Solution**:
```bash
# Check if Java is bundled
ls /Applications/ModernOS.app/Contents/Java/runtime/bin/java

# If missing, install system Java
brew install openjdk@17

# App will fallback to system Java
```

### Issue: Slow performance

**Solutions**:
1. Close other applications
2. Allocate more RAM (edit launcher script)
3. Restart ModernOS
4. Check Activity Monitor for CPU/RAM usage

### Issue: Can't mount DMG

**Solutions**:
```bash
# Verify DMG integrity
shasum -a 256 ModernOS-v1.0.0-bootable.dmg

# Try mounting manually
hdiutil attach ModernOS-v1.0.0-bootable.dmg

# Repair DMG if corrupted
hdiutil verify ModernOS-v1.0.0-bootable.dmg
```

---

## 🔐 Security & Privacy

### Closed-Source Protection

- ✅ **JAR obfuscated** (when ProGuard available)
- ✅ **No source code** included
- ✅ **Reverse engineering protected**
- ✅ **Proprietary license**

### Verify DMG Integrity

```bash
# Check SHA256 checksum
shasum -a 256 ModernOS-v1.0.0-bootable.dmg

# Compare with official checksum
cat ModernOS-v1.0.0-bootable.dmg.sha256

# Should match exactly
```

### Data Privacy

- **Local storage only** - No external servers
- **No telemetry** - No tracking
- **Offline capable** - Works without internet
- **Secure** - Closed-source prevents tampering

---

## 📊 Distribution

### Share DMG

**Upload to**:
- GitHub Releases
- Google Drive
- Dropbox
- OneDrive
- Direct download

**File size**: 39 MB (compressed)

### User Instructions

```markdown
# Download ModernOS

1. Download: ModernOS-v1.0.0-bootable.dmg
2. Open DMG file
3. Drag ModernOS.app to Applications
4. Launch from Applications

No Java installation required!
```

---

## 🎯 Advanced Usage

### Run from Command Line

```bash
# Launch app
open /Applications/ModernOS.app

# Or run Java directly
/Applications/ModernOS.app/Contents/Java/runtime/bin/java \
    -jar /Applications/ModernOS.app/Contents/Java/ModernOS.jar
```

### Customize Launch Options

Edit `/Applications/ModernOS.app/Contents/MacOS/ModernOS`:

```bash
#!/bin/bash
# ... existing code ...

# Customize Java options
exec "$JAVA_CMD" \
    -Xmx4G \                    # Increase RAM to 4GB
    -XX:+UseG1GC \
    -Duser.language=en \        # Set language
    -Duser.country=US \         # Set country
    -jar ModernOS.jar
```

### Extract JAR

```bash
# Copy JAR out of app
cp /Applications/ModernOS.app/Contents/Java/ModernOS.jar ~/Desktop/

# Run with system Java
java -jar ~/Desktop/ModernOS.jar
```

### Create Alias

```bash
# Add to ~/.zshrc or ~/.bash_profile
alias modernos='open /Applications/ModernOS.app'

# Use
modernos
```

---

## 🔄 Updates

### Check for Updates

1. Visit GitHub releases
2. Download latest DMG
3. Replace old app with new one
4. Launch updated version

### Update Process

```bash
# 1. Download new DMG
# 2. Open new DMG
# 3. Drag to Applications (replace existing)
# 4. Eject DMG
# 5. Launch updated app
```

---

## 📝 Build Information

### Built With

- **Build Script**: `build-macos-bootable.sh`
- **Java**: OpenJDK 17 (Homebrew)
- **Homebrew Path**: `/opt/homebrew`
- **Maven**: For JAR compilation
- **ProGuard**: For obfuscation (optional)

### Build Command

```bash
./build-macos-bootable.sh
```

### Build Output

```
dist/
├── ModernOS-v1.0.0-bootable.dmg        # macOS disk image
├── ModernOS-v1.0.0-bootable.dmg.sha256 # DMG checksum
├── ModernOS-v1.0.0-bootable.iso        # Cross-platform ISO
└── ModernOS-v1.0.0-bootable.iso.sha256 # ISO checksum
```

---

## 🎉 Features

### Self-Contained

- ✅ Bundled Java runtime
- ✅ No external dependencies
- ✅ Works offline
- ✅ Portable

### macOS Native

- ✅ Standard .app bundle
- ✅ Dock integration
- ✅ Launchpad support
- ✅ Spotlight searchable

### Professional

- ✅ Closed-source
- ✅ Obfuscated code
- ✅ Optimized performance
- ✅ Beautiful UI

---

<div align="center">

## 🚀 ModernOS is Ready!

**✅ Bootable DMG** - Self-contained macOS app  
**✅ Bundled Java** - No installation required  
**✅ Closed-Source** - Protected distribution  
**✅ Easy to Use** - Double-click to run  

**Download, open, and enjoy ModernOS!**

</div>
