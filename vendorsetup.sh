echo "Note: Setting up FaceUnlock "
echo " "
echo "patching frameworks/base"
cd frameworks/base

git fetch https://github.com/PrabhatProxy/superior_android_frameworks_base.git thirteen-aosp-qpr3
echo " "
# Initial import of Face Unlock for S 
git cherry-pick 6a67cc2d0790032e01a6d4fc4711f32d38f233d5
echo " "
git cherry-pick --abort
echo " "

# services: Merge T changes on our custom face unlock impl 
git cherry-pick 2f7e537bd1dd4def1f7b2252379ed3bb3141d583
echo " "
git cherry-pick --abort
echo " "

# FaceService: Allow our face unlock to be used on third-party apps
git cherry-pick 553b8e1aa6d7763e27d52c4cf4e7c1b68d97120f
echo " "
git cherry-pick --abort
echo " "

# Do not show camera indicator for Face Unlock service 
git cherry-pick 73c437552f645ed002fd5182256787a556e51d71
echo " "
git cherry-pick --abort
echo " "

# WalletActivity: Don't explicity request face auth
git cherry-pick 8a5e3e9c8dca6390015eef9a024bf72c0d8a2a53
echo " "
git cherry-pick --abort
echo " "

# Reset face auth on occluding app when authenticated
git cherry-pick ef86549f6d1a0ca66ed7692b6596c9b1a93a6605
echo " "
git cherry-pick --abort
echo " "

# face: Pass requestId on our authentication client 
git cherry-pick 1022f456f10faa28a1bdab92f64e5940e86d6b0b
echo " "
git cherry-pick --abort
echo " "

# Add idle lockout message for FaceUnlock 
git cherry-pick 295e1cbe70bd66924760557c0723787247d804f3
echo " "
git cherry-pick --abort
echo " "

# KeyguardBouncer: Don't delay showing if face auth running 
git cherry-pick 559715ef81c64693d436ae186de94a03b44d7a85
echo " "
git cherry-pick --abort
echo " "

echo "patching packages/apps/Settings"
cd ../../packages/apps/Settings

git fetch https://github.com/PrabhatProxy/superior_android_packages_apps_Settings.git thirteen-aosp-qpr3

echo " "
# Revert "Minor changes to remove duplicates and add needed strings"
git revert 1dc013bef9fa23038a1ef6b34377e166b23f25f8 --no-edit
echo " "
git revert --abort
echo " "

# Revert "Settings: Create face confirmation activity" 
git revert 69571d4e218e546ccc2273ccb91b0e17f870d5be --no-edit
echo " "
git revert --abort
echo " "

# Revert "Settings: Create a ActivityDirector to optionally use Setting…" 
git revert bd40a56fc93ccc0d1746fbf54957ebdb605a719a --no-edit
echo " "
git revert --abort
echo " "

# Initial import of Face Unlock for T
git cherry-pick 820a7513ad2f73b745502f0ecab77c007344a7f3
echo " "
git cherry-pick --abort
echo " "

# Settings: Allow using face as auth method for apps 
git cherry-pick d1c9837b71e3bcd5d80d47f56a7f1c0a562ee04c
echo " "
git cherry-pick --abort
echo " "

# Settings: Add back illustration to face settings  
git cherry-pick 7bfaec826d31428cd77a41b5b99d9a054bce1d77
echo " "
git cherry-pick --abort
echo " "

# Settings: Disable face enroll on Setup Wizard 
git cherry-pick 4a49f33c78d7a3ffad2027ee7b0a3b76e7428855
echo " "
git cherry-pick --abort
echo " "

echo "patching vendor/superior"
cd ../../../vendor/superior

git fetch https://github.com/PrabhatProxy/android_vendor_superior.git thirteen-aosp-qpr3

echo " "
# config: Restore FaceUnlock  
git cherry-pick 7208a0398934ba01686f06a5615e2fb587dfacef
echo " "
git cherry-pick --abort
echo " "

cd ../..

echo "Cloning FaceUnlock Related stuff"
echo " "

DIR="packages/apps/FaceUnlockService"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "packages/apps/FaceUnlockService exists"
  cd packages/apps/FaceUnlockService
  git pull
  cd ../../..
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Error: ${DIR} not found."
  git clone https://github.com/SuperiorOS/android_packages_apps_FaceUnlockService.git packages/apps/FaceUnlockService
fi
echo " "
DIR2="external/faceunlock"
if [ -d "$DIR2" ]; then
  ### Take action if $DIR exists ###
  echo "external/faceunlock exists"
  cd external/faceunlock
  git pull
  cd ../..
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Error: ${DIR2} not found."
  git clone https://gitlab.com/superioros/android_external_faceunlock.git external/faceunlock
fi
echo " "
echo "Finished Setting Up FaceUnlock!"

echo " "
echo "Cloning GCam"
DIR3="vendor/gcam"
if [ -d "$DIR3" ]; then
  ### Take action if $DIR exists ###
  echo "vendor/gcam exists"
  cd vendor/gcam
  git pull
  cd ../..
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Error: ${DIR3} not found."
  git clone https://gitlab.com/PrabhatProxy/vendor_gcam.git vendor/gcam
fi
echo " "
echo "Please Scroll and check for errors"