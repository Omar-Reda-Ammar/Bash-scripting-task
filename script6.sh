#!/bin/bash
domains="$1"
iterations="$2"
while IFS= read -r domain
do 
  for i in $(seq 1 $iterations)
  do
    subdomains="$(subfinder -d $domain | sort -u)"
    subdomains="$subdomains $(assetfinder -subs-only $domain | sort -u)"
    subdomains="$(echo "$subdomains" | sort -u)"
    echo "subdomains fron iteration1 are : $(echo "$subdomains" | wc -l)."
    domain="$subdomains"
  done
  echo "$subdomains" | sort -u > "$domain.subdomains.txt"
  count=$(echo "$subdomains" | sort -u | wc -l)
  echo "$count domains for $domain are saved in: $domain.subdomains.txt."
done < "$domains_file"
