#!/bin/bash
# ─── CONFIGURATION ──
CRON_JOBS=(
    "* * * * * /root/addmacs.sh >> /var/log/wol_check.log 2>&1"
    "0 6 * * * apt update && apt install -y etherwake >> /var/log/etherwake_install.log 2>&1"
)
 
check_and_add_cron() {
    local job="$1"
    # Get current crontab (suppress error if empty)
    CURRENT_CRON=$(crontab -l 2>/dev/null)
 
    # Check if the job already exists
    if echo "$CURRENT_CRON" | grep -qF "$job"; then
        echo "[INFO] Cron job already exists. No changes made."
        echo "       → $job"
    else
        echo "[INFO] Cron job not found. Adding it now..."
        # Append the new job to the existing crontab
        (echo "$CURRENT_CRON"; echo "$job") | crontab -
        echo "[OK]   Cron job added successfully."
        echo "       → $job"
    fi
}
 
for job in "${CRON_JOBS[@]}"; do
    check_and_add_cron "$job"
done
