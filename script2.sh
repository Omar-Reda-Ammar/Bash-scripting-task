#!/bin/bash
src_path="/Home"
backup_folder="/home/kali/Desktop/backup"
backup_file="back_up.tar.gz"
tar -czf "$backup_folder/$backup_file" "$src_path"

