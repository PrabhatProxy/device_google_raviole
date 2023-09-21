echo "Note: Setting up FaceUnlock "
echo " "
echo "patching frameworks/base"
cd frameworks/base

git fetch https://github.com/PrabhatProxy/superior_android_frameworks_base.git thirteen-aosp-qpr3
echo " "
# Initial import of Face Unlock for S 
git cherry-pick 50a350a2cbf0dd8e83c66cf9825ccf26baf3677b
echo " "
git cherry-pick --abort
echo " "

# services: Merge T changes on our custom face unlock impl 
git cherry-pick 776f470051c81cdacab69c049aff6c26257a0f8d
echo " "
git cherry-pick --abort
echo " "

# FaceService: Allow our face unlock to be used on third-party apps
git cherry-pick 80406529f39ba2a6c77787b2fd4b6846b497ff51
echo " "
git cherry-pick --abort
echo " "

# Do not show camera indicator for Face Unlock service 
git cherry-pick fd5b25a53b090f335df1c76f2bb831ca7fae5d4b
echo " "
git cherry-pick --abort
echo " "

# WalletActivity: Don't explicity request face auth
git cherry-pick b5626ad29373f8fcefbd521609970698d648c6b0
echo " "
git cherry-pick --abort
echo " "

# Reset face auth on occluding app when authenticated
git cherry-pick 93d6fa203e93fbd9448867a94e97d493a6e2777a
echo " "
git cherry-pick --abort
echo " "

# face: Pass requestId on our authentication client 
git cherry-pick 1b6bae814458b6db80ee811e1ba99f550b5726ca
echo " "
git cherry-pick --abort
echo " "

# Add idle lockout message for FaceUnlock 
git cherry-pick 99caf426a2bfbec605a4c8d25811afba35370d88
echo " "
git cherry-pick --abort
echo " "

# KeyguardBouncer: Don't delay showing if face auth running 
git cherry-pick 1eda0a5a19d4a300008ca6f1de33a232b15f433f
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