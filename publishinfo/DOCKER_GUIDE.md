# Docker Guide for ModernOS

**How to use Docker to build a truly bootable ISO**

---

## 🐳 What is Docker?

Docker is a tool that lets you run Linux containers on macOS/Windows. Think of it as a lightweight virtual machine.

**Why we need it**: To build a bootable Linux-based ISO on your Mac, we need Linux tools. Docker gives us a Linux environment without installing Linux.

---

## 🚀 Quick Start

### Step 1: Install Docker Desktop

```bash
# Install via Homebrew
brew install --cask docker

# Or download from:
# https://www.docker.com/products/docker-desktop
```

### Step 2: Start Docker Desktop

```bash
# Open Docker Desktop app
open -a Docker

# Wait for it to start (whale icon in menu bar)
```

### Step 3: Verify Docker is Running

```bash
# Check Docker version
docker --version

# Test Docker
docker run hello-world
```

If you see "Hello from Docker!", you're ready!

### Step 4: Build ModernOS Bootable ISO

```bash
# From your ModernOS project directory
./build-bootable-docker.sh
```

This will:
1. ✅ Check Docker is running
2. ✅ Build ModernOS JAR
3. ✅ Create Ubuntu Docker container
4. ✅ Install Linux kernel + GRUB
5. ✅ Build bootable ISO
6. ✅ Output to `dist/ModernOS-v1.0.0-bootable.iso`

**Time**: 5-10 minutes (first build)

---

## 📋 What the Script Does

### Behind the Scenes

```
Your Mac
    ↓
Docker Desktop
    ↓
Ubuntu Linux Container
    ↓
Install: xorriso, grub, squashfs-tools
    ↓
Copy: ModernOS.jar + Java runtime
    ↓
Create: Bootable ISO with Linux kernel
    ↓
Output: dist/ModernOS-v1.0.0-bootable.iso
    ↓
Back to Your Mac
```

### Docker Commands Used

The script runs these Docker commands:

```bash
# 1. Build Docker image (Ubuntu with build tools)
docker build -f Dockerfile.bootable -t modernos-builder .

# 2. Run container to build ISO
docker run --rm \
  -v "$(pwd)/target/modern-os-1.0.0.jar:/build/ModernOS.jar:ro" \
  -v "$(pwd)/dist:/build/output" \
  modernos-builder
```

---

## 🔧 Docker Basics

### Essential Commands

```bash
# Check if Docker is running
docker info

# List running containers
docker ps

# List all containers
docker ps -a

# List images
docker images

# Stop all containers
docker stop $(docker ps -q)

# Remove all containers
docker rm $(docker ps -aq)

# Remove all images
docker rmi $(docker images -q)

# Clean up everything
docker system prune -a
```

### Docker Desktop GUI

Open Docker Desktop to:
- See running containers
- View images
- Monitor resource usage
- Access settings

---

## 🐛 Troubleshooting

### Issue: Docker not found

**Solution**:
```bash
# Install Docker Desktop
brew install --cask docker

# Open Docker Desktop
open -a Docker

# Wait for it to start
```

### Issue: Docker daemon not running

**Solution**:
```bash
# Start Docker Desktop
open -a Docker

# Wait 30 seconds for it to fully start

# Verify
docker info
```

### Issue: Permission denied

**Solution**:
```bash
# Docker Desktop should handle permissions automatically
# If issues persist, restart Docker Desktop
```

### Issue: Build fails

**Solution**:
```bash
# Clean Docker cache
docker system prune -a

# Rebuild
./build-bootable-docker.sh
```

### Issue: Out of disk space

**Solution**:
```bash
# Check Docker disk usage
docker system df

# Clean up
docker system prune -a

# In Docker Desktop:
# Settings → Resources → Disk image size
```

---

## 📊 Docker vs Native Build

| Method | Pros | Cons |
|--------|------|------|
| **Docker** | ✅ Works on macOS<br>✅ Creates true bootable ISO<br>✅ Reproducible | ⚠️ Requires Docker<br>⚠️ 5-10 min build |
| **Native macOS** | ✅ No Docker needed<br>✅ Fast | ❌ Can't create bootable ISO<br>❌ Data ISO only |
| **Native Linux** | ✅ Fastest<br>✅ Direct access | ❌ Need Linux machine |

---

## 🎯 Advanced Usage

### Customize the Build

Edit `build-iso-in-docker.sh` before building:

```bash
# Add more packages
apt-get install -y your-package

# Modify kernel parameters
# Edit GRUB configuration

# Change init system
# Edit init script
```

### Debug Build

```bash
# Run Docker container interactively
docker run -it --rm \
  -v "$(pwd)/target/modern-os-1.0.0.jar:/build/ModernOS.jar:ro" \
  modernos-builder /bin/bash

# Now you're inside the container
# Run build commands manually
# Debug issues
```

### View Build Logs

```bash
# Build with verbose output
docker run --rm \
  -v "$(pwd)/target/modern-os-1.0.0.jar:/build/ModernOS.jar:ro" \
  -v "$(pwd)/dist:/build/output" \
  modernos-builder 2>&1 | tee build.log
```

---

## 💡 Docker Tips

### Speed Up Builds

```bash
# Docker caches layers
# Rebuild is faster (uses cache)
./build-bootable-docker.sh

# Force rebuild (no cache)
docker build --no-cache -f Dockerfile.bootable -t modernos-builder .
```

### Save Disk Space

```bash
# Remove old images
docker image prune

# Remove build cache
docker builder prune

# Remove everything
docker system prune -a
```

### Monitor Resources

```bash
# Check resource usage
docker stats

# In Docker Desktop:
# Settings → Resources
# Adjust CPU, Memory, Disk
```

---

## 🎓 Learn More

### Official Resources

- **Docker Docs**: https://docs.docker.com/
- **Docker Desktop**: https://www.docker.com/products/docker-desktop
- **Docker Hub**: https://hub.docker.com/

### Tutorials

- **Docker 101**: https://www.docker.com/101-tutorial
- **Docker for Mac**: https://docs.docker.com/desktop/mac/

### Community

- **Docker Forums**: https://forums.docker.com/
- **Stack Overflow**: [docker] tag

---

## 🎉 Summary

### What You Learned

✅ **What Docker is** - Container platform  
✅ **Why we need it** - Build Linux ISO on Mac  
✅ **How to install** - Docker Desktop  
✅ **How to use** - Run build script  
✅ **How to troubleshoot** - Common issues  

### Next Steps

1. **Install Docker Desktop** ✅
2. **Run build script** ✅
3. **Get bootable ISO** ✅
4. **Test in VM or USB** ⏳
5. **Share with users** ⏳

---

<div align="center">

## 🐳 Docker + ModernOS

**Build a truly bootable OS on macOS**

**✅ Easy** - One script  
**✅ Fast** - 5-10 minutes  
**✅ Reliable** - Reproducible builds  
**✅ Professional** - Real bootable ISO  

```bash
./build-bootable-docker.sh
```

</div>
