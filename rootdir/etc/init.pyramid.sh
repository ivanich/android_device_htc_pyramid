#!/system/bin/sh

export PATH=${PATH}:/system/bin/:/system/xbin/
LOG="/cache/${0}.log"

log -p i -t userinit "[${0}][Start]"

# Log related mounts and mount points before
echo "[Start]"   >> ${LOG}
mount            >> ${LOG}
echo "[/]"       >> ${LOG}
ls -la  /        >> ${LOG}
echo "[/data]"   >> ${LOG}
ls -la  /data/   >> ${LOG}
echo "[/data1]"  >> ${LOG}
ls -la  /data1/  >> ${LOG}
du -sch /data1/* >> ${LOG}

# Attempt to link data components to secondary data (optional)
# If we fail those locations will be used as usual
# Ensure permissions are set correctly
test -d /data1/dalvik-cache && chmod 0771 /data1/dalvik-cache && chown root:root         /data1/dalvik-cache && rm -Rf /data/dalvik-cache && ln -s /data1/dalvik-cache /data/dalvik-cache && log -p i -t userinit "[${0}] Linked /data1/dalvik-cache" && echo "[${0}] Linked /data1/dalvik-cache" >> ${LOG}
test -d /data1/app          && chmod 0771 /data1/app          && chown system:system     /data1/app          && rm -Rf /data/app          && ln -s /data1/app          /data/app          && log -p i -t userinit "[${0}] Linked /data1/app"          && echo "[${0}] Linked /data1/app"          >> ${LOG}
test -d /data1/data         && chmod 0771 /data1/data         && chown system:system     /data1/data         && rm -Rf /data/data         && ln -s /data1/data         /data/data         && log -p i -t userinit "[${0}] Linked /data1/data"         && echo "[${0}] Linked /data1/data"         >> ${LOG}
test -d /data1/media        && chmod 0770 /data1/media        && chown media_rw:media_rw /data1/media        && rm -Rf /data/media        && ln -s /data1/media        /data/media        && log -p i -t userinit "[${0}] Linked /data1/media"        && echo "[${0}] Linked /data1/media"        >> ${LOG}

# Log related mounts and mount points after
echo "[Stop]"    >> ${LOG}
mount            >> ${LOG}
echo "[/]"       >> ${LOG}
ls -la  /        >> ${LOG}
echo "[/data]"   >> ${LOG}
ls -la  /data/   >> ${LOG}
echo "[/data1]"  >> ${LOG}
ls -la  /data1/  >> ${LOG}
du -sch /data1/* >> ${LOG}

log -p i -t userinit "[${0}][Stop]"
