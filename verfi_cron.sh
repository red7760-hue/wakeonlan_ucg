#!/bin/bash
# ─── CONFIGURATION ──
CRON_JOB="* * * * * /root/addmacs.sh >> /var/log/wol_check.log 2>&1" 
check_and_add_cron() {
    # Get current crontab (suppress error if empty)
    CURRENT_CRON=$(crontab -l 2>/dev/null)

    # Check if the job already exists
    if echo "$CURRENT_CRON" | grep -qF "$CRON_JOB"; then
        echo "[INFO] Cron job already exists. No changes made."
        echo "       → $CRON_JOB"
    else
        echo "[INFO] Cron job not found. Adding it now..."
        # Append the new job to the existing crontab
        (echo "$CURRENT_CRON"; echo "$CRON_JOB") | crontab -
        echo "[OK]   Cron job added successfully."
        echo "       → $CRON_JOB"
    fi
}

check_and_add_cron