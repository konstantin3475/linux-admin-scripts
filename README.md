# Linux Admin Scripts

Small Linux administration scripts, server maintenance tools and automation examples.

## Topics

- Backup scripts
- Log file checks
- Apache/Nginx status checks
- Disk space monitoring
- SSL certificate checks
- Basic server hardening notes

## Background

I have been working with Linux servers, PHP, MySQL/MariaDB and web hosting environments for more than 20 years.

## check-disk-space.sh

This script monitors disk usage on all mounted Linux filesystems. It retrieves disk space information using the standard `df` command and checks whether any partition has reached or exceeded a predefined usage threshold.

If a partition exceeds the configured limit (90% by default), the script generates a warning message identifying the affected mount point and its current usage level.

The script can be executed manually or scheduled through cron jobs for regular server monitoring. It is intended as a simple example of Linux system administration automation using Bash, awk, and standard Unix command-line tools.

### Example Output

```text
Warning: Partition / is 94% full.
Warning: Partition /var is 92% full.
```

### Typical Use Cases

* Monitoring server disk usage
* Detecting low disk space conditions
* Basic system administration automation
* Learning Bash scripting and text processing
* Integration into monitoring or maintenance workflows
