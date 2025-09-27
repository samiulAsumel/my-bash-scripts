#!/bin/bash

echo "Absolute Path Mastery Script"
echo "============================"
echo ""

for i in {1..500}; do
    echo "📍 ROUND $i/500 - Absolute Path Navigation"
    
    # Enterprise navigation sequence (Real production paths)
    cd /etc
    ls -la | grep nginx | head -3
    cd /var/log
    ls -la | grep secure | head -2
    cd /home/alma
    pwd
    cd /opt/company/web/html
    touch index_$i.html
    ls -la index_$i.html
    rm index_$i.html
    cd /tmp
    pwd
    cd /usr/bin
    ls | grep python | head -2
    cd ~
    
    if (( i % 50 == 0 )); then
        echo "✅ Completed $i/500 - Muscle memory building"
    fi
done

echo "Absolute path mastery completed"